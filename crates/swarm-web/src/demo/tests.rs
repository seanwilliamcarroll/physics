use super::{BACKGROUND, SwarmDemo, heading_index, hue};
use crate::abi;
use swarm::{Neighbours, Params};

#[test]
fn sizes_are_checked() {
    assert!(SwarmDemo::new(100, 640, 480, 2, 1).is_some());
    for (n, w, h, s) in [(0, 640, 480, 2), (100, 640, 480, 0), (100, 1, 480, 2)] {
        assert!(SwarmDemo::new(n, w, h, s, 1).is_none(), "{n} {w} {h} {s}");
    }
    let d = SwarmDemo::new(100, 641, 480, 2, 1).unwrap();
    assert_eq!(d.view(), (320, 240));
}

#[test]
fn render_draws_each_boid_on_the_background() {
    let mut d = SwarmDemo::new(50, 400, 300, 2, 3).unwrap();
    let px = d.render().to_vec();
    assert_eq!(px.len(), 200 * 150);
    let drawn = px.iter().filter(|&&p| p != BACKGROUND).count();
    // 50 dots of 2 × 2, some overlapping: at most 200 pixels.
    assert!(drawn > 50 && drawn <= 200, "{drawn}");
    assert!(px.iter().all(|&p| p >> 24 == 0xff), "opaque");
}

#[test]
fn headings_go_round_the_wheel_in_order() {
    // Axes exactly: 0, 64, 128, 192.
    assert_eq!(
        [
            heading_index(1.0, 0.0),
            heading_index(0.0, 1.0),
            heading_index(-1.0, 0.0),
            heading_index(0.0, -1.0)
        ],
        [0, 64, 128, 192]
    );
    // Monotone round the circle, sampled every degree.
    let mut last = 0;
    for deg in 0..360 {
        let a = f64::from(deg).to_radians();
        #[expect(clippy::cast_possible_truncation, reason = "test angles")]
        let k = heading_index(a.cos() as f32, a.sin() as f32);
        assert!(k >= last, "{deg}°: {k} after {last}");
        last = k;
    }
    assert!(last <= 255);
}

#[test]
fn hues_are_bright_and_distinct() {
    // Red at 0, green a third round, blue two thirds: the strongest
    // channel is the expected one.
    let ch = |c: u32, k: u32| (c >> (8 * k)) & 0xff;
    let (r, g, b) = (hue(0.0), hue(1.0 / 3.0), hue(2.0 / 3.0));
    assert!(ch(r, 0) > ch(r, 1) && ch(r, 0) > ch(r, 2));
    assert!(ch(g, 1) > ch(g, 0) && ch(g, 1) > ch(g, 2));
    assert!(ch(b, 2) > ch(b, 0) && ch(b, 2) > ch(b, 1));
    assert_eq!(ch(r, 0), 242, "value 0.95");
}

#[test]
fn params_round_trip_and_are_checked() {
    let mut d = SwarmDemo::new(10, 640, 480, 2, 1).unwrap();
    assert_eq!(d.param(abi::PARAM_VISUAL_RANGE), Some(40.0));
    assert_eq!(d.param(abi::PARAM_MAX_SPEED), Some(6.0));
    assert_eq!(d.param(abi::PARAM_COUNT), None);
    assert!(d.set_param(abi::PARAM_AVOID, 0.1));
    assert!((d.param(abi::PARAM_AVOID).unwrap() - 0.1).abs() < 1e-7);
    // Protected past visual: refused, nothing changed.
    assert!(!d.set_param(abi::PARAM_PROTECTED_RANGE, 50.0));
    assert_eq!(
        d.flock().params().protected_range,
        Params::ECE4760.protected_range
    );
    assert!(!d.set_param(abi::PARAM_TURN, f64::NAN));
    assert!(!d.set_param(99, 1.0));
}

#[test]
fn brute_force_is_refused_for_a_big_flock() {
    let mut big =
        SwarmDemo::new(usize::try_from(abi::MAX_BRUTE).unwrap() + 1, 640, 480, 2, 1).unwrap();
    assert!(!big.set_neighbours(Neighbours::Brute));
    assert!(big.set_neighbours(Neighbours::Grid));
    let mut small = SwarmDemo::new(100, 640, 480, 2, 1).unwrap();
    assert!(small.set_neighbours(Neighbours::Brute));
    assert_eq!(small.flock().neighbours(), Neighbours::Brute);
}

#[test]
fn advancing_steps_at_the_rate_with_the_cap_and_the_predator() {
    let mut d = SwarmDemo::new(20, 640, 480, 2, 1).unwrap();
    assert_eq!(d.advance(0.2), 12);
    d.clock().set_rate(core::num::NonZeroU32::new(10).unwrap());
    assert_eq!(d.advance(0.2), 2);
    d.clock().set_cap(core::num::NonZeroU32::new(1));
    assert_eq!(d.advance(0.25), 1);
    assert!(d.set_predator(Some((320.0, 240.0))));
    assert_eq!(d.flock().predator(), Some((320.0, 240.0)));
    assert!(!d.set_predator(Some((f64::NAN, 0.0))));
    assert!(d.set_predator(None));
}
