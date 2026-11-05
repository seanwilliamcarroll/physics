// Pointer dragging on a demo canvas: wires pointer.ts to the engine's
// demo_grab / demo_drag / demo_release (docs/06-constraints.md,
// "Dragging"). The engine picks the nearest dynamic particle; this only
// converts the pointer to world coordinates and a pick radius.

import { attachPointer, pickRadius } from "./pointer.ts";
import type { View } from "./canvas.ts";
import type { DemoHandle, EngineExports } from "./engine";

/** Why a panel can't be grabbed, for its tooltip. */
export const NOT_GRABBABLE =
  "This panel can't be grabbed: a grab is a constraint, and adding one would hand a world its integrator steps to a constraint solver while held.";

/** Lets the user drag particles of the demo `demo()` returns (a getter, so
 *  a page that recreates its demo needn't re-attach), if its world can be
 *  grabbed (`demo_grabbable`): one its integrator steps can't, and its
 *  canvas says so (a not-allowed cursor, `NOT_GRABBABLE` as the tooltip).
 *  Returns detach. */
export function enableDrag(
  engine: EngineExports,
  canvas: HTMLCanvasElement,
  view: View,
  demo: () => DemoHandle,
): () => void {
  const grabbable = engine.demo_grabbable(demo()) === 1;
  canvas.style.cursor = grabbable ? "" : "not-allowed";
  canvas.title = grabbable ? "" : NOT_GRABBABLE;
  return attachPointer(canvas, view, {
    onGrab: (x, y) => engine.demo_grabbable(demo()) === 1 && engine.demo_grab(demo(), x, y, pickRadius(view, canvas)) >= 0,
    onDrag: (x, y) => {
      engine.demo_drag(demo(), x, y);
    },
    onRelease: () => {
      engine.demo_release(demo());
    },
  });
}
