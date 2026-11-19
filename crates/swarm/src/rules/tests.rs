use super::knobs::Tail;
use super::{FLEE, PREDATOR_RANGE, Ranges, Seen, clamp_speed, steer};
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
    let steered = steer(&P, arena(), None, ME, core::iter::once(other));
    // v += (520 − 500)·0.0005 + (0 − 4)·0.05 in x; (4 − 0)·0.05 in y.
    let (vx, vy) = (4.0 + 20.0 * 0.0005 - 4.0 * 0.05, 4.0 * 0.05);
    assert!(
        (steered.vx - vx).abs() < 1e-6 && (steered.vy - vy).abs() < 1e-6,
        "{steered:?}"
    );
    assert_eq!(
        (steered.x, steered.y),
        (ME.x + steered.vx, ME.y + steered.vy),
        "moves by its new velocity"
    );
}

#[test]
fn a_crowding_neighbour_only_repels() {
    // 5 away (inside protected 8), moving fast across: no alignment, no
    // cohesion, just the push away: (500 − 505)·0.05 = −0.25 in x.
    let other = boid(505.0, 500.0, 0.0, 6.0);
    let steered = steer(&P, arena(), None, ME, core::iter::once(other));
    assert!(
        (steered.vx - 3.75).abs() < 1e-6 && steered.vy == 0.0,
        "{steered:?}"
    );
}

#[test]
fn past_the_margin_a_boid_turns_back() {
    // Near the left edge heading out: +turn in x; near the bottom: −turn
    // in y (y down).
    let steered = steer(
        &P,
        arena(),
        None,
        boid(50.0, 950.0, -4.0, 0.0),
        core::iter::empty(),
    );
    assert!(
        (steered.vx - (-4.0 + 0.2)).abs() < 1e-6 && (steered.vy + 0.2).abs() < 1e-6,
        "{steered:?}"
    );
    let steered = steer(
        &P,
        arena(),
        None,
        boid(950.0, 50.0, 4.0, 0.0),
        core::iter::empty(),
    );
    assert!(
        (steered.vx - 3.8).abs() < 1e-6 && (steered.vy - 0.2).abs() < 1e-6,
        "{steered:?}"
    );
}

#[test]
fn speeds_are_clamped_into_the_band() {
    let length = |(x, y): (f32, f32)| (x * x + y * y).sqrt();
    assert_eq!(clamp_speed(&P, (4.0, 0.0), (4.0, 0.0)), (4.0, 0.0));
    let slow = clamp_speed(&P, (0.3, 0.4), (4.0, 0.0));
    assert!((length(slow) - 3.0).abs() < 1e-6 && (slow.0 / slow.1 - 0.75).abs() < 1e-6);
    let fast = clamp_speed(&P, (30.0, 40.0), (4.0, 0.0));
    assert!((length(fast) - 6.0).abs() < 1e-6 && (fast.0 / fast.1 - 0.75).abs() < 1e-6);
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
    let steered = steer(&P, arena(), Some((450.0, 500.0)), ME, core::iter::empty());
    let vx = 4.0 + (6.0 - 4.0) * FLEE;
    assert!(
        (steered.vx - vx).abs() < 1e-6 && steered.vy == 0.0,
        "{steered:?}"
    );
    // Beside it (+y): pushed −y.
    let steered = steer(&P, arena(), Some((500.0, 550.0)), ME, core::iter::empty());
    assert!(steered.vy < 0.0, "{steered:?}");
    // Out of range: unaffected.
    let far = Some((500.0 - PREDATOR_RANGE - 1.0, 500.0));
    assert_eq!(
        steer(&P, arena(), far, ME, core::iter::empty()),
        boid(504.0, 500.0, 4.0, 0.0)
    );
}

// Limits: each limit's own value (the margin, the predator's range, a boid
// on the same spot), the flee with a velocity across it, and the
// zero-speed rescue off an axis.

