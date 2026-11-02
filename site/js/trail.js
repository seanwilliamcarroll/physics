// Fading position history per particle ("orbit trails"). Rendering only:
// Rust returns current positions, and JS remembers where they've been
// (TASKS.md M1 decision 6).

import { Ring } from "./ring.js";
import { COORDS_PER_PARTICLE } from "./abi.js";
import { devicePx } from "./canvas.js";

/** How many opacity steps a trail fades through. Each band is one path and
 *  one stroke, so the fade costs a handful of strokes per frame rather than
 *  one per segment; 8 steps already read as a smooth fade. */
const FADE_BANDS = 8;

/** Splits a history of `length` points into up to `bands` runs for
 *  drawing, oldest first: `[start, end, alpha]` with `end` exclusive.
 *  Neighboring runs share one point, so their lines join; opacity rises to
 *  1 at the newest. Pure, so it's unit-tested.
 *  @param {number} length
 *  @param {number} bands
 *  @returns {[number, number, number][]} */
export function fadeBands(length, bands) {
  const segments = length - 1;
  if (segments < 1) return [];
  const count = Math.min(bands, segments);
  /** @type {[number, number, number][]} */
  const out = [];
  for (let k = 0; k < count; k++) {
    const start = Math.round((k * segments) / count);
    const end = Math.round(((k + 1) * segments) / count) + 1;
    out.push([start, end, (k + 1) / count]);
  }
  return out;
}

/** @typedef {import("./canvas.js").View} View */

export class Trail {
  /** @param {number} capacity points remembered per particle */
  constructor(capacity) {
    this.capacity = capacity;
    /** @type {{ x: Ring, y: Ring }[]} */
    this.paths = [];
  }

  /** Records the current interleaved positions (one point per particle).
   *  @param {Float32Array} pos */
  push(pos) {
    const n = pos.length / COORDS_PER_PARTICLE;
    while (this.paths.length < n) {
      this.paths.push({ x: new Ring(this.capacity), y: new Ring(this.capacity) });
    }
    this.paths.forEach((path, i) => {
      path.x.push(pos[i * COORDS_PER_PARTICLE] ?? Number.NaN);
      path.y.push(pos[i * COORDS_PER_PARTICLE + 1] ?? Number.NaN);
    });
  }

  clear() {
    this.paths = [];
  }

  /** Draws every trail. Assumes `view.apply(ctx)` was called (world units).
   *  @param {CanvasRenderingContext2D} ctx
   *  @param {View} view
   *  @param {string} color
   *  @param {number} widthPx CSS pixels */
  draw(ctx, view, color, widthPx) {
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
