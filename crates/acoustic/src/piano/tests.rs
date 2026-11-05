use super::{Designs, FIRST_KEY, LAST_KEY, frequency, t60, voicing};

const FS: f64 = 48_000.0;

#[test]
fn the_decay_falls_from_bass_to_treble() {
    assert!((t60(FIRST_KEY) - 20.0).abs() < 1e-9 && (t60(LAST_KEY) - 1.5).abs() < 1e-9);
    assert!((FIRST_KEY..LAST_KEY).all(|k| t60(k + 1) < t60(k)));
}

/// The stored design is the one the voicing would design itself: the
/// table changes when the cost is paid, not what plays.
#[test]
fn the_table_holds_what_the_voicing_designs() {
    let t = std::time::Instant::now();
    let d = Designs::new(FS);
    println!(
        "88 keys designed in {:?}; {} have a cascade",
        t.elapsed(),
        d.designed()
    );
    for key in [21_u8, 48, 60, 84] {
        assert_eq!(
            d.get(key),
            voicing(key, true).design(FS, frequency(key)).as_ref(),
            "MIDI {key}"
        );
        assert!(d.get(key).is_some(), "MIDI {key} has a cascade");
    }
    assert!(d.get(20).is_none() && d.get(109).is_none());
    assert!(
        voicing(60, false).design(FS, frequency(60)).is_none(),
        "no stiffness, no cascade"
    );
}
