// Canvas 2D helpers: high-DPI sizing and a world (meters, y up) to screen
// (pixels, y down) transform.

/** Keeps the canvas backing store at devicePixelRatio x its CSS size, so
 *  drawing is sharp on high-DPI screens. Returns the 2D context. */
export function setupCanvas(canvas) {
  const ctx = canvas.getContext("2d");
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
  constructor({ xMin, xMax, yMin, yMax }) {
    Object.assign(this, { xMin, xMax, yMin, yMax });
  }

  /** Device pixels per meter for the current canvas size. */
  scale(canvas) {
    return Math.min(
      canvas.width / (this.xMax - this.xMin),
      canvas.height / (this.yMax - this.yMin),
    );
  }

  /** Sets ctx's transform so subsequent drawing is in meters, y up. One
   *  setTransform instead of converting every point in JS. */
  apply(ctx) {
    const s = this.scale(ctx.canvas);
    const cx = (this.xMin + this.xMax) / 2;
    const cy = (this.yMin + this.yMax) / 2;
    // x' = s*x + e, y' = -s*y + f, with the view center at the canvas center.
    ctx.setTransform(s, 0, 0, -s,
      ctx.canvas.width / 2 - s * cx,
      ctx.canvas.height / 2 + s * cy);
  }
}

/** Clears the whole canvas, regardless of the current transform. */
export function clear(ctx, color) {
  ctx.save();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = color;
  ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
  ctx.restore();
}

/** Draws interleaved [x0, y0, ...] world positions as squares `sizePx` CSS
 *  pixels wide. Batched: one path, many rects, one fill (separate fills per
 *  point are far slower). Assumes `view.apply(ctx)` was called. */
export function drawPoints(ctx, view, pos, sizePx, color) {
  const size = (sizePx * (window.devicePixelRatio || 1)) / view.scale(ctx.canvas);
  const half = size / 2;
  ctx.fillStyle = color;
  ctx.beginPath();
  for (let i = 0; i < pos.length; i += 2) {
    ctx.rect(pos[i] - half, pos[i + 1] - half, size, size);
  }
  ctx.fill();
}

/** A horizontal line at world height `y` across the view, `widthPx` thick. */
export function drawHorizon(ctx, view, y, widthPx, color) {
  ctx.strokeStyle = color;
  ctx.lineWidth = (widthPx * (window.devicePixelRatio || 1)) / view.scale(ctx.canvas);
  ctx.beginPath();
  ctx.moveTo(view.xMin - 1e3, y);
  ctx.lineTo(view.xMax + 1e3, y);
  ctx.stroke();
}
