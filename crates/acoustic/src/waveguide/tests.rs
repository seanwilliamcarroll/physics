use super::Waveguide;
use crate::test_util::hash_noise;
use crate::{Decay, KsString, Scalar, Voicing};

const SAMPLE_RATE: f64 = 48_000.0;

fn lossless_untuned() -> Voicing {
    Voicing {
        tuned: false,
        decay: Decay::Loss(1.0),
        inharmonicity: 0.0,
    }
}

/// Karplus–Strong is the waveguide's special case (`docs/13-waveguide.md`):
/// from a loop's state the outputs agree (bound 1e-12; in fact bit for bit).
fn reproduces_the_loop<S: Scalar>() {
    for (fundamental_hz, tuned) in [
        (220.0, true),
        (440.0, false),
        (261.63, true),
        (1000.0, true),
        (55.0, false),
    ] {
        let voicing = Voicing {
            tuned,
            decay: Decay::T60(1.5),
            inharmonicity: 0.0,
        };
        let mut karplus = KsString::<S>::new(SAMPLE_RATE, fundamental_hz, voicing).unwrap();
        karplus.pluck(|index, _| S::from_f64(hash_noise(index)));
        let mut waveguide = Waveguide::<S>::new(SAMPLE_RATE, fundamental_hz, voicing).unwrap();
        assert_eq!(
            waveguide.delay(),
            karplus.delay(),
            "{fundamental_hz}: the same loop length"
        );
        let state: Vec<S> = karplus.samples().collect();
        waveguide.load_loop(&state);
        for sample_number in 0..20_000 {
            let (expected, actual) = (karplus.next_sample(), waveguide.step());
            assert!(
                (expected.to_f64() - actual.to_f64()).abs() <= 1e-12,
                "{} {fundamental_hz} Hz (N = {}): sample {sample_number}: {expected:?} vs {actual:?}",
                core::any::type_name::<S>(),
                karplus.delay()
            );
        }
    }
}

#[test]
fn reproduces_the_loop_f64() {
    reproduces_the_loop::<f64>();
}

#[test]
fn reproduces_the_loop_f32() {
    reproduces_the_loop::<f32>();
}

#[test]
fn odd_and_even_loops_split_their_rails() {
    let lossless = lossless_untuned();
    // 48000 / 440 = 109.09: N = 109 (odd); 48000 / 400 = 120: N = 120.
    let odd = Waveguide::<f64>::new(SAMPLE_RATE, 440.0, lossless).unwrap();
    assert_eq!((odd.delay(), odd.rail()), (109, 54));
    let even = Waveguide::<f64>::new(SAMPLE_RATE, 400.0, lossless).unwrap();
    assert_eq!((even.delay(), even.rail()), (120, 60));
}

#[test]
fn a_pluck_puts_its_shape_on_the_string_split_between_the_rails() {
    let mut waveguide = Waveguide::<f64>::new(SAMPLE_RATE, 400.0, lossless_untuned()).unwrap();
    waveguide.pluck(|position| {
        if position < 0.25 {
            position / 0.25
        } else {
            (1.0 - position) / 0.75
        }
    });
    let shape: Vec<f64> = waveguide.shape().collect();
    assert_eq!(shape.len(), 60);
    for (cell, &value) in shape.iter().enumerate() {
        let position = waveguide.position(cell);
        let want = if position < 0.25 {
            position / 0.25
        } else {
            (1.0 - position) / 0.75
        };
        assert!(
            (value - want).abs() < 1e-12,
            "cell {cell}: {value} vs {want}"
        );
    }
    waveguide.set_pickup(0.25);
    let at_pickup = waveguide.displacement();
    assert!((at_pickup - 0.99).abs() < 0.02, "{at_pickup}");
}

#[test]
fn the_ends_reflect_inverted() {
    let mut waveguide = Waveguide::<f64>::new(SAMPLE_RATE, 400.0, lossless_untuned()).unwrap();
    waveguide.load_rails(&[1.0], &[]);
    let first = waveguide.step();
    // The classic average halves a lone pulse into two samples.
    assert!((first - 0.5).abs() < 1e-15, "{first}");
    assert!(waveguide.left_newest() < 0.0, "inverted at the bridge");
}

#[test]
fn positions_span_the_effective_length() {
    // N = 120 plus the average's half sample: 60.25 cells, cell 0 at 0.75.
    let waveguide = Waveguide::<f64>::new(SAMPLE_RATE, 400.0, lossless_untuned()).unwrap();
    let length = SAMPLE_RATE / (2.0 * waveguide.pitch());
    assert!((length - 60.25).abs() < 1e-12, "{length}");
    assert!((waveguide.position(0) - 0.75 / 60.25).abs() < 1e-12);
    assert!(
        (waveguide.position(59) - 59.75 / 60.25).abs() < 1e-12,
        "the last cell's center is half a cell from the nut"
    );
}

#[test]
fn a_random_pluck_starts_at_rest() {
    let mut waveguide = Waveguide::<f64>::new(SAMPLE_RATE, 440.0, lossless_untuned()).unwrap();
    let mut draws = 0;
    waveguide.pluck(|_| {
        draws += 1;
        hash_noise(draws)
    });
    for cell in 0..waveguide.rail() {
        let (right, left) = waveguide.rails_at(cell);
        assert!(
            right.to_bits() == left.to_bits(),
            "cell {cell}: {right} vs {left}"
        );
    }
}

fn guide(fundamental_hz: f64) -> Waveguide<f64> {
    let voicing = Voicing {
        tuned: true,
        decay: Decay::T60(1.5),
        inharmonicity: 0.0,
    };
    Waveguide::new(SAMPLE_RATE, fundamental_hz, voicing).unwrap()
}

