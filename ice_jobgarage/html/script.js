let vehicles = [];
let currentCategory = null;
let garageKey = null;

const app = document.getElementById('app');
const vehicleList = document.getElementById('vehicleList');
const searchInput = document.getElementById('search');
const closeBtn = document.getElementById('closeBtn');
const tabs = document.getElementById('tabs');
const titleEl = document.getElementById('title');

const defaultLocale = {
  lang: 'en',
  title: 'Garage',
  close: 'Close',
  search: 'Search for vehicles...',
  unknown_category: 'Unknown',
  none_found: 'No vehicles found',
  speed: 'Speed',
  acceleration: 'Acceleration',
  handling: 'Handling',
  spawn: 'Spawn Vehicle',
  spawning: 'Spawning...',
  speed_unit: ' km/h',
  accel_unit: '/10',
  handling_unit: '/10'
};

let localeStrings = { ...defaultLocale };

function applyLocale(strings = {}, langCode) {
  localeStrings = { ...defaultLocale, ...(strings || {}) };
  document.documentElement.lang = (langCode || localeStrings.lang || defaultLocale.lang || 'en');
  document.title = localeStrings.title || defaultLocale.title;
  closeBtn.textContent = localeStrings.close || defaultLocale.close;
  searchInput.placeholder = localeStrings.search || defaultLocale.search;
}

applyLocale();

app.style.display = 'none';

function hexToRgb(hex) {
  if (!hex) return null;
  let cleaned = hex.replace('#', '');
  if (cleaned.length === 3) cleaned = cleaned.split('').map((c) => c + c).join('');
  if (cleaned.length < 6) return null;
  const intVal = parseInt(cleaned.slice(0, 6), 16);
  if (Number.isNaN(intVal)) return null;
  return { r: (intVal >> 16) & 255, g: (intVal >> 8) & 255, b: intVal & 255 };
}

function colorWithAlpha(color, alpha) {
  if (!color) return null;
  const match = color.match(/rgba?\(([^)]+)\)/i);
  if (match) {
    const parts = match[1].split(',').map((p) => p.trim());
    if (parts.length >= 3) {
      const [r, g, b] = parts;
      return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }
  }
  const rgb = hexToRgb(color);
  if (rgb) return `rgba(${rgb.r}, ${rgb.g}, ${rgb.b}, ${alpha})`;
  return null;
}

