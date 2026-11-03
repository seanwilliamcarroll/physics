// Performance readouts shared by demo pages: per-frame timings for the HUD
// and a table of measured step cost at each N tried, so cost growth with N
// is visible on the page. CostTable and nsPerPair are pure (node-tested);
// costTableHtml only builds a string.

import { Smoothed } from "./loop.ts";

const NS_PER_MS = 1e6;

/** Nanoseconds per interacting pair for a step of `n` bodies that took
 *  `msPerStep`: direct summation does n(n-1)/2 pairs, so a flat value
 *  across N means cost grows as N². NaN when there are no pairs. */
export function nsPerPair(msPerStep: number, n: number): number {
  const pairs = (n * (n - 1)) / 2;
  return pairs > 0 ? (msPerStep * NS_PER_MS) / pairs : Number.NaN;
}

/** Smoothed ms per step for each N tried, one value per series (e.g. per
 *  scalar type). */
export class CostTable {
  readonly series: number;
  readonly alpha: number | undefined;
  #rows = new Map<number, (Smoothed | null)[]>();

  /** `alpha`: smoothing weight per sample (Smoothed's default if omitted). */
  constructor(series: number, alpha?: number) {
    this.series = series;
    this.alpha = alpha;
  }

  /** Records one ms-per-step sample for series `i` at `n` bodies.
   *  Non-finite samples (no steps this frame) are ignored. */
  record(n: number, i: number, msPerStep: number): void {
    if (!Number.isFinite(msPerStep)) return;
    let row = this.#rows.get(n);
    if (row === undefined) {
      row = Array.from({ length: this.series }, () => null);
      this.#rows.set(n, row);
    }
    const cell = row[i] ?? new Smoothed(this.alpha);
    cell.add(msPerStep);
    row[i] = cell;
  }

  /** `[n, ms per step per series (null if never measured)]`, by N. */
  rows(): [number, (number | null)[]][] {
    return [...this.#rows.entries()]
      .sort(([a], [b]) => a - b)
      .map(([n, row]) => [n, row.map((c) => c?.value ?? null)]);
  }
}

/** The cost table as HTML: per N, each series' ms/step and ns/pair. */
export function costTableHtml(table: CostTable, labels: string[]): string {
  const head = labels.map((l) => `<th>${l} ms/step</th><th>${l} ns/pair</th>`).join("");
  const fmt = (v: number | null, digits: number) => (v === null ? "–" : v.toFixed(digits));
  const body = table.rows().map(([n, values]) => {
    const cells = values
      .map((ms) => `<td>${fmt(ms, 3)}</td><td>${fmt(ms === null ? null : nsPerPair(ms, n), 2)}</td>`)
      .join("");
    return `<tr><td>${n.toLocaleString()}</td>${cells}</tr>`;
  });
  return `<table><thead><tr><th>N</th>${head}</tr></thead><tbody>${body.join("")}</tbody></table>`;
}

/** Times a callback with `performance.now()`, in ms. Browsers coarsen the
 *  clock (to 0.1 ms or so without cross-origin isolation), so single
 *  readings are noisy: smooth them. */
export function timeMs(f: () => void): number {
  const t0 = performance.now();
  f();
  return performance.now() - t0;
}
