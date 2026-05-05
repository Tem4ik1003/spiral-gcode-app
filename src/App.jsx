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
  const [bedTemp, setBedTemp] = useState(65);
  const [turns, setTurns] = useState(100);
  const [printSize, setPrintSize] = useState('240');
  const [isHelpModalOpen, setIsHelpModalOpen] = useState(false);

  const [spiralPoints, setSpiralPoints] = useState([]);
  const canvasRef = useRef(null);

  const onCropComplete = useCallback((croppedArea, croppedAreaPixels) => {
    setCroppedAreaPixels(croppedAreaPixels);
  }, []);

  const handleImageUpload = (e) => {
    if (e.target.files && e.target.files.length > 0) {
      const file = e.target.files[0];

      // Validation: Only allow image files
      if (!file.type.startsWith('image/')) {
        alert('Помилка: Будь ласка, завантажте файл зображення (наприклад, JPG або PNG).');
        e.target.value = null;
        return;
      }

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

    const parsedNozzle = parseFloat(nozzleDiameter);
    // Dynamic layer height based on nozzle size for optimal print physics
    const layerHeightMap = {
      0.2: 0.12,
      0.4: 0.16,
      0.6: 0.24,
      0.8: 0.32
    };
    const dynamicLayerHeight = layerHeightMap[parsedNozzle] || 0.16;

    const config = {
      nozzleDiameter: parsedNozzle,
      layerHeight: dynamicLayerHeight,
      printSize,
      bedTemp: parseInt(bedTemp, 10),
      turns: parseInt(turns, 10)
    };
    const gcode = generateGCode(spiralPoints, config);
    const blob = new Blob([gcode], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);

    // Download G-code
    const aGcode = document.createElement('a');
    aGcode.href = url;
    aGcode.download = `spiral_art_${printSize}_${Date.now()}.gcode`;
    document.body.appendChild(aGcode);
    aGcode.click();
    document.body.removeChild(aGcode);
    URL.revokeObjectURL(url);

    // Download 3mf from /pads/ folder synchronously
    const a3mf = document.createElement('a');
    a3mf.href = `/pads/base_pad_${printSize}.3mf`;
    a3mf.download = `base_pad_${printSize}.3mf`;
    document.body.appendChild(a3mf);
    a3mf.click();
    document.body.removeChild(a3mf);
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

      // Match preview widths to G-code logic: max 95% of distance to prevent absolute black bleeding
      const minWidth = distanceBetweenTurns * 0.2;
      const maxWidth = distanceBetweenTurns * 1.3; // 1.3 provides a good balance between realistic spread and preview darkness

      let prevPt = spiralPoints[0];
      let currentWidth = -1;
      let lastDrawnIndex = 1;

      const totalPoints = spiralPoints.length;
      const duration = 2000; // 2 seconds animation
      let startTime = null;
      let animationFrameId;

      ctx.strokeStyle = '#1a1a1a';

      const animate = (timestamp) => {
        if (!startTime) startTime = timestamp;
        const progress = Math.min(1, (timestamp - startTime) / duration);
        const targetIndex = Math.floor(progress * totalPoints);

        if (lastDrawnIndex < targetIndex) {
          ctx.beginPath();
          ctx.moveTo(prevPt.x, prevPt.y);

          for (let i = lastDrawnIndex; i < targetIndex; i++) {
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
          lastDrawnIndex = targetIndex;
        }

        if (progress < 1) {
          animationFrameId = requestAnimationFrame(animate);
        }
      };

      animationFrameId = requestAnimationFrame(animate);

      // Cleanup animation if the component unmounts or spiralPoints change
      return () => {
        cancelAnimationFrame(animationFrameId);
      };
    }
  }, [spiralPoints, isCropping, turns]);

  return (
    <div className="app-layout">
      <aside className="sidebar">
        <div className="sidebar-header">
          <img src="/logo.png" alt="Edutech Expert" className="sidebar-logo" />
          <button className="help-btn" onClick={() => setIsHelpModalOpen(true)}>
            📺 Гайд по друку спіральною картиною
          </button>
        </div>

        <div className="control-group">
          <label className="file-upload-btn">
            📸 Обрати зображення
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
          <label>Температура столу (°C): {bedTemp}°C</label>
          <input
            type="range"
            min="0"
            max="100"
            step="1"
            value={bedTemp}
            onChange={(e) => setBedTemp(e.target.value)}
            className="slider"
          />
        </div>

        <div className="control-group">
          <label>Кількість витків</label>
          <input
            type="number"
            value={turns}
            onChange={(e) => setTurns(Number(e.target.value))}
            min="30" max="120" step="1"
          />
        </div>

        <div className="control-group">
          <label>Розмір картини</label>
          <select value={printSize} onChange={(e) => setPrintSize(e.target.value)}>
            <option value="160">160x160 (Bambu Lab A1 mini)</option>
            <option value="240">240x240 (X1 / P1 / A1)</option>
            <option value="320">320x320 (H2 series)</option>
          </select>
        </div>

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

      {isHelpModalOpen && (
        <div className="modal-overlay" onClick={() => setIsHelpModalOpen(false)}>
          <div className="modal-content" onClick={(e) => e.stopPropagation()}>
            <button className="modal-close" onClick={() => setIsHelpModalOpen(false)}>×</button>
            <h3>Як створити спіральну картину</h3>

            <div className="video-container">
              {/* Заміни 'VIDEO_ID' на реальний ID відео з YouTube */}
              <iframe
                src="https://www.youtube.com/watch?v=-NRKDgkUtJM"
                title="Відеоінструкція"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen>
              </iframe>
            </div>

            <ol className="steps-list">
              <li><strong>Налаштування:</strong> Обери свій принтер та сопло.</li>
              <li><strong>Завантаження:</strong> Завантаж фото (краще контрастне)</li>
              <li><strong>Кадрування:</strong> Обріж фото та натисни кнопку "Згенерувати спіраль".</li>
              <li><strong>Налаштування витків:</strong> Якщо прев'ю виглядає занадто світлим або деталі нечіткі, збільш кількість витків і знову натисни "Згенерувати".</li>
              <li><strong>Завантаження G-Code:</strong> Натисни зелену кнопку завантаження. На твій комп'ютер збережуться два файли: <code>.3mf</code> (біла підкладка) та <code>.gcode</code> (чорна спіраль).</li>
              <li><strong>Перший етап друку:</strong> Відкрий завантажений файл <code>.3mf</code> у своєму слайсері (Bambu Studio) та відправ на друк <strong>світлим</strong> пластиком.</li>
              <li><strong>Другий етап друку:</strong> Коли принтер завершить друк підкладки, <strong>НЕ ЗНІМАЙ ЇЇ ЗІ СТОЛУ!</strong> Заправ у принтер <strong>темним</strong> пластик і просто запусти скачаний файл <code>.gcode</code> як нове завдання.</li>
            </ol>

            <div className="warning-text">
              ⚠️ УВАГА: Перед запуском спіралі, вимкнути калібрування столу.
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
