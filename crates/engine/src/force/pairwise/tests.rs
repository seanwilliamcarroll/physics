use super::knobs::{lanes, pair_loop, plain_below};
use super::tuning::{F64_LANES, PairLoop, TUNING};
use super::{PairwiseGravity, plain};
use crate::force::Force;
use crate::params::kg;
use crate::{Particles, Scalar, Softening, Vec2};

/// A world of `body_count` bodies from a fixed seed: positions in a 10 m box,
/// masses 1e9 to 1e10 kg, every seventh body static, and (from 3 up)
/// body 2 on top of body 1, so unsoftened gravity meets 0/0.
fn world<S: Scalar>(body_count: usize, seed: u64) -> Particles<S> {
    let mut state = seed;
    let mut next = move || {
        state = state
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1_442_695_040_888_963_407);
        S::from_f64(f64::from(u32::try_from(state >> 40).unwrap()) / f64::from(1_u32 << 24))
    };
    let mut p = Particles::new();
    let mut first = Vec2::ZERO;
    for index in 0..body_count {
        let mut position = Vec2::new(next() * S::from_f64(10.0), next() * S::from_f64(10.0));
        if index == 1 {
            first = position;
        }
        if index == 2 {
            position = first;
        }
        if index % 7 == 6 {
            p.add_static(position);
        } else {
            let mass = 1.0e9 + next().to_f64() * 9.0e9;
            p.add(position, Vec2::ZERO, kg(mass));
        }
    }
    p
}

fn start<S: Scalar>(body_count: usize) -> Vec<Vec2<S>> {
    (0..body_count)
        .map(|index| {
            Vec2::new(S::from_f64(0.25), S::from_f64(-0.5))
                * S::from_f64(f64::from(u32::try_from(index).unwrap()))
        })
        .collect()
}

fn with<S: Scalar, const L: usize>(
    gravity: &PairwiseGravity<S>,
    pair_loop: PairLoop,
    particles: &Particles<S>,
) -> Vec<Vec2<S>> {
    let mut accelerations = start(particles.len());
    gravity.accumulate_with::<L>(pair_loop, particles, &mut accelerations);
    accelerations
}

fn sizes<const L: usize>() -> impl Iterator<Item = usize> {
    (1..=40).chain([L * 4 - 1, L * 4, L * 4 + 1, 200])
}

fn bits<S: Scalar>(v: S) -> u64 {
    v.to_f64().to_bits()
}

/// The lanes reorder body i's sum, so the vector loops differ from the
/// plain one in the last bits only: both loops, at every lane count a
/// target uses, softened and not (unsoftened, bodies 1 and 2 coincide:
/// 0/0, which every loop must skip). Within `rel` of the largest
/// acceleration: rounding, not a wrong term. The two loops aren't
/// compared bit for bit, so either can be retuned on its own.
fn match_plain<S: Scalar, const L: usize>(rel: f64) {
    for softening in [0.0, 0.05] {
        let g = PairwiseGravity::new(
            S::from_f64(6.674e-11),
            Softening::new(S::from_f64(softening)).unwrap(),
        );
        for n in sizes::<L>() {
            let p = world::<S>(n, 11 + n as u64);
            let mut reference = start(n);
            plain::accumulate(&g, &p, &mut reference);
            let scale = reference
                .iter()
                .map(|a| a.length().to_f64())
                .fold(0.0, f64::max)
                .max(1.0);
            for pair_loop in [PairLoop::TwoPass, PairLoop::Blocked] {
                let got = with::<S, L>(&g, pair_loop, &p);
                for (k, (a, r)) in got.iter().zip(&reference).enumerate() {
                    assert!(
                        (*a - *r).length().to_f64() <= rel * scale,
                        "{L} lanes, n {n}, ε {softening}, {pair_loop:?}, body {k}: {a:?} vs plain {r:?}"
                    );
                }
            }
        }
    }
}

#[test]
fn the_vector_loops_match_the_plain_loop_to_rounding_f64() {
    match_plain::<f64, 1>(1e-12);
    match_plain::<f64, 4>(1e-12);
    match_plain::<f64, 8>(1e-12);
    match_plain::<f64, 16>(1e-12);
}

#[test]
fn the_vector_loops_match_the_plain_loop_to_rounding_f32() {
    match_plain::<f32, 1>(F32_REL);
    match_plain::<f32, 4>(F32_REL);
    match_plain::<f32, 8>(F32_REL);
    match_plain::<f32, 16>(F32_REL);
}

/// f32's: about 100 ulps of the largest acceleration, for sums of up to
/// 200 terms.
const F32_REL: f64 = 1e-5;

#[test]
fn the_settings_parse_and_unset_leaves_the_target_s() {
    assert_eq!(lanes(None), None);
    assert_eq!(lanes(Some("1")), Some(1));
    assert_eq!(lanes(Some("64")), Some(64));
    assert_eq!(plain_below(None), None);
    assert_eq!(plain_below(Some("96")), Some(96));
    assert_eq!(pair_loop(None), None);
    assert_eq!(pair_loop(Some("two-pass")), Some(PairLoop::TwoPass));
    assert_eq!(pair_loop(Some("blocked")), Some(PairLoop::Blocked));
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

/// The plain loop below the threshold, the target's `f64` kernel from it
/// on: at the threshold, bit for bit. Where the two give identical bits
/// there (a one-lane kernel adds in the plain loop's order), which ran
/// can't be told and doesn't matter.
#[test]
fn the_plain_loop_runs_below_the_threshold_only() {
    let below = TUNING.plain_below;
    // A build that moves the threshold far out (the sweeps') skips this:
    // n² pairs at a million bodies is no test.
    if !(2..=4096).contains(&below) {
        return;
    }
    let g = PairwiseGravity::new(6.674e-11, Softening::new(0.05).unwrap());
    for n in [below - 1, below] {
        let p = world::<f64>(n, 5);
        let mut plain_acc = start(n);
        plain::accumulate(&g, &p, &mut plain_acc);
        let vector = with::<f64, F64_LANES>(&g, TUNING.f64.pair_loop, &p);
        let mut acc = start(n);
        g.accumulate(&p, &mut acc);
        let expected = if n < below { &plain_acc } else { &vector };
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
    assert_eq!(plain_below(Some("1000000")), Some(1_000_000));
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
