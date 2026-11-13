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
use engine::{Constraint, Scalar, Solver, Stabilization, World};
use test_support::{nonzero, pendulum_energy, time_step};

/// 10 s at a 60 Hz frame rate, as `01`'s pendulum table.
const DT: f64 = 1.0 / 60.0;
const CHAIN_STEPS: u32 = 600;

/// The roadmap's case: a bob 100 times a link particle's mass.
const RATIO: f64 = 100.0;

/// What one chain run reports: each field is the largest value seen
/// after any step.
#[derive(Copy, Clone, Debug)]
struct ChainRun {
    /// Largest |C| of any link after any step, m.
    link_error: f64,
    /// Largest |Σ link lengths − [`CHAIN_LENGTH`]| after any step, m: how
    /// much longer (or shorter) the whole chain got.
    stretch: f64,
    /// Largest energy *gain* over the start, J. A frictionless chain can
    /// only lose energy to the solver, never gain it: a gain means the
    /// solver is pumping energy in (how the classic-Baumgarte blow-up was
    /// missed in M4.4: no test checked energy).
    energy_gain: f64,
}

/// Total length of the chain's links, m.
fn chain_length<S: Scalar>(w: &World<S>) -> f64 {
    let p = w.particles().pos();
    w.constraints()
        .iter()
        .map(|c| {
            let [a, b] = c.bodies();
            (p[b.index()] - p[a.index()]).length().to_f64()
        })
        .sum()
}

