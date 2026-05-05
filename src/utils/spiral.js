export const getImageData = (imageElement, width, height) => {
  const canvas = document.createElement('canvas');
  canvas.width = width;
  canvas.height = height;
  const ctx = canvas.getContext('2d');
  
  // Draw image covering the square
  const scale = Math.max(width / imageElement.width, height / imageElement.height);
  const x = (width / 2) - (imageElement.width / 2) * scale;
  const y = (height / 2) - (imageElement.height / 2) * scale;
  
  ctx.drawImage(imageElement, x, y, imageElement.width * scale, imageElement.height * scale);
  
  return ctx.getImageData(0, 0, width, height);
};

export const getBrightness = (imageData, x, y) => {
  const ix = Math.floor(x);
  const iy = Math.floor(y);
  
  if (ix < 0 || ix >= imageData.width || iy < 0 || iy >= imageData.height) {
    return 1; // Return white (1) for out of bounds
  }
  
  const index = (iy * imageData.width + ix) * 4;
  const r = imageData.data[index];
  const g = imageData.data[index + 1];
  const b = imageData.data[index + 2];
  
  // Perceived brightness formula
  // Y = 0.299 R + 0.587 G + 0.114 B
  let brightness = (0.299 * r + 0.587 * g + 0.114 * b) / 255;
  // Aggressive contrast stretch to ensure bold black lines and clean white spaces
  brightness = (brightness - 0.2) * 1.5;
  return Math.max(0, Math.min(1, brightness));
};

export const generateSpiralPoints = (imageData, turns) => {
  const points = [];
  const width = imageData.width;
  const height = imageData.height;
  const cx = width / 2;
  const cy = height / 2;
  
  const maxRadius = Math.min(width, height) / 2;
  const maxTheta = turns * 2 * Math.PI;
  
  // Avoid division by zero, parameter b for Archimedean spiral r = b * theta
  const b = maxRadius / maxTheta;
  
  // Step size in radians. Smaller step for larger radius to maintain resolution.
  // We want approximately constant arc length per step.
  // Arc length ds = sqrt(r^2 + (dr/dtheta)^2) dtheta approx = r dtheta
  // Let's use a dynamic step or a small enough fixed step.
  // To avoid too many points, we can limit it.
  let theta = 0;
  
  while (theta <= maxTheta) {
    const r = b * theta;
    const x = cx + r * Math.cos(theta);
    const y = cy + r * Math.sin(theta);
    
    const brightness = getBrightness(imageData, x, y);
    
    points.push({ x, y, r, theta, brightness });
    
    // Dynamic step: d_theta = target_arc_length / r
    // If r is very small, we need a max step limit.
    const targetArcLength = 2; // pixels
    const dTheta = r < targetArcLength ? 0.5 : targetArcLength / r;
    theta += dTheta;
  }
  
  return points;
};
