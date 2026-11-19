//! Conservation and correctness invariants (`docs/04-testing.md`, phase 1).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{center_of_mass, momentum};
use engine::scenarios::{ORBIT_SEPARATION, cluster, orbit, orbit_period};
use engine::{DistanceConstraint, Integrator, Mass, Solver, TimeStep, UniformGravity, Vec2, World};
use test_support::{
    Tol, bits, energy_errors, envelope, for_each_scalar, momentum_drift_bound, momentum_scale,
    nonzero, s, steps_for, time_step, v,
};

const GRAVITY_Y: f64 = -9.81;

fn falling_world<S: Tol>(
    integrator: Integrator,
    substeps: u32,
    start_position: Vec2<S>,
    start_velocity: Vec2<S>,
) -> World<S> {
    let mut world = World::new(integrator, nonzero(substeps));
    world.add_force(UniformGravity::new(v(0.0, GRAVITY_Y)));
    world.add_particle(start_position, start_velocity, Mass::ONE);
    world
}

/// Under constant `g`, every integrator here has an exact closed form.
/// After n steps of size h, with t = n h:
///
/// ```text
/// v_n = v0 + g t
/// x_n = x0 + v0 t + ½ g t (t + c h)
///   symplectic Euler  c = +1   x moves with the *new* velocity
///   explicit Euler    c = -1   x moves with the *old* velocity
///   velocity Verlet   c =  0   exact for constant acceleration
/// ```
///
/// So we can assert each integrator to rounding error, not to a loose
/// tolerance, and the Euler variants' error is ±½ g h t: first order.
fn discrete_offset(integrator: Integrator) -> f64 {
    match integrator {
        Integrator::SymplecticEuler => 1.0,
        Integrator::ExplicitEuler => -1.0,
        Integrator::VelocityVerlet => 0.0,
    }
}

fn free_fall_matches_each_integrators_closed_form<S: Tol>() {
    let (start_position, start_velocity) = ((0.0, 10.0), (2.0, 5.0));
    let (step_size, step_count) = (1.0 / 64.0, 64); // binary-exact step, t = 1 s
    for integrator in Integrator::ALL {
        let mut world = falling_world::<S>(
            integrator,
            1,
            v(start_position.0, start_position.1),
            v(start_velocity.0, start_velocity.1),
        );
        for _ in 0..step_count {
            world.step(time_step(step_size));
        }
        let time = step_size * f64::from(step_count);
        let offset = discrete_offset(integrator);
        let position = world.particles().positions()[0];
        let velocity = world.particles().velocities()[0];
        let expected_y = start_position.1
            + start_velocity.1 * time
            + 0.5 * GRAVITY_Y * time * (time + offset * step_size);
        let expected_x = start_position.0 + start_velocity.0 * time;
        assert!(
            (position.y.to_f64() - expected_y).abs() < S::POS_ABS,
            "{integrator:?}: y = {position:?}, want {expected_y}"
        );
        assert!(
            (position.x.to_f64() - expected_x).abs() < S::POS_ABS,
            "{integrator:?}: x = {position:?}, want {expected_x}"
        );
        assert!(
            (velocity.y.to_f64() - (start_velocity.1 + GRAVITY_Y * time)).abs() < S::POS_ABS,
            "{integrator:?}: v = {velocity:?}"
        );
    }
}
for_each_scalar!(free_fall_matches_each_integrators_closed_form);

fn euler_free_fall_error_is_first_order_in_dt<S: Tol>() {
    for integrator in [Integrator::SymplecticEuler, Integrator::ExplicitEuler] {
        let error_at = |step_size: f64, step_count: u32| {
            let mut world = falling_world::<S>(integrator, 1, v(0.0, 0.0), v(0.0, 0.0));
            for _ in 0..step_count {
                world.step(time_step(step_size));
            }
            let time = step_size * f64::from(step_count);
            world.particles().positions()[0].y.to_f64() - 0.5 * GRAVITY_Y * time * time
        };
        let coarse = error_at(1.0 / 32.0, 32);
        let fine = error_at(1.0 / 64.0, 64);
        let ratio = coarse / fine;
        assert!(
            (ratio - 2.0).abs() < 0.01,
            "{integrator:?}: error ratio {ratio}, want 2"
        );
    }
}
for_each_scalar!(euler_free_fall_error_is_first_order_in_dt);

