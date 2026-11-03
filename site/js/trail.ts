// Fading position history per particle ("orbit trails"). Rendering only:
// Rust returns current positions, and JS remembers where they've been
// (TASKS.md M1 decision 6).

import { Ring } from "./ring.ts";
import { COORDS_PER_PARTICLE } from "./abi.ts";
import { devicePx, type View } from "./canvas.ts";

/** How many opacity steps a trail fades through. Each band is one path and
 *  one stroke, so the fade costs a handful of strokes per frame rather than
 *  one per segment; 8 steps already read as a smooth fade. */
const FADE_BANDS = 8;

/** Splits a history of `length` points into up to `bands` runs for
 *  drawing, oldest first: `[start, end, alpha]` with `end` exclusive.
 *  Neighboring runs share one point, so their lines join; opacity rises to
 *  1 at the newest. Pure, so it's unit-tested. */
export function fadeBands(length: number, bands: number): [number, number, number][] {
  const segments = length - 1;
  if (segments < 1) return [];
  const count = Math.min(bands, segments);
  const out: [number, number, number][] = [];
  for (let k = 0; k < count; k++) {
    const start = Math.round((k * segments) / count);
    const end = Math.round(((k + 1) * segments) / count) + 1;
    out.push([start, end, (k + 1) / count]);
  }
  return out;
}

export class Trail {
  /** Points remembered per particle. */
  readonly capacity: number;
  paths: { x: Ring; y: Ring }[] = [];

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  /** Records the current interleaved positions (one point per particle). */
  push(pos: Float32Array): void {
    const n = pos.length / COORDS_PER_PARTICLE;
    while (this.paths.length < n) {
      this.paths.push({ x: new Ring(this.capacity), y: new Ring(this.capacity) });
    }
    this.paths.forEach((path, i) => {
      path.x.push(pos[i * COORDS_PER_PARTICLE] ?? Number.NaN);
      path.y.push(pos[i * COORDS_PER_PARTICLE + 1] ?? Number.NaN);
    });
  }

  clear(): void {
    this.paths = [];
  }

  /** Draws every trail, `widthPx` CSS pixels wide. Assumes
   *  `view.apply(ctx)` was called (world units). */
  draw(ctx: CanvasRenderingContext2D, view: View, color: string, widthPx: number): void {
    ctx.save();
    ctx.strokeStyle = color;
    ctx.lineWidth = devicePx(widthPx) / view.scale(ctx.canvas);
    for (const { x, y } of this.paths) {
      for (const [start, end, alpha] of fadeBands(x.length, FADE_BANDS)) {
        ctx.globalAlpha = alpha;
        ctx.beginPath();
        ctx.moveTo(x.at(start), y.at(start));
        for (let k = start + 1; k < end; k++) ctx.lineTo(x.at(k), y.at(k));
        ctx.stroke();
      }
    }
    ctx.restore();
  }
}
