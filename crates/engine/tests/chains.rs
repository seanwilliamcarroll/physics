//! Chains and the double pendulum (M4.4): the roadmap's mass-ratio test
//! and the chaos demo, measured.
//!
//! Every expected value is our measurement (f64, aarch64-apple-darwin),
//! recorded in the comments and in `docs/06-constraints.md` ("As built
//! (M4.4)"). Tolerances are deliberately loose (~10x): these tests pin the
//! *qualitative* result (which solver holds the chain, that the copies
//! separate), not the digits; `determinism.rs` pins the digits.
#![cfg(test)]

use engine::diagnostics::constraint_error;
use engine::scenarios::{CHAIN_LENGTH, CHAIN_LINKS, DoublePendulumStart, chain, double_pendulum};
use engine::{Constraint, Scalar, Solver, World};
use test_support::{nonzero, pendulum_energy, s};

/// 10 s at a 60 Hz frame rate, as `01`'s pendulum table.
const DT: f64 = 1.0 / 60.0;
const CHAIN_STEPS: u32 = 600;

/// The roadmap's case: a bob 100 times a link particle's mass.
const RATIO: f64 = 100.0;

/// What one chain run reports, m.
#[derive(Copy, Clone, Debug)]
struct ChainRun {
    /// Largest |C| of any link after any step.
    max_link_error: f64,
    /// Largest |Σ link lengths − [`CHAIN_LENGTH`]| after any step: how
    /// much longer (or shorter) the whole chain got.
    max_stretch: f64,
}

/// Total length of the chain's links, m.
fn chain_length<S: Scalar>(w: &World<S>) -> f64 {
    let p = w.particles.pos();
    w.constraints()
        .iter()
        .map(|c| {
            let [a, b] = c.bodies();
            (p[b.index()] - p[a.index()]).length().to_f64()
        })
        .sum()
}

/// The [`CHAIN_LINKS`]-link chain at `ratio`, 10 s.
fn chain_run(solver: Solver, substeps: u32, iterations: u32, ratio: f64) -> ChainRun {
    let mut w = chain::<f64>(solver, nonzero(substeps), CHAIN_LINKS, ratio).unwrap();
    w.set_iterations(nonzero(iterations));
    let (mut max_link_error, mut max_stretch) = (0.0_f64, 0.0_f64);
    for _ in 0..CHAIN_STEPS {
        w.step(DT);
        let (max, _) = constraint_error(&w.particles, w.constraints()).unwrap();
        max_link_error = max_link_error.max(max);
        max_stretch = max_stretch.max((chain_length(&w) - CHAIN_LENGTH).abs());
    }
    ChainRun {
        max_link_error,
        max_stretch,
    }
}

/// `got` is within a factor of 10 of `measured` either way: the same
/// order of magnitude, which is the claim these tests make.
fn assert_order_of(what: &str, got: f64, measured: f64) {
    assert!(
        got <= 10.0 * measured && got >= measured / 10.0,
        "{what}: got {got:.4e}, measured {measured:.4e} (±10x)"
    );
}

fn assert_chain(solver: Solver, substeps: u32, iterations: u32, link: f64, stretch: f64) {
    let r = chain_run(solver, substeps, iterations, RATIO);
    assert_order_of("max link error, m", r.max_link_error, link);
    assert_order_of("max stretch, m", r.max_stretch, stretch);
}

// The table, 1:100, 10 links, iterations 1 (the default) unless named.
// Measured max link error / max stretch (f32 within ~30% of each):
//
// | Solver  | Substeps | It. 1               | It. 10              |
// |---------|----------|---------------------|---------------------|
// | XPBD    | 1        | 65 cm / 5.7 m       | 8.1 cm / 71 cm      |
// | XPBD    | 20       | 3.2 mm / 2.8 cm     | 0.46 mm / 4.0 mm    |
// | Impulse | 1        | 1.19 m / 5.6 m      | 1.10 m / 5.4 m      |
// | Impulse | 20       | 42 cm / 1.65 m      | 3.7 cm / 14 cm      |
//
// At 1 substep both solvers fail (the chain ends up several times its
// length); at 20, XPBD's chain is ~130x tighter than impulse's.

#[test]
fn xpbd_substeps_1() {
    assert_chain(Solver::Xpbd, 1, 1, 0.6517, 5.707);
}

#[test]
fn xpbd_substeps_20() {
    assert_chain(Solver::Xpbd, 20, 1, 3.202e-3, 2.820e-2);
}

#[test]
fn xpbd_substeps_20_iterations_10() {
    assert_chain(Solver::Xpbd, 20, 10, 4.621e-4, 4.032e-3);
}

#[test]
fn impulse_substeps_1() {
    assert_chain(Solver::Impulse, 1, 1, 1.187, 5.573);
}

#[test]
fn impulse_substeps_20() {
    assert_chain(Solver::Impulse, 20, 1, 0.4250, 1.652);
}

#[test]
fn impulse_substeps_20_iterations_10() {
    assert_chain(Solver::Impulse, 20, 10, 3.724e-2, 0.1366);
}

/// The roadmap's showcase as one claim: at 20 substeps XPBD's chain is
/// solid and the impulse solver's goes rubbery, by far more than the
/// ±10x slack above (measured: 133x on link error, 59x on stretch).
#[test]
fn xpbd_holds_the_heavy_chain_far_tighter_than_impulse() {
    let xpbd = chain_run(Solver::Xpbd, 20, 1, RATIO);
    let impulse = chain_run(Solver::Impulse, 20, 1, RATIO);
    assert!(
        impulse.max_link_error > 20.0 * xpbd.max_link_error,
        "{xpbd:?} vs {impulse:?}"
    );
    assert!(
        impulse.max_stretch > 10.0 * xpbd.max_stretch,
        "{xpbd:?} vs {impulse:?}"
    );
}

