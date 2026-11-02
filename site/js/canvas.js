// Canvas 2D helpers: high-DPI sizing and a world (meters, y up) to screen
// (pixels, y down) transform.

import { COORDS_PER_PARTICLE } from "./abi.js";

/** Keeps the canvas backing store at devicePixelRatio x its CSS size, so
 *  drawing is sharp on high-DPI screens. Returns the 2D context.
 *  @param {HTMLCanvasElement} canvas
 *  @returns {CanvasRenderingContext2D} */
export function setupCanvas(canvas) {
  const ctx = canvas.getContext("2d");
  if (ctx === null) {
    // getContext returns null if the canvas already has another context
    // type (e.g. WebGL); fail here, clearly, not later with a TypeError.
    throw new Error("Canvas 2D context unavailable");
  }
  const resize = () => {
    const dpr = window.devicePixelRatio || 1;
    canvas.width = Math.round(canvas.clientWidth * dpr);
    canvas.height = Math.round(canvas.clientHeight * dpr);
  };
  new ResizeObserver(resize).observe(canvas);
  resize();
  return ctx;
}

/** A world-space rectangle (meters) fitted into the canvas, aspect preserved
 *  and centered. */
export class View {
  /** @param {{ xMin: number, xMax: number, yMin: number, yMax: number }} bounds */
  constructor({ xMin, xMax, yMin, yMax }) {
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
  }

  /** Device pixels per meter for the current canvas size.
   *  @param {HTMLCanvasElement} canvas
   *  @returns {number} */
  scale(canvas) {
    return Math.min(
      canvas.width / (this.xMax - this.xMin),
      canvas.height / (this.yMax - this.yMin),
    );
  }

  /** Sets ctx's transform so subsequent drawing is in meters, y up. One
   *  setTransform instead of converting every point in JS.
   *  @param {CanvasRenderingContext2D} ctx */
  apply(ctx) {
    const s = this.scale(ctx.canvas);
    const cx = (this.xMin + this.xMax) / 2;
    const cy = (this.yMin + this.yMax) / 2;
    // x' = s*x + e, y' = -s*y + f, with the view center at the canvas center.
    ctx.setTransform(s, 0, 0, -s,
      ctx.canvas.width / 2 - s * cx,
      ctx.canvas.height / 2 + s * cy);
  }

  /** World x-range actually visible: wider than [xMin, xMax] when the
   *  canvas is wider than the view's aspect ratio.
   *  @param {HTMLCanvasElement} canvas
   *  @returns {[number, number]} */
  visibleX(canvas) {
    const halfWidth = canvas.width / this.scale(canvas) / 2;
    const cx = (this.xMin + this.xMax) / 2;
    return [cx - halfWidth, cx + halfWidth];
  }
}

/** Device pixels for a length given in CSS pixels.
 *  @param {number} cssPx
 *  @returns {number} */
function devicePx(cssPx) {
  return cssPx * (window.devicePixelRatio || 1);
}

/** Clears the whole canvas, regardless of the current transform.
 *  @param {CanvasRenderingContext2D} ctx
 *  @param {string} color */
export function clear(ctx, color) {
  ctx.save();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = color;
  ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
  ctx.restore();
}

/** Rects per path in drawPoints. Chrome serializes each draw call into one
 *  GPU command of at most ~16 MiB ("Failed to serialize op in 16777152
 *  bytes"), roughly 34 bytes per rect, so one path of ~500k rects is
 *  silently dropped. 50k rects (~1.7 MB) leaves a wide margin while still
 *  needing only 40 fills at the 2M maximum. */
const RECTS_PER_PATH = 50_000;

/** Draws interleaved [x0, y0, ...] world positions as squares `sizePx` CSS
 *  pixels wide. Batched: many rects per path, one fill per path (separate
 *  fills per point are far slower), chunked to stay under the browser's
 *  per-command size limit. Assumes `view.apply(ctx)` was called.
 *  @param {CanvasRenderingContext2D} ctx
 *  @param {View} view
 *  @param {Float32Array} pos
 *  @param {number} sizePx
 *  @param {string} color */
export function drawPoints(ctx, view, pos, sizePx, color) {
  const size = devicePx(sizePx) / view.scale(ctx.canvas);
  const half = size / 2;
  const chunk = COORDS_PER_PARTICLE * RECTS_PER_PATH;
  ctx.fillStyle = color;
  for (let start = 0; start < pos.length; start += chunk) {
    const end = Math.min(start + chunk, pos.length);
    ctx.beginPath();
    for (let i = start; i < end; i += COORDS_PER_PARTICLE) {
      ctx.rect(pos[i] - half, pos[i + 1] - half, size, size);
    }
    ctx.fill();
  }
}

/** A horizontal line at world height `y` across the whole canvas,
 *  `widthPx` CSS pixels thick.
 *  @param {CanvasRenderingContext2D} ctx
 *  @param {View} view
 *  @param {number} y
 *  @param {number} widthPx
 *  @param {string} color */
export function drawHorizon(ctx, view, y, widthPx, color) {
  const [left, right] = view.visibleX(ctx.canvas);
  ctx.strokeStyle = color;
  ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
  ctx.beginPath();
  ctx.moveTo(left, y);
  ctx.lineTo(right, y);
  ctx.stroke();
}

/** Reads a CSS custom property (e.g. "--particle") from `el`, so colors are
 *  defined once, in the stylesheet.
 *  @param {Element} el
 *  @param {string} name
 *  @returns {string} */
export function cssColor(el, name) {
  return getComputedStyle(el).getPropertyValue(name).trim();
}
