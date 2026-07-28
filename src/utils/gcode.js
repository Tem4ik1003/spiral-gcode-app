const getStartGCode = (bedTemp, nozzleTemp, plateType, filamentType, autoBedLeveling, extruder = 'T0', printerModel = '') => `
;FLAVOR:Marlin
;TYPE:Custom
; Spiral Art G-Code
; Bed Temp: ${bedTemp}
; curr_bed_type={${plateType}}
; filament_colour = #FFFFFF;#000000
; extruder_colour = #FFFFFF;#000000
; total_extruders = 2
; filament_type = ${filamentType};${filamentType}

${extruder} ; Select active extruder (T0 = RIGHT nozzle on H2D)

M140 S${bedTemp} ; set bed temp
M104 S150 ; set active extruder to no-ooze temp (150C)
M190 S${bedTemp} ; wait for bed temp
M109 S150 ; wait for active extruder temp

G90 ; absolute coordinates
M83 ; relative extruder mode

; --- Smooth Motion Settings ---
M204 S2000 ; Set acceleration to 2000 mm/s^2
M205 X5 Y5 ; Set jerk to 5
; ------------------------------

G28 ; home all axes

M400
${extruder} ; Re-select extruder after G28 (safety)
${printerModel === 'h2d' ? 'M104 T1 S0 ; Turn off left nozzle (T1 = LEFT on H2D)' : ''}
M400

M104 S${nozzleTemp} ; set active extruder to print temp
M109 S${nozzleTemp} ; wait for active extruder print temp

G92 E0 ; reset extruder
`;

const getEndGCode = (extruder = 'T0', printerModel = '') => `
; End G-Code
G91 ; relative coordinates
G1 Z10 F3000 ; lift Z
G90 ; absolute coordinates
G1 X250 Y250 F3000 ; move toolhead away

M104 S0 T0 ; turn off right nozzle
${printerModel === 'h2d' ? 'M104 S0 T1 ; turn off left nozzle' : ''}
M140 S0 ; turn off bed
M107 ; turn off fan
M84 ; disable motors
`;

const generateSolidInfill = (cx, cy, radius, lineWidth, layerHeight, angle, feedrate) => {
  const gcode = [];
  const rad = angle * Math.PI / 180;
  const cos = Math.cos(rad);
  const sin = Math.sin(rad);
  const filamentArea = Math.PI * Math.pow(1.75 / 2, 2);

  let isEven = true;
  let firstPoint = true;
  let prevX = 0, prevY = 0;

  for (let y = -radius + lineWidth / 2; y <= radius - lineWidth / 2; y += lineWidth) {
    const x_extent = Math.sqrt(radius * radius - y * y);
    
    let x_start = isEven ? -x_extent : x_extent;
    let x_end = isEven ? x_extent : -x_extent;

    // Rotate and translate start point
    const startX = cx + (x_start * cos - y * sin);
    const startY = cy + (x_start * sin + y * cos);

    // Rotate and translate end point
    const endX = cx + (x_end * cos - y * sin);
    const endY = cy + (x_end * sin + y * cos);

    if (firstPoint) {
      gcode.push(`G1 X${startX.toFixed(3)} Y${startY.toFixed(3)} F7200`);
      firstPoint = false;
    } else {
      // Extrude connecting line along the edge
      const dxEdge = startX - prevX;
      const dyEdge = startY - prevY;
      const distEdge = Math.sqrt(dxEdge * dxEdge + dyEdge * dyEdge);
      const eEdge = (distEdge * lineWidth * layerHeight) / filamentArea;
      gcode.push(`G1 X${startX.toFixed(3)} Y${startY.toFixed(3)} E${eEdge.toFixed(5)} F${feedrate}`);
    }

    // Extrude the main line
    const dx = endX - startX;
    const dy = endY - startY;
    const dist = Math.sqrt(dx * dx + dy * dy);
    const eLength = (dist * lineWidth * layerHeight) / filamentArea;
    gcode.push(`G1 X${endX.toFixed(3)} Y${endY.toFixed(3)} E${eLength.toFixed(5)} F${feedrate}`);

    prevX = endX;
    prevY = endY;
    isEven = !isEven;
  }
  return gcode;
};

