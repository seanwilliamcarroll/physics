use super::{Arena, Params};

#[test]
fn the_published_values_are_usable() {
    assert_eq!(Params::ECE4760.checked(), Some(Params::ECE4760));
}

#[test]
fn unusable_values_are_refused() {
    let published = Params::ECE4760;
    let unusable = [
        Params {
            visual_range: f32::NAN,
            ..published
        },
        Params {
            protected_range: 40.0,
            ..published
        },
        Params {
            protected_range: -1.0,
            ..published
        },
        Params {
            centering: f32::INFINITY,
            ..published
        },
        Params {
            avoid: -0.1,
            ..published
        },
        Params {
            min_speed: 0.0,
            ..published
        },
        Params {
            min_speed: 7.0,
            ..published
        },
        Params {
            margin: -1.0,
            ..published
        },
    ];
    for params in unusable {
        assert_eq!(params.checked(), None, "{params:?}");
    }
    // Equal speeds (a constant-speed flock, as Vicsek's) are fine.
    assert!(
        Params {
            min_speed: 4.0,
            max_speed: 4.0,
            ..published
        }
        .checked()
        .is_some()
    );
}

#[test]
fn an_arena_needs_two_positive_sides() {
    assert!(Arena::new(1280.0, 720.0).is_some());
    for (width, height) in [
        (0.0, 1.0),
        (1.0, -1.0),
        (f32::NAN, 1.0),
        (1.0, f32::INFINITY),
    ] {
        assert_eq!(Arena::new(width, height), None);
    }
}
