//! Conservation and correctness invariants (`docs/04-testing.md`, phase 1).
// Marks the whole file as test code, so clippy's `allow-*-in-tests` settings
// cover the generic test bodies too (see docs/lint-policy.md).
#![cfg(test)]

use engine::diagnostics::{center_of_mass, momentum};
use engine::scenarios::{ORBIT_SEPARATION, cluster, orbit, orbit_period};
use engine::{DistanceConstraint, Integrator, Mass, Solver, TimeStep, UniformGravity, Vec2, World};
use test_support::{
    Tol, bits, energy_errors, envelope, for_each_scalar, momentum_drift_bound, momentum_scale,
    nonzero, s, steps_for, time_step, v,
};

const G: f64 = -9.81;

/// One dynamic particle under uniform gravity, `substeps` per step.
fn falling_world<S: Tol>(
    integrator: Integrator,
    substeps: u32,
    x0: Vec2<S>,
    v0: Vec2<S>,
) -> World<S> {
    let mut w = World::new(integrator, nonzero(substeps));
    w.add_force(UniformGravity::new(v(0.0, G)));
    w.add_particle(x0, v0, Mass::ONE);
    w
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
    let (x0, v0) = ((0.0, 10.0), (2.0, 5.0));
    let (h, n) = (1.0 / 64.0, 64); // binary-exact h, t = 1 s
    for integrator in Integrator::ALL {
        let mut w = falling_world::<S>(integrator, 1, v(x0.0, x0.1), v(v0.0, v0.1));
        for _ in 0..n {
            w.step(time_step(h));
        }
        let t = h * f64::from(n);
        let c = discrete_offset(integrator);
        let x = w.particles().pos()[0];
        let vel = w.particles().vel()[0];
        let expect_y = x0.1 + v0.1 * t + 0.5 * G * t * (t + c * h);
        let expect_x = x0.0 + v0.0 * t;
        assert!(
            (x.y.to_f64() - expect_y).abs() < S::POS_ABS,
            "{integrator:?}: y = {x:?}, want {expect_y}"
        );
        assert!(
            (x.x.to_f64() - expect_x).abs() < S::POS_ABS,
            "{integrator:?}: x = {x:?}, want {expect_x}"
        );
        assert!(
            (vel.y.to_f64() - (v0.1 + G * t)).abs() < S::POS_ABS,
            "{integrator:?}: v = {vel:?}"
        );
    }
}
for_each_scalar!(free_fall_matches_each_integrators_closed_form);

