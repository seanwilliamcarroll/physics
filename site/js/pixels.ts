// Pixel-buffer rendering (docs/03-wasm-shell.md, "Canvas 2D, pixel
// buffer"): Rust writes one RGBA u32 per cell into wasm memory; JS wraps
// those bytes in an ImageData (no copy) and puts it on a canvas exactly the
// grid's size, which CSS scales up with `image-rendering: pixelated` so a
// cell stays a crisp square. M9's sand; later A4's height map and the
// swarm track's trail maps.

/** RGBA: bytes per pixel. */
const BYTES_PER_PIXEL = 4;

/** Sizes `canvas`'s backing store to `width × height` pixels (one per
 *  cell; CSS sets the displayed size) and returns its 2D context. */
export function pixelCanvas(canvas: HTMLCanvasElement, width: number, height: number): CanvasRenderingContext2D {
  canvas.width = width;
  canvas.height = height;
  canvas.style.imageRendering = "pixelated";
  canvas.style.aspectRatio = `${width} / ${height}`;
  const ctx = canvas.getContext("2d");
  if (ctx === null) throw new Error("no 2D canvas context");
  return ctx;
}

/** Puts the `width × height` RGBA buffer at `ptr` in `memory` on `ctx`.
 *  The view is made fresh each call: memory growth detaches old ones. */
export function blit(
  ctx: CanvasRenderingContext2D,
  memory: WebAssembly.Memory,
  ptr: number,
  width: number,
  height: number,
): void {
  const bytes = new Uint8ClampedArray(memory.buffer, ptr, width * height * BYTES_PER_PIXEL);
  ctx.putImageData(new ImageData(bytes, width, height), 0, 0);
}

/** The cell under CSS point `(x, y)` of a canvas displayed `cssWidth ×
 *  cssHeight` showing a `width × height` grid. Not clamped: a drag past
 *  the edge gives cells outside, which the brush clips. */
export function cellAt(
  x: number,
  y: number,
  cssWidth: number,
  cssHeight: number,
  width: number,
  height: number,
): [number, number] {
  return [Math.floor((x * width) / cssWidth), Math.floor((y * height) / cssHeight)];
}

/** Points from `a` to `b` (both included) no more than `spacing` cells
 *  apart, rounded to cells: a fast drag paints a stroke, not dots. */
export function strokeCells(
  [x0, y0]: [number, number],
  [x1, y1]: [number, number],
  spacing: number,
): [number, number][] {
  const n = Math.max(1, Math.ceil(Math.hypot(x1 - x0, y1 - y0) / Math.max(1, spacing)));
  return Array.from({ length: n + 1 }, (_, i) => [
    Math.round(x0 + ((x1 - x0) * i) / n),
    Math.round(y0 + ((y1 - y0) * i) / n),
  ]);
}
