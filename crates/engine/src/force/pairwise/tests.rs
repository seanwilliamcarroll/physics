use super::knobs::{
    DEFAULT_PLAIN_BELOW, LANES, LOOP, PLAIN_BELOW, PairLoop, lanes, pair_loop, plain_below,
};
use super::{PairwiseGravity, plain};
use crate::force::Force;
use crate::params::kg;
use crate::{Particles, Scalar, Softening, Vec2};

/// A world of `n` bodies from a fixed seed: positions in a 10 m box,
/// masses 1e9 to 1e10 kg, every seventh body static, and (from 3 up)
/// body 2 on top of body 1, so unsoftened gravity meets 0/0.
fn world<S: Scalar>(n: usize, seed: u64) -> Particles<S> {
    let mut state = seed;
    let mut next = move || {
        // A 64-bit LCG (Knuth's MMIX constants): enough for test data.
        state = state
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1_442_695_040_888_963_407);
        S::from_f64(f64::from(u32::try_from(state >> 40).unwrap()) / f64::from(1_u32 << 24))
    };
    let mut p = Particles::new();
    let mut first = Vec2::ZERO;
    for k in 0..n {
        let mut x = Vec2::new(next() * S::from_f64(10.0), next() * S::from_f64(10.0));
        if k == 1 {
            first = x;
        }
        if k == 2 {
            x = first;
        }
        if k % 7 == 6 {
            p.add_static(x);
        } else {
            let m = 1.0e9 + next().to_f64() * 9.0e9;
            p.add(x, Vec2::ZERO, kg(m));
        }
    }
    p
}

/// Starting accelerations that aren't zero, so adding into them is tested.
fn start<S: Scalar>(n: usize) -> Vec<Vec2<S>> {
    (0..n)
        .map(|k| {
            Vec2::new(S::from_f64(0.25), S::from_f64(-0.5))
                * S::from_f64(f64::from(u32::try_from(k).unwrap()))
        })
        .collect()
}

fn with<S: Scalar>(g: &PairwiseGravity<S>, pair_loop: PairLoop, p: &Particles<S>) -> Vec<Vec2<S>> {
    let mut acc = start(p.len());
    g.accumulate_with(pair_loop, p, &mut acc);
    acc
}

/// Sizes around every block boundary up to a few blocks, then longer runs.
fn sizes() -> impl Iterator<Item = usize> {
    (1..=40).chain([LANES * 4 - 1, LANES * 4, LANES * 4 + 1, 200])
}

/// The exact value (`to_f64` is lossless), as bits.
fn bits<S: Scalar>(v: S) -> u64 {
    v.to_f64().to_bits()
}

fn loops_agree<S: Scalar>() {
    for softening in [0.0, 0.05] {
        let g = PairwiseGravity::new(
            S::from_f64(6.674e-11),
            Softening::new(S::from_f64(softening)).unwrap(),
        );
        for n in sizes() {
            let p = world::<S>(n, 7 + n as u64);
            let (two, blocked) = (
                with(&g, PairLoop::TwoPass, &p),
                with(&g, PairLoop::Blocked, &p),
            );
            for (k, (a, b)) in two.iter().zip(&blocked).enumerate() {
                assert!(
                    bits(a.x) == bits(b.x) && bits(a.y) == bits(b.y),
                    "n {n}, ε {softening}, body {k}: two-pass {a:?}, blocked {b:?}"
                );
            }
        }
    }
}

#[test]
fn the_two_loops_give_identical_bits_f64() {
    loops_agree::<f64>();
}

#[test]
fn the_two_loops_give_identical_bits_f32() {
    loops_agree::<f32>();
}

