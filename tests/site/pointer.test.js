// Unit tests for site/js/pointer.ts's pure part, DragTracker. The DOM
// wiring (attachPointer) is thin; the M4 pages exercise it.
import { test } from "node:test";
import assert from "node:assert/strict";
import { DragTracker } from "../../site/js/pointer.ts";

const press = (pointerId, { isPrimary = true, button = 0 } = {}) => ({ pointerId, isPrimary, button });

test("primary main-button press starts a drag owned by that pointer", () => {
  const t = new DragTracker();
  assert.ok(t.canStart(press(1)));
  t.start(press(1));
  assert.ok(t.owns(press(1)));
  assert.ok(!t.owns(press(2)));
});

test("right/middle buttons and non-primary pointers don't start a drag", () => {
  const t = new DragTracker();
  assert.ok(!t.canStart(press(1, { button: 2 })));
  assert.ok(!t.canStart(press(1, { button: 1 })));
  assert.ok(!t.canStart(press(1, { isPrimary: false })));
});

test("a second press during a drag is ignored", () => {
  const t = new DragTracker();
  t.start(press(1));
  assert.ok(!t.canStart(press(2)));
});

test("only the owning pointer ends the drag, and only once", () => {
  const t = new DragTracker();
  t.start(press(1));
  assert.ok(!t.end(press(2)));
  assert.ok(t.end(press(1)));
  assert.ok(!t.end(press(1))); // e.g. lostpointercapture after pointerup
  assert.ok(t.canStart(press(3)));
});

test("nothing owns events before any drag", () => {
  const t = new DragTracker();
  assert.ok(!t.owns(press(1)));
  assert.ok(!t.end(press(1)));
});