/// The Euler variants' known error: halving h halves the error against the
/// analytic parabola (first order), with opposite signs.
fn euler_free_fall_error_is_first_order_in_dt<S: Tol>() {
    for integrator in [Integrator::SymplecticEuler, Integrator::ExplicitEuler] {
        let error_at = |h: f64, n: u32| {
            let mut w = falling_world::<S>(integrator, 1, v(0.0, 0.0), v(0.0, 0.0));
            for _ in 0..n {
                w.step(time_step(h));
            }
            let t = h * f64::from(n);
            w.particles().pos()[0].y.to_f64() - 0.5 * G * t * t
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
        let mut w = falling_world::<S>(integrator, 4, v(0.0, 0.0), v(1.0, 1.0));
        let pin = v::<S>(1.5, -2.25);
        w.add_static(pin);
        for _ in 0..1000 {
            w.step(time_step(1.0 / 60.0));
        }
        assert_eq!(bits(w.particles().pos()[1]), bits(pin), "{integrator:?}");
        assert_eq!(
            bits(w.particles().vel()[1]),
            bits(Vec2::<S>::ZERO),
            "{integrator:?}"
        );
    }
}
for_each_scalar!(static_particle_is_bit_identical);

/// A static particle never moves, even with a velocity (`vel_mut` can give
/// it one): `kick` and `drift` skip `inv_mass = 0` in every stepper, the
/// three integrators and both solvers (a rod from the pin puts a world in
/// a solver's hands). Before the audit after A3 a static drifted at
/// whatever velocity it was given.
fn a_static_with_a_velocity_stays_put<S: Tol>() {
    let pin = v::<S>(1.5, -2.25);
    let run = |mut w: World<S>, label: &str| {
        let id = w.add_static(pin);
        if let Some(vel) = w.vel_mut().get_mut(id.index()) {
            *vel = v(3.0, 4.0);
        }
        for _ in 0..100 {
            w.step(time_step(1.0 / 60.0));
        }
        assert_eq!(bits(w.particles().pos()[id.index()]), bits(pin), "{label}");
    };
    for integrator in Integrator::ALL {
        run(
            falling_world::<S>(integrator, 4, v(0.0, 0.0), v(1.0, 1.0)),
            &format!("{integrator:?}"),
        );
    }
    for solver in [Solver::Xpbd, Solver::Impulse] {
        let mut w = World::new(Integrator::SymplecticEuler, nonzero(4));
        w.add_force(UniformGravity::new(v(0.0, G)));
        w.set_solver(solver);
        let bob = w.add_particle(v(1.5, -3.25), Vec2::ZERO, Mass::ONE);
        let anchor = w.add_static(v(1.5, -2.25));
        let rod = DistanceConstraint::between(w.particles(), anchor, bob).unwrap();
        w.add_constraint(rod).unwrap();
        run(w, &format!("{solver:?}"));
    }
}
for_each_scalar!(a_static_with_a_velocity_stays_put);

/// M0's "zero dt" test, now a type's: a zero step was a no-op for the
/// integrators, but `0 / 0` for XPBD's velocity (`Δx / h`), so no step that
/// isn't positive and finite can be made at all.
fn zero_and_bad_steps_cant_be_made<S: Tol>() {
    for bad in [0.0, -1.0 / 60.0, f64::NAN, f64::INFINITY] {
        assert!(TimeStep::<S>::new(s(bad)).is_none(), "{bad}");
    }
}
for_each_scalar!(zero_and_bad_steps_cant_be_made);

/// `substeps = k` with step `dt` must equal k steps of `dt / k`, bit for bit.
/// k = 3 on purpose: dividing by a power of two is exact and would hide a
/// mismatch in how h is computed. The test computes h exactly as `World`
/// does (`dt / k` in S), not `from_f64(dt / 3.0)`, which rounds once instead
/// of twice for f32.
fn substeps_equal_repeated_smaller_steps<S: Tol>() {
    let k = 3;
    let dt = s::<S>(1.0 / 60.0);
    let h = dt / s(f64::from(k));
    for integrator in Integrator::ALL {
        let mut a = falling_world::<S>(integrator, k, v(0.0, 0.0), v(2.0, 5.0));
        let mut b = falling_world::<S>(integrator, 1, v(0.0, 0.0), v(2.0, 5.0));
        for _ in 0..100 {
            a.step(TimeStep::new(dt).unwrap());
            for _ in 0..k {
                b.step(TimeStep::new(h).unwrap());
            }
        }
        let (pa, pb) = (a.particles().pos()[0], b.particles().pos()[0]);
        assert_eq!(bits(pa), bits(pb), "{integrator:?}");
        let (va, vb) = (a.particles().vel()[0], b.particles().vel()[0]);
        assert_eq!(bits(va), bits(vb), "{integrator:?}");
    }
}
for_each_scalar!(substeps_equal_repeated_smaller_steps);

const CLUSTER_N: usize = 16;
const CLUSTER_STEPS: u32 = 1000;
const STEP: f64 = 1.0 / 60.0;

/// `docs/04-testing.md`: pairwise forces are equal and opposite, so the
/// total momentum of an isolated cluster can only change by rounding.
fn pairwise_gravity_conserves_momentum<S: Tol>() {
    let mut w = cluster::<S>(CLUSTER_N, 1).unwrap();
    let p0 = momentum(w.particles());
    for _ in 0..CLUSTER_STEPS {
        w.step(time_step(STEP));
    }
    let drift = (momentum(w.particles()) - p0).length().to_f64();
    let scale = momentum_scale(w.particles());
    let bound = momentum_drift_bound::<S>(CLUSTER_STEPS, scale);
    assert!(drift <= bound, "drift {drift:e} vs bound {bound:e}");
}
for_each_scalar!(pairwise_gravity_conserves_momentum);

/// With momentum conserved, the center of mass moves in a straight line at
/// `P / M`, however violently the bodies interact.
fn center_of_mass_moves_at_constant_velocity<S: Tol>() {
    let mut w = cluster::<S>(CLUSTER_N, 1).unwrap();
    let total_mass: f64 = w
        .particles()
        .inv_mass()
        .iter()
        .map(|w| 1.0 / w.to_f64())
        .sum();
    let p0 = momentum(w.particles());
    let com_velocity = (p0.x.to_f64() / total_mass, p0.y.to_f64() / total_mass);
    let c0 = center_of_mass(w.particles()).unwrap();
    for _ in 0..CLUSTER_STEPS {
        w.step(time_step(STEP));
    }
    let t = STEP * f64::from(CLUSTER_STEPS);
    let c1 = center_of_mass(w.particles()).unwrap();
    let expect = (
        c0.x.to_f64() + com_velocity.0 * t,
        c0.y.to_f64() + com_velocity.1 * t,
    );
    let err = (c1.x.to_f64() - expect.0).hypot(c1.y.to_f64() - expect.1);
    assert!(err <= S::COM_ABS, "COM off by {err:e} m");
}
for_each_scalar!(center_of_mass_moves_at_constant_velocity);

// --- Orbits (docs/04-testing.md, phase 1 step 4) ---

/// Step size the integrators are compared at: one 60 Hz frame.
const ORBIT_DT: f64 = 1.0 / 60.0;
/// "Over 100 orbits" (docs/04-testing.md).
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

/// First and last 10% envelopes of an error series.
fn trend_envelopes(errors: &[f64]) -> (f64, f64) {
    let tenth = errors.len() / 10;
    (
        envelope(&errors[..tenth]),
        envelope(&errors[errors.len() - tenth..]),
    )
}

fn orbit_run<S: Tol>(integrator: Integrator) -> (Vec<f64>, (f64, f64)) {
    let mut w = orbit::<S>(integrator, 1.0).unwrap();
    energy_errors(&mut w, ORBIT_DT, steps_for(ORBITS, ORBIT_DT))
}

fn symplectic_euler_orbit_energy_is_bounded_and_does_not_trend<S: Tol>() {
    let (errors, (lo, hi)) = orbit_run::<S>(Integrator::SymplecticEuler);
    let wh = omega_h();
    let bound = BOUND_FACTOR * wh * wh + S::ENERGY_FLOOR;
    let max = envelope(&errors);
    assert!(max <= bound, "max |ΔE/E| {max:e} > bound {bound:e}");
    let (first, last) = trend_envelopes(&errors);
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "energy error trends: first 10% {first:e}, last 10% {last:e}"
    );
    let d = ORBIT_SEPARATION;
    assert!(
        lo >= d * (1.0 - SE_RADIUS_BAND) && hi <= d * (1.0 + SE_RADIUS_BAND),
        "separation left the band: [{lo}, {hi}]"
    );
}
for_each_scalar!(symplectic_euler_orbit_energy_is_bounded_and_does_not_trend);

