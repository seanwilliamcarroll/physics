//! Contacts in the solvers (`docs/08-collision.md`): analytic collisions,
//! momentum, resting, bouncing. Each test runs every solver that handles
//! contacts.
#![cfg(test)]

use engine::diagnostics::{kinetic_energy, momentum};
use engine::scenarios::pendulum_gravity;
use engine::{Integrator, Radius, Restitution, Solver, UnitVec2, Vec2, Wall, World};
use test_support::{kg, nonzero, time_step};

const SOLVERS: [Solver; 2] = Solver::ALL;
const DT: f64 = 1.0 / 60.0;
const SUBSTEPS: u32 = 10;
const BALL_RADIUS: f64 = 0.1;

fn contact_world(solver: Solver, restitution: f64) -> World<f64> {
    let mut world = World::new(Integrator::SymplecticEuler, nonzero(SUBSTEPS));
    world.set_solver(solver);
    world.set_restitution(Restitution::new(restitution).unwrap());
    world
}

fn add_ball(world: &mut World<f64>, position: (f64, f64), velocity: (f64, f64), mass: f64) {
    world.add_circle(
        Vec2::new(position.0, position.1),
        Vec2::new(velocity.0, velocity.1),
        kg(mass),
        Radius::new(BALL_RADIUS).unwrap(),
    );
}

/// 1 kg at +1 m/s meets 3 kg at −1 m/s, 1 m apart, no gravity; returns
/// both velocities after 1 s (long after they meet, at ~0.4 s).
fn head_on(solver: Solver, restitution: f64) -> (Vec2<f64>, Vec2<f64>) {
    let mut world = contact_world(solver, restitution);
    add_ball(&mut world, (-0.5, 0.0), (1.0, 0.0), 1.0);
    add_ball(&mut world, (0.5, 0.0), (-1.0, 0.0), 3.0);
    for _ in 0..60 {
        world.step(time_step(DT));
    }
    (world.particles().vel()[0], world.particles().vel()[1])
}

/// Velocity tolerance for one collision, m/s.
const HEAD_ON_TOL: f64 = 1e-9;

#[test]
fn elastic_head_on_matches_the_analytic_velocities() {
    // v1' = ((m1 − e m2) v1 + (1 + e) m2 v2) / (m1 + m2) = −2, v2' = 0.
    for solver in SOLVERS {
        let (light_velocity, heavy_velocity) = head_on(solver, 1.0);
        println!("{solver:?}: v1 {light_velocity:?}, v2 {heavy_velocity:?}");
        assert!(
            (light_velocity - Vec2::new(-2.0, 0.0)).length() < HEAD_ON_TOL,
            "{solver:?}: {light_velocity:?}"
        );
        assert!(
            heavy_velocity.length() < HEAD_ON_TOL,
            "{solver:?}: {heavy_velocity:?}"
        );
    }
}

#[test]
fn inelastic_head_on_moves_together() {
    // e = 0: both at the center-of-mass velocity, (1 − 3) / 4 = −0.5.
    for solver in SOLVERS {
        let (light_velocity, heavy_velocity) = head_on(solver, 0.0);
        println!("{solver:?}: v1 {light_velocity:?}, v2 {heavy_velocity:?}");
        for velocity in [light_velocity, heavy_velocity] {
            assert!(
                (velocity - Vec2::new(-0.5, 0.0)).length() < HEAD_ON_TOL,
                "{solver:?}: {velocity:?}"
            );
        }
    }
}

#[test]
fn momentum_is_conserved_through_a_pileup() {
    // Six balls converging on a cluster, glancing, e = 0.7, no gravity or
    // walls: total momentum fixed to rounding.
    for solver in SOLVERS {
        let mut world = contact_world(solver, 0.7);
        for (position, velocity, mass) in PILEUP {
            add_ball(&mut world, position, velocity, mass);
        }
        let start_momentum = momentum(world.particles());
        for _ in 0..120 {
            world.step(time_step(DT));
        }
        let drift = (momentum(world.particles()) - start_momentum).length();
        println!("{solver:?}: momentum drift {drift:e}");
        assert!(drift < 1e-12, "{solver:?}: {drift}");
    }
}

/// A floor at y = 0 and a ball dropped from `height` (its bottom), with
/// gravity; returns (highest bounce after the first impact, deepest
/// penetration seen, kinetic energy at the end).
fn drop(solver: Solver, restitution: f64, height: f64, steps: u32) -> (f64, f64, f64) {
    let mut world = contact_world(solver, restitution);
    world.add_force(pendulum_gravity());
    world.add_wall(Wall::through(Vec2::ZERO, UnitVec2::Y));
    add_ball(&mut world, (0.0, height + BALL_RADIUS), (0.0, 0.0), 1.0);
    let (mut deepest, mut peak, mut bounced) = (0.0_f64, 0.0_f64, false);
    let mut previous_vy = 0.0;
    for _ in 0..steps {
        world.step(time_step(DT));
        let (y, vy) = (
            world.particles().pos()[0].y - BALL_RADIUS,
            world.particles().vel()[0].y,
        );
        deepest = deepest.max(-y);
        bounced |= previous_vy < 0.0 && vy > 0.0;
        if bounced {
            peak = peak.max(y);
        }
        previous_vy = vy;
    }
    (peak, deepest, kinetic_energy(world.particles()))
}

