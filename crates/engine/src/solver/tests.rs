use super::Order;
use crate::params::kg;
use crate::scenarios::{pendulum, pendulum_gravity};
use crate::{DistanceConstraint, Integrator, Solver, Vec2, World};
use core::num::NonZeroU32;

#[test]
fn alternating_flips_every_pass() {
    let flips: Vec<bool> = (0..4).map(|p| Order::Alternating.reversed(p)).collect();
    assert_eq!(flips, [false, true, false, true]);
    assert!(!Order::Forward.reversed(1) && Order::Reverse.reversed(0));
    assert_eq!(Order::default(), Order::Forward);
}

#[test]
fn sweep_visits_each_constraint_once_in_order() {
    let constraints = ['a', 'b', 'c'];
    let mut lambda = [0, 0, 0];
    let mut seen = String::new();
    Order::Reverse.sweep(0, &constraints, &mut lambda, |c, l| {
        seen.push(*c);
        *l += 1;
    });
    assert_eq!((seen.as_str(), lambda), ("cba", [1, 1, 1]));
}

/// A pin and two bobs on rods, released horizontal: the smallest chain.
fn two_link_chain(solver: Solver, order: Order) -> World<f64> {
    let mut w = World::new(Integrator::SymplecticEuler, NonZeroU32::MIN);
    w.add_force(pendulum_gravity());
    let pin = w.particles.add_static(Vec2::ZERO);
    let a = w.particles.add(Vec2::new(0.5, 0.0), Vec2::ZERO, kg(1.0));
    let b = w.particles.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    for (x, y) in [(pin, a), (a, b)] {
        let rod = DistanceConstraint::between(&w.particles, x, y).unwrap();
        w.add_constraint(rod).unwrap();
    }
    w.set_solver(solver);
    w.set_order(order);
    w
}

#[test]
fn order_changes_a_chain_but_not_a_single_rod() {
    for solver in Solver::ALL {
        let run = |mut w: World<f64>| {
            for _ in 0..30 {
                w.step(1.0 / 60.0);
            }
            w.particles.pos().to_vec()
        };
        let fwd = run(two_link_chain(solver, Order::Forward));
        let rev = run(two_link_chain(solver, Order::Reverse));
        assert_ne!(fwd, rev, "{solver:?}: order is part of Gauss-Seidel");
        // One constraint: nothing to reorder.
        let mut one = pendulum::<f64>(solver, NonZeroU32::MIN).unwrap();
        let mut other = pendulum::<f64>(solver, NonZeroU32::MIN).unwrap();
        other.set_order(Order::Reverse);
        for _ in 0..30 {
            one.step(1.0 / 60.0);
            other.step(1.0 / 60.0);
        }
        assert_eq!(one.particles.pos(), other.particles.pos(), "{solver:?}");
    }
}
