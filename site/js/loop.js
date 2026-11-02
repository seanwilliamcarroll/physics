// requestAnimationFrame driver. Physics stepping policy is NOT here: JS only
// reports real elapsed time, and Rust's fixed-timestep accumulator decides
// how many physics steps that is (docs/03-wasm-shell.md).

/** Calls `onFrame(elapsedSeconds, nowMs)` once per display frame. Uses rAF
 *  timestamps for both ends of each interval (mixing in performance.now()
 *  can yield a negative first frame). The first frame reports 0 s. */
export function runLoop(onFrame) {
  let last = null;
  function frame(now) {
    const elapsed = last === null ? 0 : (now - last) / 1000;
    last = now;
    onFrame(elapsed, now);
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