#[test]
fn a_dropped_ball_comes_to_rest_on_the_floor() {
    for solver in SOLVERS {
        let (_, deepest, final_energy) = drop(solver, 0.0, 0.5, 120);
        println!("{solver:?}: deepest {deepest:e} m, final KE {final_energy:e} J");
        assert!(deepest < 1e-3, "{solver:?}: sank {deepest} m");
        assert!(
            final_energy < 1e-9,
            "{solver:?}: still moving, {final_energy} J"
        );
    }
}

#[test]
fn a_bounce_reaches_e_squared_of_the_drop() {
    // Height after a bounce: e² h (speed scales by e, height by its square).
    for solver in SOLVERS {
        for restitution in [1.0, 0.5] {
            let (peak, deepest, _) = drop(solver, restitution, 0.5, 90);
            let expected = restitution * restitution * 0.5;
            println!(
                "{solver:?} e = {restitution}: peak {peak:.5} m (want {expected}), deepest {deepest:e}"
            );
            assert!(
                (peak - expected).abs() < 0.02 * 0.5,
                "{solver:?} e = {restitution}: {peak}"
            );
        }
    }
}

/// A ball: (position, velocity, mass).
type BallSpec = ((f64, f64), (f64, f64), f64);

/// The pileup's balls.
const PILEUP: [BallSpec; 6] = [
    ((-1.0, 0.03), (2.0, 0.0), 1.0),
    ((0.0, 0.0), (0.0, 0.0), 2.0),
    ((0.21, 0.1), (0.0, 0.0), 0.5),
    ((0.25, -0.12), (0.0, 0.0), 1.5),
    ((0.6, 0.6), (-1.0, -1.0), 1.0),
    ((1.0, -0.05), (-1.5, 0.1), 0.8),
];

/// Kinetic energy through the pileup at `restitution`: (start, end,
/// largest step-to-step rise).
fn pileup_energy(solver: Solver, restitution: f64) -> (f64, f64, f64) {
    let mut world = contact_world(solver, restitution);
    for (position, velocity, mass) in PILEUP {
        add_ball(&mut world, position, velocity, mass);
    }
    let start_energy = kinetic_energy(world.particles());
    let (mut previous_energy, mut rise) = (start_energy, 0.0_f64);
    for _ in 0..120 {
        world.step(time_step(DT));
        let energy = kinetic_energy(world.particles());
        rise = rise.max(energy - previous_energy);
        previous_energy = energy;
    }
    (start_energy, previous_energy, rise)
}

#[test]
fn collisions_never_add_energy() {
    for solver in SOLVERS {
        for restitution in [1.0, 0.7, 0.0] {
            let (start_energy, end_energy, rise) = pileup_energy(solver, restitution);
            println!(
                "{solver:?} e = {restitution}: KE {start_energy:.6} -> {end_energy:.6} J, largest rise {rise:e} J"
            );
            assert!(
                rise < 1e-12,
                "{solver:?} e = {restitution}: gained {rise} J in a step"
            );
        }
    }
}

/// Three balls stacked on a floor, released touching, with gravity:
/// deepest overlap (between balls or with the floor) over 2 s, and the
/// final kinetic energy.
fn stack(solver: Solver) -> (f64, f64) {
    let mut world = contact_world(solver, 0.0);
    world.add_force(pendulum_gravity());
    world.add_wall(Wall::through(Vec2::ZERO, UnitVec2::Y));
    for level in 0..3 {
        add_ball(
            &mut world,
            (0.0, BALL_RADIUS + 2.0 * BALL_RADIUS * f64::from(level)),
            (0.0, 0.0),
            1.0,
        );
    }
    let mut deepest = 0.0_f64;
    for _ in 0..120 {
        world.step(time_step(DT));
        let y = |index: usize| world.particles().pos()[index].y;
        deepest = deepest.max(BALL_RADIUS - y(0));
        deepest = deepest.max(2.0 * BALL_RADIUS - (y(1) - y(0)));
        deepest = deepest.max(2.0 * BALL_RADIUS - (y(2) - y(1)));
    }
    (deepest, kinetic_energy(world.particles()))
}

