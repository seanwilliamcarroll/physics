// The ants page's scenes, drawn with the paint tools (pure, node-tested):
// each is a function of the world's size that calls `paint`, which the
// page points at ant_paint. Food is kept within ~130 cells of the nest:
// with the default constants trails don't span much more
// (docs/15-swarm.md, S3.3–S3.4).

import { TOOL_ERASE, TOOL_FOOD, TOOL_NEST, TOOL_WALL } from "./swarm-abi.ts";

/** ant_paint's shape: tool, cell (x, y), radius (cells), food per cell. */
export type AntPaint = (tool: number, x: number, y: number, radius: number, amount: number) => void;

/** The page's world, cells. */
export const WORLD: [number, number] = [200, 120];

/** Food per cell in a scene's patches. */
const FOOD = 100;

/** Points every unit along a polyline: corridors cut with the eraser. */
function along(points: [number, number][]): [number, number][] {
  const out: [number, number][] = [];
  for (let i = 1; i < points.length; i++) {
    const [[ax, ay], [bx, by]] = [points[i - 1], points[i]];
    const n = Math.max(1, Math.ceil(Math.abs(bx - ax) + Math.abs(by - ay)));
    for (let k = 0; k <= n; k++) out.push([ax + ((bx - ax) * k) / n, ay + ((by - ay) * k) / n]);
  }
  return out;
}

/** Walls over the whole world. */
function fill(paint: AntPaint, w: number, h: number): void {
  for (let y = 4; y < h + 8; y += 8) for (let x = 4; x < w + 8; x += 8) paint(TOOL_WALL, x, y, 7, 0);
}

/** The nest at the left, two food patches within reach. */
function open(paint: AntPaint, w: number, h: number): void {
  paint(TOOL_NEST, w * 0.15, h / 2, 5, 0);
  paint(TOOL_FOOD, w * 0.7, h * 0.3, 7, FOOD);
  paint(TOOL_FOOD, w * 0.75, h * 0.72, 7, FOOD);
}

/** S3.4's double bridge: two arms, short (~78 cells) and long (~126). */
function bridge(paint: AntPaint, w: number, h: number): void {
  fill(paint, w, h);
  const [x0, cy] = [(w - 140) / 2, h / 2];
  paint(TOOL_ERASE, x0 + 18, cy, 12, 0);
  paint(TOOL_ERASE, x0 + 122, cy, 12, 0);
  for (const [sign, off] of [[-1, 12], [1, 36]]) {
    const y = cy + sign * off;
    const path: [number, number][] = [[x0 + 28, cy + sign * 8], [x0 + 34, y], [x0 + 106, y], [x0 + 112, cy + sign * 8]];
    for (const [x, py] of along(path)) paint(TOOL_ERASE, x, py, 2.5, 0);
  }
  paint(TOOL_NEST, x0 + 18, cy, 5, 0);
  paint(TOOL_FOOD, x0 + 122, cy, 7, FOOD * 2);
}

/** Barriers between nest and food: trails route around them. */
function barriers(paint: AntPaint, w: number, h: number): void {
  paint(TOOL_NEST, w * 0.12, h / 2, 5, 0);
  for (const [x, top] of [[w * 0.35, true], [w * 0.55, false]] as [number, boolean][]) {
    const ys = top ? [0, h * 0.65] : [h * 0.35, h];
    for (const [px, py] of along([[x, ys[0]], [x, ys[1]]])) paint(TOOL_WALL, px, py, 2, 0);
  }
  paint(TOOL_FOOD, w * 0.75, h / 2, 8, FOOD);
}

/** The scenes by name, the first the default. */
export const SCENES: Record<string, (paint: AntPaint, w: number, h: number) => void> = { open, bridge, barriers };
