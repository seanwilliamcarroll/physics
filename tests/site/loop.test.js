// Unit tests for the pure parts of site/js/loop.js.
import { test } from "node:test";
import assert from "node:assert/strict";
import { RateMeter, Smoothed, StepBudget } from "../../site/js/loop.ts";

test("RateMeter counts events in the last second only", () => {
  const m = new RateMeter();
  m.add(0, 3);
  m.add(500);
  assert.equal(m.perSecond, 4);
  m.add(1600); // the events at 0 and 500 ms are now > 1 s old
  assert.equal(m.perSecond, 1);
});

test("Smoothed starts at its first sample and moves alpha of the way", () => {
  const s = new Smoothed(0.5);
  assert.equal(s.value, 0, "no samples yet");
  s.add(10);
  assert.equal(s.value, 10);
  s.add(20);
  assert.equal(s.value, 15);
});

test("StepBudget caps every demo so all of them fit the budget", () => {
  const b = new StepBudget(10);
  assert.equal(b.cap, 0, "no cap until something is measured");
  b.record(1, 4, 2, 0); // 0.5 ms a step
  assert.equal(b.cap, 20);
  b.record(2, 1, 1.5, 0); // a second demo at 1.5 ms: 2 ms per step together
  assert.equal(b.cap, 5);
  b.forget(2);
  assert.equal(b.cap, 20);
});

test("StepBudget always allows a step, and says when it held one back", () => {
  const b = new StepBudget(10, 240);
  b.record(1, 1, 55, 0); // M2 at N = 4096: 55 ms a step
  assert.equal(b.cap, 1, "at least one step: always progress");
  b.record(1, 1, 55, 1);
  assert.equal(b.limited, true);
  const fast = new StepBudget(10, 240);
  fast.record(1, 1, 0.001, 0);
  assert.equal(fast.cap, 240, "capped at the ABI's most");
  fast.record(1, 1, 0.001, 240);
  assert.equal(fast.limited, false);
});

test("a budgeted advance sets the cap, times the call, and records it", () => {
  const b = new StepBudget(10, 240);
  const caps = [];
  let clock = 0;
  const advance = b.budgeted(
    (demo, elapsed) => {
      clock += 8; // each call takes 8 ms
      return elapsed > 0 ? 4 : 0;
    },
    (demo, cap) => caps.push([demo, cap]),
    () => clock,
  );
  // Nothing measured yet: no cap (0).
  assert.equal(advance(7, 1 / 60), 4);
  assert.deepEqual(caps, [[7, 0]]);
  // 2 ms a step measured: 5 steps fit the 10 ms budget.
  assert.equal(b.cap, 5);
  advance(7, 1 / 60);
  assert.deepEqual(caps.at(-1), [7, 5]);
  assert.equal(b.limited, false);
  // Freed through the wrapper: forgotten, then freed.
  const freed = [];
  b.forgetting((demo) => freed.push(demo))(7);
  assert.deepEqual(freed, [7]);
  assert.equal(b.cap, 0);
});
