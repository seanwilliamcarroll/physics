use super::{BACKGROUND, SwarmDemo, heading_index, hue};
use crate::abi;
use swarm::{Neighbours, Params};

#[test]
fn sizes_are_checked() {
    assert!(SwarmDemo::new(100, 640, 480, 2, 1).is_some());
    for (boid_count, width, height, scale) in
        [(0, 640, 480, 2), (100, 640, 480, 0), (100, 1, 480, 2)]
    {
        assert!(
            SwarmDemo::new(boid_count, width, height, scale, 1).is_none(),
            "{boid_count} {width} {height} {scale}"
        );
    }
    let demo = SwarmDemo::new(100, 641, 480, 2, 1).unwrap();
    assert_eq!(demo.view(), (320, 240));
}

#[test]
fn render_draws_each_boid_on_the_background() {
    let mut demo = SwarmDemo::new(50, 400, 300, 2, 3).unwrap();
    let pixels = demo.render().to_vec();
    assert_eq!(pixels.len(), 200 * 150);
    let drawn = pixels.iter().filter(|&&pixel| pixel != BACKGROUND).count();
    // 50 dots of 2 × 2, some overlapping: at most 200 pixels.
    assert!(drawn > 50 && drawn <= 200, "{drawn}");
    assert!(pixels.iter().all(|&pixel| pixel >> 24 == 0xff), "opaque");
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
        let angle = f64::from(deg).to_radians();
        #[expect(clippy::cast_possible_truncation, reason = "test angles")]
        let index = heading_index(angle.cos() as f32, angle.sin() as f32);
        assert!(index >= last, "{deg}°: {index} after {last}");
        last = index;
    }
    assert!(last <= 255);
}

#[test]
fn hues_are_bright_and_distinct() {
    // Red at 0, green a third round, blue two thirds: the strongest
    // channel is the expected one.
    let channel = |colour: u32, index: u32| (colour >> (8 * index)) & 0xff;
    let (red, green, blue) = (hue(0.0), hue(1.0 / 3.0), hue(2.0 / 3.0));
    assert!(channel(red, 0) > channel(red, 1) && channel(red, 0) > channel(red, 2));
    assert!(channel(green, 1) > channel(green, 0) && channel(green, 1) > channel(green, 2));
    assert!(channel(blue, 2) > channel(blue, 0) && channel(blue, 2) > channel(blue, 1));
    assert_eq!(channel(red, 0), 242, "value 0.95");
}

#[test]
fn params_round_trip_and_are_checked() {
    let mut demo = SwarmDemo::new(10, 640, 480, 2, 1).unwrap();
    assert_eq!(demo.param(abi::PARAM_VISUAL_RANGE), Some(40.0));
    assert_eq!(demo.param(abi::PARAM_MAX_SPEED), Some(6.0));
    assert_eq!(demo.param(abi::PARAM_COUNT), None);
    assert!(demo.set_param(abi::PARAM_AVOID, 0.1));
    assert!((demo.param(abi::PARAM_AVOID).unwrap() - 0.1).abs() < 1e-7);
    // Protected past visual: refused, nothing changed.
    assert!(!demo.set_param(abi::PARAM_PROTECTED_RANGE, 50.0));
    assert_eq!(
        demo.flock().params().protected_range,
        Params::ECE4760.protected_range
    );
    assert!(!demo.set_param(abi::PARAM_TURN, f64::NAN));
    assert!(!demo.set_param(99, 1.0));
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
    let mut demo = SwarmDemo::new(20, 640, 480, 2, 1).unwrap();
    assert_eq!(demo.advance(0.2), 12);
    demo.clock()
        .set_rate(core::num::NonZeroU32::new(10).unwrap());
    assert_eq!(demo.advance(0.2), 2);
    demo.clock().set_cap(core::num::NonZeroU32::new(1));
    assert_eq!(demo.advance(0.25), 1);
    assert!(demo.set_predator(Some((320.0, 240.0))));
    assert_eq!(demo.flock().predator(), Some((320.0, 240.0)));
    assert!(!demo.set_predator(Some((f64::NAN, 0.0))));
    assert!(demo.set_predator(None));
}

#[test]
fn hues_change_smoothly_all_the_way_round() {
    // Each channel moves at most (0.95 − 0.3325) · 255 ≈ 157 over a sixth
    // of a turn: under 2 a step at 600 steps a turn. A wrong arm or a
    // wrong term in one is a jump.
    let byte_of = |colour: u32, channel: u32| i64::from((colour >> (8 * channel)) & 0xff);
    let mut last = hue(0.0);
    for turn in 1..=600_u32 {
        let colour = hue(f64::from(turn) / 600.0);
        for channel in 0..3 {
            let step = (byte_of(colour, channel) - byte_of(last, channel)).abs();
            assert!(
                step <= 2,
                "turn {turn}/600, channel {channel}: a jump of {step}"
            );
        }
        last = colour;
    }
    assert_eq!(last, hue(0.0), "a whole turn comes back to red");
    assert_eq!(hue(0.0), 0xff55_55f2, "value 0.95, saturation 0.65");
}

#[test]
fn diagonals_fall_halfway_between_the_axes() {
    let at = |x: f32, y: f32| heading_index(x, y);
    assert_eq!(
        [at(1.0, 1.0), at(-1.0, 1.0), at(-1.0, -1.0), at(1.0, -1.0)],
        [32, 96, 160, 224]
    );
}

#[test]
fn a_boid_is_drawn_where_it_is_in_its_heading_s_colour() {
    let mut demo = SwarmDemo::new(1, 400, 300, 2, 7).unwrap();
    let boid = demo.flock.boids().next().unwrap();
    let colour = demo.hues[heading_index(boid.vx, boid.vy)];
    let (x0, y0) = (
        f64::from(boid.x / 2.0).floor(),
        f64::from(boid.y / 2.0).floor(),
    );
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "a pixel inside the view"
    )]
    let (x0, y0) = (x0 as usize, y0 as usize);
    let pixels = demo.render().to_vec();
    for y in 0..150 {
        for x in 0..200 {
            let inside = (x0..x0 + 2).contains(&x) && (y0..y0 + 2).contains(&y);
            let want = if inside { colour } else { BACKGROUND };
            assert_eq!(
                pixels[y * 200 + x],
                want,
                "({x}, {y}); the boid at ({x0}, {y0})"
            );
        }
    }
}

#[test]
fn brute_force_is_allowed_up_to_the_limit_itself() {
    let boid_count = usize::try_from(abi::MAX_BRUTE).unwrap();
    let mut demo = SwarmDemo::new(boid_count, 2000, 2000, 1, 1).unwrap();
    assert!(demo.set_neighbours(Neighbours::Brute));
}
