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

/** Physics time a display frame may take, ms: leaves room in a 60 Hz frame
 *  (16.7 ms) for drawing and the browser (`docs/workers.md`, "a step
 *  budget"). */
export const STEP_BUDGET_MS = 10;

/** Weight of each new ms-per-step sample: quick to notice a slower scene
 *  (a bigger N), steady across a frame's jitter. */
const BUDGET_SMOOTHING = 0.2;

/** The step budget: tracks each demo's smoothed milliseconds per physics
 *  step, and caps every demo's steps per frame so all of them together fit
 *  `budgetMs`. A page that keeps up never reaches its cap; one that can't
 *  runs in slow motion instead of freezing (Rust drops the owed time). */
export class StepBudget {
  readonly budgetMs: number;
  readonly maxCap: number;
  #perStep = new Map<number, Smoothed>();
  #limited = false;

  constructor(budgetMs = STEP_BUDGET_MS, maxCap = Infinity) {
    this.budgetMs = budgetMs;
    this.maxCap = maxCap;
  }

  /** Records that `demo` ran `steps` steps in `ms`, and whether it was
   *  held to its cap. */
  record(demo: number, steps: number, ms: number, cap: number): void {
    if (steps > 0) {
      let s = this.#perStep.get(demo);
      if (s === undefined) this.#perStep.set(demo, (s = new Smoothed(BUDGET_SMOOTHING)));
      s.add(ms / steps);
    }
    this.#limited = cap > 0 && steps >= cap;
  }

  /** Forgets a freed demo. */
  forget(demo: number): void {
    this.#perStep.delete(demo);
  }

  /** Steps per frame for every demo: the most that fit the budget given
   *  all of them, at least 1 (always progress), at most `maxCap`; 0 (no
   *  cap) until anything has been measured. */
  get cap(): number {
    let total = 0;
    for (const s of this.#perStep.values()) total += s.value;
    if (!(total > 0)) return 0;
    return Math.min(this.maxCap, Math.max(1, Math.floor(this.budgetMs / total)));
  }

  /** `advance` (a module's `*_advance` export) capped by this budget and
   *  timed: sets the cap through `setCap` (its `*_set_step_cap`), runs,
   *  records. What every loader wraps its module's advance in. Physics
   *  only: drawing isn't inside it. */
  budgeted<H extends number>(
    advance: (demo: H, elapsed: number) => number,
    setCap: (demo: H, cap: number) => unknown,
    now: () => number = () => performance.now(),
  ): (demo: H, elapsed: number) => number {
    return (demo, elapsed) => {
      const cap = this.cap;
      setCap(demo, cap);
      const t0 = now();
      const steps = advance(demo, elapsed);
      this.record(demo, steps, now() - t0, cap);
      return steps;
    };
  }

  /** `free` (a module's `*_free` export), forgetting the demo first. */
  forgetting<H extends number>(free: (demo: H) => void): (demo: H) => void {
    return (demo) => {
      this.forget(demo);
      free(demo);
    };
  }

  /** Whether the last advance was held to its cap: the page is running in
   *  slow motion. */
  get limited(): boolean {
    return this.#limited;
  }
}
