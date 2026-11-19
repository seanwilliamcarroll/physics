use super::{DETUNE_CENTS, Unison, string_count, string_offset_cents};
use crate::hammer::{self, Hammer, MAX_VELOCITY, STRIKE};
use crate::{Decay, Voicing, Waveguide, inharmonicity};
use math::convert::{f64_to_usize, usize_to_f64};

const SAMPLE_RATE: f64 = 48_000.0;

fn voicing(key: u8) -> Voicing {
    Voicing {
        tuned: true,
        decay: Decay::Time60Db(4.0),
        inharmonicity: inharmonicity(key),
    }
}

#[test]
fn one_two_or_three_strings_by_register() {
    assert_eq!((string_count(21), string_count(28)), (1, 1));
    assert_eq!((string_count(29), string_count(44)), (2, 2));
    assert_eq!((string_count(45), string_count(108)), (3, 3));
}

#[test]
fn the_tuning_is_symmetric_about_the_note() {
    for count in 1..=3 {
        let offsets: Vec<f64> = (0..count)
            .map(|index| string_offset_cents(index, count))
            .collect();
        let mean = offsets.iter().sum::<f64>() / usize_to_f64(offsets.len());
        assert!(mean.abs() < 1e-12, "{offsets:?}");
        assert!(
            offsets
                .windows(2)
                .all(|pair| (pair[1] - pair[0] - DETUNE_CENTS).abs() < 1e-12)
        );
    }
}

#[test]
fn each_string_plays_its_tuning() {
    let unison = Unison::<f64>::new(SAMPLE_RATE, 60, voicing(60), 1.58).unwrap();
    let fundamental_hz = 440.0 * 2f64.powf(-9.0 / 12.0);
    for (index, pitch) in unison.pitches().enumerate() {
        let cents = 1200.0 * (pitch / fundamental_hz).log2();
        assert!(
            (cents - string_offset_cents(index, 3)).abs() < 1e-9,
            "string {index}: {cents}"
        );
    }
}

/// Measured: 1.7e-4 of the peak (the strings differ by a cent, so the
/// first milliseconds barely differ). ~10x.
const SAME_AS_ONE_TOL: f64 = 2e-3;
/// The window compared, s: past the contact.
const EARLY: f64 = 0.006;

/// In its first milliseconds a group of three is three times one string.
#[test]
fn a_group_is_n_strings_struck_alike() {
    let key = 60;
    let mut group = Unison::<f64>::new(SAMPLE_RATE, key, voicing(key), 1.58).unwrap();
    let string_impedance = hammer::impedance(key);
    let fundamental_hz = 440.0 * 2f64.powf(-9.0 / 12.0);
    let mut single_string =
        Waveguide::<f64>::new(SAMPLE_RATE, fundamental_hz, voicing(key)).unwrap();
    assert!(
        single_string.strike(
            Hammer::new(
                hammer::felt(key).unwrap(),
                string_impedance,
                SAMPLE_RATE,
                1.58
            )
            .unwrap(),
            1.0 - STRIKE
        )
    );
    let (mut previous, mut worst, mut peak) = (0.0, 0.0_f64, 0.0_f64);
    for _ in 0..f64_to_usize(EARLY * SAMPLE_RATE).unwrap() {
        let output = single_string.step();
        let single = 2.0 * string_impedance * SAMPLE_RATE * (output - previous);
        previous = output;
        let group_force = group.next_sample();
        worst = worst.max((group_force - 3.0 * single).abs());
        peak = peak.max(group_force.abs());
    }
    println!(
        "group vs 3 × one string: worst difference {:.2e} of the peak",
        worst / peak
    );
    assert!(worst / peak < SAME_AS_ONE_TOL);
}

#[test]
fn a_group_makes_no_energy() {
    for key in [21_u8, 36, 60] {
        let velocity = 1.58;
        let mut unison = Unison::<f64>::new(
            SAMPLE_RATE,
            key,
            Voicing {
                inharmonicity: 0.0,
                ..voicing(key)
            },
            velocity,
        )
        .unwrap();
        let start = 0.5
            * hammer::felt(key).unwrap().mass
            * velocity
            * velocity
            * usize_to_f64(unison.len());
        while !unison.hammers().all(Hammer::retired) {
            unison.next_sample();
        }
        let hammer_energy: f64 = unison.hammers().map(Hammer::energy).sum();
        let kept = (unison.energy() + hammer_energy) / start;
        println!(
            "MIDI {key}, {} strings: {kept:.4} of the hammers' energy",
            unison.len()
        );
        assert!(kept < 1.005, "MIDI {key}: {kept}");
    }
}

#[test]
fn the_fastest_strike_stays_finite_and_faster_is_refused() {
    for key in [21_u8, 48, 60, 108] {
        let mut unison = Unison::<f32>::new(SAMPLE_RATE, key, voicing(key), MAX_VELOCITY).unwrap();
        assert!(
            (0..4800).all(|_| unison.next_sample().is_finite()),
            "key {key}"
        );
        assert!(Unison::<f32>::new(SAMPLE_RATE, key, voicing(key), MAX_VELOCITY * 1.01).is_none());
        assert!(
            Unison::<f32>::new(SAMPLE_RATE, key, voicing(key), 2.5e51).is_none(),
            "the test's case"
        );
        // Up to twice ff: 9 m/s plays.
        assert!(Unison::<f32>::new(SAMPLE_RATE, key, voicing(key), 9.0).is_some());
    }
}

#[test]
fn an_unstruck_group_is_empty_and_silent() {
    let unison = Unison::<f64>::with_capacity(SAMPLE_RATE).unwrap();
    assert!(unison.is_empty());
    assert_eq!(unison.len(), 0);
    assert_eq!(unison.pitches().count() + unison.hammers().count(), 0);
    assert!(unison.middle().is_none());
    assert_eq!(unison.energy(), 0.0);
}

#[test]
fn a_struck_group_reads_back_its_strings() {
    // A0 has one string, F1 two, C4 three.
    for (key, count) in [(21_u8, 1), (29, 2), (60, 3)] {
        let mut unison = Unison::<f64>::new(SAMPLE_RATE, key, voicing(key), 1.58).unwrap();
        assert!(!unison.is_empty() && unison.len() == count, "key {key}");
        assert_eq!(unison.hammers().count(), count);
        let pitches: Vec<f64> = unison.pitches().collect();
        assert_eq!(pitches.len(), count);
        let middle = unison.middle().unwrap().pitch();
        assert_eq!(middle.to_bits(), pitches[count / 2].to_bits(), "key {key}");
        for _ in 0..480 {
            unison.next_sample();
        }
        assert!(
            unison.energy() > 0.0,
            "key {key}: struck strings carry energy"
        );
    }
}

/// The outer strings sit a whole `DETUNE_CENTS` from the note.
#[test]
fn three_strings_sit_one_detune_apart() {
    assert_eq!(
        [
            string_offset_cents(0, 3),
            string_offset_cents(1, 3),
            string_offset_cents(2, 3)
        ],
        [-DETUNE_CENTS, 0.0, DETUNE_CENTS]
    );
    assert_eq!(
        [string_offset_cents(0, 2), string_offset_cents(1, 2)],
        [-DETUNE_CENTS / 2.0, DETUNE_CENTS / 2.0]
    );
}
