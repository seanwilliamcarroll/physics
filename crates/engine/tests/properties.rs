//! Property tests (`docs/04-testing.md`): invariants that must hold for
//! *any* generated world, not just hand-picked scenarios. Each property
//! checks f32 and f64 on the same generated input; on failure, proptest
//! shrinks to a minimal world and saves it next to this file
//! (`properties.proptest-regressions`, committed) to replay forever.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

#[macro_use]
mod common;

use common::{BodySpec, Tol, build_world, proptest_config, state_hash, world_spec};
use engine::diagnostics::momentum;
use engine::{Integrator, Scalar, Vec2, World};
use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

/// One second of 60 Hz steps per property case.
const STEPS: u32 = 60;
const DT: f64 = 1.0 / 60.0;
/// Largest translation tried, m (each axis).
const MAX_SHIFT_M: f64 = 100.0;

fn run<S: Scalar>(mut w: World<S>) -> World<S> {
    for _ in 0..STEPS {
        w.step(S::from_f64(DT));
    }
    w
}

/// `Σ m |v|` of the dynamic bodies: the scale momentum drift is judged on.
fn momentum_scale<S: Scalar>(w: &World<S>) -> f64 {
    w.particles
        .vel()
        .iter()
        .zip(w.particles.inv_mass())
        .filter(|&(_, &iw)| iw != S::ZERO)
        .map(|(v, iw)| v.length().to_f64() / iw.to_f64())
        .sum()
}

fn momentum_is_conserved<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    let w0 = build_world::<S>(bodies, Integrator::SymplecticEuler);
    let p0 = momentum(&w0.particles);
    let w = run(w0);
    let drift = (momentum(&w.particles) - p0).length().to_f64();
    let scale = momentum_scale(&w).max(f64::MIN_POSITIVE);
    prop_assert!(
        drift <= S::MOMENTUM_REL * scale,
        "drift {drift:e} vs scale {scale:e}"
    );
    Ok(())
}

fn stays_finite<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    let w = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let finite = |v: &Vec2<S>| v.x.to_f64().is_finite() && v.y.to_f64().is_finite();
    prop_assert!(w.particles.pos().iter().all(finite));
    prop_assert!(w.particles.vel().iter().all(finite));
    Ok(())
}

fn translation_commutes_with_stepping<S: Tol>(
    bodies: &[BodySpec],
    (dx, dy): (f64, f64),
) -> Result<(), TestCaseError> {
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let moved: Vec<BodySpec> = bodies
        .iter()
        .map(|b| BodySpec {
            pos: (b.pos.0 + dx, b.pos.1 + dy),
            ..b.clone()
        })
        .collect();
    let shifted = run(build_world::<S>(&moved, Integrator::SymplecticEuler));
    for (p, q) in shifted.particles.pos().iter().zip(base.particles.pos()) {
        let err = (p.x.to_f64() - dx - q.x.to_f64())
            .abs()
            .max((p.y.to_f64() - dy - q.y.to_f64()).abs());
        prop_assert!(err <= S::TRANSLATION_ABS, "off by {err:e} m");
    }
    Ok(())
}

/// Rotating by 90° is `(x, y) -> (-y, x)`: a swap and a negation, both
/// exact. Every operation in a pairwise-gravity step is symmetric under it
/// (`x² + y²` vs `y² + x²` is IEEE-commutative addition), so the result
/// must match **exactly in value**: any failure means a non-symmetric
/// operation crept in.
///
/// Value, not bits: proptest's first counterexample was two bodies at
/// rest at the origin. Rotating `0.0` gives `-0.0`, and stepping adds
/// `0.0 * h`, and `-0.0 + 0.0 = +0.0` in IEEE, so the rotated world ends
/// at `+0.0` while rotating the base result gives `-0.0`. Equal values,
/// different bits; `==` treats them as equal (and still fails on NaN).
fn rotation_by_90_degrees_is_exact<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    let rot = |(x, y): (f64, f64)| (-y, x);
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let turned: Vec<BodySpec> = bodies
        .iter()
        .map(|b| BodySpec {
            pos: rot(b.pos),
            vel: rot(b.vel),
            mass: b.mass,
        })
        .collect();
    let rotated = run(build_world::<S>(&turned, Integrator::SymplecticEuler));
    for (p, q) in rotated.particles.pos().iter().zip(base.particles.pos()) {
        prop_assert_eq!(*p, q.perp());
    }
    for (p, q) in rotated.particles.vel().iter().zip(base.particles.vel()) {
        prop_assert_eq!(*p, q.perp());
    }
    Ok(())
}

