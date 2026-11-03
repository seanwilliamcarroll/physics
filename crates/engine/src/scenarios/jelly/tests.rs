use super::{JellyBody, SpringKind, SpringNetwork, jelly};
use crate::Solver;
use core::num::NonZeroU32;

#[test]
fn grid_has_the_expected_pairs() {
    let (c, r) = (5, 4);
    let net = SpringNetwork::grid(c, r, 0.0);
    let count = |k| net.pairs.iter().filter(|p| p.2 == k).count();
    assert_eq!(net.positions.len(), c * r);
    assert_eq!(count(SpringKind::Structural), (c - 1) * r + c * (r - 1));
    assert_eq!(count(SpringKind::Shear), 2 * (c - 1) * (r - 1));
    assert_eq!(count(SpringKind::Bend), (c - 2) * r + c * (r - 2));
}

#[test]
fn both_realizations_share_particles_and_topology() {
    let s = jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 4, 3, 100.0, 0.1).unwrap();
    let k = jelly::<f64>(
        JellyBody::Constraints(Solver::Xpbd),
        NonZeroU32::MIN,
        4,
        3,
        100.0,
        0.1,
    )
    .unwrap();
    assert_eq!(s.world.particles.pos(), k.world.particles.pos());
    assert_eq!(s.world.particles.inv_mass(), k.world.particles.inv_mass());
    let springs = s.springs.unwrap();
    let pairs: Vec<_> = springs
        .springs()
        .iter()
        .map(super::super::super::Spring::ends)
        .collect();
    let rods: Vec<_> = k
        .world
        .constraints()
        .iter()
        .map(crate::Constraint::bodies)
        .collect();
    assert_eq!(pairs, rods);
    assert!(k.springs.is_none());
}

#[test]
fn stiffness_is_parsed_per_realization() {
    use crate::ConfigError;
    let springs = |k| jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 3, 3, k, 0.0).err();
    let rods = |k| {
        jelly::<f64>(
            JellyBody::Constraints(Solver::Impulse),
            NonZeroU32::MIN,
            3,
            3,
            k,
            0.0,
        )
        .err()
    };
    assert_eq!(
        springs(f64::INFINITY),
        Some(ConfigError::InvalidStiffness),
        "springs can't be rigid"
    );
    assert_eq!(rods(f64::INFINITY), None, "rigid constraints are fine");
    assert_eq!(rods(0.0), Some(ConfigError::InvalidStiffness));
    assert_eq!(springs(f64::NAN), Some(ConfigError::InvalidStiffness));
    assert_eq!(
        jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 3, 3, 10.0, -1.0).err(),
        Some(ConfigError::InvalidDamping)
    );
    assert_eq!(
        jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 0, 3, 10.0, 0.0).err(),
        Some(ConfigError::InvalidMass),
        "an empty grid has no mass to share"
    );
}
