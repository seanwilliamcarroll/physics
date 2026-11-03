// Pointer dragging on a demo canvas: wires pointer.ts to the engine's
// demo_grab / demo_drag / demo_release (docs/06-constraints.md,
// "Dragging"). The engine picks the nearest dynamic particle; this only
// converts the pointer to world coordinates and a pick radius.

import { attachPointer, pickRadius } from "./pointer.ts";
import type { View } from "./canvas.ts";
import type { DemoHandle, EngineExports } from "./engine";

/** Lets the user drag particles of the demo `demo()` returns (a getter, so
 *  a page that recreates its demo needn't re-attach). Returns detach. */
export function enableDrag(
  engine: EngineExports,
  canvas: HTMLCanvasElement,
  view: View,
  demo: () => DemoHandle,
): () => void {
  return attachPointer(canvas, view, {
    onGrab: (x, y) => engine.demo_grab(demo(), x, y, pickRadius(view, canvas)) >= 0,
    onDrag: (x, y) => {
      engine.demo_drag(demo(), x, y);
    },
    onRelease: () => {
      engine.demo_release(demo());
    },
  });
}
