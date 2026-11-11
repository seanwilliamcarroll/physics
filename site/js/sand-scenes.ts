// The sand page's starting scenes, drawn with the brush alone (no scene
// code in Rust): each is a function of the grid's size, so any `?w=&h=`
// gets the same picture, scaled. Pure: they call `paint`, which the page
// points at `sand_paint` and the tests at an array.

import { MATERIAL_LAVA, MATERIAL_SAND, MATERIAL_STONE, MATERIAL_WATER } from "./sand-abi.ts";
import { strokeCells } from "./pixels.ts";

/** Paints a disc of `radius` cells of material `code` at `(x, y)`. */
export type Paint = (x: number, y: number, radius: number, code: number) => void;

/** Wall thickness: a radius-1 disc is 3 cells across, so nothing squeezes
 *  through a diagonal wall's corners. */
const WALL = 1;

/** A stone wall along `points`. */
function wall(paint: Paint, points: [number, number][]): void {
  for (let i = 1; i < points.length; i++) {
    for (const [x, y] of strokeCells(points[i - 1], points[i], 1)) paint(x, y, WALL, MATERIAL_STONE);
  }
}

/** Fills cells `x0 ≤ x < x1`, `y0 ≤ y < y1` with `code`. */
function fill(paint: Paint, x0: number, y0: number, x1: number, y1: number, code: number): void {
  for (let y = Math.round(y0); y < Math.round(y1); y++) {
    for (let x = Math.round(x0); x < Math.round(x1); x++) paint(x, y, 0, code);
  }
}

/** An hourglass, its top bulb two-thirds full of sand, a neck a few cells
 *  wide: the pile below grows at its angle of repose while the top
 *  drains in a funnel. */
function hourglass(paint: Paint, w: number, h: number): void {
  const cx = Math.round(w / 2);
  const [top, neck, bottom] = [Math.round(h * 0.06), Math.round(h / 2), Math.round(h * 0.94)];
  const half = Math.round(Math.min(w * 0.3, (bottom - top) * 0.5));
  /** The neck's half-width inside the walls, cells. */
  const gap = 3 + WALL;
  for (const s of [-1, 1]) {
    wall(paint, [[cx + s * half, top], [cx + s * gap, neck], [cx + s * half, bottom]]);
  }
  wall(paint, [[cx - half, top], [cx + half, top]]);
  wall(paint, [[cx - half, bottom], [cx + half, bottom]]);
  // The top bulb's inside at row y: the walls narrow linearly to the neck.
  const filled = top + Math.round((neck - top) * 0.67);
  for (let y = top + 2; y < filled; y++) {
    const inner = gap + ((half - gap) * (neck - y)) / (neck - top) - 2;
    fill(paint, cx - inner, y, cx + inner + 1, y + 1, MATERIAL_SAND);
  }
}

/** Water held behind a stone wall with a slot at its foot: it drains
 *  through and levels out on the other side. */
function dam(paint: Paint, w: number, h: number): void {
  const x = Math.round(w * 0.4);
  const slot = Math.max(2, Math.round(h * 0.02));
  wall(paint, [[x, Math.round(h * 0.15)], [x, h - 1 - slot - WALL]]);
  fill(paint, 0, h * 0.2, x - WALL, h, MATERIAL_WATER);
}

/** A stone ramp carrying lava down into a pool: where they touch, lava
 *  turns to stone and water to steam, which rises, condenses and rains. */
function lavaIntoWater(paint: Paint, w: number, h: number): void {
  const [rampTop, rampFoot] = [Math.round(h * 0.3), Math.round(h * 0.7)];
  const rampEnd = Math.round(w * 0.45);
  wall(paint, [[0, rampTop], [rampEnd, rampFoot]]);
  fill(paint, 0, rampTop - h * 0.15, w * 0.15, rampTop - 2, MATERIAL_LAVA);
  fill(paint, w * 0.5, h * 0.72, w, h, MATERIAL_WATER);
}

/** The scenes by name, in the page's order (the first is the default). */
export const SCENES: Record<string, (paint: Paint, w: number, h: number) => void> = {
  hourglass,
  dam,
  lava: lavaIntoWater,
  empty: () => {},
};
