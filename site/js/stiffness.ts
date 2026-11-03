// The M5 stiffness slider and its stability hint (docs/07-soft-bodies.md).
// Pure, so node --test covers it.

/** Slider positions are log10(k): 1 → 10 N/m … 7 → 10⁷ N/m. */
export const SLIDER_MIN = 1;
export const SLIDER_MAX = 7;
/** One stop past the top means rigid (k = ∞): only constraints can do it. */
export const RIGID_STOP = SLIDER_MAX + 0.5;

/** Stiffness in N/m for a slider position (∞ at the rigid stop). */
export function sliderToStiffness(v: number): number {
  return v >= RIGID_STOP ? Infinity : 10 ** v;
}

export function stiffnessLabel(k: number): string {
  return Number.isFinite(k) ? `k = ${Math.round(k).toLocaleString("en-US")} N/m` : "rigid (k = ∞)";
}

/** Symplectic Euler's threshold for one spring on a particle of mass `m`
 *  (kg) with substep `h` (s): `4 m / h²` (docs/07-soft-bodies.md). */
export function kCrit(m: number, h: number): number {
  return (4 * m) / (h * h);
}

/** The force-based jelly blows up between these fractions of `kCrit`
 *  (measured, engine tests/jelly.rs: its fastest mode is ~3× one
 *  spring's). */
export const JELLY_BLOWUP_FRACTION: [number, number] = [0.1, 0.15];
