// Drawing for the acoustic pages: a waveform (A1's loop, A2's string) and
// a spectrum with its harmonics marked (A2).

/** Colors, from the stylesheet. */
export type DrawColors = { background: string; line: string; grid: string; text: string; missing: string };

/** The waveform's ±1 fills this much of the canvas's half height. */
const WAVE_FILL = 0.9;

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
  ctx.font = `${12 * window.devicePixelRatio}px sans-serif`;
  for (const m of marks) ctx.fillText(m.label, m.at * w + 4, 14 * window.devicePixelRatio);
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

/** The spectrum's frequency and level ranges. */
const MAX_HZ = 5000;
const MIN_DB = -90;

/** `db` (bins `rate / (2 · db.length)` Hz apart) from 0 to 5 kHz, with
 *  ticks at the harmonics of `f0` and the ones in `missing` marked. */
export function drawSpectrum(
  ctx: CanvasRenderingContext2D, db: Float32Array, rate: number, f0: number | null, missing: number[], c: DrawColors,
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
  ctx.font = `${12 * window.devicePixelRatio}px sans-serif`;
  ctx.fillText(`0–${MAX_HZ / 1000} kHz, ${MIN_DB}…0 dB`, 4, h - 6);
}
