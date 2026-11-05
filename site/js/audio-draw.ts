// Drawing for the acoustic pages: a waveform (A1's loop, A2's string) and
// a spectrum with its harmonics marked (A2).

/** Colors, from the stylesheet; `stretched` marks a stiff string's
 *  partials (A3), `missing` the harmonics a position silences (A2). */
export type DrawColors = { background: string; line: string; grid: string; text: string; missing: string; stretched?: string };

/** The waveform's ±1 fills this much of the canvas's half height. */
const WAVE_FILL = 0.9;
/** Labels: font size, and their offset from a mark or the corner, CSS px. */
const LABEL_PX = 12;
const LABEL_BASELINE_PX = 14;
const LABEL_INSET_PX = 4;
const HZ_PER_KHZ = 1000;

function labelFont(ctx: CanvasRenderingContext2D): void {
  ctx.font = `${LABEL_PX * window.devicePixelRatio}px sans-serif`;
}

function background(ctx: CanvasRenderingContext2D, c: DrawColors): void {
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = c.background;
  ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
}

/** `samples` across the canvas (±1 fills the height), and a center line;
 *  `marks` are vertical lines at fractions of the width (a pluck, a
 *  pickup). */
export function drawWave(ctx: CanvasRenderingContext2D, samples: Float32Array, c: DrawColors, marks: { at: number; label: string }[] = []): void {
  const { width: w, height: h } = ctx.canvas;
  background(ctx, c);
  ctx.strokeStyle = c.grid;
  ctx.lineWidth = Math.max(1, window.devicePixelRatio);
  ctx.beginPath();
  ctx.moveTo(0, h / 2);
  ctx.lineTo(w, h / 2);
  for (const m of marks) {
    ctx.moveTo(m.at * w, 0);
    ctx.lineTo(m.at * w, h);
  }
  ctx.stroke();
  ctx.fillStyle = c.text;
  labelFont(ctx);
  const dpr = window.devicePixelRatio;
  for (const m of marks) ctx.fillText(m.label, m.at * w + LABEL_INSET_PX * dpr, LABEL_BASELINE_PX * dpr);
  if (samples.length < 2) return;
  ctx.strokeStyle = c.line;
  ctx.beginPath();
  samples.forEach((v, i) => {
    const x = (i / (samples.length - 1)) * w;
    const y = h / 2 - v * (h / 2) * WAVE_FILL;
    if (i === 0) ctx.moveTo(x, y);
    else ctx.lineTo(x, y);
  });
  ctx.stroke();
}

/** A stiff string's partial ticks: this much of the height, this thick. */
const PARTIAL_TICK_LENGTH = 0.25;
const PARTIAL_TICK_WIDTH = 2;

/** The spectrum's frequency and level ranges. */
const MAX_HZ = 5000;
const MIN_DB = -90;

/** `db` (bins `rate / (2 · db.length)` Hz apart) from 0 to 5 kHz, with
 *  ticks at the harmonics of `f0` and the ones in `missing` marked, and
 *  short ticks at `partials` (Hz: a stiff string's, A3), on top. */
export function drawSpectrum(
  ctx: CanvasRenderingContext2D, db: Float32Array, rate: number, f0: number | null, missing: number[], c: DrawColors,
  partials: number[] = [],
): void {
  const { width: w, height: h } = ctx.canvas;
  background(ctx, c);
  const binHz = rate / (2 * db.length);
  const x = (hz: number) => (hz / MAX_HZ) * w;
  const y = (level: number) => (Math.max(MIN_DB, Math.min(0, level)) / MIN_DB) * h;
  if (f0 !== null) {
    ctx.lineWidth = Math.max(1, window.devicePixelRatio);
    for (let k = 1; k * f0 < MAX_HZ; k++) {
      ctx.strokeStyle = missing.includes(k) ? c.missing : c.grid;
      ctx.beginPath();
      ctx.moveTo(x(k * f0), 0);
      ctx.lineTo(x(k * f0), h);
      ctx.stroke();
    }
  }
  if (partials.length > 0) {
    ctx.strokeStyle = c.stretched ?? c.missing;
    ctx.lineWidth = Math.max(1, window.devicePixelRatio) * PARTIAL_TICK_WIDTH;
    ctx.beginPath();
    for (const hz of partials) {
      if (hz >= MAX_HZ) continue;
      ctx.moveTo(x(hz), 0);
      ctx.lineTo(x(hz), h * PARTIAL_TICK_LENGTH);
    }
    ctx.stroke();
    ctx.lineWidth = Math.max(1, window.devicePixelRatio);
  }
  ctx.strokeStyle = c.line;
  ctx.beginPath();
  for (let k = 0; k * binHz <= MAX_HZ && k < db.length; k++) {
    const px = x(k * binHz);
    const py = y(db[k] ?? MIN_DB);
    if (k === 0) ctx.moveTo(px, py);
    else ctx.lineTo(px, py);
  }
  ctx.stroke();
  ctx.fillStyle = c.text;
  labelFont(ctx);
  const dpr = window.devicePixelRatio;
  ctx.fillText(`0–${MAX_HZ / HZ_PER_KHZ} kHz, ${MIN_DB}…0 dB`, LABEL_INSET_PX * dpr, h - LABEL_INSET_PX * dpr);
}

/** The hammer force plot's time span, ms (the trace's length, 12 ms). */
const TRACE_MS = 12;
/** The force's peak fills this much of the height. */
const TRACE_FILL = 0.85;
const MS_PER_S = 1000;

/** The latest strike's hammer force (`force`, N, one per sample at
 *  `rate`) against time from impact, 0 to 12 ms, labeled with its peak and
 *  how long the felt pushed. */
export function drawTrace(ctx: CanvasRenderingContext2D, force: Float32Array, rate: number, c: DrawColors): void {
  const { width: w, height: h } = ctx.canvas;
  background(ctx, c);
  const dpr = window.devicePixelRatio;
  ctx.lineWidth = Math.max(1, dpr);
  ctx.strokeStyle = c.grid;
  ctx.beginPath();
  for (let ms = 1; ms < TRACE_MS; ms++) {
    ctx.moveTo((ms / TRACE_MS) * w, h);
    ctx.lineTo((ms / TRACE_MS) * w, h - LABEL_BASELINE_PX * dpr);
  }
  ctx.stroke();
  ctx.fillStyle = c.text;
  labelFont(ctx);
  let peak = 0;
  let last = -1;
  force.forEach((f, i) => {
    peak = Math.max(peak, f);
    if (f > 0) last = i;
  });
  const label = force.length === 0
    ? "no strike yet"
    : `peak ${peak.toFixed(1)} N · the felt pushed for ${(((last + 1) / rate) * MS_PER_S).toFixed(2)} ms · 0–${TRACE_MS} ms`;
  ctx.fillText(label, LABEL_INSET_PX * dpr, LABEL_BASELINE_PX * dpr);
  if (force.length < 2 || peak <= 0) return;
  ctx.strokeStyle = c.line;
  ctx.beginPath();
  force.forEach((f, i) => {
    const px = ((i / rate) * MS_PER_S / TRACE_MS) * w;
    const py = h - (f / peak) * h * TRACE_FILL;
    if (i === 0) ctx.moveTo(px, py);
    else ctx.lineTo(px, py);
  });
  ctx.stroke();
}
