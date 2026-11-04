use super::Waveguide;
use crate::{Decay, KsString, Scalar, Voicing};

const FS: f64 = 48_000.0;

#[expect(clippy::cast_precision_loss, reason = "a 16-bit value, exact")]
fn hash_noise(i: usize) -> f64 {
    let h = (i.wrapping_mul(2_654_435_761) >> 7) & 0xffff;
    h as f64 / 32768.0 - 1.0
}

/// Karplus–Strong is the waveguide's special case (`docs/13-waveguide.md`):
/// started from a loop's state, the waveguide's bridge output is the
/// loop's output, bit for bit, for odd and even loops, tuned and not.
fn reproduces_the_loop<S: Scalar>() {
    for (f0, tuned) in [
        (220.0, true),
        (440.0, false),
        (261.63, true),
        (1000.0, true),
        (55.0, false),
    ] {
        let voicing = Voicing {
            tuned,
            decay: Decay::T60(1.5),
        };
        let mut ks = KsString::<S>::new(FS, f0, voicing).unwrap();
        ks.pluck(|i, _| S::from_f64(hash_noise(i)));
        let mut wg = Waveguide::<S>::new(FS, f0, voicing).unwrap();
        assert_eq!(wg.delay(), ks.delay(), "{f0}: the same loop length");
        let state: Vec<S> = ks.samples().collect();
        wg.load_loop(&state);
        for n in 0..20_000 {
            let (a, b) = (ks.next_sample(), wg.step());
            assert!(
                a.to_f64().to_bits() == b.to_f64().to_bits(),
                "{} {f0} Hz (N = {}): sample {n}: {a:?} vs {b:?}",
                core::any::type_name::<S>(),
                ks.delay()
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
    let lossless = Voicing {
        tuned: false,
        decay: Decay::Loss(1.0),
    };
    // 48000 / 440 = 109.09: N = 109 (odd); 48000 / 400 = 120: N = 120.
    let odd = Waveguide::<f64>::new(FS, 440.0, lossless).unwrap();
    assert_eq!((odd.delay(), odd.rail()), (109, 54));
    let even = Waveguide::<f64>::new(FS, 400.0, lossless).unwrap();
    assert_eq!((even.delay(), even.rail()), (120, 60));
}

#[test]
fn a_pluck_puts_its_shape_on_the_string_split_between_the_rails() {
    let lossless = Voicing {
        tuned: false,
        decay: Decay::Loss(1.0),
    };
    let mut wg = Waveguide::<f64>::new(FS, 400.0, lossless).unwrap();
    // A triangle peaked a quarter of the way from the bridge.
    wg.pluck(|s| if s < 0.25 { s / 0.25 } else { (1.0 - s) / 0.75 });
    let shape: Vec<f64> = wg.shape().collect();
    assert_eq!(shape.len(), 60);
    for (c, &y) in shape.iter().enumerate() {
        #[expect(clippy::cast_precision_loss, reason = "test sizes")]
        let s = (c as f64 + 0.5) / 60.0;
        let want = if s < 0.25 { s / 0.25 } else { (1.0 - s) / 0.75 };
        assert!((y - want).abs() < 1e-12, "cell {c}: {y} vs {want}");
    }
    // The pickup reads the same shape between cells (linearly).
    wg.set_pickup(0.25);
    let at = wg.displacement();
    assert!((at - 0.99).abs() < 0.02, "{at}");
}

#[test]
fn the_ends_reflect_inverted() {
    // One right-going pulse next to the bridge, lossless and untuned: it
    // comes back on the left rail upside down.
    let lossless = Voicing {
        tuned: false,
        decay: Decay::Loss(1.0),
    };
    let mut wg = Waveguide::<f64>::new(FS, 400.0, lossless).unwrap();
    wg.load_rails(&[1.0], &[]);
    let first = wg.step();
    // The classic average halves a lone pulse into two samples.
    assert!((first - 0.5).abs() < 1e-15, "{first}");
    assert!(wg.left_newest() < 0.0, "inverted at the bridge");
}
