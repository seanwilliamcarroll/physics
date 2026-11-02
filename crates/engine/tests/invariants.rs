//! Conservation and correctness invariants (`docs/04-testing.md`, phase 1).
// Marks the whole file as test code, so clippy's `allow-*-in-tests` settings
// cover the generic test bodies and `common` too (see docs/lint-policy.md).
#![cfg(test)]

#[macro_use]
mod common;

use common::{Tol, bits, s, v};
use engine::diagnostics::{center_of_mass, momentum};
use engine::scenarios::cluster;
use engine::{ConfigError, Integrator, Particles, Scalar, UniformGravity, Vec2, World};

const G: f64 = -9.81;

/// One dynamic particle under uniform gravity, `substeps` per step.
fn falling_world<S: Tol>(substeps: u32, x0: Vec2<S>, v0: Vec2<S>) -> World<S> {
    let mut w = World::new(Integrator::SymplecticEuler, substeps).unwrap();
    w.add_force(UniformGravity::new(v(0.0, G)));
    w.particles.add(x0, v0, s(1.0));
    w
}

/// Symplectic Euler (v first, then x) under constant `g` has an exact
/// closed form. After n steps of size h, with t = n h:
///
/// ```text
/// v_n = v0 + g t
/// x_n = x0 + h (v_1 + ... + v_n) = x0 + v0 t + ½ g t (t + h)
/// ```
///
/// That is the analytic `x0 + v0 t + ½ g t²` plus an error of exactly
/// ½ g h t: first order in h. So we can assert the integrator to rounding
/// error, not to a loose tolerance.
fn free_fall_matches_discrete_symplectic_euler<S: Tol>() {
    let (x0, v0) = ((0.0, 10.0), (2.0, 5.0));
    let (h, n) = (1.0 / 64.0, 64); // binary-exact h, t = 1 s
    let mut w = falling_world::<S>(1, v(x0.0, x0.1), v(v0.0, v0.1));
    for _ in 0..n {
        w.step(s(h));
    }

    let t = h * f64::from(n);
    let x = w.particles.pos()[0];
    let vel = w.particles.vel()[0];
    let expect_y = x0.1 + v0.1 * t + 0.5 * G * t * (t + h);
    let expect_x = x0.0 + v0.0 * t;
    assert!(
        (x.y.to_f64() - expect_y).abs() < S::POS_ABS,
        "y = {x:?}, want {expect_y}"
    );
    assert!(
        (x.x.to_f64() - expect_x).abs() < S::POS_ABS,
        "x = {x:?}, want {expect_x}"
    );
    assert!((vel.y.to_f64() - (v0.1 + G * t)).abs() < S::POS_ABS);
}
for_each_scalar!(free_fall_matches_discrete_symplectic_euler);

/// The integrator's known error: halving h halves the error against the
/// analytic parabola (first-order method).
fn free_fall_error_is_first_order_in_dt<S: Tol>() {
    let error_at = |h: f64, n: u32| {
        let mut w = falling_world::<S>(1, v(0.0, 0.0), v(0.0, 0.0));
        for _ in 0..n {
            w.step(s(h));
        }
        let t = h * f64::from(n);
        w.particles.pos()[0].y.to_f64() - 0.5 * G * t * t
    };
    let coarse = error_at(1.0 / 32.0, 32);
    let fine = error_at(1.0 / 64.0, 64);
    let ratio = coarse / fine;
    assert!((ratio - 2.0).abs() < 0.01, "error ratio {ratio}, want 2");
}
for_each_scalar!(free_fall_error_is_first_order_in_dt);

fn static_particle_is_bit_identical<S: Tol>() {
    let mut w = falling_world::<S>(4, v(0.0, 0.0), v(1.0, 1.0));
    let pin = v::<S>(1.5, -2.25);
    w.particles.add_static(pin);
    for _ in 0..1000 {
        w.step(s(1.0 / 60.0));
    }
    assert_eq!(bits(w.particles.pos()[1]), bits(pin));
    assert_eq!(bits(w.particles.vel()[1]), bits(Vec2::<S>::ZERO));
}
for_each_scalar!(static_particle_is_bit_identical);

