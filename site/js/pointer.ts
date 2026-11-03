// Pointer input → world coordinates (TASKS.md M4 decision 10). Pointer
// events cover mouse, pen, and touch alike; pointer capture keeps a drag
// alive when the pointer leaves the canvas. Picking itself is in Rust
// (decision 4): pages pass the world point to `demo_grab`.

import type { View } from "./canvas.ts";

/** `PointerEvent.button` for the main button: left mouse, touch contact,
 *  pen tip. Right/middle clicks keep their browser meaning. */
const MAIN_BUTTON = 0;

/** Pick radius in CSS pixels: about half a fingertip (touch targets are
 *  ~44 CSS px across in Apple's and WCAG's guidance), and generous for a
 *  mouse without reaching a neighboring link at the pages' scales. */
export const PICK_RADIUS_PX = 22;

/** What a page does with a drag, in world meters. `onGrab` returns whether
 *  something was grabbed; if not, the gesture is ignored until the next
 *  press. */
export type DragHandlers = {
  onGrab(x: number, y: number): boolean;
  onDrag(x: number, y: number): void;
  onRelease(): void;
};

/** The fields of a PointerEvent the drag logic reads (so tests needn't
 *  build real events). */
export type PointerSample = { pointerId: number; isPrimary: boolean; button: number };

/** Which pointer, if any, is dragging. Pure: decides whether each event
 *  starts, continues, or ends the drag; the DOM wiring does the rest. */
export class DragTracker {
  active: number | null = null;

  /** Whether this press may start a drag: the primary pointer's main
   *  button, with no drag already in progress (a second finger is ignored). */
  canStart(e: PointerSample): boolean {
    return this.active === null && e.isPrimary && e.button === MAIN_BUTTON;
  }

  start(e: PointerSample): void {
    this.active = e.pointerId;
  }

  /** Whether `e` belongs to the drag in progress. */
  owns(e: PointerSample): boolean {
    return this.active !== null && e.pointerId === this.active;
  }

  /** Ends the drag if `e` owns it; returns whether it did. */
  end(e: PointerSample): boolean {
    if (!this.owns(e)) return false;
    this.active = null;
    return true;
  }
}

/** World meters for the pick radius on `canvas` at its current size. */
export function pickRadius(view: View, canvas: HTMLCanvasElement): number {
  return view.cssToWorld(canvas, PICK_RADIUS_PX);
}

/** Wires `canvas`'s pointer events to `handlers` through `view`. Returns a
 *  function that removes the listeners. */
export function attachPointer(
  canvas: HTMLCanvasElement,
  view: View,
  handlers: DragHandlers,
): () => void {
  // Without this, a touch drag scrolls or zooms the page instead of
  // delivering pointermove events.
  canvas.style.touchAction = "none";
  const tracker = new DragTracker();
  const world = (e: PointerEvent): [number, number] => {
    const rect = canvas.getBoundingClientRect();
    return view.toWorld(canvas, e.clientX - rect.left, e.clientY - rect.top);
  };

  const down = (e: PointerEvent) => {
    if (!tracker.canStart(e)) return;
    if (!handlers.onGrab(...world(e))) return;
    tracker.start(e);
    // Keep receiving this pointer's events outside the canvas.
    canvas.setPointerCapture(e.pointerId);
    // No text selection or emulated mouse events during the drag.
    e.preventDefault();
  };
  const move = (e: PointerEvent) => {
    if (tracker.owns(e)) handlers.onDrag(...world(e));
  };
  // up, cancel (touch taken over by the browser), and lost capture all end
  // the drag; whichever arrives first wins, the rest are ignored.
  const end = (e: PointerEvent) => {
    if (tracker.end(e)) handlers.onRelease();
  };

  const listeners: [string, (e: PointerEvent) => void][] = [
    ["pointerdown", down],
    ["pointermove", move],
    ["pointerup", end],
    ["pointercancel", end],
    ["lostpointercapture", end],
  ];
  for (const [type, fn] of listeners) canvas.addEventListener(type, fn as EventListener);
  return () => {
    for (const [type, fn] of listeners) canvas.removeEventListener(type, fn as EventListener);
  };
}
