export const getImageData = (imageElement, width, height) => {
  const canvas = document.createElement('canvas');
  canvas.width = width;
  canvas.height = height;
  const ctx = canvas.getContext('2d');
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
    return 1; 
  }
  
  const index = (iy * imageData.width + ix) * 4;
  const r = imageData.data[index];
  const g = imageData.data[index + 1];
  const b = imageData.data[index + 2];
  
  let brightness = (0.299 * r + 0.587 * g + 0.114 * b) / 255;
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
  const b = maxRadius / maxTheta;
  
  let theta = 0;
  
  while (theta <= maxTheta) {
    const r = b * theta;
    const x = cx + r * Math.cos(theta);
    const y = cy + r * Math.sin(theta);
    
    const brightness = getBrightness(imageData, x, y);
    
    points.push({ x, y, r, theta, brightness });
    
    const targetArcLength = 2; 
    const dTheta = r < targetArcLength ? 0.5 : targetArcLength / r;
    theta += dTheta;
  }
  
  return points;
};
