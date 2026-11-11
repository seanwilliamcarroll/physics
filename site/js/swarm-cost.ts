// The boids page's cost measurement, the pure part (node-tested): the
// world a flock of n flies in at the page's density, and the table of
// ns per boid-step by mode (docs/15-swarm.md, "What's measured").

import type { CostTable } from "./perf.ts";

/** The page's world for its default flock: 10k boids in 2560 × 1440
 *  world pixels, drawn at half scale (docs/15-swarm.md, S1.4). */
export const DEFAULT_N = 10_000;
export const WORLD: [number, number] = [2560, 1440];

/** The world for `n` boids at the default's density: sides grow with
 *  √n, rounded, at least 64 px. */
export function worldFor(n: number): [number, number] {
  const s = Math.sqrt(n / DEFAULT_N);
  return [Math.max(64, Math.round(WORLD[0] * s)), Math.max(64, Math.round(WORLD[1] * s))];
}

/** ns per boid-step from ms per step. */
export function nsPerBoid(msPerStep: number, n: number): number {
  return n > 0 ? (msPerStep * 1e6) / n : Number.NaN;
}

/** The measured table: per n, each mode's ms per step and ns per boid.
 *  Flat ns per boid as n grows is O(n); growing with n is O(n²). */
export function costHtml(table: CostTable, labels: string[]): string {
  const head = labels.map((l) => `<th>${l} ms/step</th><th>${l} ns/boid</th>`).join("");
  const fmt = (v: number | null, digits: number) => (v === null ? "–" : v.toFixed(digits));
  const body = table.rows().map(([n, values]) => {
    const cells = values
      .map((ms) => `<td>${fmt(ms, 2)}</td><td>${fmt(ms === null ? null : nsPerBoid(ms, n), 0)}</td>`)
      .join("");
    return `<tr><td>${n.toLocaleString()}</td>${cells}</tr>`;
  });
  return `<table><thead><tr><th>boids</th>${head}</tr></thead><tbody>${body.join("")}</tbody></table>`;
}
