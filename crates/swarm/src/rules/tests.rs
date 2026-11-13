use super::{FLEE, PREDATOR_RANGE, clamp_speed, steer};
use crate::{Arena, Boid, Params};

const P: Params = Params::ECE4760;

fn arena() -> Arena {
    Arena::new(1000.0, 1000.0).unwrap()
}

fn boid(x: f32, y: f32, vx: f32, vy: f32) -> Boid {
    Boid { x, y, vx, vy }
}

/// Mid-arena, heading +x at 4 (inside the speed band, far from edges).
const ME: Boid = Boid {
    x: 500.0,
    y: 500.0,
    vx: 4.0,
    vy: 0.0,
};

#[test]
fn alone_a_boid_flies_straight() {
    assert_eq!(
        steer(&P, arena(), None, ME, core::iter::empty()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
    // Out of range (each axis, then the distance) is the same as alone.
    let far = [boid(540.0, 500.0, 0.0, 6.0), boid(530.0, 530.0, 0.0, 6.0)];
    assert_eq!(
        steer(&P, arena(), None, ME, far.into_iter()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
}

#[test]
fn a_neighbour_in_range_pulls_and_aligns() {
    // At (520, 500), moving (0, 4): 20 away, outside protected (8).
    let other = boid(520.0, 500.0, 0.0, 4.0);
    let b = steer(&P, arena(), None, ME, core::iter::once(other));
    // v += (520 − 500)·0.0005 + (0 − 4)·0.05 in x; (4 − 0)·0.05 in y.
    let (vx, vy) = (4.0 + 20.0 * 0.0005 - 4.0 * 0.05, 4.0 * 0.05);
    assert!(
        (b.vx - vx).abs() < 1e-6 && (b.vy - vy).abs() < 1e-6,
        "{b:?}"
    );
    assert_eq!(
        (b.x, b.y),
        (ME.x + b.vx, ME.y + b.vy),
        "moves by its new velocity"
    );
}

#[test]
fn a_crowding_neighbour_only_repels() {
    // 5 away (inside protected 8), moving fast across: no alignment, no
    // cohesion, just the push away: (500 − 505)·0.05 = −0.25 in x.
    let other = boid(505.0, 500.0, 0.0, 6.0);
    let b = steer(&P, arena(), None, ME, core::iter::once(other));
    assert!((b.vx - 3.75).abs() < 1e-6 && b.vy == 0.0, "{b:?}");
}

#[test]
fn past_the_margin_a_boid_turns_back() {
    // Near the left edge heading out: +turn in x; near the bottom: −turn
    // in y (y down).
    let b = steer(
        &P,
        arena(),
        None,
        boid(50.0, 950.0, -4.0, 0.0),
        core::iter::empty(),
    );
    assert!(
        (b.vx - (-4.0 + 0.2)).abs() < 1e-6 && (b.vy + 0.2).abs() < 1e-6,
        "{b:?}"
    );
    let b = steer(
        &P,
        arena(),
        None,
        boid(950.0, 50.0, 4.0, 0.0),
        core::iter::empty(),
    );
    assert!(
        (b.vx - 3.8).abs() < 1e-6 && (b.vy - 0.2).abs() < 1e-6,
        "{b:?}"
    );
}

#[test]
fn speeds_are_clamped_into_the_band() {
    let len = |(x, y): (f32, f32)| (x * x + y * y).sqrt();
    assert_eq!(clamp_speed(&P, (4.0, 0.0), (4.0, 0.0)), (4.0, 0.0));
    let slow = clamp_speed(&P, (0.3, 0.4), (4.0, 0.0));
    assert!((len(slow) - 3.0).abs() < 1e-6 && (slow.0 / slow.1 - 0.75).abs() < 1e-6);
    let fast = clamp_speed(&P, (30.0, 40.0), (4.0, 0.0));
    assert!((len(fast) - 6.0).abs() < 1e-6 && (fast.0 / fast.1 - 0.75).abs() < 1e-6);
}

#[test]
fn at_zero_speed_the_old_heading_is_kept() {
    // The terms cancelled the velocity: min speed along the old heading.
    assert_eq!(clamp_speed(&P, (0.0, 0.0), (0.0, -5.0)), (0.0, -3.0));
    // Never the case after a step (speeds start in the band), but defined.
    assert_eq!(clamp_speed(&P, (0.0, 0.0), (0.0, 0.0)), (3.0, 0.0));
}

#[test]
fn a_boid_flees_a_predator_in_range_only() {
    // Predator 50 behind (−x): steer toward +x at top speed, by FLEE.
    let b = steer(&P, arena(), Some((450.0, 500.0)), ME, core::iter::empty());
    let vx = 4.0 + (6.0 - 4.0) * FLEE;
    assert!((b.vx - vx).abs() < 1e-6 && b.vy == 0.0, "{b:?}");
    // Beside it (+y): pushed −y.
    let b = steer(&P, arena(), Some((500.0, 550.0)), ME, core::iter::empty());
    assert!(b.vy < 0.0, "{b:?}");
    // Out of range: unaffected.
    let far = Some((500.0 - PREDATOR_RANGE - 1.0, 500.0));
    assert_eq!(
        steer(&P, arena(), far, ME, core::iter::empty()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
}

// Found by the full mutation run of 2026-11-12: each limit's own value
// (the margin, the predator's range, a boid on the same spot), the flee
// with a velocity across it, and the zero-speed rescue off an axis.

#[test]
fn exactly_at_the_margin_a_boid_does_not_turn() {
    let m = P.margin;
    for at in [boid(m, m, 4.0, 0.0), boid(1000.0 - m, 1000.0 - m, 4.0, 0.0)] {
        let b = steer(&P, arena(), None, at, core::iter::empty());
        assert_eq!((b.vx, b.vy), (4.0, 0.0), "{at:?}");
    }
}

#[test]
fn a_predator_exactly_at_its_range_or_on_the_boid_is_ignored() {
    let at_range = Some((500.0 - PREDATOR_RANGE, 500.0));
    assert_eq!(
        steer(&P, arena(), at_range, ME, core::iter::empty()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
    // No direction to flee in (and no division by zero).
    assert_eq!(
        steer(&P, arena(), Some((500.0, 500.0)), ME, core::iter::empty()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
}

#[test]
fn fleeing_steers_both_components_toward_away_at_top_speed() {
    // Heading (3, 4) with the predator 50 to +y: "away at top speed" is
    // (0, −6), approached by FLEE of the difference.
    let me = boid(500.0, 500.0, 3.0, 4.0);
    let b = steer(&P, arena(), Some((500.0, 550.0)), me, core::iter::empty());
    let (vx, vy) = (3.0 + (0.0 - 3.0) * FLEE, 4.0 + (-6.0 - 4.0) * FLEE);
    assert!(
        (b.vx - vx).abs() < 1e-6 && (b.vy - vy).abs() < 1e-6,
        "{b:?}"
    );
}

#[test]
fn a_boid_on_the_same_spot_is_not_a_neighbour() {
    // Inside the protected range it pushes (by nothing: dx = dy = 0); it
    // is not counted for centering or matching.
    let twin = boid(500.0, 500.0, 0.0, 5.0);
    let b = steer(&P, arena(), None, ME, [twin].into_iter());
    assert_eq!(b, boid(504.0, 500.0, 4.0, 0.0));
}

#[test]
fn at_zero_speed_an_off_axis_heading_is_kept() {
    // (3, 4) is speed 5: min speed 3 along it.
    let (x, y) = clamp_speed(&P, (0.0, 0.0), (3.0, 4.0));
    assert!((x - 1.8).abs() < 1e-6 && (y - 2.4).abs() < 1e-6, "{x} {y}");
}
