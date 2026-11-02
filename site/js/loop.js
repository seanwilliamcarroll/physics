// requestAnimationFrame driver. Physics stepping policy is NOT here: JS only
// reports real elapsed time, and Rust's fixed-timestep accumulator decides
// how many physics steps that is (docs/03-wasm-shell.md).

/** Calls `onFrame(elapsedSeconds, nowMs)` once per display frame. Uses rAF
 *  timestamps for both ends of each interval (mixing in performance.now()
 *  can yield a negative first frame). The first frame reports 0 s.
 *
 *  `maxFps` (optional) skips display frames to emulate a slower monitor,
 *  for checking that simulation speed doesn't depend on refresh rate. */
export function runLoop(onFrame, { maxFps = Infinity } = {}) {
  const minIntervalMs = 1000 / maxFps;
  let last = null;
  function frame(now) {
    // Small slack so a 60 Hz cap on a 60 Hz display doesn't drop frames to jitter.
    if (last === null || now - last >= minIntervalMs - 1) {
      const elapsed = last === null ? 0 : (now - last) / 1000;
      last = now;
      onFrame(elapsed, now);
    }
    requestAnimationFrame(frame);
  }
  requestAnimationFrame(frame);
}

/** Counts events per second over a sliding one-second window. */
export class RateMeter {
  #times = [];
  /** Records `count` events at time `nowMs`. */
  add(nowMs, count = 1) {
    for (let i = 0; i < count; i++) this.#times.push(nowMs);
    while (this.#times.length && nowMs - this.#times[0] > 1000) this.#times.shift();
  }
  get perSecond() {
    return this.#times.length;
  }
}

/** Exponential moving average, for steady HUD readouts of jittery timings.
 *  `alpha` is the weight of each new sample (0.05 ~ last 20 samples). */
export class Smoothed {
  #value = null;
  constructor(alpha = 0.05) {
    this.alpha = alpha;
  }
  add(sample) {
    this.#value = this.#value === null ? sample : this.#value + this.alpha * (sample - this.#value);
  }
  get value() {
    return this.#value ?? 0;
  }
}
