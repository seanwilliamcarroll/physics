// What every demo page does the same way: the rate and fps options, the
// rate slider, the smoke-or-live split with its HUD rates line, and the
// error path (DOM and smoke-mode code; the pure helpers are in panels.ts). A page keeps its own scene, settings, drawing and readouts:
// those differ in substance, and sharing them would take a hook per page.

import { DEFAULT_RATE_HZ, MAX_RATE_HZ } from "./abi.ts";
import { cssColor } from "./canvas.ts";
import { slider } from "./controls.ts";
import { byId } from "./dom.ts";
import { MS_PER_SECOND, RateMeter, runLoop } from "./loop.ts";
import { stepBudget } from "./wasm.ts";
import { errorText, runSmoke, smokeError, smokeMode } from "./smoke.ts";
import type { IntOption } from "./options.ts";
import type { PlotColors } from "./plot.ts";
import type { DemoHandle, EngineExports } from "./engine";

/** `?rate=`: physics steps per second, every physics page. */
export const RATE_OPTION: IntOption = {
  kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "physics steps per second; dt = 1 / rate",
};

/** `?fps=`: a display-rate cap, every physics page. */
export const FPS_OPTION: IntOption = {
  kind: "int", min: 1, max: 1000, default: Infinity, help: "cap the display rate to emulate a slower monitor",
};

/** The plot colors every page uses, from the site's CSS variables. */
export function plotColors(css: Element): PlotColors {
  return {
    background: cssColor(css, "--stage-bg"),
    grid: cssColor(css, "--grid"),
    text: cssColor(css, "--muted"),
  };
}

/** The physics rate slider, with its time step in the readout. */
export function rateSlider(parent: HTMLElement, value: number, onInput: (hz: number) => void): HTMLInputElement {
  return slider(parent, {
    label: "rate",
    min: RATE_OPTION.min,
    max: RATE_OPTION.max,
    value,
    format: (hz) => `${hz} Hz · dt ${(MS_PER_SECOND / hz).toFixed(1)} ms`,
    onInput,
  });
}

/** One frame's result: physics steps taken, and the page's part of the HUD. */
export type Frame = { steps: number; status: string };

export type DemoOptions<P> = {
  /** The panels, each with its demo and canvas. */
  panels: readonly P[];
  /** Draws one panel's current state (all smoke mode needs). */
  draw: (p: P) => void;
  /** The color the smoke test counts pixels of. */
  particleColor: string;
  /** `?fps=`'s cap (Infinity for none). */
  maxFps: number;
  /** Live mode, once per display frame: advance, draw, update readouts. */
  frame: (elapsedSeconds: number, nowMs: number) => Frame;
};

/** Runs a multi-panel physics page. In smoke mode, the smoke check over
 *  every panel (energy must stay finite); live, the frame loop, with the
 *  display and physics rates leading the HUD line. */
export function runDemo<P extends { demo: DemoHandle | null; ctx: CanvasRenderingContext2D }>(
  engine: EngineExports,
  hud: HTMLElement,
  o: DemoOptions<P>,
): void {
  if (smokeMode) {
    const smokePanels = o.panels.map((p) => {
      if (p.demo === null) throw new Error("demo not created");
      return { demo: p.demo, ctx: p.ctx, draw: () => o.draw(p) };
    });
    runSmoke(engine, smokePanels, o.particleColor, { checkEnergy: true });
    return;
  }
  const fps = new RateMeter();
  const sps = new RateMeter();
  runLoop((elapsed, now) => {
    const { steps, status } = o.frame(elapsed, now);
    fps.add(now);
    sps.add(now, steps);
    const slow = stepBudget.limited ? " (slow motion: step budget)" : "";
    hud.textContent =
      `display ${fps.perSecond} fps · physics ${sps.perSecond} steps/s${slow} · ${status}` +
      (Number.isFinite(o.maxFps) ? ` · capped at ${o.maxFps} fps` : "");
  }, { maxFps: o.maxFps });
}

/** The page's catch: shows the error in the HUD, reports it to the smoke
 *  test, and rethrows so it also reaches the console. */
export function pageFailed(hud: HTMLElement, err: unknown): never {
  hud.textContent = `error: ${errorText(err)}`;
  smokeError(err);
  throw err;
}

export type AudioPageOptions = {
  /** Starts audio (a user gesture: autoplay policy). */
  start: () => Promise<unknown>;
  /** Smoke mode: render offline and report. */
  smoke: () => Promise<void>;
  /** Live: build the controls and keyboard; `begin` starts audio and hides
   *  the start button (for the keyboard's first note). */
  live: (begin: () => Promise<void>) => void;
};

/** Runs an acoustic page: the smoke render, or the live page behind the
 *  `#start` button. */
export async function runAudioPage(hud: HTMLElement, o: AudioPageOptions): Promise<void> {
  try {
    const startButton = byId("start", HTMLButtonElement);
    if (smokeMode) {
      startButton.hidden = true;
      await o.smoke();
      return;
    }
    const begin = async (): Promise<void> => {
      await o.start();
      startButton.hidden = true;
    };
    o.live(begin);
    startButton.addEventListener("click", () => void begin());
  } catch (err) {
    pageFailed(hud, err);
  }
}