#[test]
fn a_stack_rests_without_sinking() {
    for solver in SOLVERS {
        let (deepest, final_energy) = stack(solver);
        println!("{solver:?}: deepest overlap {deepest:e} m, final KE {final_energy:e} J");
        assert!(deepest < 1e-3, "{solver:?}: {deepest} m");
        assert!(final_energy < 1e-9, "{solver:?}: {final_energy} J");
    }
}

// Edge cases (`docs/numerical-testing-checklist.md` §2.6 and §2.8): speeds
// that cross many radii per substep, and extreme mass ratios.

/// A ball fired at `speed` m/s (no gravity) at a wall 1 m away, for 1 s:
/// whether it ever ended a step inside the wall, and its final velocity.
/// Walls are half-planes, so a ball can't get *through* one; the risk at
/// many radii per substep is a missed bounce, leaving it inside.
fn bullet(solver: Solver, speed: f64) -> (bool, Vec2<f64>) {
    let mut world = contact_world(solver, 1.0);
    // A wall at x = 1, free on the left (its normal is −x).
    world.add_wall(Wall::through(Vec2::new(1.0, 0.0), -UnitVec2::X));
    add_ball(&mut world, (0.0, 0.0), (speed, 0.0), 1.0);
    let mut inside = false;
    for _ in 0..60 {
        world.step(time_step(DT));
        inside |= world.particles().pos()[0].x + BALL_RADIUS > 1.0 + 1e-9;
    }
    (inside, world.particles().vel()[0])
}

#[test]
fn a_bullet_bounces_off_a_wall() {
    // 1 000 m/s is 1.7 m a substep (17 radii); 100 000 m/s, 170 m.
    // Measured: −speed to 2e-14 (XPBD) and exactly (impulse).
    for solver in SOLVERS {
        for speed in [1e3, 1e5] {
            let (inside, velocity) = bullet(solver, speed);
            assert!(
                !inside,
                "{solver:?} at {speed} m/s ended a step inside the wall"
            );
            assert!(
                (velocity.x + speed).abs() < 1e-12 * speed && velocity.y == 0.0,
                "{solver:?} at {speed}: {velocity:?}"
            );
        }
    }
}

#[test]
fn fast_circles_dont_pass_through_each_other() {
    // ±1 000 m/s, 20 m apart: they close 33 m a frame. The speculative
    // contact (a gap counts if it can close this substep) stops them.
    for solver in SOLVERS {
        let mut world = contact_world(solver, 1.0);
        add_ball(&mut world, (-10.0, 0.0), (1e3, 0.0), 1.0);
        add_ball(&mut world, (10.0, 0.0), (-1e3, 0.0), 1.0);
        for _ in 0..60 {
            world.step(time_step(DT));
            let positions = world.particles().pos();
            assert!(
                positions[0].x < positions[1].x,
                "{solver:?}: they passed through"
            );
        }
        // Equal masses, elastic: they swap velocities.
        let velocities = world.particles().vel();
        assert!(
            (velocities[0].x + 1e3).abs() < 1e-9 && (velocities[1].x - 1e3).abs() < 1e-9,
            "{solver:?}: {velocities:?}"
        );
    }
}

#[test]
fn a_one_to_a_million_collision_is_exact_and_finite() {
    // 1 kg at 1 m/s on 1e6 kg at rest, elastic:
    // v1' = (m1 − m2)/(m1 + m2), v2' = 2 m1 / (m1 + m2).
    // Measured: both within 1e-8 (relative); momentum drift 3.4e-8 (XPBD),
    // 1e-16 (impulse); bounds ~30x.
    let (light_mass, heavy_mass) = (1.0, 1e6);
    let (expected_light, expected_heavy) = (
        (light_mass - heavy_mass) / (light_mass + heavy_mass),
        2.0 * light_mass / (light_mass + heavy_mass),
    );
    for solver in SOLVERS {
        let mut world = contact_world(solver, 1.0);
        add_ball(&mut world, (-0.5, 0.0), (1.0, 0.0), light_mass);
        add_ball(&mut world, (0.5, 0.0), (0.0, 0.0), heavy_mass);
        let start_momentum = momentum(world.particles());
        for _ in 0..60 {
            world.step(time_step(DT));
        }
        let velocities = world.particles().vel();
        assert!(
            velocities
                .iter()
                .all(|velocity| velocity.x.is_finite() && velocity.y.is_finite())
        );
        assert!(
            (velocities[0].x / expected_light - 1.0).abs() < 3e-7,
            "{solver:?}: light {}",
            velocities[0].x
        );
        assert!(
            (velocities[1].x / expected_heavy - 1.0).abs() < 3e-7,
            "{solver:?}: heavy {}",
            velocities[1].x
        );
        assert!(
            (momentum(world.particles()) - start_momentum).length() < 1e-6,
            "{solver:?}: momentum"
        );
    }
}
