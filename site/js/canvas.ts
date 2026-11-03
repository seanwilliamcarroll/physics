// Canvas 2D helpers: high-DPI sizing and a world (meters, y up) to screen
// (pixels, y down) transform.

import { COORDS_PER_PARTICLE } from "./abi.ts";

/** Keeps the canvas backing store at devicePixelRatio x its CSS size, so
 *  drawing is sharp on high-DPI screens. Returns the 2D context. */
export function setupCanvas(canvas: HTMLCanvasElement): CanvasRenderingContext2D {
  const ctx = canvas.getContext("2d");
  if (ctx === null) {
    // getContext returns null if the canvas already has another context
    // type (e.g. WebGL); fail here, clearly, not later with a TypeError.
    throw new Error("Canvas 2D context unavailable");
  }
  const resize = () => {
    const dpr = window.devicePixelRatio || 1;
    const width = Math.round(canvas.clientWidth * dpr);
    const height = Math.round(canvas.clientHeight * dpr);
    // Assigning width or height clears the canvas, even to the same value,
    // and ResizeObserver calls back on layout changes that don't change
    // this canvas's size. Only assign on a real change.
    if (canvas.width !== width) canvas.width = width;
    if (canvas.height !== height) canvas.height = height;
  };
  new ResizeObserver(resize).observe(canvas);
  resize();
  return ctx;
}

/** A world-space rectangle (meters) fitted into the canvas, aspect preserved
 *  and centered. */
export class View {
  readonly xMin: number;
  readonly xMax: number;
  readonly yMin: number;
  readonly yMax: number;

  constructor({ xMin, xMax, yMin, yMax }: { xMin: number; xMax: number; yMin: number; yMax: number }) {
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
  }

  /** Device pixels per meter for the current canvas size. */
  scale(canvas: HTMLCanvasElement): number {
    return Math.min(
      canvas.width / (this.xMax - this.xMin),
      canvas.height / (this.yMax - this.yMin),
    );
  }

  /** Sets ctx's transform so subsequent drawing is in meters, y up. One
   *  setTransform instead of converting every point in JS. */
  apply(ctx: CanvasRenderingContext2D): void {
    const s = this.scale(ctx.canvas);
    const cx = (this.xMin + this.xMax) / 2;
    const cy = (this.yMin + this.yMax) / 2;
    // x' = s*x + e, y' = -s*y + f, with the view center at the canvas center.
    ctx.setTransform(s, 0, 0, -s,
      ctx.canvas.width / 2 - s * cx,
      ctx.canvas.height / 2 + s * cy);
  }

  /** World x-range actually visible: wider than [xMin, xMax] when the
   *  canvas is wider than the view's aspect ratio. */
  visibleX(canvas: HTMLCanvasElement): [number, number] {
    const halfWidth = canvas.width / this.scale(canvas) / 2;
    const cx = (this.xMin + this.xMax) / 2;
    return [cx - halfWidth, cx + halfWidth];
  }
}

/** Device pixels for a length given in CSS pixels. */
export function devicePx(cssPx: number): number {
  return cssPx * (window.devicePixelRatio || 1);
}

/** Clears the whole canvas, regardless of the current transform. */
export function clear(ctx: CanvasRenderingContext2D, color: string): void {
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
 *  per-command size limit. Assumes `view.apply(ctx)` was called. */
export function drawPoints(
  ctx: CanvasRenderingContext2D,
  view: View,
  pos: Float32Array,
  sizePx: number,
  color: string,
): void {
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
 *  `widthPx` CSS pixels thick. */
export function drawHorizon(
  ctx: CanvasRenderingContext2D,
  view: View,
  y: number,
  widthPx: number,
  color: string,
): void {
  const [left, right] = view.visibleX(ctx.canvas);
  ctx.strokeStyle = color;
  ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
  ctx.beginPath();
  ctx.moveTo(left, y);
  ctx.lineTo(right, y);
  ctx.stroke();
}

/** Reads a CSS custom property (e.g. "--particle") from `el`, so colors are
 *  defined once, in the stylesheet. */
export function cssColor(el: Element, name: string): string {
  return getComputedStyle(el).getPropertyValue(name).trim();
}
