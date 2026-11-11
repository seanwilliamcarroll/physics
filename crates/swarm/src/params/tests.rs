use super::{Arena, Params};

#[test]
fn the_published_values_are_usable() {
    assert_eq!(Params::ECE4760.checked(), Some(Params::ECE4760));
}

#[test]
fn unusable_values_are_refused() {
    let p = Params::ECE4760;
    let bad = [
        Params {
            visual_range: f32::NAN,
            ..p
        },
        Params {
            protected_range: 40.0,
            ..p
        },
        Params {
            protected_range: -1.0,
            ..p
        },
        Params {
            centering: f32::INFINITY,
            ..p
        },
        Params { avoid: -0.1, ..p },
        Params {
            min_speed: 0.0,
            ..p
        },
        Params {
            min_speed: 7.0,
            ..p
        },
        Params { margin: -1.0, ..p },
    ];
    for b in bad {
        assert_eq!(b.checked(), None, "{b:?}");
    }
    // Equal speeds (a constant-speed flock, as Vicsek's) are fine.
    assert!(
        Params {
            min_speed: 4.0,
            max_speed: 4.0,
            ..p
        }
        .checked()
        .is_some()
    );
}

#[test]
fn an_arena_needs_two_positive_sides() {
    assert!(Arena::new(1280.0, 720.0).is_some());
    for (w, h) in [
        (0.0, 1.0),
        (1.0, -1.0),
        (f32::NAN, 1.0),
        (1.0, f32::INFINITY),
    ] {
        assert_eq!(Arena::new(w, h), None);
    }
}
