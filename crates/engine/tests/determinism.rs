//! Determinism: repeatability and golden hashes (`docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::scenarios::{
    BOX_BALLS, CHAIN_LINKS, CRADLE_BALLS, DoublePendulumStart, Fountain, JELLY_COLS, JELLY_ROWS,
    JellyBody, ball_box, break_shot, chain, cluster, collapse, cradle, disk, double_pendulum,
    jelly, orbit, pendulum, pool_break,
};
use engine::{Integrator, Scalar, Solver};
use test_support::{Tol, cluster_barnes_hut, for_each_scalar, nonzero, state_hash, time_step};

/// One step: a 60 Hz frame, as the demos use.
const DT: f64 = 1.0 / 60.0;

/// Reference runs: every scenario, and the orbit under every integrator.
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
    /// force springs at k = 1000 N/m, constraints at k = 1e5 (M5.5).
    Jelly(JellyBody),
    /// The 1:100 chain ([`CHAIN_LINKS`] links), 4 substeps, 600 steps:
    /// pins Gauss–Seidel's constraint order along a chain.
    Chain(Solver),
    /// The double pendulum (1e-9 m offset), impulse with 20 substeps (the
    /// page's default), 600 steps: chaotic, so any change shows up.
    DoublePendulum,
    /// The ball box ([`BOX_BALLS`] balls, seed 1), 10 substeps, 600 steps
    /// (10 s): walls, gravity and many impacts, so the contact order and
    /// the impact stage's rounds are pinned (M6).
    BallBox(Solver),
    /// The break shot (rack touching), 10 substeps, 120 steps (2 s):
    /// one impact through a touching rack, the impact stage's hardest case.
    BreakShot(Solver),
    /// The cradle ([`CRADLE_BALLS`] balls, one pulled), 10 substeps, 300
    /// steps (5 s): impacts down a row, with rods.
    Cradle(Solver),
    /// The pool break (10 m/s, a stun), 10 substeps, 240 steps (4 s):
    /// cushions, pockets, the cloth and the moment-of-impact normals (M7).
    PoolBreak(Solver),
}

