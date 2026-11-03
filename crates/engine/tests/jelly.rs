//! The jelly (`docs/07-soft-bodies.md`): force-based springs blow up past
//! a stiffness well below the single-spring `k_crit`; compliant
//! constraints stay stable at any stiffness, rigid included.
//!
//! Stability is judged by **kinetic energy**, not total energy: the
//! elastic energy of very stiff, unconverged constraints (`½ C² / α` with
//! tiny `α`) is meaningless (it showed XPBD "gaining" 3e5 J while at rest).
#![cfg(test)]

use engine::Solver;
use engine::diagnostics::kinetic_energy;
use engine::scenarios::{JELLY_COLS, JELLY_ROWS, JellyBody, jelly};
use test_support::nonzero;

const DT: f64 = 1.0 / 60.0;
/// The page's default substeps: h = 1/600 s.
const SUBSTEPS: u32 = 10;
/// The page's default damping, N·s/m.
const DAMPING: f64 = 0.5;

/// The single-spring threshold for one jelly particle (1/64 kg): `4 m / h²`
/// = 22 500 N/m.
fn k_crit() -> f64 {
    // 64 particles share JELLY_MASS (1 kg).
    let m = engine::scenarios::JELLY_MASS / 64.0;
    assert_eq!(JELLY_COLS * JELLY_ROWS, 64);
    let h = DT / f64::from(SUBSTEPS);
    4.0 * m / (h * h)
}

/// (largest kinetic energy, J, over 5 s; kinetic energy at the end).
/// Non-finite counts as infinite.
fn run(body: JellyBody, k: f64) -> (f64, f64) {
    let mut j = jelly::<f64>(body, nonzero(SUBSTEPS), JELLY_COLS, JELLY_ROWS, k, DAMPING).unwrap();
    let mut peak = 0.0_f64;
    for _ in 0..300 {
        j.world.step(DT);
        let ke = kinetic_energy(&j.world.particles);
        if !ke.is_finite() {
            return (f64::INFINITY, f64::INFINITY);
        }
        peak = peak.max(ke);
    }
    (peak, kinetic_energy(&j.world.particles))
}

/// The fall: dropped 0.5 m (plus its own height), the jelly reaches 4.82 J
/// of kinetic energy just before impact, in every stable run. Anything
/// past twice that came from the stepper, not gravity.
const FALL_KE_BOUND: f64 = 10.0;

/// Force springs on the 8×8 grid blow up between 0.1 and 0.15 of the
/// single-spring `k_crit` (measured, c = 0.5: stable at 0.08, infinite
/// kinetic energy at 0.1 and above with damping, at 0.15 without): the
/// grid's fastest mode is ~3x faster than one spring's (`07`, "A network
/// fails earlier"). Bounds: stable at 0.05, blown up by 0.2.
#[test]
fn force_springs_blow_up_well_below_the_single_spring_threshold() {
    let (stable, _) = run(JellyBody::Springs, 0.05 * k_crit());
    let (blown, _) = run(JellyBody::Springs, 0.2 * k_crit());
    assert!(stable < FALL_KE_BOUND, "0.05 k_crit: peak KE {stable} J");
    assert!(blown > 100.0, "0.2 k_crit: peak KE {blown} J");
}

/// Compliant constraints at one iteration, from soft to rigid: the
/// kinetic energy never exceeds the fall's, and the jelly comes to rest
/// (measured: peak 4.82 J in every run).
#[test]
fn constraints_stay_stable_at_any_stiffness() {
    for solver in Solver::ALL {
        for k in [1e3, 1e5, 1e7, 1e9, f64::INFINITY] {
            let (peak, end) = run(JellyBody::Constraints(solver), k);
            assert!(peak < FALL_KE_BOUND, "{solver:?} k={k:e}: peak KE {peak} J");
            assert!(end < 0.1, "{solver:?} k={k:e}: still moving, KE {end} J");
        }
    }
}