#[test]
fn the_pickup_reads_between_cells_linearly() {
    let mut guide = guide(220.0);
    let rail_length = guide.right.len();
    // Cell c holds c, so the pickup reads its own cell coordinate.
    let ramp: Vec<f64> = (0..rail_length).map(math::convert::usize_to_f64).collect();
    guide.load_rails(&ramp, &vec![0.0; rail_length]);
    for x in [3.0, 3.5, 10.25] {
        guide.set_pickup((x + guide.first_cell_offset) / guide.length);
        assert!(
            (guide.displacement() - x).abs() < 1e-9,
            "at {x}: {}",
            guide.displacement()
        );
    }
    // Past the outer centers it clamps onto the end cells.
    let last = math::convert::usize_to_f64(rail_length - 1);
    for (pickup, cell_value) in [(0.0, 0.0), (1.0, last)] {
        guide.set_pickup(pickup);
        assert!(
            (guide.displacement() - cell_value).abs() < 1e-9,
            "pickup {pickup}: {}",
            guide.displacement()
        );
    }
}

#[test]
fn restringing_refuses_a_note_too_long_for_the_rails() {
    let voicing = Voicing {
        tuned: true,
        decay: Decay::T60(1.5),
        inharmonicity: 0.0,
    };
    let mut guide = guide(220.0);
    assert!(guide.restring(SAMPLE_RATE, 440.0, voicing), "shorter fits");
    assert!(
        !guide.restring(SAMPLE_RATE, 110.0, voicing),
        "longer than the rails were made for"
    );
    // (`rail_length > 0` is defensive: coefficients refuse loops under 2.)
}

#[test]
fn geometry_falls_back_for_a_pitch_that_isnt_positive_and_finite() {
    for pitch in [0.0, -220.0, f64::NAN, f64::INFINITY] {
        assert_eq!(
            super::geometry(SAMPLE_RATE, pitch, 10),
            (10.0, 0.5),
            "{pitch}"
        );
    }
    let (length, first_cell_offset) = super::geometry(SAMPLE_RATE, 240.0, 99);
    assert_eq!((length, first_cell_offset), (100.0, 1.5));
}

fn hammer() -> crate::hammer::Hammer {
    let key = 57;
    crate::hammer::Hammer::new(
        crate::hammer::felt(key).unwrap(),
        crate::hammer::impedance(key),
        SAMPLE_RATE,
        1.58,
    )
    .unwrap()
}

#[test]
fn a_strike_lands_on_the_junction_nearest_its_point() {
    let mut guide = guide(220.0);
    let rail_length = guide.right.len();
    for cell in [0, 3, rail_length / 2, rail_length - 2] {
        let position =
            (math::convert::usize_to_f64(cell) + 0.5 + guide.first_cell_offset) / guide.length;
        assert!(guide.strike(hammer(), position));
        assert_eq!(
            guide
                .hammer
                .as_ref()
                .map(|(_, junction_cell)| *junction_cell),
            Some(cell),
            "aimed at junction {cell}"
        );
    }
    // 0.4 of a cell either side is still that junction (exact aim leaves
    // half a cell of slack, enough to hide a shifted offset).
    for cell in [3, rail_length / 2] {
        for shift in [-0.4, 0.4] {
            let position =
                (math::convert::usize_to_f64(cell) + 0.5 + shift + guide.first_cell_offset)
                    / guide.length;
            assert!(guide.strike(hammer(), position));
            assert_eq!(
                guide
                    .hammer
                    .as_ref()
                    .map(|(_, junction_cell)| *junction_cell),
                Some(cell),
                "junction {cell}, {shift:+}"
            );
        }
    }
    for (position, cell) in [(0.0, 0), (1.0, rail_length - 2)] {
        assert!(guide.strike(hammer(), position));
        assert_eq!(
            guide
                .hammer
                .as_ref()
                .map(|(_, junction_cell)| *junction_cell),
            Some(cell),
            "position = {position}"
        );
    }
}

#[test]
fn striking_a_ringing_string_silences_it_first() {
    let mut guide = guide(220.0);
    let rail_length = guide.right.len();
    guide.load_rails(&vec![0.5; rail_length], &vec![0.25; rail_length]);
    assert!(guide.strike(hammer(), 0.125));
    assert!(
        (0..rail_length).all(|cell| guide.rails_at(cell) == (0.0, 0.0)),
        "the old vibration is gone"
    );
}

#[test]
fn a_two_cell_rail_takes_a_strike_and_one_cell_doesnt() {
    // A junction needs two cells: 10 kHz has two at 48 kHz, 12 kHz one.
    let mut two = guide(10_000.0);
    assert_eq!(two.right.len(), 2);
    assert!(two.strike(hammer(), 0.125));
    let mut one = guide(12_000.0);
    assert_eq!(one.right.len(), 1);
    assert!(!one.strike(hammer(), 0.125));
}

#[test]
fn the_pickup_reads_a_straight_line_exactly_between_cells() {
    let mut waveguide = Waveguide::<f64>::new(SAMPLE_RATE, 400.0, lossless_untuned()).unwrap();
    waveguide.pluck(|position| position);
    let (first_position, last_position) = (waveguide.position(0), waveguide.position(59));
    for step in 0..=20 {
        let pickup = first_position + (last_position - first_position) * f64::from(step) / 20.0;
        waveguide.set_pickup(pickup);
        let got = waveguide.displacement();
        assert!((got - pickup).abs() < 1e-12, "pickup at {pickup}: {got}");
    }
}