fn velocity_verlet_orbit_is_bounded_and_tighter_than_symplectic_euler<S: Tol>() {
    let (errors, (lo, hi)) = orbit_run::<S>(Integrator::VelocityVerlet);
    let wh = omega_h();
    let bound = BOUND_FACTOR * wh.powi(4) / 4.0 + S::ENERGY_FLOOR;
    let max = envelope(&errors);
    assert!(max <= bound, "max |ΔE/E| {max:e} > bound {bound:e}");
    let (first, last) = trend_envelopes(&errors);
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "energy error trends: first 10% {first:e}, last 10% {last:e}"
    );
    let d = ORBIT_SEPARATION;
    assert!(
        lo >= d * (1.0 - VV_RADIUS_BAND) && hi <= d * (1.0 + VV_RADIUS_BAND),
        "separation left the band: [{lo}, {hi}]"
    );
    let (se_errors, _) = orbit_run::<S>(Integrator::SymplecticEuler);
    let advantage = envelope(&se_errors) / max;
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
    let mut w = orbit::<S>(integrator, 1.0).unwrap();
    let (errors, (lo, hi)) = energy_errors(&mut w, ORBIT_DT, steps_for(LONG_ORBITS, ORBIT_DT));
    let max = envelope(&errors);
    let (first, last) = trend_envelopes(&errors);
    eprintln!(
        "{integrator:?}: max {max:e} (bound {bound:e}), first {first:e}, last {last:e}, [{lo}, {hi}]"
    );
    assert!(max <= bound + S::ENERGY_FLOOR, "max |ΔE/E| {max:e}");
    assert!(
        last <= TREND_FACTOR * first + S::ENERGY_FLOOR,
        "trends: {first:e} → {last:e}"
    );
    let d = ORBIT_SEPARATION;
    assert!(
        lo >= d * (1.0 - band) && hi <= d * (1.0 + band),
        "[{lo}, {hi}]"
    );
}

#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_symplectic_orbits_hold_for_two_thousand_orbits() {
    let wh = omega_h();
    for scalar_f32 in [false, true] {
        let se = BOUND_FACTOR * wh * wh;
        let vv = BOUND_FACTOR * wh.powi(4) / 4.0;
        if scalar_f32 {
            long_orbit_holds::<f32>(Integrator::SymplecticEuler, se, SE_RADIUS_BAND);
            long_orbit_holds::<f32>(Integrator::VelocityVerlet, vv, VV_RADIUS_BAND);
        } else {
            long_orbit_holds::<f64>(Integrator::SymplecticEuler, se, SE_RADIUS_BAND);
            long_orbit_holds::<f64>(Integrator::VelocityVerlet, vv, VV_RADIUS_BAND);
        }
    }
}
