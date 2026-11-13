// Side-by-side demo panels: one titled canvas plus a readout per config,
// built the same way on every multi-panel page, and the checks on
// the demos they hold.

import { setupCanvas, cssColor } from "./canvas.ts";
import type { DemoHandle, EngineExports } from "./engine";

/** What every panel config needs: its title and the CSS variable holding
 *  its color (title, and whatever the page draws in that color). Pages add
 *  their own fields (integrator code, scalar, …). */
export type PanelConfig = { name: string; colorVar: string };

/** One built panel: the page's config fields, its resolved color, a sized
 *  2D context, the readout line under the canvas, and its demo (`null`
 *  until the page creates it, once the engine has loaded). */
export type Panel<C extends PanelConfig> = C & {
  color: string;
  ctx: CanvasRenderingContext2D;
  readout: HTMLElement;
  demo: DemoHandle | null;
};

/** Builds a `div.panel` (h3 title, canvas, `div.readout`) per config into
 *  `container`, colors read from `css`, in config order.
 *
 *  All panels go into the grid *before* any canvas is sized: sizing each as
 *  it was added measured it in a one- or two-column grid (M1: 1152 and 570
 *  px wide instead of 376), and the later correction cleared what had been
 *  drawn. */
export function buildPanels<C extends PanelConfig>(
  container: HTMLElement,
  configs: readonly C[],
  css: Element,
): Panel<C>[] {
  const built = configs.map((cfg) => {
    const color = cssColor(css, cfg.colorVar);
    const el = document.createElement("div");
    el.className = "panel";
    const title = document.createElement("h3");
    title.textContent = cfg.name;
    title.style.color = color;
    const canvas = document.createElement("canvas");
    const readout = document.createElement("div");
    readout.className = "readout";
    el.append(title, canvas, readout);
    return { cfg, color, canvas, readout, el };
  });
  container.append(...built.map((p) => p.el));
  return built.map(({ cfg, color, canvas, readout }) => ({
    ...cfg,
    color,
    ctx: setupCanvas(canvas),
    readout,
    demo: null,
  }));
}

/** The panels as plot series: one line per panel, in its color. */
export function panelSeries(panels: readonly { name: string; color: string }[]): { label: string; color: string }[] {
  return panels.map((p) => ({ label: p.name, color: p.color }));
}

/** The panel's demo; throws if the page hasn't created it yet. Panels hold
 *  `demo: null` until the engine loads, so every use goes through here
 *  rather than a non-null assertion. */
export function demoHandle(p: { demo: DemoHandle | null }): DemoHandle {
  if (p.demo === null) throw new Error("demo not created");
  return p.demo;
}

/** Throws unless every `demo_set_*` status is 1: a 0 means the page passed
 *  something the engine rejects, a page bug worth stopping on. */
export function requireAccepted(statuses: number[], what = "a setting"): void {
  if (!statuses.every((s) => s === 1)) throw new Error(`${what} was rejected`);
}

/** `created` in place of `old` (freed): the constructor's handle, checked,
 *  since 0 is the ABI's null. `what` names the constructor for the error. */
export function replaceDemo(
  engine: EngineExports,
  old: DemoHandle | null,
  created: DemoHandle,
  what: string,
): DemoHandle {
  if (old !== null) engine.demo_free(old);
  if (created === 0) throw new Error(`${what} returned null`);
  return created;
}
