//! Property tests (`docs/04-testing.md`): invariants that must hold for
//! *any* generated world, not just hand-picked scenarios. Each property
//! checks f32 and f64 on the same generated input; on failure, proptest
//! shrinks to a minimal world and saves it next to this file
//! (`properties.proptest-regressions`, committed) to replay forever.
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::momentum;
use engine::{Integrator, Scalar, Vec2, World};
use proptest::prelude::*;
use proptest::test_runner::TestCaseError;
use test_support::{
    BodySpec, Tol, build_world, momentum_drift_bound, momentum_scale, proptest_config, state_bits,
    time_step, world_spec,
};

/// One second of 60 Hz steps per property case.
const STEPS: u32 = 60;
const DT: f64 = 1.0 / 60.0;
/// Largest translation tried, m (each axis).
const MAX_SHIFT_M: f64 = 100.0;

fn run<S: Scalar>(mut world: World<S>) -> World<S> {
    for _ in 0..STEPS {
        world.step(time_step(DT));
    }
    world
}

fn momentum_is_conserved<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    let start_world = build_world::<S>(bodies, Integrator::SymplecticEuler);
    let start_momentum = momentum(start_world.particles());
    let world = run(start_world);
    let drift = (momentum(world.particles()) - start_momentum)
        .length()
        .to_f64();
    let scale = momentum_scale(world.particles()).max(f64::MIN_POSITIVE);
    let bound = momentum_drift_bound::<S>(STEPS, scale);
    prop_assert!(drift <= bound, "drift {drift:e} vs bound {bound:e}");
    Ok(())
}

fn stays_finite<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    let world = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let finite = |vector: &Vec2<S>| vector.x.to_f64().is_finite() && vector.y.to_f64().is_finite();
    prop_assert!(world.particles().pos().iter().all(finite));
    prop_assert!(world.particles().vel().iter().all(finite));
    Ok(())
}

fn translation_commutes_with_stepping<S: Tol>(
    bodies: &[BodySpec],
    (dx, dy): (f64, f64),
) -> Result<(), TestCaseError> {
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let moved: Vec<BodySpec> = bodies
        .iter()
        .map(|body| BodySpec {
            pos: (body.pos.0 + dx, body.pos.1 + dy),
            ..body.clone()
        })
        .collect();
    let shifted = run(build_world::<S>(&moved, Integrator::SymplecticEuler));
    for (shifted_position, base_position) in
        shifted.particles().pos().iter().zip(base.particles().pos())
    {
        let error = (shifted_position.x.to_f64() - dx - base_position.x.to_f64())
            .abs()
            .max((shifted_position.y.to_f64() - dy - base_position.y.to_f64()).abs());
        prop_assert!(error <= S::TRANSLATION_ABS, "off by {error:e} m");
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
    let rotate = |(x, y): (f64, f64)| (-y, x);
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let turned: Vec<BodySpec> = bodies
        .iter()
        .map(|body| BodySpec {
            pos: rotate(body.pos),
            vel: rotate(body.vel),
            mass: body.mass,
        })
        .collect();
    let rotated = run(build_world::<S>(&turned, Integrator::SymplecticEuler));
    for (rotated_position, base_position) in
        rotated.particles().pos().iter().zip(base.particles().pos())
    {
        prop_assert_eq!(*rotated_position, base_position.perp());
    }
    for (rotated_velocity, base_velocity) in
        rotated.particles().vel().iter().zip(base.particles().vel())
    {
        prop_assert_eq!(*rotated_velocity, base_velocity.perp());
    }
    Ok(())
}

/// Pairwise forces don't depend on body order, so reordering changes only
/// summation order (rounding). This holds for unconstrained worlds only:
/// with constraints, Gauss–Seidel order is part of the method, and
/// `constrained_properties.rs` checks the bounded version instead.
fn permutation_changes_only_rounding<S: Tol>(
    bodies: &[BodySpec],
    shuffled: &[BodySpec],
) -> Result<(), TestCaseError> {
    let base = run(build_world::<S>(bodies, Integrator::SymplecticEuler));
    let permuted = run(build_world::<S>(shuffled, Integrator::SymplecticEuler));
    for (shuffled_index, shuffled_body) in shuffled.iter().enumerate() {
        // Generated positions are continuous, so bit-equal positions
        // identify the same body.
        let original_index = bodies
            .iter()
            .position(|original| {
                original.pos.0.to_bits() == shuffled_body.pos.0.to_bits()
                    && original.pos.1.to_bits() == shuffled_body.pos.1.to_bits()
            })
            .unwrap();
        let (permuted_position, base_position) = (
            permuted.particles().pos()[shuffled_index],
            base.particles().pos()[original_index],
        );
        let error = (permuted_position.x.to_f64() - base_position.x.to_f64())
            .abs()
            .max((permuted_position.y.to_f64() - base_position.y.to_f64()).abs());
        prop_assert!(
            error <= S::PERMUTATION_ABS,
            "body {original_index} off by {error:e} m"
        );
    }
    Ok(())
}

fn every_integrator_is_deterministic<S: Tol>(bodies: &[BodySpec]) -> Result<(), TestCaseError> {
    for integrator in Integrator::ALL {
        let first = run(build_world::<S>(bodies, integrator));
        let repeat = run(build_world::<S>(bodies, integrator));
        prop_assert_eq!(
            state_bits(first.particles()),
            state_bits(repeat.particles()),
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
            .prop_flat_map(|world| (Just(world.clone()), Just(world).prop_shuffle())),
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
