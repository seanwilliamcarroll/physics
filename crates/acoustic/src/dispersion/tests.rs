use core::f64::consts::TAU;

use super::{Dispersion, MAX_BIQUADS, biquad_delay, biquad_delay_gradient, design};
use crate::piano::{FIRST_KEY, LAST_KEY, frequency, voicing};
use crate::voicing::phase_delay_lowpass;

const SAMPLE_RATE: f64 = 48_000.0;

fn worst_cents(lowest_partial_hz: f64, inharmonicity: f64) -> (usize, u32, f64) {
    let dispersion =
        design(SAMPLE_RATE, lowest_partial_hz, inharmonicity, 0.5, 1e9).expect("a design");
    let worst = errors(
        &dispersion,
        SAMPLE_RATE,
        lowest_partial_hz,
        inharmonicity,
        0.5,
    )
    .into_iter()
    .fold(0.0, f64::max);
    (dispersion.count, dispersion.partials, worst)
}

/// Each designed partial's error (cents, 2 and up), predicted from the
/// filters' phase delays: partial k needs `k fs / f_k` samples a round
/// trip, `f_k = k F₀ √(1 + B k²)`, less the loss lowpass's delay.
fn errors(
    dispersion: &Dispersion,
    sample_rate: f64,
    lowest_partial_hz: f64,
    inharmonicity: f64,
    lowpass_stretch: f64,
) -> Vec<f64> {
    let fundamental_hz = lowest_partial_hz / (1.0 + inharmonicity).sqrt();
    let omega_lowest = TAU * lowest_partial_hz / sample_rate;
    (2..=dispersion.partials)
        .map(|number| {
            let number = f64::from(number);
            let partial_hz =
                number * fundamental_hz * (1.0 + inharmonicity * number * number).sqrt();
            let partial_omega = TAU * partial_hz / sample_rate;
            let want = number * sample_rate / partial_hz
                - sample_rate / lowest_partial_hz
                - (phase_delay_lowpass(lowpass_stretch, partial_omega)
                    - phase_delay_lowpass(lowpass_stretch, omega_lowest));
            let got = dispersion.delay(partial_omega) - dispersion.delay(omega_lowest);
            (1200.0 / core::f64::consts::LN_2 * (got - want) / (number * sample_rate / partial_hz))
                .abs()
        })
        .collect()
}

/// Key `key` as the piano designs it: the design, each partial's error, and
/// the biquad count with unlimited room.
fn as_the_piano_designs(sample_rate: f64, key: u8) -> (Dispersion, Vec<f64>, usize) {
    let key_voicing = voicing(key, true);
    let (lowest_partial_hz, inharmonicity) = (frequency(key), key_voicing.inharmonicity);
    let mut seen = None;
    let voiced = key_voicing.coefficients_designed(
        sample_rate,
        lowest_partial_hz,
        |lowpass_stretch, room| {
            let dispersion = design(
                sample_rate,
                lowest_partial_hz,
                inharmonicity,
                lowpass_stretch,
                room,
            );
            seen = Some((lowpass_stretch, dispersion));
            dispersion
        },
    );
    assert!(voiced.is_some(), "{sample_rate} Hz, MIDI {key}: no voice");
    let (lowpass_stretch, dispersion) = seen.expect("designed");
    let dispersion =
        dispersion.unwrap_or_else(|| panic!("{sample_rate} Hz, MIDI {key}: no cascade"));
    let unlimited = design(
        sample_rate,
        lowest_partial_hz,
        inharmonicity,
        lowpass_stretch,
        1e9,
    )
    .expect("a design")
    .count;
    let partial_errors = errors(
        &dispersion,
        sample_rate,
        lowest_partial_hz,
        inharmonicity,
        lowpass_stretch,
    );
    (dispersion, partial_errors, unlimited)
}

/// With the room it wants, the worst partial is 1.65 cents (key 92 at
/// 48 kHz, partial 8). ~1.2x.
const ALL_KEYS_TOL_CENTS: f64 = 2.0;

/// Where the loop's room left fewer biquads than wanted: 2.73 cents (keys
/// 98–100, partials 4–6). Held to `AUDIBLE_CENTS` (`tests/tuning.rs`).
const ROOM_LIMITED_TOL_CENTS: f64 = 3.0;

/// One biquad for three partials (MIDI 106 at 44.1 kHz, 107 at 48 kHz):
/// 10.9 cents, on partials at 8–16 kHz. ~1.1x.
const ONE_BIQUAD_TOL_CENTS: f64 = 12.0;