/// The mass ratio is what hurts: with equal masses (1:1) the same chain
/// holds ~100x better under impulse (4.1 mm against 42 cm) and ~6x
/// better under XPBD (0.51 mm against 3.2 mm), 20 substeps.
#[test]
fn equal_masses_hold_far_better_than_1_to_100() {
    for (solver, factor) in [(Solver::Impulse, 20.0), (Solver::Xpbd, 2.0)] {
        let light = chain_run(solver, 20, 1, 1.0);
        let heavy = chain_run(solver, 20, 1, RATIO);
        assert!(
            heavy.max_link_error > factor * light.max_link_error,
            "{solver:?}: {light:?} vs {heavy:?}"
        );
    }
}

// The double pendulum: `TASKS.md` decision 9's default, impulse with 20
// substeps, the solver that keeps the energy (chaos needs it to stay put).

const CHAOS_SUBSTEPS: u32 = 20;

/// Distance between the tips (particle 2) of two double pendulums, m,
/// compared in f64.
fn tip_distance<A: Scalar, B: Scalar>(a: &World<A>, b: &World<B>) -> f64 {
    let (pa, pb) = (a.particles.pos()[2], b.particles.pos()[2]);
    let (dx, dy) = (pa.x.to_f64() - pb.x.to_f64(), pa.y.to_f64() - pb.y.to_f64());
    dx.hypot(dy)
}

/// Steps both until the tips are more than 1 cm apart; the time in s, or
/// `None` within `max_s`.
fn time_to_separate<A: Scalar, B: Scalar>(
    a: &mut World<A>,
    b: &mut World<B>,
    max_s: u32,
) -> Option<f64> {
    for step in 1..=max_s * 60 {
        a.step(s(DT));
        b.step(s(DT));
        if tip_distance(a, b) > 0.01 {
            return Some(f64::from(step) * DT);
        }
    }
    None
}

/// Copies 1e-9 m apart separate to > 1 cm. Measured: 23.8 s (tips still
/// 2.7e-9 m apart at 10 s, 1.2e-4 m at 20 s; the growth is ~e-fold per
/// 1.5 s once it starts). Not "a few seconds": this start (both rods
/// horizontal, from rest) stays nearly regular for its first ~10 s.
/// With 100 substeps it's 19.6 s (a different, more accurate
/// trajectory); with a 1e-6 m offset, 15.8 s. Bounds: after 10 s, by 30 s.
#[test]
fn copies_1e_9_apart_separate() {
    let mut a = double_pendulum::<f64>(
        Solver::Impulse,
        nonzero(CHAOS_SUBSTEPS),
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let mut b = double_pendulum::<f64>(
        Solver::Impulse,
        nonzero(CHAOS_SUBSTEPS),
        DoublePendulumStart::Horizontal,
        1e-9,
    )
    .unwrap();
    let t = time_to_separate(&mut a, &mut b, 30);
    assert!(t.is_some_and(|t| t > 10.0), "{t:?}");
}

/// Rounding alone is enough: the same start in f32 and f64 separates to
/// > 1 cm. Measured: 14.9 s (10.8 s at 100 substeps). Bounds: after 5 s, by 25 s.
#[test]
fn f32_and_f64_of_the_same_start_separate() {
    let mut a = double_pendulum::<f64>(
        Solver::Impulse,
        nonzero(CHAOS_SUBSTEPS),
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let mut b = double_pendulum::<f32>(
        Solver::Impulse,
        nonzero(CHAOS_SUBSTEPS),
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let t = time_to_separate(&mut a, &mut b, 25);
    assert!(t.is_some_and(|t| t > 5.0), "{t:?}");
}

/// The chaos is the pendulum's, not the solver's leak: over the 30 s the
/// tests above run, energy stays within 0.039 J of the start (measured,
/// f64; f32 0.038 J), 0.4% of `m g L` = 9.8 J. Bound 0.4 J. For contrast,
/// XPBD at 20 substeps loses 10 J in 20 s, and its 1e-9 copies don't
/// reach 1 cm in 120 s: the damping kills the chaos.
#[test]
fn impulse_keeps_the_double_pendulums_energy() {
    let mut w = double_pendulum::<f64>(
        Solver::Impulse,
        nonzero(CHAOS_SUBSTEPS),
        DoublePendulumStart::Horizontal,
        0.0,
    )
    .unwrap();
    let e0 = pendulum_energy(&w);
    let mut worst = 0.0_f64;
    for _ in 0..30 * 60 {
        w.step(DT);
        worst = worst.max((pendulum_energy(&w) - e0).abs());
    }
    assert!(worst < 0.4, "{worst} J");
}

/// The raised start (both rods at 135°) has more energy, so the same 1e-9
/// m separates sooner: measured 11.1 s against the horizontal start's
/// 23.8 s (M4.4, the start the M4 page defaults to). Divergence is
/// exponential, so 1e-9 → 1e-2 m is ~16 e-foldings whatever the start;
/// the page shows the growth on a log plot from t = 0. Bounds: after 5 s
/// (catches a bug that separates them at once), by 15 s, and sooner than
/// the horizontal start.
#[test]
fn raised_start_separates_sooner() {
    let start = DoublePendulumStart::Raised;
    let mut a =
        double_pendulum::<f64>(Solver::Impulse, nonzero(CHAOS_SUBSTEPS), start, 0.0).unwrap();
    let mut b =
        double_pendulum::<f64>(Solver::Impulse, nonzero(CHAOS_SUBSTEPS), start, 1e-9).unwrap();
    let t = time_to_separate(&mut a, &mut b, 15);
    assert!(t.is_some_and(|t| t > 5.0), "{t:?}");
}
