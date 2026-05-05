// Standard Start G-Code for Bambu X1/P1
const getStartGCode = (bedTemp, autoBedLeveling) => `
;FLAVOR:Marlin
;TYPE:Custom
; Spiral Art G-Code for Bambu Lab
; Bed Temp: ${bedTemp}
; filament_colour = #FFFFFF;#000000
; extruder_colour = #FFFFFF;#000000
; total_extruders = 2
; filament_type = PLA;PLA

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

G28 ; home all axes (Z-homing will be accurate because no oozing at 150C)
${autoBedLeveling ? 'G29 ; Auto Bed Leveling (probes the bed to compensate for warping)' : '; G29 Auto Bed Leveling disabled'}

M104 S220 ; set actual print temp
M109 S220 ; wait for actual print temp

G92 E0 ; reset extruder
`;

const getEndGCode = () => `
; End G-Code
G91 ; relative coordinates
G1 Z10 F3000 ; lift Z
G90 ; absolute coordinates
G1 X250 Y250 F3000 ; move toolhead away

M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M107 ; turn off fan
M84 ; disable motors
`;

export const generateGCode = (points, config) => {
  const { nozzleDiameter, layerHeight, printerType, bedTemp, generateBasePad, basePadThickness, turns, autoBedLeveling, flowRatio = 0.98 } = config;

  const gcodeLines = [];
  gcodeLines.push(getStartGCode(bedTemp, autoBedLeveling));

  let maxPrintRadius = 105; // Default for X1/P1 (256x256 bed) to avoid front-left cutter exclusion zone
  let cx = 128;
  let cy = 128;

  if (printerType === 'A1 mini') {
    maxPrintRadius = 75; // 180x180 bed
    cx = 90;
    cy = 90;
  }

  // Calculate dynamic line width based on pitch to prevent vertical stacking (over-extrusion)
  const pitch = maxPrintRadius / turns;
  // Ensure minWidth is not so small that it prints in the air.
  // User requested minimum 0.35mm line width so thin lines don't print as hair and stick better.
  const minWidth = Math.max(0.35, nozzleDiameter * 0.5);
  const maxWidth = pitch * 0.95; // Leaves a 5% gap so thick lines don't merge together completely

  if (points.length === 0) return '';

  const maxPixelRadius = points[points.length - 1].r;
  const scale = maxPrintRadius / maxPixelRadius;

  const cxPixel = points[0].x;
  const cyPixel = points[0].y;

  let currentZ = 0;

  if (generateBasePad && basePadThickness > 0) {
    gcodeLines.push(`T0 ; Select Tool 0 (White)`);
    const layers = Math.max(1, Math.round(basePadThickness / layerHeight));
    const padWidth = 0.42;
    const filamentArea = Math.PI * Math.pow(1.75 / 2, 2);
    // User-configurable flow ratio (density) multiplier
    const basePadFlowMultiplier = flowRatio;

    for (let l = 1; l <= layers; l++) {
      // First layer needs extra squish (60% of layer height) to stick properly to the bed
      currentZ = l === 1 ? layerHeight * 0.6 : (l - 1) * layerHeight + (layerHeight * 0.6);
      gcodeLines.push(`;LAYER_CHANGE`);
      gcodeLines.push(`;Z:${currentZ.toFixed(3)}`);
      gcodeLines.push(`;HEIGHT:${layerHeight.toFixed(3)}`);
      gcodeLines.push(`;TYPE:Solid infill`);

      gcodeLines.push(`G1 Z${currentZ.toFixed(3)} F2400`);

      // 1. Draw 2 perimeters
      for (let p = 0; p < 2; p++) {
        let r = maxPrintRadius - p * padWidth;
        let segments = Math.max(32, Math.floor(2 * Math.PI * r)); // 1mm segments
        let prevX = cx + r;
        let prevY = cy;
        gcodeLines.push(`G1 X${prevX.toFixed(3)} Y${prevY.toFixed(3)} F4800`); // move to start (doubled speed)

        for (let i = 1; i <= segments; i++) {
          let angle = (i / segments) * 2 * Math.PI;
          let x = cx + r * Math.cos(angle);
          let y = cy + r * Math.sin(angle);

          let dx = x - prevX;
          let dy = y - prevY;
          let dist = Math.sqrt(dx * dx + dy * dy);
          let e = ((padWidth * layerHeight * dist) / filamentArea) * basePadFlowMultiplier;

          gcodeLines.push(`G1 X${x.toFixed(3)} Y${y.toFixed(3)} E${e.toFixed(5)} F3000`); // extrude perimeter (doubled speed)
          prevX = x;
          prevY = y;
        }
      }

      // 2. Rectilinear Infill
      let isLeftToRight = true;
      const innerRadius = maxPrintRadius - 2 * padWidth;
      const infillSpacing = padWidth * 0.85; // 15% overlap to ensure 0 gap

      for (let yOffset = -innerRadius; yOffset <= innerRadius; yOffset += infillSpacing) {
        let xBound = Math.sqrt(innerRadius * innerRadius - yOffset * yOffset);
        let x1 = cx + (isLeftToRight ? -xBound : xBound);
        let x2 = cx + (isLeftToRight ? xBound : -xBound);
        let y = cy + yOffset;

        gcodeLines.push(`G1 X${x1.toFixed(3)} Y${y.toFixed(3)} F7200`); // move to start (doubled speed)

        let dist = Math.abs(x2 - x1);
        let e = ((padWidth * layerHeight * dist) / filamentArea) * basePadFlowMultiplier;
        gcodeLines.push(`G1 X${x2.toFixed(3)} Y${y.toFixed(3)} E${e.toFixed(5)} F4800`); // extrude infill (doubled speed)

        isLeftToRight = !isLeftToRight;
      }
    }

    gcodeLines.push(`;PAUSE FOR FILAMENT CHANGE`);
    gcodeLines.push(`M400 U1 ; Pause for user intervention`);
    gcodeLines.push(`T1 ; Select Tool 1 (Black)`);
    gcodeLines.push(`G92 E0 ; reset extruder after pause`);
  }

  currentZ += layerHeight * 0.8; // Increased Z lift to give more distance between base pad and spiral

  gcodeLines.push(`G1 X${cx.toFixed(3)} Y${cy.toFixed(3)} F2400`);
  gcodeLines.push(`G1 Z${currentZ.toFixed(3)} F2400`);

  // Bambu Studio / PrusaSlicer specific comments to force preview rendering
  gcodeLines.push(`;LAYER_CHANGE`);
  gcodeLines.push(`;Z:${currentZ.toFixed(3)}`);
  gcodeLines.push(`;HEIGHT:${layerHeight.toFixed(3)}`);
  gcodeLines.push(`;TYPE:Outer wall`);

  let prevX = cx;
  let prevY = cy;
  let firstArtPoint = true;

  // Extrusion multiplier constant to increase flow and help thin lines print reliably
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

    // Explicitly add F2400 (40 mm/s) to EVERY line
    gcodeLines.push(`G1 X${x.toFixed(3)} Y${y.toFixed(3)} E${eLength.toFixed(5)} F2400`);

    prevX = x;
    prevY = y;
  }

  gcodeLines.push(getEndGCode());

  return gcodeLines.join('\n');
};
