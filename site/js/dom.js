// Typed DOM lookups.

/** The element with this id, checked to be of `type`; throws a clear error
 *  otherwise. `getElementById` returns null for a missing id and a plain
 *  HTMLElement type, so without this every page would either assume both
 *  or repeat the check.
 *  @template {Element} T
 *  @param {string} id
 *  @param {{ new (): T, name: string }} type e.g. HTMLCanvasElement
 *  @returns {T} */
export function byId(id, type) {
  const el = document.getElementById(id);
  if (!(el instanceof type)) {
    throw new Error(`#${id} is ${el === null ? "missing" : `not a ${type.name}`}`);
  }
  return el;
}