/// Pairwise forces don't depend on body order, so reordering changes only
/// summation order (rounding). M3's Gauss–Seidel solvers will break this on
/// purpose: it's the canary for where order dependence enters.
fn permutation_changes_only_rounding<S: Tol>(
    bodies: &[BodySpec],
    shuffled: &[BodySpec],
) -> Result<(), TestCaseError> {
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let perm = run(build_world::<S>(shuffled, Integrator::SymplecticEuler));
    for (i, b) in shuffled.iter().enumerate() {
        // Generated positions are continuous, so bit-equal positions
        // identify the same body.
        let j = bodies
            .iter()
            .position(|o| {
                o.pos.0.to_bits() == b.pos.0.to_bits() && o.pos.1.to_bits() == b.pos.1.to_bits()
            })
            .unwrap();
        let (p, q) = (perm.particles.pos()[i], base.particles.pos()[j]);
        let err = (p.x.to_f64() - q.x.to_f64())
            .abs()
            .max((p.y.to_f64() - q.y.to_f64()).abs());
        prop_assert!(err <= S::PERMUTATION_ABS, "body {j} off by {err:e} m");
    }
    Ok(())
}

fn every_integrator_is_deterministic<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    for integrator in Integrator::ALL {
        let a = run(build_world::<S>(bodies, integrator));
        let b = run(build_world::<S>(bodies, integrator));
        prop_assert_eq!(
            state_hash(&a.particles),
            state_hash(&b.particles),
            "{:?}",
            integrator
        );
    }
    Ok(())
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn pairwise_gravity_conserves_momentum_for_any_world(bodies in world_spec()) {
        momentum_is_conserved::<f32>(&bodies)?;
        momentum_is_conserved::<f64>(&bodies)?;
    }

    #[test]
    fn softened_worlds_stay_finite(bodies in world_spec()) {
        stays_finite::<f32>(&bodies)?;
        stays_finite::<f64>(&bodies)?;
    }

    #[test]
    fn translation_invariance(
        bodies in world_spec(),
        shift in (-MAX_SHIFT_M..MAX_SHIFT_M, -MAX_SHIFT_M..MAX_SHIFT_M),
    ) {
        translation_commutes_with_stepping::<f32>(&bodies, shift)?;
        translation_commutes_with_stepping::<f64>(&bodies, shift)?;
    }

    #[test]
    fn rotation_by_90_degrees_commutes_exactly(bodies in world_spec()) {
        rotation_by_90_degrees_is_exact::<f32>(&bodies)?;
        rotation_by_90_degrees_is_exact::<f64>(&bodies)?;
    }

    #[test]
    fn permutation_invariance(
        (bodies, shuffled) in world_spec()
            .prop_flat_map(|w| (Just(w.clone()), Just(w).prop_shuffle())),
    ) {
        permutation_changes_only_rounding::<f32>(&bodies, &shuffled)?;
        permutation_changes_only_rounding::<f64>(&bodies, &shuffled)?;
    }

    #[test]
    fn determinism_for_any_world(bodies in world_spec()) {
        every_integrator_is_deterministic::<f32>(&bodies)?;
        every_integrator_is_deterministic::<f64>(&bodies)?;
    }
}
