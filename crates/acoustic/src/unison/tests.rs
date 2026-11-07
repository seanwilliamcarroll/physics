use super::{DETUNE_CENTS, Unison, offset, strings};
use crate::hammer::{self, Hammer, MAX_VELOCITY, STRIKE};
use crate::{Decay, Voicing, Waveguide, inharmonicity};
use math::convert::{f64_to_usize, usize_to_f64};

const FS: f64 = 48_000.0;

fn voicing(key: u8) -> Voicing {
    Voicing {
        tuned: true,
        decay: Decay::T60(4.0),
        inharmonicity: inharmonicity(key),
    }
}

#[test]
fn one_two_or_three_strings_by_register() {
    assert_eq!((strings(21), strings(28)), (1, 1));
    assert_eq!((strings(29), strings(44)), (2, 2));
    assert_eq!((strings(45), strings(108)), (3, 3));
}

#[test]
fn the_tuning_is_symmetric_about_the_note() {
    for n in 1..=3 {
        let offsets: Vec<f64> = (0..n).map(|i| offset(i, n)).collect();
        let mean = offsets.iter().sum::<f64>() / usize_to_f64(offsets.len());
        assert!(mean.abs() < 1e-12, "{offsets:?}");
        assert!(
            offsets
                .windows(2)
                .all(|w| (w[1] - w[0] - DETUNE_CENTS).abs() < 1e-12)
        );
    }
}

#[test]
fn each_string_plays_its_tuning() {
    let u = Unison::<f64>::new(FS, 60, voicing(60), 1.58).unwrap();
    let f0 = 440.0 * 2f64.powf(-9.0 / 12.0);
    for (i, p) in u.pitches().enumerate() {
        let cents = 1200.0 * (p / f0).log2();
        assert!((cents - offset(i, 3)).abs() < 1e-9, "string {i}: {cents}");
    }
}

/// Measured (A3.4): 1.7e-4 of the peak (the strings differ by a cent, so
/// the first milliseconds barely differ). ~10x.
const SAME_AS_ONE_TOL: f64 = 2e-3;
/// The window compared, s: past the contact.
const EARLY: f64 = 0.006;

/// A hammer per string: a group of three, in its first milliseconds, is
/// three times one string (the middle one, in tune) under one hammer.
#[test]
fn a_group_is_n_strings_struck_alike() {
    let key = 60;
    let mut group = Unison::<f64>::new(FS, key, voicing(key), 1.58).unwrap();
    let z = hammer::impedance(key);
    let f0 = 440.0 * 2f64.powf(-9.0 / 12.0);
    let mut one = Waveguide::<f64>::new(FS, f0, voicing(key)).unwrap();
    assert!(one.strike(
        Hammer::new(hammer::felt(key).unwrap(), z, FS, 1.58).unwrap(),
        1.0 - STRIKE
    ));
    let (mut previous, mut worst, mut peak) = (0.0, 0.0_f64, 0.0_f64);
    for _ in 0..f64_to_usize(EARLY * FS).unwrap() {
        let y = one.step();
        let single = 2.0 * z * FS * (y - previous);
        previous = y;
        let g = group.next_sample();
        worst = worst.max((g - 3.0 * single).abs());
        peak = peak.max(g.abs());
    }
    println!(
        "group vs 3 × one string: worst difference {:.2e} of the peak",
        worst / peak
    );
    assert!(worst / peak < SAME_AS_ONE_TOL);
}

/// The strings' energy plus the hammers', once they've all left, is at
/// most what the hammers brought: `N` strikes, no energy from nowhere.
#[test]
fn a_group_makes_no_energy() {
    for key in [21_u8, 36, 60] {
        let v = 1.58;
        let mut u = Unison::<f64>::new(
            FS,
            key,
            Voicing {
                inharmonicity: 0.0,
                ..voicing(key)
            },
            v,
        )
        .unwrap();
        let start = 0.5 * hammer::felt(key).unwrap().mass * v * v * usize_to_f64(u.len());
        while !u.hammers().all(Hammer::retired) {
            u.next_sample();
        }
        let hammers: f64 = u.hammers().map(Hammer::energy).sum();
        let kept = (u.energy() + hammers) / start;
        println!(
            "MIDI {key}, {} strings: {kept:.4} of the hammers' energy",
            u.len()
        );
        assert!(kept < 1.005, "MIDI {key}: {kept}");
    }
}

/// The fastest strike accepted stays finite in `f32` across the keyboard
/// (a far faster one once overflowed the rails and panicked); one faster
/// is refused.
#[test]
fn the_fastest_strike_stays_finite_and_faster_is_refused() {
    for key in [21_u8, 48, 60, 108] {
        let mut u = Unison::<f32>::new(FS, key, voicing(key), MAX_VELOCITY).unwrap();
        assert!((0..4800).all(|_| u.next_sample().is_finite()), "key {key}");
        assert!(Unison::<f32>::new(FS, key, voicing(key), MAX_VELOCITY * 1.01).is_none());
        assert!(
            Unison::<f32>::new(FS, key, voicing(key), 2.5e51).is_none(),
            "the test's case"
        );
        // Up to twice ff: 9 m/s plays (found by the pre-push mutation
        // report: `2 + ff` = 7 m/s passed the checks above).
        assert!(Unison::<f32>::new(FS, key, voicing(key), 9.0).is_some());
    }
}
