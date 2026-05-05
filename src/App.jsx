import React, { useState, useRef, useEffect, useCallback } from 'react';
import Cropper from 'react-easy-crop';
import { getCroppedImg, createImage } from './utils/cropImage';
import { getImageData, generateSpiralPoints } from './utils/spiral';
import { generateGCode } from './utils/gcode';
import './App.css';

function App() {
  // Original uploaded image URL for cropping
  const [imageSrc, setImageSrc] = useState(null);

  // Cropper state
  const [crop, setCrop] = useState({ x: 0, y: 0 });
  const [zoom, setZoom] = useState(1);
  const [croppedAreaPixels, setCroppedAreaPixels] = useState(null);
  const [isCropping, setIsCropping] = useState(false);

  // Final image object ready for spiral generation
  const [image, setImage] = useState(null);

  // Generator settings
  const [nozzleDiameter, setNozzleDiameter] = useState(0.4);
  const [layerHeight, setLayerHeight] = useState(0.16);
  const [turns, setTurns] = useState(150);
  const [printerType, setPrinterType] = useState('X1/P1');
  const [bedTemp, setBedTemp] = useState(60);

  const [generateBasePad, setGenerateBasePad] = useState(false);
  const [basePadThickness, setBasePadThickness] = useState(0.8);
  const [autoBedLeveling, setAutoBedLeveling] = useState(true);
  const [flowRatio, setFlowRatio] = useState(0.98);

  const [spiralPoints, setSpiralPoints] = useState([]);
  const canvasRef = useRef(null);

  const onCropComplete = useCallback((croppedArea, croppedAreaPixels) => {
    setCroppedAreaPixels(croppedAreaPixels);
  }, []);

  const handleImageUpload = (e) => {
    if (e.target.files && e.target.files.length > 0) {
      const file = e.target.files[0];
      const reader = new FileReader();
      reader.addEventListener('load', () => {
        setImageSrc(reader.result);
        setIsCropping(true); // Open cropper
      });
      reader.readAsDataURL(file);
      // Reset input
      e.target.value = null;
    }
  };

  const applyCrop = async () => {
    try {
      const croppedImageUrl = await getCroppedImg(imageSrc, croppedAreaPixels);
      const img = await createImage(croppedImageUrl);
      setImage(img);
      setIsCropping(false);
      setSpiralPoints([]); // reset old preview
    } catch (e) {
      console.error(e);
    }
  };

  const cancelCrop = () => {
    setIsCropping(false);
    if (!image) setImageSrc(null); // Clear if no previous image
  };

  const openCropper = () => {
    setIsCropping(true);
  };

  const handleGenerate = () => {
    try {
      if (!image) return;
      const resolution = 800;
      const imageData = getImageData(image, resolution, resolution);
      const points = generateSpiralPoints(imageData, turns);
      setSpiralPoints(points);
    } catch (e) {
      alert("Помилка генерації: " + e.message);
    }
  };

  const handleDownload = () => {
    if (spiralPoints.length === 0) return;
    const config = {
      nozzleDiameter: parseFloat(nozzleDiameter),
      layerHeight,
      printerType,
      bedTemp: parseInt(bedTemp, 10),
      generateBasePad,
      basePadThickness: parseFloat(basePadThickness),
      turns: parseInt(turns, 10),
      autoBedLeveling,
      flowRatio: parseFloat(flowRatio)
    };
    const gcode = generateGCode(spiralPoints, config);
    const blob = new Blob([gcode], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `spiral_art_${Date.now()}.gcode`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  // Render preview on canvas
  useEffect(() => {
    if (spiralPoints.length > 0 && canvasRef.current && !isCropping) {
      const canvas = canvasRef.current;
      const ctx = canvas.getContext('2d');
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      // Background (bed)
      ctx.fillStyle = '#ffffff';
      ctx.fillRect(0, 0, canvas.width, canvas.height);

      ctx.lineCap = 'round';
      ctx.lineJoin = 'round';

      // Dynamic line width based on number of turns
      const maxRadius = canvas.width / 2;
      const distanceBetweenTurns = maxRadius / turns;

      const minWidth = distanceBetweenTurns * 0.2;
      const maxWidth = distanceBetweenTurns * 1.8;

      let prevPt = spiralPoints[0];
      let currentWidth = -1;

      ctx.beginPath();
      ctx.moveTo(prevPt.x, prevPt.y);
      ctx.strokeStyle = '#1a1a1a';

      for (let i = 1; i < spiralPoints.length; i++) {
        const pt = spiralPoints[i];
        const w = minWidth + (1 - pt.brightness) * (maxWidth - minWidth);
        const roundedW = Math.round(w * 10) / 10; // Round to 1 decimal to group strokes

        if (roundedW !== currentWidth) {
          ctx.stroke();
          ctx.beginPath();
          ctx.moveTo(prevPt.x, prevPt.y);
          ctx.lineWidth = roundedW;
          currentWidth = roundedW;
        }

        ctx.lineTo(pt.x, pt.y);
        prevPt = pt;
      }
      ctx.stroke();
    }
  }, [spiralPoints, isCropping]);

  return (
    <div className="app-layout">
      <aside className="sidebar">
        <div className="sidebar-header">
          <h2>🌀 Спіральна картинка</h2>
          <img src="/logo.svg" alt="Edutech Expert" className="sidebar-logo" />
        </div>

        <div className="control-group">
          <label className="file-upload-btn">
            📸 Вибрати зображення
            <input type="file" accept="image/*" onChange={handleImageUpload} />
          </label>
        </div>

        {image && !isCropping && (
          <div className="image-preview-container">
            <div className="image-preview">
              <img src={image.src} alt="Cropped preview" />
            </div>
            <button className="btn secondary-btn" onClick={openCropper}>Змінити кадрування</button>
          </div>
        )}

        <div className="control-group">
          <label>Діаметр сопла (мм)</label>
          <select value={nozzleDiameter} onChange={(e) => setNozzleDiameter(e.target.value)}>
            <option value="0.2">0.2</option>
            <option value="0.4">0.4</option>
            <option value="0.6">0.6</option>
            <option value="0.8">0.8</option>
          </select>
        </div>

        <div className="control-group">
          <label>Висота шару (мм)</label>
          <select value={layerHeight} onChange={(e) => setLayerHeight(Number(e.target.value))}>
            <option value="0.12">0.12 мм (Ультра)</option>
            <option value="0.16">0.16 мм (Оптимально)</option>
            <option value="0.20">0.20 мм (Грубо)</option>
          </select>
        </div>

        <div className="control-group">
          <label>Кількість витків</label>
          <input
            type="number"
            value={turns}
            onChange={(e) => setTurns(Number(e.target.value))}
            min="10" max="500" step="10"
          />
        </div>

        <div className="control-group">
          <label>Принтер</label>
          <select value={printerType} onChange={(e) => setPrinterType(e.target.value)}>
            <option value="X1/P1">Bambu Lab X1 / P1 / A1 (256x256)</option>
            <option value="A1 mini">Bambu Lab A1 mini (180x180)</option>
          </select>
        </div>

        <div className="control-group">
          <label>Температура столу (°C)</label>
          <input
            type="number"
            value={bedTemp}
            onChange={(e) => setBedTemp(e.target.value)}
            onBlur={(e) => {
              let val = parseInt(e.target.value, 10);
              if (isNaN(val)) val = 60;
              if (val < 30) val = 30;
              if (val > 80) val = 80;
              setBedTemp(val);
            }}
            min="30" max="80"
          />
        </div>

        <div className="control-group">
          <label>Множник потоку підложки (Flow Ratio)</label>
          <input
            type="number"
            value={flowRatio}
            onChange={(e) => setFlowRatio(e.target.value)}
            onBlur={(e) => {
              let val = parseFloat(e.target.value);
              if (isNaN(val)) val = 0.98;
              if (val < 0.5) val = 0.5;
              if (val > 1.5) val = 1.5;
              setFlowRatio(val);
            }}
            min="0.5" max="1.5" step="0.01"
          />
        </div>

        <div className="control-group">
          <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', marginTop: '10px' }}>
            <input
              type="checkbox"
              checked={generateBasePad}
              onChange={(e) => setGenerateBasePad(e.target.checked)}
              style={{ width: '18px', height: '18px' }}
            />
            Створити підкладку (білу)
          </label>
        </div>

        <div className="control-group">
          <label style={{ display: 'flex', alignItems: 'center', gap: '8px', cursor: 'pointer', marginTop: '10px' }}>
            <input
              type="checkbox"
              checked={autoBedLeveling}
              onChange={(e) => setAutoBedLeveling(e.target.checked)}
              style={{ width: '18px', height: '18px' }}
            />
            Калібрування столу (Рекомендовано)
          </label>
        </div>

        {generateBasePad && (
          <div className="control-group">
            <label>Товщина підкладки (мм)</label>
            <input
              type="number"
              value={basePadThickness}
              onChange={(e) => setBasePadThickness(Number(e.target.value))}
              min="0.2" max="5.0" step="0.2"
            />
          </div>
        )}

        <button className="btn generate-btn" onClick={handleGenerate} disabled={!image || isCropping}>
          Згенерувати спіраль
        </button>

        <button className="btn download-btn" onClick={handleDownload} disabled={spiralPoints.length === 0 || isCropping}>
          Завантажити G-Code
        </button>

        <div className="info-box">
          <strong>💡 Як працює товщина:</strong><br />
          Товщина лінії регулюється зміною потоку пластику (параметр <code>E</code> в G-Code).
          На темних пікселях принтер видавлює в 2.5 рази більше пластику, формуючи товсту чорну лінію.
          На світлих пікселях екструзія падає майже до нуля (0.2 від діаметра сопла), залишаючи видимим білий стіл.
        </div>
      </aside>

      <main className="preview-area">
        {isCropping ? (
          <div className="cropper-container">
            <div className="cropper-wrapper">
              <Cropper
                image={imageSrc}
                crop={crop}
                zoom={zoom}
                aspect={1}
                cropShape="round"
                showGrid={false}
                onCropChange={setCrop}
                onCropComplete={onCropComplete}
                onZoomChange={setZoom}
              />
            </div>
            <div className="cropper-controls">
              <input
                type="range"
                value={zoom}
                min={1}
                max={3}
                step={0.1}
                aria-labelledby="Zoom"
                onChange={(e) => {
                  setZoom(e.target.value)
                }}
                className="zoom-slider"
              />
              <div className="cropper-actions">
                <button className="btn secondary-btn" onClick={cancelCrop}>Скасувати</button>
                <button className="btn generate-btn" onClick={applyCrop}>Застосувати кадрування</button>
              </div>
            </div>
          </div>
        ) : (
          <div className="canvas-container">
            {spiralPoints.length === 0 && !image && (
              <div className="placeholder">Завантажте фото для попереднього перегляду</div>
            )}
            {spiralPoints.length === 0 && image && (
              <div className="placeholder">Натисніть "Згенерувати"</div>
            )}
            <canvas
              ref={canvasRef}
              width={800}
              height={800}
              style={{ display: spiralPoints.length > 0 ? 'block' : 'none' }}
            ></canvas>
          </div>
        )}
      </main>
    </div>
  );
}

export default App;
