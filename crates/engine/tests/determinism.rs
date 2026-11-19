//! Determinism: every run is repeatable, bit for bit (`docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::scenarios::{
    BOX_BALLS, CHAIN_LINKS, CRADLE_BALLS, DoublePendulumStart, Fountain, JELLY_COLS, JELLY_ROWS,
    JellyBody, ball_box, break_shot, chain, cluster, collapse, cradle, disk, double_pendulum,
    jelly, orbit, pendulum, pool_break,
};
use engine::{Integrator, Scalar, Solver};
use test_support::{Tol, cluster_barnes_hut, for_each_scalar, nonzero, state_bits, time_step};

const DT: f64 = 1.0 / 60.0;

#[derive(Copy, Clone, Debug)]
enum Run {
    /// 100 particles, 600 steps (10 s), respawning: exercises the PRNG
    /// beyond setup.
    Fountain,
    /// 16 bodies, 300 steps: chaotic, so any change shows up fast.
    Cluster,
    /// 16 bodies, 300 steps (5 s: the inner orbits go round several times).
    Disk,
    /// 16 bodies, 300 steps (5 s: through the first collapse).
    Collapse,
    /// 200 bodies, 100 steps: past the plain-loop cutoff (16-body worlds
    /// run the plain loop), so the vector pair loop and its lanes are
    /// pinned; 200 isn't a multiple of the lanes, so the leftover pairs
    /// after the last block are too (`force/pairwise/knobs.rs`).
    ClusterLarge,
    /// 600 steps (~3.3 orbits).
    Orbit(Integrator),
    /// A 64-body cluster under Barnes–Hut (θ = 0.5), 300 steps: enough
    /// bodies for a tree of several levels, so the tree build and walk
    /// order are pinned (`docs/barnes-hut.md`, "Determinism").
    ClusterBarnesHut,
    /// The `01` pendulum, 4 substeps, 600 steps (10 s): pins the solver's
    /// predict / project / derive order and λ handling.
    Pendulum(Solver),
    /// The 8×8 jelly, 10 substeps, 300 steps (5 s: falls, lands, settles):
    /// force springs at k = 1000 N/m, constraints at k = 1e5.
    Jelly(JellyBody),
    /// The 1:100 chain ([`CHAIN_LINKS`] links), 4 substeps, 600 steps:
    /// pins Gauss–Seidel's constraint order along a chain.
    Chain(Solver),
    /// The double pendulum (1e-9 m offset), impulse with 20 substeps, 600
    /// steps: chaotic, so any change shows up.
    DoublePendulum,
    /// The ball box ([`BOX_BALLS`] balls, seed 1), 10 substeps, 600 steps
    /// (10 s): walls, gravity and many impacts, so the contact order and
    /// the impact stage's rounds are pinned.
    BallBox(Solver),
    /// The break shot (rack touching), 10 substeps, 120 steps (2 s):
    /// one impact through a touching rack, the impact stage's hardest case.
    BreakShot(Solver),
    /// The cradle ([`CRADLE_BALLS`] balls, one pulled), 10 substeps, 300
    /// steps (5 s): impacts down a row, with rods.
    Cradle(Solver),
    /// The pool break (10 m/s, a stun), 10 substeps, 240 steps (4 s):
    /// cushions, pockets, the cloth and the moment-of-impact normals.
    PoolBreak(Solver),
}

const RUNS: [Run; 25] = [
    Run::Fountain,
    Run::Cluster,
    Run::Disk,
    Run::Collapse,
    Run::ClusterLarge,
    Run::Orbit(Integrator::SymplecticEuler),
    Run::Orbit(Integrator::ExplicitEuler),
    Run::Orbit(Integrator::VelocityVerlet),
    Run::ClusterBarnesHut,
    Run::Pendulum(Solver::Xpbd),
    Run::Pendulum(Solver::Impulse),
    Run::Chain(Solver::Xpbd),
    Run::Chain(Solver::Impulse),
    Run::DoublePendulum,
    Run::Jelly(JellyBody::Springs),
    Run::Jelly(JellyBody::Constraints(Solver::Xpbd)),
    Run::Jelly(JellyBody::Constraints(Solver::Impulse)),
    Run::BallBox(Solver::Xpbd),
    Run::BallBox(Solver::Impulse),
    Run::BreakShot(Solver::Xpbd),
    Run::BreakShot(Solver::Impulse),
    Run::Cradle(Solver::Xpbd),
    Run::Cradle(Solver::Impulse),
    Run::PoolBreak(Solver::Xpbd),
    Run::PoolBreak(Solver::Impulse),
];