#[test]
fn exactly_at_the_margin_a_boid_does_not_turn() {
    let margin = P.margin;
    for at in [
        boid(margin, margin, 4.0, 0.0),
        boid(1000.0 - margin, 1000.0 - margin, 4.0, 0.0),
    ] {
        let steered = steer(&P, arena(), None, at, core::iter::empty());
        assert_eq!((steered.vx, steered.vy), (4.0, 0.0), "{at:?}");
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
    let steered = steer(&P, arena(), Some((500.0, 550.0)), me, core::iter::empty());
    let (vx, vy) = (3.0 + (0.0 - 3.0) * FLEE, 4.0 + (-6.0 - 4.0) * FLEE);
    assert!(
        (steered.vx - vx).abs() < 1e-6 && (steered.vy - vy).abs() < 1e-6,
        "{steered:?}"
    );
}

#[test]
fn a_boid_on_the_same_spot_is_not_a_neighbour() {
    // Inside the protected range it pushes (by nothing: dx = dy = 0); it
    // is not counted for centering or matching.
    let twin = boid(500.0, 500.0, 0.0, 5.0);
    let steered = steer(&P, arena(), None, ME, [twin].into_iter());
    assert_eq!(steered, boid(504.0, 500.0, 4.0, 0.0));
}

#[test]
fn at_zero_speed_an_off_axis_heading_is_kept() {
    // (3, 4) is speed 5: min speed 3 along it.
    let (x, y) = clamp_speed(&P, (0.0, 0.0), (3.0, 4.0));
    assert!((x - 1.8).abs() < 1e-6 && (y - 2.4).abs() < 1e-6, "{x} {y}");
}

/// The masked form gives the same values as the branching one, for every
/// kind of candidate: too close, in range, out of range, and the boid
/// itself (at distance 0).
#[test]
fn the_masked_add_matches_the_branching_one() {
    let ranges = Ranges::of(&P);
    let others = [
        Boid {
            x: ME.x + 1.0,
            y: ME.y,
            vx: 1.0,
            vy: 0.5,
        },
        Boid {
            x: ME.x - 10.0,
            y: ME.y + 20.0,
            vx: -1.0,
            vy: 2.0,
        },
        Boid {
            x: ME.x + 500.0,
            y: ME.y,
            vx: 3.0,
            vy: 3.0,
        },
        ME,
        Boid {
            x: ME.x,
            y: ME.y - P.protected_range,
            vx: 0.0,
            vy: -1.0,
        },
        Boid {
            x: ME.x + P.visual_range,
            y: ME.y,
            vx: 0.25,
            vy: 0.0,
        },
    ];
    let (mut branching, mut masked) = (Seen::default(), Seen::default());
    for other in others {
        branching.add(ranges, ME, other);
        masked.add_masked(ranges, ME, other);
        assert_eq!(branching, masked, "after {other:?}");
    }
}

/// Sorted's span edges, every way (`SWARM_SPAN`, `SWARM_TAIL`): the same
/// sums as each candidate through [`Seen::add`], to rounding. Spans short
/// (under a block), at the arrays' start (the masked block can't reach
/// back), whole blocks, and long; empty ones too.
#[test]
fn every_span_edge_setting_sums_the_same_candidates() {
    const L: usize = 8;
    // Up to 61 boids: u16 arithmetic, exact in f32.
    let indices = || 0..61_u16;
    let x: Vec<f32> = indices()
        .map(|index| ME.x + (f32::from(index * 37 % 101) - 50.0) * 1.3)
        .collect();
    let y: Vec<f32> = indices()
        .map(|index| ME.y + (f32::from(index * 53 % 97) - 48.0) * 1.1)
        .collect();
    let vx: Vec<f32> = indices().map(|index| f32::from(index % 7) - 3.0).collect();
    let vy: Vec<f32> = indices().map(|index| f32::from(index % 5) - 2.0).collect();
    let ranges = Ranges::of(&P);
    let spans = [0..3, 3..3, 3..11, 11..30, 30..32, 40..48, 48..61, 0..61];
    let mut reference = Seen::default();
    for span in spans.clone() {
        for index in span {
            reference.add(
                ranges,
                ME,
                Boid {
                    x: x[index],
                    y: y[index],
                    vx: vx[index],
                    vy: vy[index],
                },
            );
        }
    }
    assert!(reference.count > 10.0, "the data must have neighbours");
    for settings in [false, true]
        .into_iter()
        .flat_map(|per_boid| [Tail::Scalar, Tail::Masked, Tail::Table].map(|tail| (per_boid, tail)))
    {
        let mut seen = Seen::default();
        super::lanes::add_spans::<L>(
            &mut seen,
            ranges,
            ME,
            [&x, &y, &vx, &vy],
            spans.clone().into_iter(),
            settings,
        );
        let close = |got: f32, want: f32| (got - want).abs() <= 1e-4 * want.abs().max(1.0);
        for (got, want) in [
            (seen.sum_x, reference.sum_x),
            (seen.sum_y, reference.sum_y),
            (seen.sum_vx, reference.sum_vx),
            (seen.sum_vy, reference.sum_vy),
            (seen.count, reference.count),
            (seen.close_dx, reference.close_dx),
            (seen.close_dy, reference.close_dy),
        ] {
            assert!(close(got, want), "{settings:?}: {got} against {want}");
        }
    }
}
