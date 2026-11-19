use super::{Designs, FIRST_KEY, LAST_KEY, frequency, t60, voicing};

const SAMPLE_RATE: f64 = 48_000.0;

#[test]
fn the_decay_falls_from_bass_to_treble() {
    assert!((t60(FIRST_KEY) - 20.0).abs() < 1e-9 && (t60(LAST_KEY) - 1.5).abs() < 1e-9);
    assert!((FIRST_KEY..LAST_KEY).all(|key| t60(key + 1) < t60(key)));
}

/// The stored design is the one the voicing would design itself: the
/// table changes when the cost is paid, not what plays.
#[test]
fn the_table_holds_what_the_voicing_designs() {
    let start = std::time::Instant::now();
    let designs = Designs::new(SAMPLE_RATE);
    println!(
        "88 keys designed in {:?}; {} have a cascade",
        start.elapsed(),
        designs.designed()
    );
    for key in [21_u8, 48, 60, 84] {
        assert_eq!(
            designs.get(key),
            voicing(key, true)
                .design(SAMPLE_RATE, frequency(key))
                .as_ref(),
            "MIDI {key}"
        );
        assert!(designs.get(key).is_some(), "MIDI {key} has a cascade");
    }
    assert!(designs.get(20).is_none() && designs.get(109).is_none());
    assert!(
        voicing(60, false)
            .design(SAMPLE_RATE, frequency(60))
            .is_none(),
        "no stiffness, no cascade"
    );
}
