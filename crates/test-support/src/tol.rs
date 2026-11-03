//! Per-scalar tolerances and error laws for the engine's tests.

use engine::Scalar;

/// Per-scalar tolerances. These are hypotheses: when one fails, first decide
/// whether the tolerance or the physics is wrong, and record why here.
pub trait Tol: Scalar {
    /// Absolute position/velocity error allowed from rounding alone, for
    /// scenes of order 10 m over order 100 steps. Set ~10x above measured.
    const POS_ABS: f64;
    /// Machine epsilon of the scalar, for error laws that scale with it
    /// (see `momentum_drift_bound`).
    const EPSILON: f64;
    /// Center-of-mass error allowed after the same run, m. ~10x measured.
    const COM_ABS: f64;
    /// Relative energy error from rounding alone over 100 orbits: added to
    /// every orbit energy bound. In f32 it exceeds velocity Verlet's own
    /// truncation error, so f32 can't resolve Verlet's accuracy.
    const ENERGY_FLOOR: f64;
    /// Property tests, 60 steps of random worlds (`world_spec`): position
    /// difference allowed between "shift then step" and "step then shift"
    /// (shifts up to ±100 m), and between a world and its reordering, m.
    /// Set ~10x above the worst case over 2000 random worlds.
    const TRANSLATION_ABS: f64;
    const PERMUTATION_ABS: f64;
}

// Measured (2026-11-02): free fall, 64 steps: max error 1.5e-6.
// Cluster, 1000 steps: COM error 1.5e-6 m.
impl Tol for f32 {
    const POS_ABS: f64 = 1e-5;
    const EPSILON: f64 = f32::EPSILON as f64;
    const COM_ABS: f64 = 2e-5;
    // Orbit, Verlet, 100 orbits: 9.7e-6 (vs 3.7e-7 in f64): rounding.
    const ENERGY_FLOOR: f64 = 1e-4;
    // 2000 random worlds: translation 3.7e-4 m (positions to ~110 m, where an
    // f32 step is ~8 µm), permutation 4.8e-6 m.
    const TRANSLATION_ABS: f64 = 4e-3;
    const PERMUTATION_ABS: f64 = 5e-5;
}

// Measured (same runs): free fall 8.9e-16. Cluster: COM error 1.6e-14 m.
impl Tol for f64 {
    const POS_ABS: f64 = 1e-14;
    const EPSILON: f64 = f64::EPSILON;
    const COM_ABS: f64 = 2e-13;
    // f64 orbit errors match truncation formulas to 3 digits; rounding is
    // far below them.
    const ENERGY_FLOOR: f64 = 1e-12;
    // 2000 random worlds: translation 4.3e-13 m, permutation 1.2e-14 m.
    const TRANSLATION_ABS: f64 = 5e-12;
    const PERMUTATION_ABS: f64 = 2e-13;
}

/// Largest momentum drift rounding alone can cause in `steps` steps:
/// `steps · ε · Σ m|v|`.
///
/// Pairwise forces are equal and opposite, so momentum only changes through
/// rounding. Each step, `v += a h` rounds each velocity by at most half an
/// ulp (≤ ε/2 relative), moving that body's momentum by ≤ ε m|v|/2; summed
/// over bodies and steps, with the momentum readout's own rounding, the
/// drift stays under `steps · ε · Σ m|v|`. An error law in the scalar's ε,
/// not a measured constant: a constant calibrated on one 16-body cluster
/// (1e-6 for f32) was exceeded by a two-body world proptest found.
/// Measured over 15,000 random worlds × 3 integrators: worst drift is 0.26
/// (f32) and 0.10 (f64) of this bound.
#[must_use]
pub fn momentum_drift_bound<S: Tol>(steps: u32, scale: f64) -> f64 {
    f64::from(steps) * S::EPSILON * scale
}
