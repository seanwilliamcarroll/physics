use super::{JellyBody, SpringKind, SpringNetwork, jelly};
use crate::Solver;
use core::num::NonZeroU32;

#[test]
fn grid_has_the_expected_pairs() {
    let (cols, rows) = (5, 4);
    let network = SpringNetwork::grid(cols, rows, 0.0);
    let count = |kind| network.pairs.iter().filter(|pair| pair.2 == kind).count();
    assert_eq!(network.positions.len(), cols * rows);
    assert_eq!(
        count(SpringKind::Structural),
        (cols - 1) * rows + cols * (rows - 1)
    );
    assert_eq!(count(SpringKind::Shear), 2 * (cols - 1) * (rows - 1));
    assert_eq!(
        count(SpringKind::Bend),
        (cols - 2) * rows + cols * (rows - 2)
    );
}

#[test]
fn both_realizations_share_particles_and_topology() {
    let spring_jelly = jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 4, 3, 100.0, 0.1).unwrap();
    let constraint_jelly = jelly::<f64>(
        JellyBody::Constraints(Solver::Xpbd),
        NonZeroU32::MIN,
        4,
        3,
        100.0,
        0.1,
    )
    .unwrap();
    assert_eq!(
        spring_jelly.world.particles.pos(),
        constraint_jelly.world.particles.pos()
    );
    assert_eq!(
        spring_jelly.world.particles.inv_mass(),
        constraint_jelly.world.particles.inv_mass()
    );
    let springs = spring_jelly.springs.unwrap();
    let spring_ends: Vec<_> = springs
        .springs()
        .iter()
        .map(super::super::super::Spring::ends)
        .collect();
    let rod_ends: Vec<_> = constraint_jelly
        .world
        .constraints()
        .iter()
        .map(crate::Constraint::bodies)
        .collect();
    assert_eq!(spring_ends, rod_ends);
    assert!(constraint_jelly.springs.is_none());
}

#[test]
fn stiffness_is_parsed_per_realization() {
    use crate::ConfigError;
    let springs =
        |stiffness| jelly::<f64>(JellyBody::Springs, NonZeroU32::MIN, 3, 3, stiffness, 0.0).err();
    let rods = |stiffness| {
        jelly::<f64>(
            JellyBody::Constraints(Solver::Impulse),
            NonZeroU32::MIN,
            3,
            3,
            stiffness,
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

/// `α = 1/k`: a `k` so small its inverse overflows (in `f32` below about
/// 3e-39, in `f64` at subnormals) is refused, not turned into an infinite
/// compliance (which XPBD would make NaN); `k = ∞` is rigid.
#[test]
fn a_stiffness_whose_compliance_overflows_is_refused() {
    use super::compliance_for;
    use crate::{Compliance, ConfigError};
    assert_eq!(
        compliance_for::<f32>(1e-39),
        Err(ConfigError::InvalidStiffness)
    );
    assert_eq!(
        compliance_for::<f64>(1e-310),
        Err(ConfigError::InvalidStiffness)
    );
    assert_eq!(compliance_for::<f64>(f64::INFINITY), Ok(Compliance::RIGID));
    assert!(compliance_for::<f32>(1e3).is_ok());
}