/// The lanes reorder body i's sum, so the vector loops differ from the
/// plain one in the last bits only.
#[test]
fn the_vector_loops_match_the_plain_loop_to_rounding() {
    let g = PairwiseGravity::new(6.674e-11, Softening::new(0.05).unwrap());
    for n in sizes() {
        let p = world::<f64>(n, 11 + n as u64);
        let mut reference = start(n);
        plain::accumulate(&g, &p, &mut reference);
        let scale = reference
            .iter()
            .map(|a| a.length())
            .fold(0.0, f64::max)
            .max(1.0);
        for pair_loop in [PairLoop::TwoPass, PairLoop::Blocked] {
            for (k, (a, r)) in with(&g, pair_loop, &p).iter().zip(&reference).enumerate() {
                assert!(
                    (*a - *r).length() <= 1e-12 * scale,
                    "n {n}, {pair_loop:?}, body {k}: {a:?} vs plain {r:?}"
                );
            }
        }
    }
}

#[test]
fn the_knobs_parse_and_default() {
    assert_eq!(lanes(None), 16);
    assert_eq!(lanes(Some("1")), 1);
    assert_eq!(lanes(Some("64")), 64);
    assert_eq!(plain_below(None), DEFAULT_PLAIN_BELOW);
    assert_eq!(plain_below(Some("96")), 96);
    assert_eq!(pair_loop(None), PairLoop::TwoPass);
    assert_eq!(pair_loop(Some("two-pass")), PairLoop::TwoPass);
    assert_eq!(pair_loop(Some("blocked")), PairLoop::Blocked);
}

#[test]
#[should_panic(expected = "not a power of two")]
fn lanes_must_be_a_power_of_two() {
    lanes(Some("12"));
}

#[test]
#[should_panic(expected = "GRAVITY_PLAIN_BELOW: not a number")]
fn plain_below_must_be_a_number() {
    plain_below(Some(""));
}

#[test]
#[should_panic(expected = "at most 64")]
fn lanes_are_at_most_64() {
    lanes(Some("128"));
}

#[test]
#[should_panic(expected = "not a number")]
fn lanes_must_be_a_number() {
    lanes(Some("8x"));
}

#[test]
#[should_panic(expected = "`two-pass` or `blocked`")]
fn the_loop_must_be_one_of_the_two() {
    pair_loop(Some("fast"));
}

/// The plain loop below `PLAIN_BELOW` bodies, the vector loop from it on:
/// at the threshold, bit for bit (the two differ in the last bits there,
/// which the test checks first, or it would prove nothing).
#[test]
fn the_plain_loop_runs_below_the_threshold_only() {
    // A build that moves the threshold far out (the sweeps') skips this:
    // n² pairs at a million bodies is no test.
    if PLAIN_BELOW < 2 || PLAIN_BELOW > 4096 {
        return;
    }
    let g = PairwiseGravity::new(6.674e-11, Softening::new(0.05).unwrap());
    for n in [PLAIN_BELOW - 1, PLAIN_BELOW] {
        let p = world::<f64>(n, 5);
        let mut plain_acc = start(n);
        plain::accumulate(&g, &p, &mut plain_acc);
        let vector = with(&g, LOOP, &p);
        let differ = plain_acc
            .iter()
            .zip(&vector)
            .any(|(a, b)| bits(a.x) != bits(b.x) || bits(a.y) != bits(b.y));
        assert!(
            differ,
            "n {n}: the two loops agree to the bit, so this can't tell them apart"
        );
        let mut acc = start(n);
        g.accumulate(&p, &mut acc);
        let expected = if n < PLAIN_BELOW { &plain_acc } else { &vector };
        for (k, (a, e)) in acc.iter().zip(expected).enumerate() {
            assert!(
                bits(a.x) == bits(e.x) && bits(a.y) == bits(e.y),
                "n {n}, body {k}: {a:?}, expected {e:?}"
            );
        }
    }
}

/// `number` takes up to a million; past it, a setting is refused, and a
/// long one stops early rather than overflowing.
#[test]
fn the_threshold_reaches_a_million() {
    assert_eq!(plain_below(Some("1000000")), 1_000_000);
}

#[test]
#[should_panic(expected = "GRAVITY_PLAIN_BELOW: not a number")]
fn the_threshold_stops_at_a_million() {
    plain_below(Some("1000001"));
}

#[test]
#[should_panic(expected = "GRAVITY_PLAIN_BELOW: not a number")]
fn a_long_threshold_is_refused_not_overflowed() {
    plain_below(Some("99999999999999999999999999"));
}
