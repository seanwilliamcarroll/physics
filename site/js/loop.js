// requestAnimationFrame driver. Physics stepping policy is NOT here: JS only
// reports real elapsed time, and Rust's fixed-timestep accumulator decides
// how many physics steps that is (docs/03-wasm-shell.md).

export const MS_PER_SECOND = 1000;

/** Tolerance when capping the frame rate: rAF timestamps jitter by a
 *  fraction of a millisecond, so a 60 fps cap on a 60 Hz display would
 *  otherwise drop frames that arrive a hair early. */
const FRAME_CAP_SLACK_MS = 1;

/** RateMeter window: counts are "per second" because the window is 1 s. */
const RATE_WINDOW_MS = MS_PER_SECOND;

/** Smoothed's default weight per sample: about the last 20 samples
 *  (1 / 0.05) dominate, steady enough to read, quick enough to react. */
const DEFAULT_SMOOTHING = 0.05;

/** Calls `onFrame(elapsedSeconds, nowMs)` once per display frame. Uses rAF
 *  timestamps for both ends of each interval (mixing in performance.now()
 *  can yield a negative first frame). The first frame reports 0 s.
 *
 *  `maxFps` (optional) skips display frames to emulate a slower monitor,
 *  for checking that simulation speed doesn't depend on refresh rate.
 *  @param {(elapsedSeconds: number, nowMs: number) => void} onFrame
 *  @param {{ maxFps?: number }} [options] */
export function runLoop(onFrame, { maxFps = Infinity } = {}) {
  const minIntervalMs = MS_PER_SECOND / maxFps;
  /** @type {number | null} */
  let last = null;
  /** @param {DOMHighResTimeStamp} now */
  function frame(now) {
    if (last === null || now - last >= minIntervalMs - FRAME_CAP_SLACK_MS) {
      const elapsed = last === null ? 0 : (now - last) / MS_PER_SECOND;
      last = now;
      onFrame(elapsed, now);
    }
    requestAnimationFrame(frame);
  }
  requestAnimationFrame(frame);
}

/** Counts events per second over a sliding one-second window. */
export class RateMeter {
  /** @type {number[]} */
  #times = [];
  /** Records `count` events at time `nowMs`.
   *  @param {number} nowMs
   *  @param {number} [count] */
  add(nowMs, count = 1) {
    for (let i = 0; i < count; i++) this.#times.push(nowMs);
    while (this.#times.length && nowMs - this.#times[0] > RATE_WINDOW_MS) this.#times.shift();
  }
  /** @returns {number} */
  get perSecond() {
    return this.#times.length;
  }
}

/** Exponential moving average, for steady HUD readouts of jittery timings.
 *  `alpha` is the weight of each new sample. */
export class Smoothed {
  /** @type {number | null} */
  #value = null;
  /** @param {number} [alpha] */
  constructor(alpha = DEFAULT_SMOOTHING) {
    this.alpha = alpha;
  }
  /** @param {number} sample */
  add(sample) {
    this.#value = this.#value === null ? sample : this.#value + this.alpha * (sample - this.#value);
  }
  /** @returns {number} */
  get value() {
    return this.#value ?? 0;
  }
}