const RUNS: [Run; 24] = [
    Run::Fountain,
    Run::Cluster,
    Run::Disk,
    Run::Collapse,
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

/// Builds the run's world, steps it, and hashes the final state.
fn run<S: Scalar>(r: Run) -> u64 {
    match r {
        Run::Fountain => {
            let mut scene = Fountain::new(1);
            let mut w = scene.world::<S>(100);
            for _ in 0..600 {
                w.step(time_step(DT));
                scene.respawn_fallen(&mut w);
            }
            state_hash(w.particles())
        }
        Run::Cluster | Run::Disk | Run::Collapse => {
            let build = match r {
                Run::Cluster => cluster::<S>,
                Run::Disk => disk::<S>,
                _ => collapse::<S>,
            };
            let mut w = build(16, 1).unwrap();
            stepped(&mut w, 300)
        }
        Run::Jelly(body) => {
            let k = if body == JellyBody::Springs {
                1000.0
            } else {
                1e5
            };
            let mut j = jelly::<S>(body, nonzero(10), JELLY_COLS, JELLY_ROWS, k, 0.5).unwrap();
            for _ in 0..300 {
                j.world.step(time_step(DT));
            }
            state_hash(j.world.particles())
        }
        Run::Pendulum(solver) => {
            let mut w = pendulum::<S>(solver, nonzero(4)).unwrap();
            stepped(&mut w, 600)
        }
        Run::Chain(solver) => {
            let mut w = chain::<S>(solver, nonzero(4), CHAIN_LINKS, 100.0).unwrap();
            stepped(&mut w, 600)
        }
        Run::DoublePendulum => {
            let mut w = double_pendulum::<S>(
                Solver::Impulse,
                nonzero(20),
                DoublePendulumStart::Horizontal,
                1e-9,
            )
            .unwrap();
            stepped(&mut w, 600)
        }
        Run::BallBox(solver) => {
            let mut w = ball_box::<S>(solver, nonzero(10), BOX_BALLS, 1).unwrap();
            stepped(&mut w, 600)
        }
        Run::BreakShot(solver) => {
            let mut w = break_shot::<S>(solver, nonzero(10), 0.0).unwrap();
            stepped(&mut w, 120)
        }
        Run::Cradle(solver) => {
            let mut w = cradle::<S>(solver, nonzero(10), CRADLE_BALLS, 1).unwrap();
            stepped(&mut w, 300)
        }
        Run::PoolBreak(solver) => {
            let mut w = pool_break::<S>(solver, nonzero(10), 10.0, 0.0).unwrap();
            stepped(&mut w, 240)
        }
        Run::ClusterBarnesHut => {
            let mut w = cluster_barnes_hut::<S>(64, 1, 0.5);
            stepped(&mut w, 300)
        }
        Run::Orbit(integrator) => {
            let mut w = orbit::<S>(integrator, 1.0).unwrap();
            stepped(&mut w, 600)
        }
    }
}

/// Steps `w` `steps` times at [`DT`] and hashes the final state.
fn stepped<S: Scalar>(w: &mut engine::World<S>, steps: usize) -> u64 {
    for _ in 0..steps {
        w.step(time_step(DT));
    }
    state_hash(w.particles())
}

/// Repeatability: the same run twice is bit-identical, for every scalar.
fn every_run_is_repeatable<S: Tol>() {
    for r in RUNS {
        assert_eq!(run::<S>(r), run::<S>(r), "{r:?}");
    }
}
for_each_scalar!(every_run_is_repeatable);

/// Golden hashes, per run: (f32, f64). Change detectors: a refactor that
/// alters any result fails here, and you decide whether that was intended
/// (then paste the new values from the failure message) or a bug.
/// Recorded on aarch64-apple-darwin, Rust 1.99.1; `cargo xtask test-wasm`
/// checks the same values on wasm32-wasip1 (`docs/04-testing.md`).
const GOLDEN: [(u64, u64); 24] = [
    (0x62d2_3ead_9eca_5aa2, 0x3310_5c41_b976_f7c6), // Fountain
    (0x5444_76f1_0dbc_08c8, 0x3dd0_4ef8_e624_0f65), // Cluster
    (0x7f78_7e7b_c5d7_4fb9, 0xa60c_e466_6830_9be0), // Disk
    (0x4243_55a9_2d1b_b9d3, 0x2ec5_fcc0_29c0_1f7b), // Collapse
    (0x38b8_98d9_9f2e_436a, 0x62a3_677f_7c53_91e2), // Orbit(SymplecticEuler)
    (0xdbd3_a74a_c351_be50, 0xa548_448e_abb6_5ba7), // Orbit(ExplicitEuler)
    (0x521c_acff_69c8_f074, 0x2479_9e2b_6114_4cb8), // Orbit(VelocityVerlet)
    (0x36db_ee64_fd7d_9585, 0x127b_bd5f_cc9b_e6c3), // ClusterBarnesHut
    (0x989a_6cd3_ba07_198c, 0x208c_a668_28aa_95aa), // Pendulum(Xpbd)
    (0x1ddc_6b8c_24f6_6c6b, 0x6642_c1e3_c031_d93e), // Pendulum(Impulse)
    (0x45e3_0c60_6f1f_bfe2, 0xe52e_d266_de49_2a04), // Chain(Xpbd)
    (0x89f6_7e75_f857_3861, 0x03d2_2ac8_3b0d_121f), // Chain(Impulse)
    (0x766f_e60d_00da_4c07, 0x0901_793c_4bbc_980c), // DoublePendulum
    (0xa62e_3f2f_299a_3174, 0x5ec9_8ade_fa46_b8ce), // Jelly(Springs)
    (0x2079_e496_6081_d007, 0xa96f_bdb3_87ea_cd29), // Jelly(Constraints(Xpbd))
    (0x417b_f5ac_8bf7_f82b, 0x3182_4044_ab02_85a0), // Jelly(Constraints(Impulse))
    (0xee53_e386_26ee_ad85, 0x6cda_f64a_97a3_03b5), // BallBox(Xpbd)
    (0xd4ff_ef78_d3e0_c821, 0x9211_3380_0dec_15b2), // BallBox(Impulse)
    (0xb7c4_e8f7_919a_f2a0, 0x4f5c_6b16_15ea_98b2), // BreakShot(Xpbd)
    (0xb0a9_deb3_aba9_437b, 0xea50_db0f_3a7b_e67b), // BreakShot(Impulse)
    (0x4023_045c_a431_d110, 0x0e32_9ef6_1a2e_e434), // Cradle(Xpbd)
    (0x8600_3eb7_30b4_ea5c, 0x7c86_e9d1_ce89_5d5b), // Cradle(Impulse)
    (0x9ec2_fd1b_f4bd_e264, 0x9038_9a24_fca0_cac2), // PoolBreak(Xpbd)
    (0x7d22_34db_a781_a107, 0x3e46_5211_91e1_7f6f), // PoolBreak(Impulse)
];

#[test]
fn golden_hashes_are_unchanged() {
    let mut changed = Vec::new();
    for (r, &(g32, g64)) in RUNS.iter().zip(&GOLDEN) {
        let (h32, h64) = (run::<f32>(*r), run::<f64>(*r));
        if (h32, h64) != (g32, g64) {
            changed.push(format!(
                "    ({}, {}), // {r:?}",
                grouped(h32),
                grouped(h64)
            ));
        }
    }
    assert!(
        changed.is_empty(),
        "golden hashes changed. If the change in results is intended, \
         update GOLDEN in tests/determinism.rs with:\n{}",
        changed.join("\n")
    );
}

/// `0xabcd_ef01_2345_6789`: the digit grouping clippy's `unreadable_literal`
/// asks for, so the failure message can be pasted as-is.
fn grouped(h: u64) -> String {
    let group = |shift: u32| (h >> shift) & 0xffff;
    format!(
        "0x{:04x}_{:04x}_{:04x}_{:04x}",
        group(48),
        group(32),
        group(16),
        group(0)
    )
}
