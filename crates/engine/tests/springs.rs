//! Force-based springs (`docs/07-soft-bodies.md`): the spring law, its
//! damping, and where symplectic Euler stops being stable.
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, momentum};
use engine::{Damping, Integrator, Spring, SpringForce, Stiffness, Vec2, World};
use math::convert::f64_to_usize;
use test_support::{kg, nonzero, time_step};

const DT: f64 = 1.0 / 60.0;

fn bob_on_spring(
    stiffness: f64,
    damping: f64,
    substeps: u32,
    stretch: f64,
) -> (World<f64>, SpringForce<f64>) {
    let mut world = World::new(Integrator::SymplecticEuler, nonzero(substeps));
    let anchor = world.add_static(Vec2::ZERO);
    let bob = world.add_particle(Vec2::new(1.0 + stretch, 0.0), Vec2::ZERO, kg(1.0));
    let spring = Spring::with_rest(
        world.particles(),
        anchor,
        bob,
        1.0,
        Stiffness::new(stiffness).unwrap(),
        Damping::new(damping).unwrap(),
    )
    .unwrap();
    let force = SpringForce::new(vec![spring]);
    world.add_force(force.clone());
    (world, force)
}

fn energy(world: &World<f64>, force: &SpringForce<f64>) -> f64 {
    kinetic_energy(world.particles()) + force.potential(world.particles())
}

/// Undamped, k = 100 N/m, m = 1 kg: period 2π √(m/k) ≈ 0.628 s, measured
/// from the stretch's upward zero crossings. Measured 0.62857 s (0.04%,
/// mostly the 1/60 s sampling); bound 0.5%.
#[test]
fn spring_period_is_two_pi_root_m_over_k() {
    let (mut world, _) = bob_on_spring(100.0, 0.0, 20, 0.01);
    let (mut first_crossing, mut last_crossing, mut periods, mut previous_stretch) =
        (None, 0.0, -1.0_f64, 0.01);
    for step in 1..=300_u32 {
        world.step(time_step(DT));
        let stretch = world.particles().positions()[1].x - 1.0;
        if previous_stretch < 0.0 && stretch >= 0.0 {
            let time = f64::from(step) * DT;
            first_crossing.get_or_insert(time);
            last_crossing = time;
            periods += 1.0;
        }
        previous_stretch = stretch;
    }
    let measured = (last_crossing - first_crossing.unwrap()) / periods;
    let expected = 2.0 * std::f64::consts::PI * 0.1;
    assert!(
        (measured - expected).abs() < 0.005 * expected,
        "{measured} vs {expected}"
    );
}

/// Damped: energy decays as e^(−c t / m) (amplitude as e^(−c t / 2m)).
/// c = 0.4, m = 1: after 5 s, e^(−2) of the start.
#[test]
fn damped_spring_loses_energy_at_the_analytic_rate() {
    let (mut world, force) = bob_on_spring(100.0, 0.4, 20, 0.05);
    let start_energy = energy(&world, &force);
    for _ in 0..300 {
        world.step(time_step(DT));
    }
    let ratio = energy(&world, &force) / start_energy;
    let expected = (-2.0_f64).exp();
    // Measured 0.1342 vs 0.1353 (0.8%); bound ~10x.
    assert!(
        (ratio - expected).abs() < 0.08 * expected,
        "{ratio} vs {expected}"
    );
}

/// Two free bodies on a damped spring: internal forces only, so momentum
/// is conserved to rounding.
#[test]
fn spring_conserves_momentum() {
    let mut world = World::<f64>::new(Integrator::SymplecticEuler, nonzero(4));
    let light = world.add_particle(Vec2::ZERO, Vec2::new(0.3, -1.0), kg(1.0));
    let heavy = world.add_particle(Vec2::new(1.2, 0.0), Vec2::new(-0.1, 2.0), kg(2.0));
    let spring = Spring::with_rest(
        world.particles(),
        light,
        heavy,
        1.0,
        Stiffness::new(50.0).unwrap(),
        Damping::new(0.5).unwrap(),
    )
    .unwrap();
    world.add_force(SpringForce::new(vec![spring]));
    let start_momentum = momentum(world.particles());
    for _ in 0..600 {
        world.step(time_step(DT));
    }
    let drift = (momentum(world.particles()) - start_momentum).length();
    // Measured 1.3e-14; bound ~10x.
    assert!(drift < 2e-13, "{drift}");
}

fn energy_growth(stiffness: f64) -> f64 {
    let (mut world, force) = bob_on_spring(stiffness, 0.0, 1, 0.01);
    let start_energy = energy(&world, &force);
    let mut worst = 1.0_f64;
    for _ in 0..600 {
        world.step(time_step(DT));
        worst = worst.max(energy(&world, &force) / start_energy);
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
    let critical_stiffness = 4.0 / (DT * DT);
    let below = energy_growth(0.9 * critical_stiffness);
    let above = energy_growth(1.1 * critical_stiffness);
    assert!(below < 1e3, "0.9 k_crit: {below}");
    assert!(above > 1e6, "1.1 k_crit: {above}");
}

/// Velocity Verlet with a **damped** spring stays second order: its second
/// force evaluation sees the predicted velocity `v + a h`, so the damper's
/// end-of-step force is off by `O(h²)`, not `O(h)`. A bob on k = 4 N/m,
/// c = 0.5 N·s/m, released 1 m stretched, against the exact underdamped
/// solution at t = 5 s, at three step sizes. Measured: the error quarters
/// with each halving (ratios 4.0); with the old velocity it only halved
/// (2.0), 100× less accurate at h = 1/60.
#[test]
fn verlet_is_second_order_with_damping() {
    const STIFFNESS: f64 = 4.0;
    const DAMPING: f64 = 0.5;
    const DURATION: f64 = 5.0;
    let exact = {
        let natural_omega = STIFFNESS.sqrt();
        let damped_omega = natural_omega * (1.0 - (DAMPING / (2.0 * natural_omega)).powi(2)).sqrt();
        (-DAMPING / 2.0 * DURATION).exp()
            * ((damped_omega * DURATION).cos()
                + DAMPING / 2.0 / damped_omega * (damped_omega * DURATION).sin())
    };
    let error = |substeps: u32| {
        let (mut world, _) = bob_on_spring(STIFFNESS, DAMPING, substeps, 1.0);
        world.set_integrator(Integrator::VelocityVerlet);
        for _ in 0..f64_to_usize(DURATION / DT).unwrap() {
            world.step(time_step(DT));
        }
        (world.particles().positions()[1].x - 1.0 - exact).abs()
    };
    let (error_1, error_2, error_4) = (error(1), error(2), error(4));
    let (ratio_1, ratio_2) = (error_1 / error_2, error_2 / error_4);
    println!("errors {error_1:.3e} {error_2:.3e} {error_4:.3e}; ratios {ratio_1:.2} {ratio_2:.2}");
    assert!(
        ratio_1 > SECOND_ORDER_RATIO && ratio_2 > SECOND_ORDER_RATIO,
        "{ratio_1} {ratio_2}"
    );
}

/// Halving h divides a second-order error by 4 and a first-order one by 2;
/// 3.5 tells them apart with room for higher-order terms.
const SECOND_ORDER_RATIO: f64 = 3.5;