fn run<S: Scalar>(reference_run: Run) -> Vec<u64> {
    match reference_run {
        Run::Fountain => {
            let mut fountain = Fountain::new(1);
            let mut world = fountain.world::<S>(100);
            for _ in 0..600 {
                world.step(time_step(DT));
                fountain.respawn_fallen(&mut world);
            }
            state_bits(world.particles())
        }
        Run::Cluster | Run::Disk | Run::Collapse => {
            let build = match reference_run {
                Run::Cluster => cluster::<S>,
                Run::Disk => disk::<S>,
                _ => collapse::<S>,
            };
            let mut world = build(16, 1).unwrap();
            stepped(&mut world, 300)
        }
        Run::Jelly(body) => {
            let stiffness = if body == JellyBody::Springs {
                1000.0
            } else {
                1e5
            };
            let mut jelly_world =
                jelly::<S>(body, nonzero(10), JELLY_COLS, JELLY_ROWS, stiffness, 0.5).unwrap();
            for _ in 0..300 {
                jelly_world.world.step(time_step(DT));
            }
            state_bits(jelly_world.world.particles())
        }
        Run::Pendulum(solver) => {
            let mut world = pendulum::<S>(solver, nonzero(4)).unwrap();
            stepped(&mut world, 600)
        }
        Run::Chain(solver) => {
            let mut world = chain::<S>(solver, nonzero(4), CHAIN_LINKS, 100.0).unwrap();
            stepped(&mut world, 600)
        }
        Run::DoublePendulum => {
            let mut world = double_pendulum::<S>(
                Solver::Impulse,
                nonzero(20),
                DoublePendulumStart::Horizontal,
                1e-9,
            )
            .unwrap();
            stepped(&mut world, 600)
        }
        Run::BallBox(solver) => {
            let mut world = ball_box::<S>(solver, nonzero(10), BOX_BALLS, 1).unwrap();
            stepped(&mut world, 600)
        }
        Run::BreakShot(solver) => {
            let mut world = break_shot::<S>(solver, nonzero(10), 0.0).unwrap();
            stepped(&mut world, 120)
        }
        Run::Cradle(solver) => {
            let mut world = cradle::<S>(solver, nonzero(10), CRADLE_BALLS, 1).unwrap();
            stepped(&mut world, 300)
        }
        Run::PoolBreak(solver) => {
            let mut world = pool_break::<S>(solver, nonzero(10), 10.0, 0.0).unwrap();
            stepped(&mut world, 240)
        }
        Run::ClusterLarge => {
            let mut world = cluster::<S>(200, 1).unwrap();
            stepped(&mut world, 100)
        }
        Run::ClusterBarnesHut => {
            let mut world = cluster_barnes_hut::<S>(64, 1, 0.5);
            stepped(&mut world, 300)
        }
        Run::Orbit(integrator) => {
            let mut world = orbit::<S>(integrator, 1.0).unwrap();
            stepped(&mut world, 600)
        }
    }
}

fn stepped<S: Scalar>(world: &mut engine::World<S>, steps: usize) -> Vec<u64> {
    for _ in 0..steps {
        world.step(time_step(DT));
    }
    state_bits(world.particles())
}

fn every_run_is_repeatable<S: Tol>() {
    for reference_run in RUNS {
        assert!(
            run::<S>(reference_run) == run::<S>(reference_run),
            "{reference_run:?}: two runs differ"
        );
    }
}
for_each_scalar!(every_run_is_repeatable);