const generatePadLayer = (cx, cy, maxPrintRadius, z, layerHeight, lineWidth, isFirstLayer, layerIndex, isTopLayer) => {
  const gcodeLines = [];
  gcodeLines.push(`;LAYER_CHANGE`);
  gcodeLines.push(`;Z:${z.toFixed(3)}`);
  gcodeLines.push(`;HEIGHT:${layerHeight.toFixed(3)}`);
  
  const speedScale = isFirstLayer ? 0.5 : 1.0;
  const feedrateWall = Math.round(3600 * speedScale); // 60 mm/s
  const feedrateInfill = Math.round(10800 * speedScale); // 180 mm/s
  
  gcodeLines.push(`G1 Z${z.toFixed(3)} F7200`);
  
  // Outer Wall
  gcodeLines.push(`;TYPE:Outer wall`);
  let currentR = maxPrintRadius - lineWidth / 2;
  const filamentArea = Math.PI * Math.pow(1.75 / 2, 2);
  let wallExtrusion = (2 * Math.PI * currentR * lineWidth * layerHeight) / filamentArea;
  
  gcodeLines.push(`;WIDTH:${lineWidth.toFixed(3)}`);
  gcodeLines.push(`G1 X${(cx + currentR).toFixed(3)} Y${cy.toFixed(3)} F7200`);
  gcodeLines.push(`G3 X${(cx - currentR).toFixed(3)} Y${cy.toFixed(3)} I${(-currentR).toFixed(3)} J0 E${(wallExtrusion / 2).toFixed(5)} F${feedrateWall}`);
  gcodeLines.push(`G3 X${(cx + currentR).toFixed(3)} Y${cy.toFixed(3)} I${currentR.toFixed(3)} J0 E${(wallExtrusion / 2).toFixed(5)} F${feedrateWall}`);
  
  // Inner Wall
  gcodeLines.push(`;TYPE:Inner wall`);
  currentR -= lineWidth;
  wallExtrusion = (2 * Math.PI * currentR * lineWidth * layerHeight) / filamentArea;
  gcodeLines.push(`;WIDTH:${lineWidth.toFixed(3)}`);
  gcodeLines.push(`G1 X${(cx + currentR).toFixed(3)} Y${cy.toFixed(3)} F7200`);
  gcodeLines.push(`G3 X${(cx - currentR).toFixed(3)} Y${cy.toFixed(3)} I${(-currentR).toFixed(3)} J0 E${(wallExtrusion / 2).toFixed(5)} F${feedrateWall}`);
  gcodeLines.push(`G3 X${(cx + currentR).toFixed(3)} Y${cy.toFixed(3)} I${currentR.toFixed(3)} J0 E${(wallExtrusion / 2).toFixed(5)} F${feedrateWall}`);
  
  // Solid Infill
  let type = `;TYPE:Internal solid infill`;
  if (isFirstLayer) type = `;TYPE:Bottom surface`;
  else if (isTopLayer) type = `;TYPE:Top surface`;
  gcodeLines.push(type);
  gcodeLines.push(`;WIDTH:${lineWidth.toFixed(3)}`);
  const infillRadius = currentR - lineWidth / 2;
  const angle = isFirstLayer ? 45 : (layerIndex % 2 === 0 ? 45 : 135);
  
  const infillGCode = generateSolidInfill(cx, cy, infillRadius, lineWidth, layerHeight, angle, feedrateInfill);
  gcodeLines.push(...infillGCode);
  
  return gcodeLines;
};

