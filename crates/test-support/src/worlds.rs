//! `proptest` generators: random worlds for the property tests.

use engine::scenarios::GRAVITATIONAL_CONSTANT;
use engine::{Integrator, PairwiseGravity, Scalar, World};
use proptest::prelude::*;
use proptest::test_runner::Config as ProptestConfig;

use crate::{s, v};

/// Generated bodies sit in a ±10 m box: demo scale.
pub const PROP_BOX_M: f64 = 10.0;
/// Speeds up to 1 m/s per axis: slow next to the gravitational speeds below.
pub const PROP_SPEED: f64 = 1.0;
/// Mass range, kg: `G m` of 0.07–0.7 m³/s², so bodies a meter apart pull at
/// up to ~0.7 m/s², and visibly interact within a 1 s run.
pub const PROP_MASS_KG: (f64, f64) = (1.0e9, 1.0e10);
/// Softening for property worlds, m: bounded kicks on close passes, so
/// "any world" stays finite.
pub const PROP_SOFTENING_M: f64 = 0.1;
/// Cases per property when `PROPTEST_CASES` isn't set: quick enough for
/// every `cargo test`; set the variable for longer runs.
pub const PROP_DEFAULT_CASES: u32 = 64;

/// One generated body; `mass: None` means static (`inv_mass = 0`).
#[derive(Clone, Debug)]
pub struct BodySpec {
    pub pos: (f64, f64),
    pub vel: (f64, f64),
    pub mass: Option<f64>,
}

/// Bodies anywhere in the box; one in ten is static.
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

/// 2 to 12 bodies: enough for every pair interaction, small enough that
/// shrinking finds minimal counterexamples quickly.
pub fn world_spec() -> impl Strategy<Value = Vec<BodySpec>> {
    prop::collection::vec(body_spec(), 2..=12)
}

/// A world of `bodies` under softened pairwise gravity.
#[must_use]
pub fn build_world<S: Scalar>(bodies: &[BodySpec], integrator: Integrator) -> World<S> {
    let mut w = World::new(integrator, 1).unwrap();
    w.add_force(PairwiseGravity::new(
        S::from_f64(GRAVITATIONAL_CONSTANT),
        S::from_f64(PROP_SOFTENING_M),
    ));
    for b in bodies {
        let pos = v::<S>(b.pos.0, b.pos.1);
        match b.mass {
            Some(m) => w.particles.add(pos, v(b.vel.0, b.vel.1), s(m)),
            None => w.particles.add_static(pos),
        }
    }
    w
}

/// 64 cases by default (`PROP_DEFAULT_CASES`); `PROPTEST_CASES` overrides,
/// e.g. `PROPTEST_CASES=5000 cargo test -p engine --test properties`.
#[must_use]
pub fn proptest_config() -> ProptestConfig {
    let mut config = ProptestConfig::default();
    if std::env::var_os("PROPTEST_CASES").is_none() {
        config.cases = PROP_DEFAULT_CASES;
    }
    config
}
