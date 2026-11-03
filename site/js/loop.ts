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
 *  for checking that simulation speed doesn't depend on refresh rate. */
export function runLoop(
  onFrame: (elapsedSeconds: number, nowMs: number) => void,
  { maxFps = Infinity }: { maxFps?: number } = {},
): void {
  const minIntervalMs = MS_PER_SECOND / maxFps;
  let last: number | null = null;
  function frame(now: DOMHighResTimeStamp): void {
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
  #times: number[] = [];

  /** Records `count` events at time `nowMs`. */
  add(nowMs: number, count = 1): void {
    for (let i = 0; i < count; i++) this.#times.push(nowMs);
    while (this.#times.length && nowMs - (this.#times[0] ?? nowMs) > RATE_WINDOW_MS) {
      this.#times.shift();
    }
  }

  get perSecond(): number {
    return this.#times.length;
  }
}

/** Exponential moving average, for steady HUD readouts of jittery timings.
 *  `alpha` is the weight of each new sample. */
export class Smoothed {
  // Declared, not a constructor parameter property (`readonly alpha = ...`
  // in the parameter list): that shorthand generates code, so
  // `erasableSyntaxOnly` rejects it.
  readonly alpha: number;
  #value: number | null = null;

  constructor(alpha = DEFAULT_SMOOTHING) {
    this.alpha = alpha;
  }

  add(sample: number): void {
    this.#value = this.#value === null ? sample : this.#value + this.alpha * (sample - this.#value);
  }

  get value(): number {
    return this.#value ?? 0;
  }
}