export const generateGCode = (points, config) => {
  const { nozzleDiameter, layerHeight, printerModel, imageSize, bedTemp, nozzleTemp, plateType, filamentType, turns } = config;

  const extruder = printerModel === 'h2d' ? 'T0' : 'T0';

  const gcodeLines = [];
  gcodeLines.push(getStartGCode(bedTemp, nozzleTemp, plateType, filamentType, false, extruder, printerModel));

  let cx = 128;
  let cy = 128;

  if (printerModel === 'a1mini') {
    cx = 90;
    cy = 90;
  } else if (printerModel === 'x1p1a1') {
    cx = 128;
    cy = 128;
  } else if (printerModel === 'h2d') {
    cx = 175;
    cy = 160;
  } else if (printerModel === 'std320') {
    cx = 175;
    cy = 160;
  }

  const parsedSize = parseInt(imageSize, 10);
  const maxPrintRadius = (parsedSize / 2) - 2;

  const pitch = maxPrintRadius / turns;
  const minWidth = Math.max(0.3, nozzleDiameter * 0.75);
  const maxWidth = Math.min(pitch * 0.95, nozzleDiameter * 2.2);

  if (points.length === 0) return '';

  const maxPixelRadius = points[points.length - 1].r;
  const scale = maxPrintRadius / maxPixelRadius;

  const cxPixel = points[0].x;
  const cyPixel = points[0].y;

  // Always extrude Prime Line to establish nozzle flow
  gcodeLines.push(`;===== Prime Line =====`);
  gcodeLines.push(`G1 X5 Y5 F7200`);
  gcodeLines.push(`G1 Z0.2 F1200`);
  gcodeLines.push(`G1 X5 Y105 E10 F1200`);
  gcodeLines.push(`G1 X6 Y105 F7200`);
  gcodeLines.push(`G1 X6 Y5 E10 F1200`);
  gcodeLines.push(`G1 Z2.0 F1200`);
  gcodeLines.push(`G92 E0`);

  let currentZ = 0.2;
  const enablePad = config.enablePad !== false;
  const padLayers = config.padLayers || 5;
  const firstLayerHeight = 0.2;
  
  if (enablePad && padLayers > 0) {
    const numLayers = padLayers;
    const lineWidth = Math.max(0.42, nozzleDiameter * 1.05);
    
    for (let i = 0; i < numLayers; i++) {
      const isFirstLayer = i === 0;
      const currentLayerHeight = isFirstLayer ? firstLayerHeight : layerHeight;
      if (i > 0) {
        currentZ += currentLayerHeight;
      }
      const isTopLayer = i === numLayers - 1;
      
      const layerGcode = generatePadLayer(cx, cy, maxPrintRadius, currentZ, currentLayerHeight, lineWidth, isFirstLayer, i, isTopLayer);
      gcodeLines.push(...layerGcode);
    }
    
    // Add Pause before spiral starts for filament change
    gcodeLines.push(`M400 ; wait all motion done`);
    gcodeLines.push(`M0 ; Pause for filament change`);
    
    // Position Z for the spiral to print on top of the pad
    currentZ += layerHeight;
  } else {
    currentZ = firstLayerHeight;
  }

  gcodeLines.push(`;===== SPIRAL START =====`);
  gcodeLines.push(`G1 X${cx.toFixed(3)} Y${cy.toFixed(3)} F7200`);
  gcodeLines.push(`G1 Z${currentZ.toFixed(3)} F2400`);

  gcodeLines.push(`;LAYER_CHANGE`);
  gcodeLines.push(`;Z:${currentZ.toFixed(3)}`);
  gcodeLines.push(`;HEIGHT:${layerHeight.toFixed(3)}`);
  gcodeLines.push(`;TYPE:Outer wall`);

  let prevX = cx;
  let prevY = cy;

  const flowMultiplier = 1.15;
  const filamentArea = Math.PI * Math.pow(1.75 / 2, 2);

  // Set feedrate once for modal G1 movement
  gcodeLines.push(`G1 F2400`);

  for (let i = 1; i < points.length; i++) {
    const pt = points[i];

    const x = cx + (pt.x - cxPixel) * scale;
    const y = cy + (pt.y - cyPixel) * scale;

    const dx = x - prevX;
    const dy = y - prevY;
    const distance = Math.sqrt(dx * dx + dy * dy);

    const w = minWidth + (1 - pt.brightness) * (maxWidth - minWidth);

    const volume = w * layerHeight * distance * flowMultiplier;
    const eLength = volume / filamentArea;

    gcodeLines.push(`G1 X${x.toFixed(3)} Y${y.toFixed(3)} E${eLength.toFixed(5)}`);

    prevX = x;
    prevY = y;
  }

  gcodeLines.push(getEndGCode(extruder, printerModel));

  return gcodeLines.join('\n');
};