#[test]
fn every_key_puts_its_partials_within_its_bound() {
    for sample_rate in [44_100.0, 48_000.0] {
        for key in FIRST_KEY..=LAST_KEY {
            let (dispersion, partial_errors, unlimited) = as_the_piano_designs(sample_rate, key);
            let worst = partial_errors.iter().copied().fold(0.0, f64::max);
            let tolerance = if dispersion.count == unlimited {
                ALL_KEYS_TOL_CENTS
            } else if dispersion.count == 1 && partial_errors.len() > 2 {
                ONE_BIQUAD_TOL_CENTS
            } else {
                ROOM_LIMITED_TOL_CENTS
            };
            assert!(
                worst < tolerance,
                "{sample_rate} Hz, MIDI {key}: {} biquads ({unlimited} with room), worst {worst} cents",
                dispersion.count
            );
        }
    }
}

/// The first 30 partials land within a fraction of a cent. ~5x the worst.
const DESIGN_TOL_CENTS: f64 = 1.0;

#[test]
fn the_cascade_puts_partials_where_the_stiffness_says() {
    for (name, lowest_partial_hz, inharmonicity) in [
        ("A0", 27.5, 2.08e-4),
        ("C2", 65.41, 6.68e-5),
        ("C3", 130.81, 1.1e-4),
        ("C4", 261.63, 3.1e-4),
        ("A4", 440.0, 7.1e-4),
        ("C6", 1046.5, 2.85e-3),
    ] {
        let (count, partials, error) = worst_cents(lowest_partial_hz, inharmonicity);
        println!("{name}: {count} biquads, {partials} partials, worst {error:.3} cents");
        assert!(count <= MAX_BIQUADS);
        assert!(error < DESIGN_TOL_CENTS, "{name}: {error} cents");
    }
}

#[test]
fn no_stiffness_no_filter() {
    assert!(design(SAMPLE_RATE, 220.0, 0.0, 0.5, 1e9).is_none());
    assert!(design(SAMPLE_RATE, 220.0, f64::NAN, 0.5, 1e9).is_none());
}

#[test]
fn the_design_is_reproducible() {
    let first = design(SAMPLE_RATE, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    let second = design(SAMPLE_RATE, 261.63, 3.1e-4, 0.5, 1e9).unwrap();
    assert_eq!(first, second);
}

#[test]
fn a_short_loop_gets_a_smaller_filter() {
    let full = design(SAMPLE_RATE, 1046.5, 2.85e-3, 0.5, 1e9).unwrap();
    let omega_lowest = TAU * 1046.5 / SAMPLE_RATE;
    let room = full.delay(omega_lowest) / 2.0;
    // Must be `expect`, not `if let`: a design that gave up must fail.
    let small = design(SAMPLE_RATE, 1046.5, 2.85e-3, 0.5, room).expect("a smaller filter fits");
    assert!(
        small.delay(omega_lowest) <= room,
        "{} > {room}",
        small.delay(omega_lowest)
    );
    assert!(
        small.count < full.count,
        "{} biquads, not fewer than {}",
        small.count,
        full.count
    );
    assert_eq!(small.partials, full.partials, "the same targets");
}

#[test]
fn the_delay_gradient_matches_central_differences() {
    let step = 1e-6;
    for radius in [0.3, 0.7, 0.95, 0.995] {
        for angle in [0.05, 0.4, 1.2, 2.5] {
            for omega in [0.01, 0.2, 0.9, 2.0] {
                let (d_radius, d_angle) = biquad_delay_gradient(radius, angle, omega);
                let numeric_radius = (biquad_delay(radius + step, angle, omega)
                    - biquad_delay(radius - step, angle, omega))
                    / (2.0 * step);
                let numeric_angle = (biquad_delay(radius, angle + step, omega)
                    - biquad_delay(radius, angle - step, omega))
                    / (2.0 * step);
                for (got, want, what) in [
                    (d_radius, numeric_radius, "r"),
                    (d_angle, numeric_angle, "θ"),
                ] {
                    let tolerance = 1e-5 * want.abs().max(1.0);
                    assert!(
                        (got - want).abs() <= tolerance,
                        "d/d{what} at r {radius}, θ {angle}, ω {omega}: {got} against {want}"
                    );
                }
            }
        }
    }
}