fn static_particle_is_bit_identical<S: Tol>() {
    for integrator in Integrator::ALL {
        let mut world = falling_world::<S>(integrator, 4, v(0.0, 0.0), v(1.0, 1.0));
        let pin = v::<S>(1.5, -2.25);
        world.add_static(pin);
        for _ in 0..1000 {
            world.step(time_step(1.0 / 60.0));
        }
        assert_eq!(
            bits(world.particles().positions()[1]),
            bits(pin),
            "{integrator:?}"
        );
        assert_eq!(
            bits(world.particles().velocities()[1]),
            bits(Vec2::<S>::ZERO),
            "{integrator:?}"
        );
    }
}
for_each_scalar!(static_particle_is_bit_identical);

/// A static particle never moves, even with a velocity (`velocities_mut` can give
/// it one): `kick` and `drift` skip `inverse_mass = 0` in every stepper, the
/// three integrators and both solvers (a rod from the pin puts a world in
/// a solver's hands).
fn a_static_with_a_velocity_stays_put<S: Tol>() {
    let pin = v::<S>(1.5, -2.25);
    let run = |mut world: World<S>, label: &str| {
        let id = world.add_static(pin);
        if let Some(velocity) = world.velocities_mut().get_mut(id.index()) {
            *velocity = v(3.0, 4.0);
        }
        for _ in 0..100 {
            world.step(time_step(1.0 / 60.0));
        }
        assert_eq!(
            bits(world.particles().positions()[id.index()]),
            bits(pin),
            "{label}"
        );
    };
    for integrator in Integrator::ALL {
        run(
            falling_world::<S>(integrator, 4, v(0.0, 0.0), v(1.0, 1.0)),
            &format!("{integrator:?}"),
        );
    }
    for solver in [Solver::Xpbd, Solver::Impulse] {
        let mut world = World::new(Integrator::SymplecticEuler, nonzero(4));
        world.add_force(UniformGravity::new(v(0.0, GRAVITY_Y)));
        world.set_solver(solver);
        let bob = world.add_particle(v(1.5, -3.25), Vec2::ZERO, Mass::ONE);
        let anchor = world.add_static(v(1.5, -2.25));
        let rod = DistanceConstraint::between(world.particles(), anchor, bob).unwrap();
        world.add_constraint(rod).unwrap();
        run(world, &format!("{solver:?}"));
    }
}
for_each_scalar!(a_static_with_a_velocity_stays_put);

/// A zero step would be a no-op for the integrators but `0 / 0` for XPBD's
/// velocity (`Δx / h`), so no step that isn't positive and finite can be
/// made at all.
fn zero_and_bad_steps_cant_be_made<S: Tol>() {
    for bad in [0.0, -1.0 / 60.0, f64::NAN, f64::INFINITY] {
        assert!(TimeStep::<S>::new(s(bad)).is_none(), "{bad}");
    }
}
for_each_scalar!(zero_and_bad_steps_cant_be_made);

/// `substeps = k` with step `dt` must equal k steps of `dt / k`, to
/// rounding (today they agree bit for bit; the test leaves room for the
/// substep loop to do its arithmetic its own way). k = 3 on purpose: a
/// power of two divides exactly and would hide a mismatch in how h is
/// computed; h is computed as `World` does (`dt / k` in S). A wrong h
/// (off by a substep) moves the particle far past the tolerance.
fn substeps_equal_repeated_smaller_steps<S: Tol>() {
    let substeps = 3;
    let step = s::<S>(1.0 / 60.0);
    let substep = step / s(f64::from(substeps));
    for integrator in Integrator::ALL {
        let mut with_substeps = falling_world::<S>(integrator, substeps, v(0.0, 0.0), v(2.0, 5.0));
        let mut with_small_steps = falling_world::<S>(integrator, 1, v(0.0, 0.0), v(2.0, 5.0));
        for _ in 0..100 {
            with_substeps.step(TimeStep::new(step).unwrap());
            for _ in 0..substeps {
                with_small_steps.step(TimeStep::new(substep).unwrap());
            }
        }
        // 300 small steps' rounding, relative to how far and how fast.
        let close = |value: Vec2<S>, reference: Vec2<S>| {
            (value - reference).length().to_f64()
                <= 300.0 * S::EPSILON * reference.length().to_f64().max(1.0)
        };
        let (position, small_position) = (
            with_substeps.particles().positions()[0],
            with_small_steps.particles().positions()[0],
        );
        assert!(
            close(position, small_position),
            "{integrator:?}: {position:?} vs {small_position:?}"
        );
        let (velocity, small_velocity) = (
            with_substeps.particles().velocities()[0],
            with_small_steps.particles().velocities()[0],
        );
        assert!(
            close(velocity, small_velocity),
            "{integrator:?}: {velocity:?} vs {small_velocity:?}"
        );
    }
}
for_each_scalar!(substeps_equal_repeated_smaller_steps);

