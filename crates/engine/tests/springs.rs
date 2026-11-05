//! Force-based springs (`docs/07-soft-bodies.md`): the spring law, its
//! damping, and where symplectic Euler stops being stable.
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, momentum};
use engine::{Damping, Integrator, Spring, SpringForce, Stiffness, Vec2, World};
use test_support::{kg, nonzero};

const DT: f64 = 1.0 / 60.0;

/// A 1 kg bob on a spring of stiffness `k` and damping `c` to a static
/// anchor, rest length 1 m, released stretched by `stretch` (no gravity).
fn bob_on_spring(k: f64, c: f64, substeps: u32, stretch: f64) -> (World<f64>, SpringForce<f64>) {
    let mut w = World::new(Integrator::SymplecticEuler, nonzero(substeps));
    let anchor = w.add_static(Vec2::ZERO);
    let bob = w.add_particle(Vec2::new(1.0 + stretch, 0.0), Vec2::ZERO, kg(1.0));
    let spring = Spring::with_rest(
        w.particles(),
        anchor,
        bob,
        1.0,
        Stiffness::new(k).unwrap(),
        Damping::new(c).unwrap(),
    )
    .unwrap();
    let force = SpringForce::new(vec![spring]);
    w.add_force(force.clone());
    (w, force)
}

fn energy(w: &World<f64>, f: &SpringForce<f64>) -> f64 {
    kinetic_energy(w.particles()) + f.potential(w.particles())
}

/// Undamped, k = 100 N/m, m = 1 kg: period 2π √(m/k) ≈ 0.628 s, measured
/// from the stretch's upward zero crossings. Measured 0.62857 s (0.04%,
/// mostly the 1/60 s sampling); bound 0.5%.
#[test]
fn spring_period_is_two_pi_root_m_over_k() {
    let (mut w, _) = bob_on_spring(100.0, 0.0, 20, 0.01);
    let (mut first, mut last, mut periods, mut prev) = (None, 0.0, -1.0_f64, 0.01);
    for i in 1..=300_u32 {
        w.step(DT);
        let x = w.particles().pos()[1].x - 1.0;
        if prev < 0.0 && x >= 0.0 {
            let t = f64::from(i) * DT;
            first.get_or_insert(t);
            last = t;
            periods += 1.0;
        }
        prev = x;
    }
    let got = (last - first.unwrap()) / periods;
    let want = 2.0 * std::f64::consts::PI * 0.1;
    assert!((got - want).abs() < 0.005 * want, "{got} vs {want}");
}

/// Damped: energy decays as e^(−c t / m) (amplitude as e^(−c t / 2m)).
/// c = 0.4, m = 1: after 5 s, e^(−2) of the start.
#[test]
fn damped_spring_loses_energy_at_the_analytic_rate() {
    let (mut w, f) = bob_on_spring(100.0, 0.4, 20, 0.05);
    let e0 = energy(&w, &f);
    for _ in 0..300 {
        w.step(DT);
    }
    let ratio = energy(&w, &f) / e0;
    let want = (-2.0_f64).exp();
    // Measured 0.1342 vs 0.1353 (0.8%); bound ~10x.
    assert!((ratio - want).abs() < 0.08 * want, "{ratio} vs {want}");
}

/// Two free bodies on a damped spring: internal forces only, so momentum
/// is conserved to rounding.
#[test]
fn spring_conserves_momentum() {
    let mut w = World::<f64>::new(Integrator::SymplecticEuler, nonzero(4));
    let a = w.add_particle(Vec2::ZERO, Vec2::new(0.3, -1.0), kg(1.0));
    let b = w.add_particle(Vec2::new(1.2, 0.0), Vec2::new(-0.1, 2.0), kg(2.0));
    let s = Spring::with_rest(
        w.particles(),
        a,
        b,
        1.0,
        Stiffness::new(50.0).unwrap(),
        Damping::new(0.5).unwrap(),
    )
    .unwrap();
    w.add_force(SpringForce::new(vec![s]));
    let p0 = momentum(w.particles());
    for _ in 0..600 {
        w.step(DT);
    }
    let drift = (momentum(w.particles()) - p0).length();
    // Measured 1.3e-14; bound ~10x.
    assert!(drift < 2e-13, "{drift}");
}

/// Max energy over 10 s relative to the start, for stiffness `k`.
fn energy_growth(k: f64) -> f64 {
    let (mut w, f) = bob_on_spring(k, 0.0, 1, 0.01);
    let e0 = energy(&w, &f);
    let mut worst = 1.0_f64;
    for _ in 0..600 {
        w.step(DT);
        worst = worst.max(energy(&w, &f) / e0);
    }
    worst
}

/// `explicit_spring_diverges_above_critical_stiffness`
/// (`docs/07-soft-bodies.md`): symplectic Euler on one spring is bounded
/// exactly while `ω h ≤ 2`, so `k_crit = 4 m / h²` (14 400 N/m here: 1 kg,
/// one 1/60 s substep). Measured max energy over 10 s, relative to the
/// start: 0.99 `k_crit` 2.0e2, 1.01 `k_crit` 5.9e71: sharp.
///
/// Below the threshold the *true* energy still swings (3x at 0.5 `k_crit`,
/// 19x at 0.9, 200x at 0.99): symplectic Euler conserves a nearby "shadow"
/// energy, and near `ω h = 2` the two drift far apart. Bounded is not
/// accurate. Bounds: below 1e3 at 0.9 (bounded), above 1e6 at 1.1.
#[test]
fn explicit_spring_diverges_above_critical_stiffness() {
    let k_crit = 4.0 / (DT * DT);
    let below = energy_growth(0.9 * k_crit);
    let above = energy_growth(1.1 * k_crit);
    assert!(below < 1e3, "0.9 k_crit: {below}");
    assert!(above > 1e6, "1.1 k_crit: {above}");
}
