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

/** A world-space rectangle in meters. */
export type ViewBox = { xMin: number; xMax: number; yMin: number; yMax: number };

/** World (m, y up) to device pixels (y down) as `x' = s*x + e`,
 *  `y' = -s*y + f`: the 2D-canvas matrix `(s, 0, 0, -s, e, f)`. */
export type ViewTransform = { s: number; e: number; f: number };

/** The transform fitting `box` into a `width` x `height` (device pixel)
 *  canvas: aspect preserved (the tighter axis sets `s`), box center at the
 *  canvas center, so the looser axis shows extra world (letterboxing).
 *  Pure, so it's unit-tested. */
export function viewTransform(box: ViewBox, width: number, height: number): ViewTransform {
  const s = Math.min(width / (box.xMax - box.xMin), height / (box.yMax - box.yMin));
  const cx = (box.xMin + box.xMax) / 2;
  const cy = (box.yMin + box.yMax) / 2;
  return { s, e: width / 2 - s * cx, f: height / 2 + s * cy };
}

/** World point to device pixels under `t`. */
export function worldToDevice(t: ViewTransform, x: number, y: number): [number, number] {
  return [t.s * x + t.e, -t.s * y + t.f];
}

/** Device pixels to world point: the exact inverse of `worldToDevice`. */
export function deviceToWorld(t: ViewTransform, px: number, py: number): [number, number] {
  return [(px - t.e) / t.s, (t.f - py) / t.s];
}

/** A world-space rectangle (meters) fitted into the canvas, aspect preserved
 *  and centered. */
export class View implements ViewBox {
  readonly xMin: number;
  readonly xMax: number;
  readonly yMin: number;
  readonly yMax: number;

  constructor({ xMin, xMax, yMin, yMax }: ViewBox) {
    this.xMin = xMin;
    this.xMax = xMax;
    this.yMin = yMin;
    this.yMax = yMax;
  }

  /** Device pixels per meter for the current canvas size. */
  scale(canvas: HTMLCanvasElement): number {
    return viewTransform(this, canvas.width, canvas.height).s;
  }

  /** Sets ctx's transform so subsequent drawing is in meters, y up. One
   *  setTransform instead of converting every point in JS. */
  apply(ctx: CanvasRenderingContext2D): void {
    const { s, e, f } = viewTransform(this, ctx.canvas.width, ctx.canvas.height);
    ctx.setTransform(s, 0, 0, -s, e, f);
  }

  /** World point under a pointer `cssX`, `cssY` CSS pixels from the
   *  canvas's top-left corner (`clientX - rect.left`): the inverse of
   *  `apply`. CSS pixels become device pixels by the canvas's own
   *  backing-store ratio (`width / rect.width`) rather than
   *  `devicePixelRatio`: that ratio is what the browser actually stretches,
   *  including `setupCanvas`'s rounding and the frame between a zoom and
   *  the resize callback. */
  toWorld(canvas: HTMLCanvasElement, cssX: number, cssY: number): [number, number] {
    const rect = canvas.getBoundingClientRect();
    const t = viewTransform(this, canvas.width, canvas.height);
    return deviceToWorld(t, cssX * (canvas.width / rect.width), cssY * (canvas.height / rect.height));
  }

  /** World meters for a length in CSS pixels (e.g. a pick radius). */
  cssToWorld(canvas: HTMLCanvasElement, cssPx: number): number {
    return (cssPx * canvas.width) / canvas.getBoundingClientRect().width / this.scale(canvas);
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

/** A line from world point `a` to `b`, `widthPx` CSS pixels thick.
 *  Assumes `view.apply(ctx)` was called. */
export function drawSegment(
  ctx: CanvasRenderingContext2D,
  view: View,
  a: [number, number],
  b: [number, number],
  widthPx: number,
  color: string,
): void {
  ctx.strokeStyle = color;
  ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
  ctx.beginPath();
  ctx.moveTo(a[0], a[1]);
  ctx.lineTo(b[0], b[1]);
  ctx.stroke();
}

/** Particle indices per link in `drawLinks`'s index buffer. */
const INDICES_PER_LINK = 2;

/** One line per link between particles: `links` is `[a0, b0, a1, b1, …]`
 *  (as `demo_links_ptr/len` will expose) into interleaved positions `pos`.
 *  One path and one stroke for all links. Links naming a particle past the
 *  end of `pos` are skipped (a stale index buffer mustn't draw to NaN or
 *  throw), as is a dangling last index. Assumes `view.apply(ctx)` was
 *  called. */
export function drawLinks(
  ctx: CanvasRenderingContext2D,
  view: View,
  pos: Float32Array,
  links: Uint32Array,
  widthPx: number,
  color: string,
): void {
  const count = Math.floor(pos.length / COORDS_PER_PARTICLE);
  ctx.strokeStyle = color;
  ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
  ctx.beginPath();
  for (let k = 0; k + INDICES_PER_LINK <= links.length; k += INDICES_PER_LINK) {
    const a = links[k];
    const b = links[k + 1];
    if (a >= count || b >= count) continue;
    ctx.moveTo(pos[a * COORDS_PER_PARTICLE], pos[a * COORDS_PER_PARTICLE + 1]);
    ctx.lineTo(pos[b * COORDS_PER_PARTICLE], pos[b * COORDS_PER_PARTICLE + 1]);
  }
  ctx.stroke();
}

/** A circle outline of world radius `r` around `center`, `widthPx` CSS
 *  pixels thick. Assumes `view.apply(ctx)` was called. */
export function drawCircle(
  ctx: CanvasRenderingContext2D,
  view: View,
  center: [number, number],
  r: number,
  widthPx: number,
  color: string,
): void {
  ctx.strokeStyle = color;
  ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
  ctx.beginPath();
  ctx.arc(center[0], center[1], r, 0, 2 * Math.PI);
  ctx.stroke();
}