const CLUSTER_BODIES: usize = 16;
const CLUSTER_STEPS: u32 = 1000;
const STEP: f64 = 1.0 / 60.0;

/// `docs/04-testing.md`: pairwise forces are equal and opposite, so the
/// total momentum of an isolated cluster can only change by rounding.
fn pairwise_gravity_conserves_momentum<S: Tol>() {
    let mut world = cluster::<S>(CLUSTER_BODIES, 1).unwrap();
    let start_momentum = momentum(world.particles());
    for _ in 0..CLUSTER_STEPS {
        world.step(time_step(STEP));
    }
    let drift = (momentum(world.particles()) - start_momentum)
        .length()
        .to_f64();
    let scale = momentum_scale(world.particles());
    let bound = momentum_drift_bound::<S>(CLUSTER_STEPS, scale);
    assert!(drift <= bound, "drift {drift:e} vs bound {bound:e}");
}
for_each_scalar!(pairwise_gravity_conserves_momentum);

fn center_of_mass_moves_at_constant_velocity<S: Tol>() {
    let mut world = cluster::<S>(CLUSTER_BODIES, 1).unwrap();
    let total_mass: f64 = world
        .particles()
        .inverse_mass()
        .iter()
        .map(|inverse_mass| 1.0 / inverse_mass.to_f64())
        .sum();
    let start_momentum = momentum(world.particles());
    let center_velocity = (
        start_momentum.x.to_f64() / total_mass,
        start_momentum.y.to_f64() / total_mass,
    );
    let start_center = center_of_mass(world.particles()).unwrap();
    for _ in 0..CLUSTER_STEPS {
        world.step(time_step(STEP));
    }
    let time = STEP * f64::from(CLUSTER_STEPS);
    let end_center = center_of_mass(world.particles()).unwrap();
    let expected = (
        start_center.x.to_f64() + center_velocity.0 * time,
        start_center.y.to_f64() + center_velocity.1 * time,
    );
    let error = (end_center.x.to_f64() - expected.0).hypot(end_center.y.to_f64() - expected.1);
    assert!(error <= S::COM_ABS, "COM off by {error:e} m");
}
for_each_scalar!(center_of_mass_moves_at_constant_velocity);

const ORBIT_DT: f64 = 1.0 / 60.0;
const ORBITS: f64 = 100.0;

/// ωh for the circular orbit: radians of orbit per step. Both integrators'
/// energy errors scale with powers of it.
fn omega_h() -> f64 {
    2.0 * core::f64::consts::PI / orbit_period() * ORBIT_DT
}

/// Energy bounds are 1.5x the measured error law. Measured (f64, 100
/// orbits, ωh = 0.0349): symplectic Euler max |ΔE/E| = 1.219e-3 vs
/// (ωh)² = 1.218e-3; velocity Verlet 3.704e-7 vs (ωh)⁴/4 = 3.70e-7. The
/// scalar's rounding floor (`Tol::ENERGY_FLOOR`) is added on top.
const BOUND_FACTOR: f64 = 1.5;

/// "Doesn't trend": the last 10% of the run's error envelope may exceed the
/// first 10% by at most this factor (plus the rounding floor). Measured:
/// 1.000x for both symplectic integrators; explicit Euler is 1.37x.
const TREND_FACTOR: f64 = 1.1;

/// Allowed relative deviation of the separation from `ORBIT_SEPARATION`.
/// Measured: symplectic Euler 1.8%, velocity Verlet 0.06%.
const SE_RADIUS_BAND: f64 = 0.025;
const VV_RADIUS_BAND: f64 = 0.001;

/// Velocity Verlet must beat symplectic Euler's error by at least this
/// factor. Measured: 3,300x in f64, 125x in f32 (rounding-limited).
const VERLET_ADVANTAGE: f64 = 50.0;

fn trend_envelopes(errors: &[f64]) -> (f64, f64) {
    let tenth = errors.len() / 10;
    (
        envelope(&errors[..tenth]),
        envelope(&errors[errors.len() - tenth..]),
    )
}

fn orbit_run<S: Tol>(integrator: Integrator) -> (Vec<f64>, (f64, f64)) {
    let mut world = orbit::<S>(integrator, 1.0).unwrap();
    energy_errors(&mut world, ORBIT_DT, steps_for(ORBITS, ORBIT_DT))
}

