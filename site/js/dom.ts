// Typed DOM lookups.

/** The element with this id, checked to be of `type`; throws a clear error
 *  otherwise. `getElementById` returns null for a missing id and a plain
 *  HTMLElement type, so without this every page would either assume both
 *  or repeat the check. `type` is e.g. `HTMLCanvasElement`. */
export function byId<T extends Element>(id: string, type: { new (): T; name: string }): T {
  const el = document.getElementById(id);
  if (!(el instanceof type)) {
    throw new Error(`#${id} is ${el === null ? "missing" : `not a ${type.name}`}`);
  }
  return el;
}
