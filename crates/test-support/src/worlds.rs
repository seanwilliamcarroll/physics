//! `proptest` generators: random worlds for the property tests.

use engine::scenarios::newtonian;
use engine::{Integrator, Scalar, Softening, World};
use proptest::prelude::*;
use proptest::test_runner::Config as ProptestConfig;

use crate::{kg, s, v};

pub const PROP_BOX_M: f64 = 10.0;
pub const PROP_SPEED: f64 = 1.0;
/// Mass range, kg: `G m` of 0.07–0.7 m³/s², so bodies interact visibly within 1 s.
pub const PROP_MASS_KG: (f64, f64) = (1.0e9, 1.0e10);
/// Softening, m: bounds kicks on close passes so any world stays finite.
pub const PROP_SOFTENING_M: f64 = 0.1;
pub const PROP_DEFAULT_CASES: u32 = 64;

/// One generated body; `mass: None` means static (`inv_mass = 0`).
#[derive(Clone, Debug)]
pub struct BodySpec {
    pub pos: (f64, f64),
    pub vel: (f64, f64),
    pub mass: Option<f64>,
}

pub fn body_spec() -> impl Strategy<Value = BodySpec> {
    let coord = -PROP_BOX_M..PROP_BOX_M;
    let speed = -PROP_SPEED..PROP_SPEED;
    let mass = prop_oneof![
        9 => (PROP_MASS_KG.0..PROP_MASS_KG.1).prop_map(Some),
        1 => Just(None),
    ];
    (coord.clone(), coord, speed.clone(), speed, mass).prop_map(|(x, y, vx, vy, mass)| BodySpec {
        pos: (x, y),
        vel: (vx, vy),
        mass,
    })
}

/// 2 to 12 bodies: every pair interaction, quick shrinking.
pub fn world_spec() -> impl Strategy<Value = Vec<BodySpec>> {
    prop::collection::vec(body_spec(), 2..=12)
}

#[must_use]
pub fn build_world<S: Scalar>(bodies: &[BodySpec], integrator: Integrator) -> World<S> {
    let mut world = World::new(integrator, core::num::NonZeroU32::MIN);
    world.add_force(newtonian(Softening::new(s::<S>(PROP_SOFTENING_M)).unwrap()));
    for body in bodies {
        let pos = v::<S>(body.pos.0, body.pos.1);
        match body.mass {
            Some(mass) => {
                world.add_particle(pos, v(body.vel.0, body.vel.1), kg(mass));
            }
            None => {
                world.add_static(pos);
            }
        }
    }
    world
}

/// 64 cases by default (`PROP_DEFAULT_CASES`); `PROPTEST_CASES` overrides,
/// e.g. `PROPTEST_CASES=5000 cargo test -p engine --test properties`.
#[must_use]
pub fn proptest_config() -> ProptestConfig {
    proptest_config_with(PROP_DEFAULT_CASES)
}

/// As [`proptest_config`], with `cases` by default, for expensive properties.
#[must_use]
pub fn proptest_config_with(cases: u32) -> ProptestConfig {
    let mut config = ProptestConfig::default();
    if std::env::var_os("PROPTEST_CASES").is_none() {
        config.cases = cases;
    }
    config
}
