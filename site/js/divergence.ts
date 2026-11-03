// How far two runs of the same scene have drifted apart: the M2 page's
// f32-vs-f64 metric (TASKS.md M2 decision 6). Pure, so `node --test`
// covers it.

import { COORDS_PER_PARTICLE } from "./abi.ts";

/** Root-mean-square distance between matching bodies of two interleaved
 *  `[x0, y0, x1, y1, ...]` layouts, in meters. NaN when the layouts differ
 *  in length or are empty (nothing to compare). */
export function rmsDistance(a: Float32Array, b: Float32Array): number {
  if (a.length !== b.length || a.length === 0) return Number.NaN;
  let sum = 0;
  for (let i = 0; i < a.length; i++) {
    const d = a[i] - b[i];
    sum += d * d;
  }
  return Math.sqrt(sum / (a.length / COORDS_PER_PARTICLE));
}
