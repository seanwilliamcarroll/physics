use engine::diagnostics::{constraint_potential, kinetic_energy, uniform_gravity_potential};
use engine::scenarios::{JellyBody, jelly, pendulum_gravity};
use engine::{Solver, TimeStep};

use super::super::jelly::JELLY_START_SUBSTEPS;
use super::super::{Demo, ScalarKind};
use super::PHYSICS_DT;

/// A 4 × 4 jelly, soft enough to be stable at the demo's 10 substeps.
const SIDE: usize = 4;
const STIFFNESS: f64 = 500.0;
const DAMPING: f64 = 0.5;
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
    // A twin world stepped alike gives each term.
    for body in BODIES {
        let mut demo =
            Demo::new_jelly(ScalarKind::F64, body, SIDE, SIDE, STIFFNESS, DAMPING).unwrap();
        let mut twin =
            jelly::<f64>(body, JELLY_START_SUBSTEPS, SIDE, SIDE, STIFFNESS, DAMPING).unwrap();
        for _ in 0..STEPS {
            demo.advance(PHYSICS_DT);
            twin.world.step(TimeStep::new(PHYSICS_DT).unwrap());
        }
        let particles = twin.world.particles();
        let elastic = twin.springs.as_ref().map_or_else(
            || constraint_potential(particles, twin.world.constraints()),
            |springs| springs.potential(particles),
        );
        let terms = [
            kinetic_energy(particles),
            uniform_gravity_potential(particles, &pendulum_gravity()),
            elastic,
        ];
        assert!(
            terms.iter().all(|t| *t != 0.0),
            "{body:?}: every term counts: {terms:?}"
        );
        let expect = terms.iter().sum::<f64>();
        assert_eq!(
            demo.energy().map(f64::to_bits),
            Some(expect.to_bits()),
            "{body:?}"
        );
    }
}

#[test]
fn a_live_stiffness_change_reaches_the_springs_the_world_steps() {
    // Far past the critical stiffness the stepped jelly must blow up: the
    // change has to reach the springs the world steps, not only the
    // readout's copy.
    let kinetic_after = |new_stiffness: Option<f64>| {
        let mut demo = Demo::new_jelly(
            ScalarKind::F64,
            JellyBody::Springs,
            SIDE,
            SIDE,
            STIFFNESS,
            DAMPING,
        )
        .unwrap();
        if let Some(new_stiffness) = new_stiffness {
            assert!(demo.set_stiffness(new_stiffness));
        }
        for _ in 0..60 {
            demo.advance(PHYSICS_DT);
        }
        demo.kinetic_energy()
    };
    let (calm, stiff) = (kinetic_after(None), kinetic_after(Some(1e6)));
    assert!(calm < 10.0, "k = {STIFFNESS}: {calm} J");
    assert!(
        stiff.is_nan() || stiff >= 1e3,
        "k = 1e6: {stiff} J (NaN counts as exploded)"
    );
}
