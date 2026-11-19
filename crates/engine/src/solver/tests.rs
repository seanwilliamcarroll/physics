use super::Order;
use crate::params::kg;
use crate::scenarios::{pendulum, pendulum_gravity};
use crate::test_util::time_step;
use crate::{DistanceConstraint, Integrator, Solver, Vec2, World};
use core::num::NonZeroU32;

#[test]
fn alternating_flips_every_pass() {
    let flips: Vec<bool> = (0..4)
        .map(|pass| Order::Alternating.reversed(pass))
        .collect();
    assert_eq!(flips, [false, true, false, true]);
    assert!(!Order::Forward.reversed(1) && Order::Reverse.reversed(0));
    assert_eq!(Order::default(), Order::Forward);
}

#[test]
fn sweep_visits_each_constraint_once_in_order() {
    let constraints = ['a', 'b', 'c'];
    let mut lambdas = [0, 0, 0];
    let mut seen = String::new();
    Order::Reverse.sweep(0, &constraints, &mut lambdas, |constraint, lambda| {
        seen.push(*constraint);
        *lambda += 1;
    });
    assert_eq!((seen.as_str(), lambdas), ("cba", [1, 1, 1]));
}

fn two_link_chain(solver: Solver, order: Order) -> World<f64> {
    let mut world = World::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    world.add_force(pendulum_gravity());
    let pin = world.particles.add_static(Vec2::ZERO);
    let near = world
        .particles
        .add(Vec2::new(0.5, 0.0), Vec2::ZERO, kg(1.0));
    let far = world
        .particles
        .add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    for (from, to) in [(pin.id(), near), (near, far)] {
        let rod = DistanceConstraint::between(&world.particles, from, to).unwrap();
        world.add_constraint(rod).unwrap();
    }
    world.set_solver(solver);
    world.set_order(order);
    world
}

#[test]
fn order_changes_a_chain_but_not_a_single_rod() {
    for solver in Solver::ALL {
        let run = |mut world: World<f64>| {
            for _ in 0..30 {
                world.step(time_step(1.0 / 60.0));
            }
            world.particles.positions().to_vec()
        };
        let forward = run(two_link_chain(solver, Order::Forward));
        let reverse = run(two_link_chain(solver, Order::Reverse));
        assert_ne!(
            forward, reverse,
            "{solver:?}: order is part of Gauss-Seidel"
        );
        let mut one = pendulum::<f64>(solver, NonZeroU32::MIN).unwrap();
        let mut other = pendulum::<f64>(solver, NonZeroU32::MIN).unwrap();
        other.set_order(Order::Reverse);
        for _ in 0..30 {
            one.step(time_step(1.0 / 60.0));
            other.step(time_step(1.0 / 60.0));
        }
        assert_eq!(
            one.particles.positions(),
            other.particles.positions(),
            "{solver:?}"
        );
    }
}

fn soft_rod(solver: Solver, damping: f64, iterations: u32) -> (Vec2<f64>, Vec2<f64>) {
    use crate::{Compliance, Damping};
    let mut world = World::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    world.add_force(pendulum_gravity());
    let pin = world.particles.add_static(Vec2::ZERO);
    let bob = world
        .particles
        .add(Vec2::new(1.2, 0.0), Vec2::ZERO, kg(1.0));
    let rod = DistanceConstraint::with_length(
        &world.particles,
        pin.id(),
        bob,
        1.0,
        Compliance::new(1e-3).unwrap(),
    )
    .unwrap()
    .with_damping(Damping::new(damping).unwrap());
    world.add_constraint(rod).unwrap();
    world.set_solver(solver);
    world.set_iterations(NonZeroU32::new(iterations).unwrap());
    world.step(time_step(1.0 / 60.0));
    let index = bob.index();
    (
        world.particles.positions()[index],
        world.particles.velocities()[index],
    )
}

#[test]
fn one_soft_rod_converges_in_one_pass() {
    // A single constraint is solved exactly by one Gauss-Seidel pass: the
    // α̃λ term (or its impulse counterpart) cancels what's left, so more
    // passes change nothing. Needs more than one pass: with one, λ starts at 0
    // and the term's sign and λ's accumulation go untested.
    for solver in Solver::ALL {
        for damping in [0.0, 0.5] {
            let (position_1, velocity_1) = soft_rod(solver, damping, 1);
            let (position_5, velocity_5) = soft_rod(solver, damping, 5);
            let off = (position_5 - position_1).length() + (velocity_5 - velocity_1).length();
            assert!(
                off < 1e-12,
                "{solver:?}, damping = {damping}: 5 passes moved it {off:e}"
            );
            assert!(
                (position_1 - Vec2::new(1.2, 0.0)).length() > 1e-3,
                "{solver:?}: the rod pulled"
            );
        }
    }
}
