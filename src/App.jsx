import React, { useState, useRef, useEffect, useCallback } from 'react';
import Cropper from 'react-easy-crop';
import { getCroppedImg, createImage } from './utils/cropImage';
import { getImageData, generateSpiralPoints } from './utils/spiral';
import { generateGCode } from './utils/gcode';
import './App.css';

function App() {
  const [imageSrc, setImageSrc] = useState(null);

  const [crop, setCrop] = useState({ x: 0, y: 0 });
  const [zoom, setZoom] = useState(1);
  const [croppedAreaPixels, setCroppedAreaPixels] = useState(null);
  const [isCropping, setIsCropping] = useState(false);

  const [image, setImage] = useState(null);

  const [nozzleDiameter, setNozzleDiameter] = useState(0.4);
  const [bedTemp, setBedTemp] = useState(60);
  const [nozzleTemp, setNozzleTemp] = useState(230);
  const [plateType, setPlateType] = useState('Textured PEI Plate');
  const [filamentType, setFilamentType] = useState('PLA');
  const [showAdvanced, setShowAdvanced] = useState(false);
  const [turns, setTurns] = useState(100);
  const [contrast, setContrast] = useState(1.5);
  const [invert, setInvert] = useState(false);
  const [printerModel, setPrinterModel] = useState('x1p1a1');
  const [imageSize, setImageSize] = useState('240');
  const [enablePad, setEnablePad] = useState(true);
  const [padLayers, setPadLayers] = useState(5);
  const [isHelpModalOpen, setIsHelpModalOpen] = useState(false);

  const [spiralPoints, setSpiralPoints] = useState([]);
  const canvasRef = useRef(null);

  const onCropComplete = useCallback((croppedArea, croppedAreaPixels) => {
    setCroppedAreaPixels(croppedAreaPixels);
  }, []);

  const handleImageUpload = (e) => {
    if (e.target.files && e.target.files.length > 0) {
      const file = e.target.files[0];

      if (!file.type.startsWith('image/')) {
        alert('Помилка: Будь ласка, завантажте файл зображення (наприклад, JPG або PNG).');
        e.target.value = null;
        return;
      }

      const reader = new FileReader();
      reader.addEventListener('load', () => {
        setImageSrc(reader.result);
        setIsCropping(true); 
      });
      reader.readAsDataURL(file);
      e.target.value = null;
    }
  };

  const applyCrop = async () => {
    try {
      const croppedImageUrl = await getCroppedImg(imageSrc, croppedAreaPixels);
      const img = await createImage(croppedImageUrl);
      setImage(img);
      setIsCropping(false);
      setSpiralPoints([]); 
    } catch (e) {
      console.error(e);
    }
  };

  const cancelCrop = () => {
    setIsCropping(false);
    if (!image) setImageSrc(null); 
  };

  const openCropper = () => {
    setIsCropping(true);
  };

  const handleGenerate = () => {
    try {
      if (!image) return;
      const resolution = 800;
      const imageData = getImageData(image, resolution, resolution);
      const points = generateSpiralPoints(imageData, turns, { contrast, invert });
      setSpiralPoints(points);
    } catch (e) {
      alert("Помилка генерації: " + e.message);
    }
  };

  const handleDownload = () => {
    if (spiralPoints.length === 0) return;

    const parsedNozzle = parseFloat(nozzleDiameter);
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
      printerModel,
      imageSize,
      bedTemp: parseInt(bedTemp, 10),
      nozzleTemp: parseInt(nozzleTemp, 10),
      plateType,
      filamentType,
      turns: parseInt(turns, 10),
      enablePad,
      padLayers: parseInt(padLayers, 10)
    };
    const gcode = generateGCode(spiralPoints, config);
    const blob = new Blob([gcode], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);

    const aGcode = document.createElement('a');
    aGcode.href = url;
    aGcode.download = `spiral_art_${imageSize}_${Date.now()}.gcode`;
    document.body.appendChild(aGcode);
    aGcode.click();
    document.body.removeChild(aGcode);
    URL.revokeObjectURL(url);
  };

  useEffect(() => {
    if (spiralPoints.length > 0 && canvasRef.current && !isCropping) {
      const canvas = canvasRef.current;
      const ctx = canvas.getContext('2d');
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      const centerX = canvas.width / 2;
      const centerY = canvas.height / 2;
      const bgRadius = canvas.width / 2;

      ctx.beginPath();
      ctx.arc(centerX, centerY, bgRadius, 0, 2 * Math.PI);
      ctx.fillStyle = '#ffffff';
      ctx.fill();

      ctx.lineCap = 'round';
      ctx.lineJoin = 'round';

      const maxRadius = canvas.width / 2;
      const currentImageRadius = (parseInt(imageSize, 10) / 2);
      const distanceBetweenTurns = maxRadius / turns;

      const minWidth = distanceBetweenTurns * 0.2;
      const maxWidth = distanceBetweenTurns * 1.3; 

      let prevPt = spiralPoints[0];
      let currentWidth = -1;
      let lastDrawnIndex = 1;

      const totalPoints = spiralPoints.length;
      const duration = 2000; 
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

      return () => {
        cancelAnimationFrame(animationFrameId);
      };
    }
  }, [spiralPoints, isCropping, turns]);

  return (
    <div className="app-layout">
      <aside className="sidebar">
        <div className="sidebar-header">
          <img src="logo.png" alt="Edutech Expert" className="sidebar-logo" />

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
            <button className="btn secondary-btn" onClick={openCropper}>Змінити застосування</button>
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
          <label>Контраст зображення: {contrast}</label>
          <input
            type="range"
            min="0.5"
            max="2.5"
            step="0.1"
            value={contrast}
            onChange={(e) => setContrast(parseFloat(e.target.value))}
            className="slider"
          />
        </div>

        <div className="control-group">
          <label className="checkbox-label">
            <input 
              type="checkbox" 
              checked={invert} 
              onChange={(e) => setInvert(e.target.checked)} 
            />
            Інвертувати кольори (для темного фону)
          </label>
        </div>

        <div className="advanced-settings-toggle" onClick={() => setShowAdvanced(!showAdvanced)}>
          <span>{showAdvanced ? '▼' : '▶'} Додаткові налаштування</span>
        </div>

        {showAdvanced && (
          <div className="advanced-settings-panel">
            <div className="control-group">
              <label>Тип пластику</label>
              <select value={filamentType} onChange={(e) => {
                const selectedFilament = e.target.value;
                setFilamentType(selectedFilament);
                if (selectedFilament === 'PLA') setNozzleTemp(230);
                else if (selectedFilament === 'PETG') setNozzleTemp(245);
                else if (selectedFilament === 'ABS') setNozzleTemp(260);
                else if (selectedFilament === 'TPU') setNozzleTemp(220);
              }}>
                <option value="PLA">PLA</option>
                <option value="PETG">PETG</option>
                <option value="ABS">ABS</option>
                <option value="TPU">TPU</option>
              </select>
            </div>
            <div className="control-group" style={{ marginTop: '10px' }}>
              <label>Тип пластини</label>
              <select value={plateType} onChange={(e) => {
                const selectedPlate = e.target.value;
                setPlateType(selectedPlate);
                if (selectedPlate === 'Cool Plate') setBedTemp(35);
                else setBedTemp(60);
              }}>
                <option value="Textured PEI Plate">Textured PEI Plate</option>
                <option value="Smooth PEI Plate">Smooth PEI Plate / High Temp</option>
                <option value="Cool Plate">Cool Plate</option>
              </select>
            </div>
            <div className="control-group" style={{ marginTop: '10px' }}>
              <label>Температура сопла (°C): {nozzleTemp}°C</label>
              <input
                type="range"
                min="180"
                max="260"
                step="5"
                value={nozzleTemp}
                onChange={(e) => setNozzleTemp(e.target.value)}
                className="slider"
              />
            </div>
          </div>
        )}

        <div className="control-group">
          <label>Ваш принтер</label>
          <select value={printerModel} onChange={(e) => {
            const model = e.target.value;
            setPrinterModel(model);
            if (model === 'a1mini') setImageSize('160');
            else if (model === 'x1p1a1' && imageSize === '290') setImageSize('240');
          }}>
            <option value="a1mini">Bambu Lab A1 mini</option>
            <option value="x1p1a1">Bambu Lab X1 / P1 / A1</option>
            <option value="h2d">H2D (Right Nozzle)</option>
          </select>
        </div>

        <div className="control-group">
          <label>Розмір картинки</label>
          <select value={imageSize} onChange={(e) => setImageSize(e.target.value)}>
            <option value="160">160x160</option>
            {(printerModel === 'x1p1a1' || printerModel === 'h2d' || printerModel === 'std320') && (
              <option value="240">240x240</option>
            )}
            {(printerModel === 'h2d') && (
              <option value="290">290x290</option>
            )}
          </select>
        </div>

        <div className="control-group">
          <label className="checkbox-label">
            <input 
              type="checkbox" 
              checked={enablePad} 
              onChange={(e) => setEnablePad(e.target.checked)} 
            />
            Додати підкладку в G-Code
          </label>
        </div>

        {enablePad && (
          <div className="control-group">
            <label>Кількість шарів (1 шар = 0.2мм)</label>
            <input 
              type="number" 
              min="1" 
              max="20" 
              step="1"
              value={padLayers} 
              onChange={(e) => setPadLayers(e.target.value)} 
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
          На темних пікселях принтер зверху в 2.5 рази більше пластику, формуючи товсту чорну лінію.
          На світлих пікселях екструзія падає майже до нуля (0.2 від діаметра сопла), залишаючи видимим білий стіл.
        </div>

        <a href="https://www.edutechexpert.com.ua/" target="_blank" rel="noopener noreferrer" className="store-link">
          Наш магазин
        </a>
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
                <button className="btn generate-btn" onClick={applyCrop}>Застосувати малюнок</button>
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
              <iframe
                src="https://www.youtube.com/embed/-NRKDgkUtJM"
                title="Відеоінструкція"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen>
              </iframe>
            </div>

            <ol className="steps-list">
              <li><strong>Налаштування:</strong> Обери свій принтер та сопло.</li>
              <li><strong>Завантаження:</strong> Завантаж фото (краще контрастне)</li>
              <li><strong>Генерація:</strong> Обріж фото та натисни кнопку "Згенерувати спіраль".</li>
              <li><strong>Налаштування витків та контрасту:</strong> Відрегулюй кількість витків та контраст, після чого натисни "Згенерувати".</li>
              <li><strong>Завантаження G-Code:</strong> Натисни зелену кнопку завантаження G-Code.</li>
              <li><strong>Друк:</strong> Надрукуй отриманий G-Code на принтері. Якщо увімкнено підкладку, принтер призупиниться після друку білої підкладки для зміни філаменту на темний.</li>
            </ol>

            <div className="warning-text">
              ⚠️ УВАГА: Перед запуском спіралі вимкніть авто-калібрування столу (Bed Leveling).
            </div>

            {printerModel === 'h2d' && (
              <div className="warning-text" style={{ backgroundColor: '#e0e7ff', color: '#3730a3', marginTop: '10px' }}>
                ℹ️ <strong>Для принтера H2D:</strong> Білий пластик заправте в ЛІВЕ сопло (T1), чорний — в ПРАВЕ сопло (T0).
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
