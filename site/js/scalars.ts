// Engine number types by name: the URL/menu spelling ("f32", "f64") to the
// demo_new scalar code. No DOM access, so `node --test` covers it.

import { SCALAR_F32, SCALAR_F64 } from "./abi.ts";
import { readChoice } from "./options.ts";
import type { ChoiceOption } from "./options.ts";

/** Scalar names → abi.ts codes. The source of truth for which scalars
 *  exist. Pages may list them in their own order (`OPTIONS.scalar.values`,
 *  menus), e.g. f64 first where f64 is the default. */
export const SCALAR_CODES = { f32: SCALAR_F32, f64: SCALAR_F64 };
export type ScalarName = keyof typeof SCALAR_CODES;

export function isScalar(s: string | null): s is ScalarName {
  return s !== null && Object.hasOwn(SCALAR_CODES, s);
}

/** The `scalar` URL option, read with `opt` (its legal values and default).
 *  Throws if `opt` itself lists a value that isn't a scalar: that's a page
 *  bug, not bad user input (readChoice already rejects unknown values). */
export function readScalar(params: URLSearchParams, opt: ChoiceOption): ScalarName {
  const v = readChoice(params, "scalar", opt);
  if (!isScalar(v)) throw new Error(`scalar option allows "${v}", which isn't a scalar`);
  return v;
}
