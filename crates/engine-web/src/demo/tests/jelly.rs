use engine::diagnostics::{constraint_potential, kinetic_energy, uniform_gravity_potential};
use engine::scenarios::{JellyBody, jelly, pendulum_gravity};
use engine::{Solver, TimeStep};

use super::super::jelly::JELLY_START_SUBSTEPS;
use super::super::{Demo, ScalarKind};
use super::PHYSICS_DT;

/// A 4 × 4 jelly, soft enough to be stable at the demo's 10 substeps.
const SIDE: usize = 4;
const K: f64 = 500.0;
const C: f64 = 0.5;
/// Half a second: falling (kinetic), above the ground (potential), and
/// wobbling (elastic) all at once.
const STEPS: usize = 30;

const BODIES: [JellyBody; 3] = [
    JellyBody::Springs,
    JellyBody::Constraints(Solver::Xpbd),
    JellyBody::Constraints(Solver::Impulse),
];

#[test]
fn jelly_energy_is_kinetic_plus_gravity_plus_elastic() {
    // cargo-mutants (full run): flipping either `+` in the jelly's energy
    // sum went unnoticed. A twin world stepped alike gives each term.
    for body in BODIES {
        let mut d = Demo::new_jelly(ScalarKind::F64, body, SIDE, SIDE, K, C).unwrap();
        let mut j = jelly::<f64>(body, JELLY_START_SUBSTEPS, SIDE, SIDE, K, C).unwrap();
        for _ in 0..STEPS {
            d.advance(PHYSICS_DT);
            j.world.step(TimeStep::new(PHYSICS_DT).unwrap());
        }
        let p = j.world.particles();
        let elastic = j.springs.as_ref().map_or_else(
            || constraint_potential(p, j.world.constraints()),
            |s| s.potential(p),
        );
        let terms = [
            kinetic_energy(p),
            uniform_gravity_potential(p, &pendulum_gravity()),
            elastic,
        ];
        assert!(
            terms.iter().all(|t| *t != 0.0),
            "{body:?}: every term counts: {terms:?}"
        );
        let expect = terms.iter().sum::<f64>();
        assert_eq!(
            d.energy().map(f64::to_bits),
            Some(expect.to_bits()),
            "{body:?}"
        );
    }
}

#[test]
fn a_live_stiffness_change_reaches_the_springs_the_world_steps() {
    // cargo-mutants: the force jelly's live k could update only the
    // readout's copy of its springs (`reinstall` replaced by nothing). Far
    // past k_crit, the stepped jelly must blow up.
    let kinetic_after = |k: Option<f64>| {
        let mut d = Demo::new_jelly(ScalarKind::F64, JellyBody::Springs, SIDE, SIDE, K, C).unwrap();
        if let Some(k) = k {
            assert!(d.set_stiffness(k));
        }
        for _ in 0..60 {
            d.advance(PHYSICS_DT);
        }
        d.kinetic_energy()
    };
    let (calm, stiff) = (kinetic_after(None), kinetic_after(Some(1e6)));
    assert!(calm < 10.0, "k = {K}: {calm} J");
    assert!(
        stiff.is_nan() || stiff >= 1e3,
        "k = 1e6: {stiff} J (NaN counts as exploded)"
    );
}
