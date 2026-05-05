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

G28 ; home all axes (Z-homing will touch the pad and set Z=0 at the top of the pad)
; G29 Auto Bed Leveling intentionally disabled for this print

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
  const { nozzleDiameter, layerHeight, printSize, bedTemp, turns } = config;

  const gcodeLines = [];
  gcodeLines.push(getStartGCode(bedTemp));

  let maxPrintRadius = 110;
  let cx = 110;
  let cy = 110;

  if (printSize === '160') {
    maxPrintRadius = 80; // 160x160 picture
    cx = 90;  // Center of Bambu A1 Mini bed (180x180)
    cy = 90;
  } else if (printSize === '240') {
    maxPrintRadius = 120; // 240x240 picture
    cx = 128; // Center of Bambu X1/P1/A1 bed (256x256)
    cy = 128;
  } else if (printSize === '320') {
    maxPrintRadius = 160; // 320x320 picture
    cx = 160; // Assuming bed size is 320x320
    cy = 160;
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

  // Spiral starts like a new print, Z=0 is the top of the pad because of G28
  // Fixed starting height of 0.14mm for the spiral art distance
  let currentZ = 0.14;

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
