//! Determinism: repeatability and golden hashes (`docs/04-testing.md`).
// Whole file is test code (docs/lint-policy.md).
#![cfg(test)]

use engine::scenarios::{
    CHAIN_LINKS, DoublePendulumStart, Fountain, chain, cluster, collapse, disk, double_pendulum,
    orbit, pendulum,
};
use engine::{Integrator, Scalar, Solver};
use test_support::{Tol, cluster_barnes_hut, for_each_scalar, nonzero, s, state_hash};

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
    /// The 1:100 chain ([`CHAIN_LINKS`] links), 4 substeps, 600 steps:
    /// pins Gauss–Seidel's constraint order along a chain.
    Chain(Solver),
    /// The double pendulum (1e-9 m offset), impulse with 20 substeps (the
    /// page's default), 600 steps: chaotic, so any change shows up.
    DoublePendulum,
}

const RUNS: [Run; 13] = [
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
];

/// Builds the run's world, steps it, and hashes the final state.
fn run<S: Scalar>(r: Run) -> u64 {
    match r {
        Run::Fountain => {
            let mut scene = Fountain::new(1);
            let mut w = scene.world::<S>(100);
            for _ in 0..600 {
                w.step(s(DT));
                scene.respawn_fallen(&mut w);
            }
            state_hash(&w.particles)
        }
        Run::Cluster | Run::Disk | Run::Collapse => {
            let build = match r {
                Run::Cluster => cluster::<S>,
                Run::Disk => disk::<S>,
                _ => collapse::<S>,
            };
            let mut w = build(16, 1).unwrap();
            for _ in 0..300 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
        Run::Pendulum(solver) => {
            let mut w = pendulum::<S>(solver, nonzero(4)).unwrap();
            for _ in 0..600 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
        Run::Chain(solver) => {
            let mut w = chain::<S>(solver, nonzero(4), CHAIN_LINKS, 100.0).unwrap();
            for _ in 0..600 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
        Run::DoublePendulum => {
            let mut w = double_pendulum::<S>(
                Solver::Impulse,
                nonzero(20),
                DoublePendulumStart::Horizontal,
                1e-9,
            )
            .unwrap();
            for _ in 0..600 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
        Run::ClusterBarnesHut => {
            let mut w = cluster_barnes_hut::<S>(64, 1, 0.5);
            for _ in 0..300 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
        Run::Orbit(integrator) => {
            let mut w = orbit::<S>(integrator, 1.0).unwrap();
            for _ in 0..600 {
                w.step(s(DT));
            }
            state_hash(&w.particles)
        }
    }
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
const GOLDEN: [(u64, u64); 13] = [
    (0x62d2_3ead_9eca_5aa2, 0x3310_5c41_b976_f7c6), // Fountain
    (0x5444_76f1_0dbc_08c8, 0x3dd0_4ef8_e624_0f65), // Cluster
    (0x7f78_7e7b_c5d7_4fb9, 0xa60c_e466_6830_9be0), // Disk
    (0x4243_55a9_2d1b_b9d3, 0x2ec5_fcc0_29c0_1f7b), // Collapse
    (0x38b8_98d9_9f2e_436a, 0x62a3_677f_7c53_91e2), // Orbit(SymplecticEuler)
    (0xdbd3_a74a_c351_be50, 0xa548_448e_abb6_5ba7), // Orbit(ExplicitEuler)
    (0x521c_acff_69c8_f074, 0x2479_9e2b_6114_4cb8), // Orbit(VelocityVerlet)
    (0x1b01_6782_cfd0_e3bb, 0x6ad4_4251_6e06_fcf6), // ClusterBarnesHut
    (0x989a_6cd3_ba07_198c, 0x208c_a668_28aa_95aa), // Pendulum(Xpbd)
    (0x1ddc_6b8c_24f6_6c6b, 0x6642_c1e3_c031_d93e), // Pendulum(Impulse)
    (0x45e3_0c60_6f1f_bfe2, 0xe52e_d266_de49_2a04), // Chain(Xpbd)
    (0x89f6_7e75_f857_3861, 0x03d2_2ac8_3b0d_121f), // Chain(Impulse)
    (0x766f_e60d_00da_4c07, 0x0901_793c_4bbc_980c), // DoublePendulum
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