function toColor(value) {
  if (!value) return null;
  const trimmed = value.trim();
  if (/^rgba?\(/i.test(trimmed)) return trimmed;

  let v = trimmed.replace('#', '');
  if (!/^[0-9a-f]{6,8}$/i.test(v)) return trimmed;

  const r = parseInt(v.slice(0, 2), 16);
  const g = parseInt(v.slice(2, 4), 16);
  const b = parseInt(v.slice(4, 6), 16);

  if (v.length === 8) {
    const a = parseInt(v.slice(6, 8), 16);
    if (a < 255) {
      const alpha = +(a / 255).toFixed(3);
      return `rgba(${r}, ${g}, ${b}, ${alpha})`;
    }
  }
  return `#${v.slice(0, 6)}`;
}

function applyColors(colors) {
  const palette = colors || {};
  if (!colors) return; // hvis CSS skal bestemme farven
  const hasAny =
    palette.primary || palette.primaryLight || palette.primaryDark ||
    palette.primarySoft || palette.primaryGlow || palette.text;
  if (!hasAny) return; // bevar CSS-toppen hvis ingen farver er sendt fra config/colors.json

  const rootStyles = getComputedStyle(document.documentElement);
  const current = (key, fallback) => (rootStyles.getPropertyValue(key) || fallback || '').trim();

  const accent = toColor(palette.primary) || palette.primary || current('--accent', '#ff2222');
  const strong = toColor(palette.primaryDark) || current('--accent-strong', accent);
  const soft = toColor(palette.primaryLight) || palette.primarySoft || current('--accent-soft', accent);
  const text = toColor(palette.text) || palette.text || current('--text-color', '#ffffff');
  const glow = palette.primaryGlow || colorWithAlpha(accent, 0.4) || current('--accent-glow', accent);

  const root = document.documentElement;
  root.style.setProperty('--accent', accent);
  root.style.setProperty('--accent-strong', strong);
  root.style.setProperty('--accent-soft', soft);
  root.style.setProperty('--accent-glow', glow);
  root.style.setProperty('--text-color', text);
}

window.addEventListener('message', (event) => {
  const d = event.data;
  if (d.action === 'open') {
    applyLocale(d.locale, d.lang);
    vehicles = d.vehicles || [];
    garageKey = d.garageKey || null;
    const headerTitle = d.label || localeStrings.title || defaultLocale.title;
    titleEl.textContent = headerTitle;
    document.title = headerTitle;
    applyColors(d.colors);
    app.style.display = 'flex';
    buildTabs();
    renderList();
    setTimeout(() => searchInput.focus(), 100);
  } else if (d.action === 'close') {
    app.style.display = 'none';
    vehicles = [];
    garageKey = null;
    searchInput.value = '';
  }
});

closeBtn.onclick = () => {
  fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' }).then(() => {});
};

function uniqCategories() {
  const s = new Set();
  const unknown = localeStrings.unknown_category || defaultLocale.unknown_category;
  vehicles.forEach(v => s.add(v.category || unknown));
  return Array.from(s);
}

function buildTabs() {
  tabs.innerHTML = '';
  const cats = uniqCategories();
  currentCategory = cats[0] || null;

  cats.forEach(cat => {
    const btn = document.createElement('button');
    btn.className = 'tab' + (cat === currentCategory ? ' active' : '');
    btn.dataset.cat = cat;
    btn.textContent = cat;
    btn.addEventListener('click', (e) => {
      document.querySelectorAll('.tab').forEach(x => x.classList.remove('active'));
      e.currentTarget.classList.add('active');
      currentCategory = cat;
      renderList();
    });
    tabs.appendChild(btn);
  });
}

function renderList() {
  const q = (searchInput.value || '').toLowerCase();
  const unknownCategory = localeStrings.unknown_category || defaultLocale.unknown_category;
  let filtered = vehicles.map(v => ({
    ...v,
    category: v.category || unknownCategory
  }));
  if (currentCategory) filtered = filtered.filter(v => v.category === currentCategory);
  if (q) filtered = filtered.filter(v => (v.label || '').toLowerCase().includes(q) || (v.model || '').toLowerCase().includes(q));

  const labels = {
    speed: localeStrings.speed || defaultLocale.speed,
    acceleration: localeStrings.acceleration || defaultLocale.acceleration,
    handling: localeStrings.handling || defaultLocale.handling
  };
  const units = {
    speed: localeStrings.speed_unit || defaultLocale.speed_unit || '',
    accel: localeStrings.accel_unit || defaultLocale.accel_unit || '',
    handling: localeStrings.handling_unit || defaultLocale.handling_unit || ''
  };
  const spawnText = localeStrings.spawn || defaultLocale.spawn;
  const spawningText = localeStrings.spawning || defaultLocale.spawning;
  const noneFoundText = localeStrings.none_found || defaultLocale.none_found;

  vehicleList.innerHTML = '';
  
  if (filtered.length === 0) {
    vehicleList.innerHTML = `<div style="grid-column: 1 / -1; text-align: center; padding: 60px 20px; color: rgba(255, 255, 255, 0.5); font-size: 16px;">${noneFoundText}</div>`;
    return;
  }

  filtered.forEach(v => {
    const imgPath = `img/${v.model}.png`;
    const card = document.createElement('div');
    card.className = 'card';
    
    const speed = (v.stats && v.stats.speed) || '-';
    const accel = (v.stats && v.stats.accel) || '-';
    const handling = (v.stats && v.stats.handling) || '-';
    
    card.innerHTML = `
      <img src="${imgPath}" class="vehicle-img" onerror="this.style.display='none'" />
      <h3>${v.label}</h3>
      <div class="stats">
        <div class="stat">
          <strong>${labels.speed}:</strong>
          <span>${speed}${speed !== '-' ? units.speed : ''}</span>
        </div>
        <div class="stat">
          <strong>${labels.acceleration}:</strong>
          <span>${accel}${accel !== '-' ? units.accel : ''}</span>
        </div>
        <div class="stat">
          <strong>${labels.handling}:</strong>
          <span>${handling}${handling !== '-' ? units.handling : ''}</span>
        </div>
      </div>
      <div class="spawn">
        <button class="btn spawnBtn">${spawnText}</button>
      </div>
    `;
    
    const spawnBtn = card.querySelector('.spawnBtn');
    spawnBtn.addEventListener('click', () => {
      spawnBtn.textContent = spawningText;
      spawnBtn.disabled = true;
      
      fetch(`https://${GetParentResourceName()}/spawnVehicle`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: JSON.stringify({ model: v.model, garageKey })
      }).then(() => {
        fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' });
      }).catch(() => {
        spawnBtn.textContent = spawnText;
        spawnBtn.disabled = false;
      });
    });
    
    vehicleList.appendChild(card);
  });
}

searchInput.addEventListener('input', renderList);

document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && app.style.display === 'flex') {
    closeBtn.click();
  }
});
