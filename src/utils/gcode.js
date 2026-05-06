const getStartGCode = (bedTemp, nozzleTemp, plateType, filamentType, autoBedLeveling, extruder = 'T0') => `
;FLAVOR:Marlin
;TYPE:Custom
; Spiral Art G-Code
; Bed Temp: ${bedTemp}
; curr_bed_type={${plateType}}
; filament_colour = #FFFFFF;#000000
; extruder_colour = #FFFFFF;#000000
; total_extruders = 2
; filament_type = ${filamentType};${filamentType}

${extruder} ; Activate selected extruder

M140 S${bedTemp} ; set bed temp
M104 S150 ; set extruder temp to no-ooze temp (150C)
M190 S${bedTemp} ; wait for bed temp
M109 S150 ; wait for extruder temp

G90 ; absolute coordinates
M83 ; relative extruder mode

; --- Smooth Motion Settings ---
M204 S2000 ; Set acceleration to 2000 mm/s^2
M205 X5 Y5 ; Set jerk to 5
; ------------------------------

G28 ; home all axes (Z-homing will touch the pad and set Z=0 at the top of the pad)
; G29 Auto Bed Leveling intentionally disabled for this print

M104 S${nozzleTemp} ; set actual print temp
M109 S${nozzleTemp} ; wait for actual print temp

G92 E0 ; reset extruder
`;

const getEndGCode = (extruder = 'T0') => `
; End G-Code
G91 ; relative coordinates
G1 Z10 F3000 ; lift Z
G90 ; absolute coordinates
G1 X250 Y250 F3000 ; move toolhead away

M104 S0 ${extruder} ; turn off active extruder
M140 S0 ; turn off bed
M107 ; turn off fan
M84 ; disable motors
`;

export const generateGCode = (points, config) => {
  const { nozzleDiameter, layerHeight, printerModel, imageSize, bedTemp, nozzleTemp, plateType, filamentType, turns } = config;

  const extruder = printerModel === 'h2d' ? 'T1' : 'T0';

  const gcodeLines = [];
  gcodeLines.push(getStartGCode(bedTemp, nozzleTemp, plateType, filamentType, false, extruder));

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
  let maxPrintRadius = (parsedSize / 2) - 2; 

  const pitch = maxPrintRadius / turns;
  const minWidth = Math.max(0.35, nozzleDiameter * 0.5);
  const maxWidth = pitch * 0.95; 

  if (points.length === 0) return '';

  const maxPixelRadius = points[points.length - 1].r;
  const scale = maxPrintRadius / maxPixelRadius;

  const cxPixel = points[0].x;
  const cyPixel = points[0].y;

  let currentZ = 0.14;

  gcodeLines.push(`G1 X${cx.toFixed(3)} Y${cy.toFixed(3)} F2400`);
  gcodeLines.push(`G1 Z${currentZ.toFixed(3)} F2400`);

  gcodeLines.push(`;LAYER_CHANGE`);
  gcodeLines.push(`;Z:${currentZ.toFixed(3)}`);
  gcodeLines.push(`;HEIGHT:${layerHeight.toFixed(3)}`);
  gcodeLines.push(`;TYPE:Outer wall`);

  let prevX = cx;
  let prevY = cy;
  let firstArtPoint = true;

  const flowMultiplier = 1.4;

  for (let i = 1; i < points.length; i++) {
    const pt = points[i];

    const x = cx + (pt.x - cxPixel) * scale;
    const y = cy + (pt.y - cyPixel) * scale;

    const dx = x - prevX;
    const dy = y - prevY;
    const distance = Math.sqrt(dx * dx + dy * dy);

    const w = minWidth + (1 - pt.brightness) * (maxWidth - minWidth);

    const filamentArea = Math.PI * Math.pow(1.75 / 2, 2);
    const volume = w * layerHeight * distance * flowMultiplier;
    const eLength = volume / filamentArea;

    gcodeLines.push(`G1 X${x.toFixed(3)} Y${y.toFixed(3)} E${eLength.toFixed(5)} F2400`);

    prevX = x;
    prevY = y;
  }

  gcodeLines.push(getEndGCode(extruder));

  return gcodeLines.join('\n');
};
