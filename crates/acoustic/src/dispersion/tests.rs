use core::f64::consts::TAU;

use super::{MAX_BIQUADS, design};
use crate::voicing::phase_delay_lowpass;

const FS: f64 = 48_000.0;

/// The worst partial error (cents) of a design, predicted from the
/// filters' phase delays: partial k needs `k fs / f_k` samples a round
/// trip, `f_k = k F₀ √(1 + B k²)`, relative to the fundamental's.
fn worst_cents(f1: f64, b: f64) -> (usize, u32, f64) {
    let d = design(FS, f1, b, 0.5, 1e9).expect("a design");
    let f0 = f1 / (1.0 + b).sqrt();
    let w1 = TAU * f1 / FS;
    let worst = (2..=d.partials)
        .map(|k| {
            let k = f64::from(k);
            let fk = k * f0 * (1.0 + b * k * k).sqrt();
            let wk = TAU * fk / FS;
            let want = k * FS / fk
                - FS / f1
                - (phase_delay_lowpass(0.5, wk) - phase_delay_lowpass(0.5, w1));
            let got = d.delay(wk) - d.delay(w1);
            (1200.0 / core::f64::consts::LN_2 * (got - want) / (k * FS / fk)).abs()
        })
        .fold(0.0, f64::max);
    (d.count, d.partials, worst)
}

/// Measured (A3.2, prototype then Rust): the placed-and-refined cascade
/// puts the first 30 partials within a fraction of a cent across the
/// keyboard. ~5x the worst measured.
const DESIGN_TOL_CENTS: f64 = 1.0;

#[test]
fn the_cascade_puts_partials_where_the_stiffness_says() {
    for (name, f1, b) in [
        ("A0", 27.5, 2.08e-4),
        ("C2", 65.41, 6.68e-5),
        ("C3", 130.81, 1.1e-4),
        ("C4", 261.63, 3.1e-4),
        ("A4", 440.0, 7.1e-4),
        ("C6", 1046.5, 2.85e-3),
    ] {
        let (count, partials, err) = worst_cents(f1, b);
        println!("{name}: {count} biquads, {partials} partials, worst {err:.3} cents");
        assert!(count <= MAX_BIQUADS);
        assert!(err < DESIGN_TOL_CENTS, "{name}: {err} cents");
    }
}

#[test]
fn no_stiffness_no_filter() {
    assert!(design(FS, 220.0, 0.0, 0.5, 1e9).is_none());
    assert!(design(FS, 220.0, f64::NAN, 0.5, 1e9).is_none());
}

#[test]
fn the_design_is_reproducible() {
    // The same inputs give the same bits (libm, a fixed iteration count):
    // the rendered audio's goldens rely on it.
    let a = design(FS, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    let b = design(FS, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    assert_eq!(a, b);
}

#[test]
fn a_short_loop_gets_a_smaller_filter() {
    // The cascade's delay at f₀ may use at most `max_delay` samples.
    let full = design(FS, 1046.5, 2.85e-3, 0.5, 1e9).unwrap();
    let w1 = TAU * 1046.5 / FS;
    let room = full.delay(w1) / 2.0;
    // Found by the full mutation run of 2026-11-12: this was an `if let`,
    // so a design that gave up passed too.
    let small = design(FS, 1046.5, 2.85e-3, 0.5, room).expect("a smaller filter fits");
    assert!(small.delay(w1) <= room, "{} > {room}", small.delay(w1));
    assert!(
        small.count < full.count,
        "{} biquads, not fewer than {}",
        small.count,
        full.count
    );
    assert_eq!(small.partials, full.partials, "the same targets");
}
