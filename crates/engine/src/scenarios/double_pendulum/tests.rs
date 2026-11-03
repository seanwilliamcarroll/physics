use core::num::NonZeroU32;

use super::{DOUBLE_PENDULUM_LENGTH, DOUBLE_PENDULUM_MASS, double_pendulum};
use crate::{Constraint, Solver, Vec2};

#[test]
fn pin_and_two_rods_level_with_it() {
    let w = double_pendulum::<f64>(Solver::Impulse, NonZeroU32::MIN, 0.0).unwrap();
    let p = &w.particles;
    let l = DOUBLE_PENDULUM_LENGTH;
    assert_eq!(
        p.pos(),
        [Vec2::ZERO, Vec2::new(l, 0.0), Vec2::new(2.0 * l, 0.0)]
    );
    assert!(p.vel().iter().all(|&v| v == Vec2::ZERO));
    let w_bob = 1.0 / DOUBLE_PENDULUM_MASS;
    assert_eq!(p.inv_mass(), [0.0, w_bob, w_bob]);
    let rods = w.constraints();
    assert_eq!(rods.len(), 2);
    for (i, rod) in rods.iter().enumerate() {
        let [a, b] = rod.bodies();
        assert_eq!((a.index(), b.index()), (i, i + 1));
        assert!((rod.length() - l).abs() <= 4.0 * f64::EPSILON * l);
    }
    assert_eq!(w.solver(), Solver::Impulse);
}

#[test]
fn offset_moves_only_the_tip_and_only_in_y() {
    let base = double_pendulum::<f64>(Solver::Xpbd, NonZeroU32::MIN, 0.0).unwrap();
    let nudged = double_pendulum::<f64>(Solver::Xpbd, NonZeroU32::MIN, 1e-9).unwrap();
    let (a, b) = (base.particles.pos(), nudged.particles.pos());
    assert_eq!(a[..2], b[..2]);
    assert_eq!(b[2], a[2] + Vec2::new(0.0, 1e-9));
}

#[test]
fn substeps_are_the_ones_given() {
    let w = double_pendulum::<f32>(Solver::Xpbd, NonZeroU32::new(20).unwrap(), 0.0).unwrap();
    assert_eq!(w.substeps(), 20);
}