/// The [`CHAIN_LINKS`]-link chain at `ratio`, 10 s.
fn chain_run(
    solver: Solver,
    stab: Stabilization,
    substeps: u32,
    iterations: u32,
    ratio: f64,
) -> ChainRun {
    let mut w = chain::<f64>(solver, nonzero(substeps), CHAIN_LINKS, ratio).unwrap();
    w.set_iterations(nonzero(iterations));
    w.set_stabilization(stab);
    let e0 = pendulum_energy(&w);
    let (mut link_error, mut stretch, mut energy_gain) = (0.0_f64, 0.0_f64, 0.0_f64);
    for _ in 0..CHAIN_STEPS {
        w.step(time_step(DT));
        let (max, _) = constraint_error(w.particles(), w.constraints()).unwrap();
        link_error = link_error.max(max);
        stretch = stretch.max((chain_length(&w) - CHAIN_LENGTH).abs());
        energy_gain = energy_gain.max(pendulum_energy(&w) - e0);
    }
    ChainRun {
        link_error,
        stretch,
        energy_gain,
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

/// Largest energy gain a stable run may show, J: measured 0.0 for every
/// XPBD and split-impulse run (energy only decreases); the bound leaves
/// rounding room, far below the classic blow-up's +15 J and up.
const MAX_STABLE_GAIN: f64 = 0.01;

fn assert_chain(solver: Solver, substeps: u32, iterations: u32, link: f64, stretch: f64) {
    let r = chain_run(solver, Stabilization::Split, substeps, iterations, RATIO);
    assert_order_of("max link error, m", r.link_error, link);
    assert_order_of("max stretch, m", r.stretch, stretch);
    assert!(
        r.energy_gain <= MAX_STABLE_GAIN,
        "gained {} J",
        r.energy_gain
    );
}

// The table, 1:100, 10 links, iterations 1 unless named, split impulses
// (the default stabilization). Measured max link error / max stretch;
// energy gain 0.0 in every run (M4.9, re-measured after the classic
// Baumgarte blow-up was found):
//
// | Solver           | Substeps | It. 1           | It. 10           |
// |------------------|----------|-----------------|------------------|
// | XPBD             | 1        | 65 cm / 5.7 m   |                  |
// | XPBD             | 20       | 3.2 mm / 2.8 cm | 0.46 mm / 4.0 mm |
// | Impulse (split)  | 1        | 1.30 m / 10.5 m |                  |
// | Impulse (split)  | 20       | 4.3 mm / 3.7 cm | 0.61 mm / 5.3 mm |
//
// At 1 substep both fail; at 20 both hold, about equally: once position
// error is corrected positionally (split impulses), the impulse solver
// behaves like XPBD on the chain. The M4.4 numbers (impulse 42 cm, "130x
// worse") were classic Baumgarte's blow-up, not softness; see
// `known_failures.rs`.

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
    assert_chain(Solver::Impulse, 1, 1, 1.297, 10.47);
}

#[test]
fn impulse_substeps_20() {
    assert_chain(Solver::Impulse, 20, 1, 4.251e-3, 3.717e-2);
}

#[test]
fn impulse_substeps_20_iterations_10() {
    assert_chain(Solver::Impulse, 20, 10, 6.137e-4, 5.274e-3);
}

/// With split impulses the two solvers hold the heavy chain about equally
/// (4.3 mm vs 3.2 mm at 20 substeps): within 2x of each other.
#[test]
fn split_impulses_hold_the_chain_like_xpbd() {
    let xpbd = chain_run(Solver::Xpbd, Stabilization::Split, 20, 1, RATIO);
    let impulse = chain_run(Solver::Impulse, Stabilization::Split, 20, 1, RATIO);
    let ratio = impulse.link_error / xpbd.link_error;
    assert!((0.5..=2.0).contains(&ratio), "{xpbd:?} vs {impulse:?}");
}

/// The mass ratio is what hurts: with equal masses (1:1) the chain holds
/// ~6x better under XPBD (0.51 mm vs 3.2 mm) and ~5x under impulse
/// (0.92 mm vs 4.3 mm), 20 substeps.
#[test]
fn equal_masses_hold_far_better_than_1_to_100() {
    for solver in Solver::ALL {
        let light = chain_run(solver, Stabilization::Split, 20, 1, 1.0);
        let heavy = chain_run(solver, Stabilization::Split, 20, 1, RATIO);
        assert!(
            heavy.link_error > 2.0 * light.link_error,
            "{solver:?}: {light:?} vs {heavy:?}"
        );
    }
}

/// `classic_baumgarte_blows_up_on_heavy_chains` (`known_failures.rs`)
/// needs `chain_run`; it lives here to share it. With warm starting and
/// one pass, classic Baumgarte pumps energy into the 1:100 chain, and
/// *more substeps make it worse* (a smaller `h` turns the same error into
/// a larger bias velocity `β C / h`). Measured max gain over 10 s: 0 J at 1
/// substep, +15 J at 2, +186 J at 5, +3398 J at 20, from a chain holding
/// ~10 J. Bounds: > 100 J at 20 substeps, and growing with substeps.
#[test]
fn classic_baumgarte_blows_up_on_heavy_chains() {
    let gain =
        |sub| chain_run(Solver::Impulse, Stabilization::Baumgarte, sub, 1, RATIO).energy_gain;
    let (two, twenty) = (gain(2), gain(20));
    assert!(twenty > 100.0, "only {twenty} J at 20 substeps");
    assert!(twenty > two, "{two} J at 2 substeps vs {twenty} J at 20");
}

// The double pendulum at the page's default, impulse with 20
// substeps, the solver that keeps the energy (chaos needs it to stay put).

const CHAOS_SUBSTEPS: u32 = 20;

/// Distance between the tips (particle 2) of two double pendulums, m,
/// compared in f64.
fn tip_distance<A: Scalar, B: Scalar>(a: &World<A>, b: &World<B>) -> f64 {
    let (pa, pb) = (a.particles().pos()[2], b.particles().pos()[2]);
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
        a.step(time_step(DT));
        b.step(time_step(DT));
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
        w.step(time_step(DT));
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

/// The slow tier (`cargo xtask slow`): the 1:100 chain for a minute at 20
/// substeps, both solvers. Over a long run its worst link error must not
/// grow (the last 10 s within 2x the first), and it may not gain energy
/// past the 10 s table's limit.
#[test]
#[ignore = "slow: cargo xtask slow"]
fn slow_the_chain_holds_for_a_minute() {
    const TEN_SECONDS: u32 = 600;
    for solver in Solver::ALL {
        let mut w = chain::<f64>(solver, nonzero(20), CHAIN_LINKS, RATIO).unwrap();
        let e0 = pendulum_energy(&w);
        let mut worst = Vec::new();
        let mut gain = 0.0_f64;
        for _ in 0..6 {
            let mut window = 0.0_f64;
            for _ in 0..TEN_SECONDS {
                w.step(time_step(1.0 / 60.0));
                let err =
                    constraint_error(w.particles(), w.constraints()).map_or(0.0, |(max, _)| max);
                window = window.max(err);
                gain = gain.max(pendulum_energy(&w) - e0);
            }
            worst.push(window);
        }
        eprintln!("{solver:?}: worst link error per 10 s {worst:?}, max gain {gain:.3} J");
        let (first, last) = (worst[0], worst[5]);
        assert!(
            last <= 2.0 * first,
            "{solver:?}: link error grew {first:e} → {last:e}"
        );
        assert!(gain <= MAX_STABLE_GAIN, "{solver:?}: gained {gain} J");
    }
}
