use super::inharmonicity;

/// The doc's table (`docs/14-piano.md`), to the digits it gives.
#[test]
fn the_keyboard_matches_the_docs_table() {
    for (key, want) in [
        (21, 2.1e-4),
        (36, 6.7e-5),
        (48, 1.1e-4),
        (60, 3.1e-4),
        (69, 7.1e-4),
        (84, 2.9e-3),
        (108, 2.6e-2),
    ] {
        let got = inharmonicity(key);
        println!("MIDI {key}: B = {got:.3e}");
        assert!(
            (got / want - 1.0).abs() < 0.05,
            "MIDI {key}: {got} vs {want}"
        );
    }
}

#[test]
fn lowest_in_the_tenor() {
    // Falling through the bass, rising through the treble: the minimum
    // sits between the lines' crossing (C2) and the treble's rise.
    let lowest_key = (21..=108)
        .min_by(|&first, &second| inharmonicity(first).total_cmp(&inharmonicity(second)))
        .unwrap();
    println!("minimum at MIDI {lowest_key}");
    assert!((33..=45).contains(&lowest_key), "{lowest_key}");
}
