// S5: S3's ants with their hand-tuned defaults against the evolved
// constants (crates/swarm/examples/evolve_ants.rs; docs/15-swarm.md, S5),
// side by side through S3's ant_* exports, and the evolution's history.

import { loadSwarm } from "../../js/swarm-wasm.ts";
import { blit, countOtherThan, pixelCanvas } from "../../js/pixels.ts";
import { SCENES, WORLD } from "../../js/ant-scenes.ts";
import { BEST, EVOLVED, HELD_OUT, MEAN } from "../../js/ant-evolution.ts";
import {
  ANT_DECAY, ANT_DIFFUSION, ANT_FALLOFF, ANT_SENSOR_ANGLE, ANT_SENSOR_DISTANCE, ANT_TURN, ANT_WIGGLE,
  DEFAULT_RATE_HZ, MAX_RATE_HZ,
} from "../../js/swarm-abi.ts";
import { RateMeter, runLoop } from "../../js/loop.ts";
import { button, select } from "../../js/controls.ts";
import { byId } from "../../js/dom.ts";
import { FPS_OPTION, pageFailed, plotColors } from "../../js/page.ts";
import { readChoice, readInt, optionsTableHtml } from "../../js/options.ts";
import { reportSmoke, smokeMode } from "../../js/smoke.ts";
import { LinePlot } from "../../js/plot.ts";
import { cssColor } from "../../js/canvas.ts";
import type { ChoiceOption, IntOption } from "../../js/options.ts";
import type { AntHandle, SwarmExports } from "../../js/swarm";

const OPTIONS: { scene: ChoiceOption; seed: IntOption; rate: IntOption; fps: IntOption } = {
  scene: { kind: "choice", values: ["training", "barriers", "open", "bridge"], default: "training", help: "scene (training: what evolution scored)" },
  seed: { kind: "int", min: 0, max: 2 ** 32 - 1, default: 1000, help: "both colonies' seed (1000+: held out)" },
  rate: { kind: "int", min: 1, max: MAX_RATE_HZ, default: DEFAULT_RATE_HZ, help: "steps per second" },
  fps: FPS_OPTION,
};

const PRESETS: [string, string][] = [
  ["the training scene (default)", ""],
  ["the barriers scene (never trained on)", "?scene=barriers"],
  ["faster", "?rate=240"],
];

/** As the evolution's runs. */
const ANTS = 500;
const SCALE = 3;
const SMOKE_STEPS = 30;
const BACKGROUND_RGB = [0x16, 0x1a, 0x22];

const params = new URLSearchParams(location.search);
let scene = readChoice(params, "scene", OPTIONS.scene);
const seed = readInt(params, "seed", OPTIONS.seed);
const rate = readInt(params, "rate", OPTIONS.rate);
const maxFps = readInt(params, "fps", OPTIONS.fps);

byId("options", HTMLElement).innerHTML = optionsTableHtml(OPTIONS, PRESETS);
const hud = byId("hud", HTMLElement);
const fmt = (n: number) => n.toLocaleString();
byId("held-training", HTMLElement).textContent = fmt(HELD_OUT.training.evolved);
byId("held-training-d", HTMLElement).textContent = fmt(HELD_OUT.training.defaults);
byId("held-barriers", HTMLElement).textContent = fmt(HELD_OUT.barriers.evolved);
byId("held-barriers-d", HTMLElement).textContent = fmt(HELD_OUT.barriers.defaults);

/** A colony in `name`'s scene; `evolved` applies the evolved constants. */
function build(s: SwarmExports, name: string, evolved: boolean): AntHandle {
  const d = s.ant_new(WORLD[0], WORLD[1], ANTS, SCALE, seed);
  if (d === 0) throw new Error("ant_new refused");
  s.ant_set_rate(d, rate);
  if (evolved) {
    const set: [number, number][] = [
      [ANT_SENSOR_ANGLE, EVOLVED.sensorAngle], [ANT_SENSOR_DISTANCE, EVOLVED.sensorDistance], [ANT_TURN, EVOLVED.turn],
      [ANT_WIGGLE, EVOLVED.wiggle], [ANT_FALLOFF, EVOLVED.falloff], [ANT_DIFFUSION, EVOLVED.diffusion], [ANT_DECAY, EVOLVED.decay],
    ];
    for (const [code, v] of set) {
      if (s.ant_set_param(d, code, v) === 0) throw new Error(`the evolved constant ${code} was refused`);
    }
  }
  SCENES[name]?.((tool, x, y, r, amount) => void s.ant_paint(d, tool, x, y, r, amount), ...WORLD);
  return d;
}

try {
  const s = await loadSwarm();
  let pair: [AntHandle, AntHandle] = [build(s, scene, false), build(s, scene, true)];
  const [w, h] = [s.ant_view_width(pair[0]), s.ant_view_height(pair[0])];
  const ctxs = [pixelCanvas(byId("a", HTMLCanvasElement), w, h), pixelCanvas(byId("b", HTMLCanvasElement), w, h)];
  const labels = [byId("left", HTMLElement), byId("right", HTMLElement)];

  if (smokeMode) {
    let steps = 0;
    for (const [i, d] of pair.entries()) {
      for (let k = 0; k < SMOKE_STEPS; k++) steps += s.ant_advance(d, 1 / DEFAULT_RATE_HZ + 1e-9);
      blit(ctxs[i], s.memory, s.ant_render(d), w, h);
    }
    const px = countOtherThan(ctxs[1].getImageData(0, 0, w, h).data, BACKGROUND_RGB);
    reportSmoke(`ok steps=${steps / 2} particle_px=${px}`);
  } else {
    const controls = byId("controls", HTMLElement);
    const restart = () => {
      for (const d of pair) s.ant_free(d);
      pair = [build(s, scene, false), build(s, scene, true)];
    };
    select(controls, {
      label: "scene",
      choices: OPTIONS.scene.values.map((v) => [v, v]),
      value: scene,
      onChange: (v) => { scene = v; restart(); },
    });
    button(controls, { label: "restart", onClick: restart });

    const canvas = byId("history", HTMLCanvasElement);
    const history = new LinePlot(canvas, {
      series: [
        { label: "best", color: cssColor(canvas, "--series-3") },
        { label: "mean", color: cssColor(canvas, "--series-2") },
      ],
      capacity: BEST.length,
      colors: plotColors(canvas),
    });
    BEST.forEach((b, g) => history.push(g, [b, MEAN[g] ?? Number.NaN]));
    history.draw();

    const fps = new RateMeter();
    const sps = new RateMeter();
    runLoop((elapsed, now) => {
      let steps = 0;
      for (const [i, d] of pair.entries()) {
        steps = s.ant_advance(d, elapsed);
        blit(ctxs[i], s.memory, s.ant_render(d), w, h);
      }
      fps.add(now);
      const [dd, de] = pair.map((d) => s.ant_delivered(d));
      labels[0].textContent = `defaults · delivered ${fmt(dd ?? 0)}`;
      labels[1].textContent = `evolved · delivered ${fmt(de ?? 0)}`;
      sps.add(now, steps);
      hud.textContent = `display ${fps.perSecond} fps · ${sps.perSecond} steps/s each` +
        (Number.isFinite(maxFps) ? ` · capped at ${maxFps} fps` : "");
    }, { maxFps });
  }
} catch (err) {
  pageFailed(hud, err);
}
