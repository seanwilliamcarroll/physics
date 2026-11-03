// Live line plots: several series over simulated time, on one canvas.
// The scale math (range, log transform, ticks) is pure and unit-tested;
// LinePlot does the drawing.

import { Ring } from "./ring.ts";
import { setupCanvas } from "./canvas.ts";

export type Scale = "linear" | "log";

/** Smallest magnitude a log plot shows: about f64's machine epsilon
 *  (2.2e-16), so an exact 0 (no error at all) sits at the bottom instead
 *  of at log10(0) = -Infinity. */
export const LOG_FLOOR = 1e-16;

/** Fraction of the linear span added above and below the data. */
const LINEAR_PADDING = 0.05;

/** Ranges for a plot with no data yet. */
const EMPTY_RANGE: Record<Scale, [number, number]> = { linear: [-1, 1], log: [-2, 0] };

/** Plot coordinate for a sample: itself (linear) or log10 of its magnitude
 *  (log; floored at LOG_FLOOR). */
export function plotValue(v: number, scale: Scale): number {
  return scale === "log" ? Math.log10(Math.max(Math.abs(v), LOG_FLOOR)) : v;
}

/** Y range [lo, hi] in plot coordinates covering every series. Linear
 *  always includes 0 (so "no error" is visible) and pads 5%; log rounds out
 *  to whole decades. */
export function yRange(series: Iterable<number>[], scale: Scale): [number, number] {
  let lo = Infinity;
  let hi = -Infinity;
  for (const s of series) {
    for (const v of s) {
      const p = plotValue(v, scale);
      lo = Math.min(lo, p);
      hi = Math.max(hi, p);
    }
  }
  if (lo > hi) return [...EMPTY_RANGE[scale]];
  if (scale === "log") {
    // `+ 0` turns -0 (from ceil of a value in (-1, 0)) into 0.
    const [a, b] = [Math.floor(lo) + 0, Math.ceil(hi) + 0];
    return [a, b > a ? b : a + 1];
  }
  lo = Math.min(lo, 0);
  hi = Math.max(hi, 0);
  const pad = (hi - lo || 1) * LINEAR_PADDING;
  return [lo - pad, hi + pad];
}

/** Integer exponents within [lo, hi]: where a log plot draws grid lines.
 */
export function decadeTicks(lo: number, hi: number): number[] {
  const ticks: number[] = [];
  for (let e = Math.ceil(lo); e <= Math.floor(hi); e++) ticks.push(e);
  return ticks;
}

/** Plot margins and text size, CSS pixels. */
const MARGIN = { left: 56, right: 8, top: 8, bottom: 8 };
const FONT_PX = 11;
const LEGEND_SWATCH_PX = 10;
/** Room reserved at the right for the legend's swatch and label. */
const LEGEND_WIDTH_PX = 150;
/** Space between a tick label and the plot area / a swatch and its label. */
const LABEL_GAP_PX = 4;
/** Series line width; grid lines are 1 px. */
const SERIES_LINE_PX = 1.5;

export type Series = { label: string; color: string };
export type PlotColors = { background: string; grid: string; text: string };

/** Several series sampled at the same times, drawn as polylines over the
 *  most recent `capacity` samples. */
export class LinePlot {
  readonly ctx: CanvasRenderingContext2D;
  readonly series: Series[];
  readonly colors: PlotColors;
  scale: Scale;
  readonly times: Ring;
  readonly values: Ring[];

  constructor(
    canvas: HTMLCanvasElement,
    { series, capacity, scale = "linear", colors }:
      { series: Series[]; capacity: number; scale?: Scale; colors: PlotColors },
  ) {
    this.ctx = setupCanvas(canvas);
    this.series = series;
    this.colors = colors;
    this.scale = scale;
    this.times = new Ring(capacity);
    this.values = series.map(() => new Ring(capacity));
  }

  /** One sample per series, at simulated time `t`. */
  push(t: number, values: number[]): void {
    this.times.push(t);
    this.values.forEach((ring, i) => ring.push(values[i] ?? Number.NaN));
  }

  clear(): void {
    this.times.clear();
    for (const ring of this.values) ring.clear();
  }

  draw(): void {
    const { ctx, colors } = this;
    const dpr = window.devicePixelRatio || 1;
    const { width, height } = ctx.canvas;
    const left = MARGIN.left * dpr;
    const right = width - MARGIN.right * dpr;
    const top = MARGIN.top * dpr;
    const bottom = height - MARGIN.bottom * dpr;

    ctx.setTransform(1, 0, 0, 1, 0, 0);
    ctx.fillStyle = colors.background;
    ctx.fillRect(0, 0, width, height);

    const [lo, hi] = yRange(this.values, this.scale);
    const n = this.times.length;
    const t0 = n > 0 ? this.times.at(0) : 0;
    const t1 = n > 0 ? this.times.at(n - 1) : 1;
    const sx = (t: number): number => left + ((t - t0) / (t1 - t0 || 1)) * (right - left);
    /** `p` is a plot coordinate. */
    const sy = (p: number): number => bottom - ((p - lo) / (hi - lo)) * (bottom - top);

    // Grid and labels: decades (log) or zero plus the extremes (linear).
    ctx.font = `${FONT_PX * dpr}px ui-monospace, SFMono-Regular, Menlo, monospace`;
    ctx.textBaseline = "middle";
    ctx.textAlign = "right";
    ctx.lineWidth = dpr;
    const ticks: [number, string][] = this.scale === "log"
      ? decadeTicks(lo, hi).map((e) => [e, `1e${e}`])
      : [[0, "0"], [lo, lo.toPrecision(2)], [hi, hi.toPrecision(2)]];
    ctx.strokeStyle = colors.grid;
    ctx.fillStyle = colors.text;
    ctx.beginPath();
    for (const [p] of ticks) {
      ctx.moveTo(left, sy(p));
      ctx.lineTo(right, sy(p));
    }
    ctx.stroke();
    for (const [p, label] of ticks) ctx.fillText(label, left - LABEL_GAP_PX * dpr, sy(p));

    // One path and one stroke per series.
    ctx.lineWidth = SERIES_LINE_PX * dpr;
    this.values.forEach((ring, i) => {
      ctx.strokeStyle = this.series[i]?.color ?? colors.text;
      ctx.beginPath();
      for (let k = 0; k < n; k++) {
        const x = sx(this.times.at(k));
        const y = sy(plotValue(ring.at(k), this.scale));
        if (k === 0) ctx.moveTo(x, y);
        else ctx.lineTo(x, y);
      }
      ctx.stroke();
    });

    // Legend, top right.
    ctx.textAlign = "left";
    const rowPx = (FONT_PX + LABEL_GAP_PX) * dpr;
    this.series.forEach((s, i) => {
      const y = top + (i + 0.5) * rowPx;
      const x = right - LEGEND_WIDTH_PX * dpr;
      ctx.fillStyle = s.color;
      ctx.fillRect(x, y - (LEGEND_SWATCH_PX * dpr) / 2, LEGEND_SWATCH_PX * dpr, LEGEND_SWATCH_PX * dpr);
      ctx.fillStyle = colors.text;
      ctx.fillText(s.label, x + (LEGEND_SWATCH_PX + LABEL_GAP_PX) * dpr, y);
    });
  }
}