fn zero_dt_leaves_state_unchanged<S: Tol>() {
    let mut w = falling_world::<S>(4, v(1.0, 2.0), v(3.0, 4.0));
    let before = (w.particles.pos().to_vec(), w.particles.vel().to_vec());
    for _ in 0..10 {
        w.step(S::ZERO);
    }
    assert_eq!(w.particles.pos(), before.0);
    assert_eq!(w.particles.vel(), before.1);
}
for_each_scalar!(zero_dt_leaves_state_unchanged);

/// `substeps = k` with step `dt` must equal k steps of `dt / k`, bit for bit.
/// k = 3 on purpose: dividing by a power of two is exact and would hide a
/// mismatch in how h is computed. The test computes h exactly as `World`
/// does (`dt / k` in S), not `from_f64(dt / 3.0)`, which rounds once instead
/// of twice for f32.
fn substeps_equal_repeated_smaller_steps<S: Tol>() {
    let k = 3;
    let dt = s::<S>(1.0 / 60.0);
    let h = dt / s(f64::from(k));
    let mut a = falling_world::<S>(k, v(0.0, 0.0), v(2.0, 5.0));
    let mut b = falling_world::<S>(1, v(0.0, 0.0), v(2.0, 5.0));
    for _ in 0..100 {
        a.step(dt);
        for _ in 0..k {
            b.step(h);
        }
    }
    assert_eq!(bits(a.particles.pos()[0]), bits(b.particles.pos()[0]));
    assert_eq!(bits(a.particles.vel()[0]), bits(b.particles.vel()[0]));
}
for_each_scalar!(substeps_equal_repeated_smaller_steps);

fn zero_substeps_is_rejected<S: Tol>() {
    let w = World::<S>::new(Integrator::SymplecticEuler, 0);
    assert!(matches!(w, Err(ConfigError::ZeroSubsteps)));
}
for_each_scalar!(zero_substeps_is_rejected);

const CLUSTER_N: usize = 16;
const CLUSTER_STEPS: u32 = 1000;
const STEP: f64 = 1.0 / 60.0;

/// `Σ m |v|`: the momentum a cluster *could* have if every body moved the
/// same way. Momentum error is judged relative to it.
fn momentum_scale<S: Scalar>(p: &Particles<S>) -> f64 {
    p.vel()
        .iter()
        .zip(p.inv_mass())
        .filter(|&(_, &w)| w != S::ZERO)
        .map(|(v, w)| v.length().to_f64() / w.to_f64())
        .sum()
}

/// `docs/04-testing.md`: pairwise forces are equal and opposite, so the
/// total momentum of an isolated cluster can only change by rounding.
fn pairwise_gravity_conserves_momentum<S: Tol>() {
    let mut w = cluster::<S>(CLUSTER_N, 1).unwrap();
    let p0 = momentum(&w.particles);
    for _ in 0..CLUSTER_STEPS {
        w.step(s(STEP));
    }
    let drift = (momentum(&w.particles) - p0).length().to_f64();
    let scale = momentum_scale(&w.particles);
    assert!(
        drift <= S::MOMENTUM_REL * scale,
        "drift {drift:e} vs scale {scale:e}"
    );
}
for_each_scalar!(pairwise_gravity_conserves_momentum);

/// With momentum conserved, the center of mass moves in a straight line at
/// `P / M`, however violently the bodies interact.
fn center_of_mass_moves_at_constant_velocity<S: Tol>() {
    let mut w = cluster::<S>(CLUSTER_N, 1).unwrap();
    let total_mass: f64 = w
        .particles
        .inv_mass()
        .iter()
        .map(|w| 1.0 / w.to_f64())
        .sum();
    let p0 = momentum(&w.particles);
    let com_velocity = (p0.x.to_f64() / total_mass, p0.y.to_f64() / total_mass);
    let c0 = center_of_mass(&w.particles).unwrap();
    for _ in 0..CLUSTER_STEPS {
        w.step(s(STEP));
    }
    let t = STEP * f64::from(CLUSTER_STEPS);
    let c1 = center_of_mass(&w.particles).unwrap();
    let expect = (
        c0.x.to_f64() + com_velocity.0 * t,
        c0.y.to_f64() + com_velocity.1 * t,
    );
    let err = (c1.x.to_f64() - expect.0).hypot(c1.y.to_f64() - expect.1);
    assert!(err <= S::COM_ABS, "COM off by {err:e} m");
}
for_each_scalar!(center_of_mass_moves_at_constant_velocity);
