// The Vicsek page's sweep, the pure part (node-tested): Fig. 2a's sizes
// (Vicsek et al. 1995), the η grid, and the box side for a density.

/** Fig. 2a's sizes in the browser: [N, L] (ρ ≈ 4). Its N = 10000 (L =
 *  50) is left to the native sweep: ~2.5 ms a step in V8. */
export const FIG_2A: [number, number][] = [[40, 3.1], [100, 5], [400, 10], [4000, 31.6]];

/** η from 0 to 5 by 0.25: Fig. 2a's range. */
export function etaGrid(step = 0.25, max = 5): number[] {
  const n = Math.round(max / step);
  return Array.from({ length: n + 1 }, (_, k) => k * step);
}

/** The side of a square box holding `n` particles at density `rho`. */
export function sideFor(n: number, rho: number): number {
  return Math.sqrt(n / rho);
}

/** The sweep's cases in run order: for each η, every size (so the plot
 *  can draw a column of points at a time). */
export function cases(sizes: [number, number][], etas: number[]): { eta: number; i: number; n: number; side: number }[] {
  return etas.flatMap((eta) => sizes.map(([n, side], i) => ({ eta, i, n, side })));
}