fn symplectic_euler_orbit_energy_is_bounded_and_does_not_trend<S: Tol>() {
    let (errors, (lowest_separation, highest_separation)) =
        orbit_run::<S>(Integrator::SymplecticEuler);
    let omega_step = omega_h();
    let bound = BOUND_FACTOR * omega_step * omega_step + S::ENERGY_FLOOR;
    let max_error = envelope(&errors);
    assert!(
        max_error <= bound,
        "max |ΔE/E| {max_error:e} > bound {bound:e}"
    );
    let (first, last) = trend_envelopes(&errors);
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "energy error trends: first 10% {first:e}, last 10% {last:e}"
    );
    let separation = ORBIT_SEPARATION;
    assert!(
        lowest_separation >= separation * (1.0 - SE_RADIUS_BAND)
            && highest_separation <= separation * (1.0 + SE_RADIUS_BAND),
        "separation left the band: [{lowest_separation}, {highest_separation}]"
    );
}
for_each_scalar!(symplectic_euler_orbit_energy_is_bounded_and_does_not_trend);

fn velocity_verlet_orbit_is_bounded_and_tighter_than_symplectic_euler<S: Tol>() {
    let (errors, (lowest_separation, highest_separation)) =
        orbit_run::<S>(Integrator::VelocityVerlet);
    let omega_step = omega_h();
    let bound = BOUND_FACTOR * omega_step.powi(4) / 4.0 + S::ENERGY_FLOOR;
    let max_error = envelope(&errors);
    assert!(
        max_error <= bound,
        "max |ΔE/E| {max_error:e} > bound {bound:e}"
    );
    let (first, last) = trend_envelopes(&errors);
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "energy error trends: first 10% {first:e}, last 10% {last:e}"
    );
    let separation = ORBIT_SEPARATION;
    assert!(
        lowest_separation >= separation * (1.0 - VV_RADIUS_BAND)
            && highest_separation <= separation * (1.0 + VV_RADIUS_BAND),
        "separation left the band: [{lowest_separation}, {highest_separation}]"
    );
    let (symplectic_errors, _) = orbit_run::<S>(Integrator::SymplecticEuler);
    let advantage = envelope(&symplectic_errors) / max_error;
    assert!(
        advantage >= VERLET_ADVANTAGE,
        "Verlet only {advantage:.1}x better than symplectic Euler"
    );
}
for_each_scalar!(velocity_verlet_orbit_is_bounded_and_tighter_than_symplectic_euler);

/// The slow tier (`cargo xtask slow`): the symplectic integrators over
/// 2 000 orbits (20x the every-push run), same bounds: bounded, no
/// trend, separation in its band.
const LONG_ORBITS: f64 = 2000.0;

fn long_orbit_holds<S: Tol>(integrator: Integrator, bound: f64, band: f64) {
    let mut world = orbit::<S>(integrator, 1.0).unwrap();
    let (errors, (lowest_separation, highest_separation)) =
        energy_errors(&mut world, ORBIT_DT, steps_for(LONG_ORBITS, ORBIT_DT));
    let max_error = envelope(&errors);
    let (first, last) = trend_envelopes(&errors);
    eprintln!(
        "{integrator:?}: max {max_error:e} (bound {bound:e}), first {first:e}, last {last:e}, [{lowest_separation}, {highest_separation}]"
    );
    assert!(
        max_error <= bound + S::ENERGY_FLOOR,
        "max |ΔE/E| {max_error:e}"
    );
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "trends: {first:e} → {last:e}"
    );
    let separation = ORBIT_SEPARATION;
    assert!(
        lowest_separation >= separation * (1.0 - band)
            && highest_separation <= separation * (1.0 + band),
        "[{lowest_separation}, {highest_separation}]"
    );
}

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_symplectic_orbits_hold_for_two_thousand_orbits() {
    let omega_step = omega_h();
    for scalar_f32 in [false, true] {
        let symplectic_bound = BOUND_FACTOR * omega_step * omega_step;
        let verlet_bound = BOUND_FACTOR * omega_step.powi(4) / 4.0;
        if scalar_f32 {
            long_orbit_holds::<f32>(
                Integrator::SymplecticEuler,
                symplectic_bound,
                SE_RADIUS_BAND,
            );
            long_orbit_holds::<f32>(Integrator::VelocityVerlet, verlet_bound, VV_RADIUS_BAND);
        } else {
            long_orbit_holds::<f64>(
                Integrator::SymplecticEuler,
                symplectic_bound,
                SE_RADIUS_BAND,
            );
            long_orbit_holds::<f64>(Integrator::VelocityVerlet, verlet_bound, VV_RADIUS_BAND);
        }
    }
}
