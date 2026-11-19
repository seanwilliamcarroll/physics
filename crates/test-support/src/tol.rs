//! Per-scalar tolerances and error laws for the engine's tests.

use engine::{Particles, Scalar};

/// Per-scalar tolerances: hypotheses, not facts. When one fails, decide
/// whether the tolerance or the physics is wrong.
pub trait Tol: Scalar {
    /// Absolute position/velocity rounding error for ~10 m scenes over ~100
    /// steps. ~10x measured.
    const POS_ABS: f64;
    /// Machine epsilon, for error laws that scale with it.
    const EPSILON: f64;
    /// Center-of-mass error allowed after the same run, m. ~10x measured.
    const COM_ABS: f64;
    /// Relative energy error from rounding alone over 100 orbits, added to every
    /// orbit energy bound. In f32 it exceeds Verlet's own truncation error.
    const ENERGY_FLOOR: f64;
    /// Property tests (60 steps, `world_spec`): position difference allowed
    /// between shift-then-step and step-then-shift (shifts up to ±100 m), and
    /// between a world and its reordering, m. ~10x the worst of 2000 worlds.
    const TRANSLATION_ABS: f64;
    const PERMUTATION_ABS: f64;
}

// Measured: free fall, 64 steps: max error 1.5e-6.
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

// Measured: free fall 8.9e-16. Cluster: COM error 1.6e-14 m.
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
/// rounding: each step `v += a h` moves a body's momentum by at most
/// ε m|v|/2. An error law in ε, not a measured constant.
/// Measured over 15,000 random worlds × 3 integrators: worst drift is 0.26
/// (f32) and 0.10 (f64) of this bound.
#[must_use]
pub fn momentum_drift_bound<S: Tol>(steps: u32, scale: f64) -> f64 {
    f64::from(steps) * S::EPSILON * scale
}

/// `Σ m|v|` of the dynamic bodies: the scale momentum drift is judged on.
#[must_use]
pub fn momentum_scale<S: Scalar>(particles: &Particles<S>) -> f64 {
    particles
        .vel()
        .iter()
        .zip(particles.inv_mass())
        .filter(|&(_, &inv_mass)| inv_mass != S::ZERO)
        .map(|(vel, inv_mass)| vel.length().to_f64() / inv_mass.to_f64())
        .sum()
}
