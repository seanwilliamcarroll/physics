use core::num::NonZeroU32;

use super::{
    CORNER_CUT_DEG, JAW_LENGTH, POOL_BALL_RADIUS, POOL_CORNER_MOUTH, POOL_LENGTH, POOL_RACK,
    POOL_SIDE_MOUTH, POOL_WIDTH, SIDE_CUT_DEG, pool_break, pool_rack, pool_table,
};
use crate::{ConfigError, Solver, Vec2};

#[test]
fn the_table_has_six_rails_twelve_jaws_and_six_pockets() {
    let world = pool_table::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    assert_eq!((world.segments().len(), world.pockets().len()), (18, 6));
    assert!(world.table().is_some() && world.particles().is_empty());
}

fn sort_by_position(points: &mut [Vec2<f64>]) {
    points.sort_by(|first, second| {
        first
            .x
            .total_cmp(&second.x)
            .then(first.y.total_cmp(&second.y))
    });
}

/// The geometry against WPA §9, independent of how `pool_table` builds
/// it. Rails are the segments on the surface's edge; each leaves a mouth of
/// the specified width at each pocket; each jaw leaves a mouth point at its
/// cut angle to the rail, outward, `JAW_LENGTH` long; each pocket's sensor
/// sits where the doc says.
#[test]
fn the_table_matches_the_specification() {
    const TOLERANCE: f64 = 1e-12;
    let world = pool_table::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    let (half_length, half_width) = (POOL_LENGTH / 2.0, POOL_WIDTH / 2.0);
    let on_edge = |point: Vec2<f64>| {
        let on_long = (point.y.abs() - half_width).abs() < TOLERANCE
            && point.x.abs() <= half_length + TOLERANCE;
        let on_short = (point.x.abs() - half_length).abs() < TOLERANCE
            && point.y.abs() <= half_width + TOLERANCE;
        on_long || on_short
    };
    let (rails, jaws): (Vec<_>, Vec<_>) = world
        .segments()
        .iter()
        .map(|segment| segment.ends())
        .partition(|[from, to]| on_edge(*from) && on_edge(*to));
    assert_eq!((rails.len(), jaws.len()), (6, 12));
    // Every rail end is a mouth point, and each mouth point pairs with
    // exactly one other across a pocket at the specified width.
    let ends: Vec<Vec2<f64>> = rails.iter().flatten().copied().collect();
    for &point in &ends {
        let side = point.x.abs() < half_length / 2.0;
        let mouth = if side {
            POOL_SIDE_MOUTH
        } else {
            POOL_CORNER_MOUTH
        };
        let partners = ends
            .iter()
            .filter(|&&other| ((other - point).length() - mouth).abs() < TOLERANCE)
            .count();
        assert_eq!(partners, 1, "mouth point {point:?}");
    }
    let mut starts = Vec::new();
    for [from, to] in &jaws {
        let (start, tip) = if on_edge(*from) {
            (*from, *to)
        } else {
            (*to, *from)
        };
        assert!(!on_edge(tip), "a jaw's tip is off the table");
        assert!(
            ((tip - start).length() - JAW_LENGTH).abs() < TOLERANCE,
            "jaw length"
        );
        assert!(
            tip.x.abs() > half_length - TOLERANCE || tip.y.abs() > half_width - TOLERANCE,
            "jaw at {start:?} points onto the table"
        );
        let rail = rails
            .iter()
            .find(|rail| rail.contains(&start))
            .expect("a jaw starts at a rail's end");
        let other_end = if rail[0] == start { rail[1] } else { rail[0] };
        let (along_rail, along_jaw) = (other_end - start, tip - start);
        let angle = (along_rail.dot(along_jaw) / (along_rail.length() * along_jaw.length()))
            .acos()
            .to_degrees();
        let cut = if start.x.abs() < half_length / 2.0 {
            SIDE_CUT_DEG
        } else {
            CORNER_CUT_DEG
        };
        assert!(
            (angle - cut).abs() < 1e-9,
            "jaw at {start:?}: {angle}° not {cut}°"
        );
        starts.push(start);
    }
    sort_by_position(&mut starts);
    let mut sorted = ends.clone();
    sort_by_position(&mut sorted);
    assert_eq!(starts, sorted);
    // Pockets: corners centred on the table's corners, reaching the mouth's
    // midpoint; sides a ball's radius behind the rail, as wide as the mouth.
    let corner_setback = POOL_CORNER_MOUTH / 2.0_f64.sqrt();
    let mut expected = Vec::new();
    for sign_y in [1.0, -1.0] {
        for sign_x in [1.0, -1.0] {
            expected.push((
                Vec2::new(sign_x * half_length, sign_y * half_width),
                corner_setback / 2.0_f64.sqrt(),
            ));
        }
        expected.push((
            Vec2::new(0.0, sign_y * (half_width + POOL_BALL_RADIUS)),
            POOL_SIDE_MOUTH / 2.0,
        ));
    }
    for (centre, radius) in expected {
        let found = world.pockets().iter().any(|pocket| {
            (pocket.center() - centre).length() < TOLERANCE
                && (pocket.radius() - radius).abs() < TOLERANCE
        });
        assert!(found, "no pocket of radius {radius} at {centre:?}");
    }
}

#[test]
fn the_rack_is_sixteen_balls_on_the_table_touching_not_overlapping() {
    let world = pool_rack::<f64>(Solver::Xpbd, NonZeroU32::MIN).unwrap();
    let positions = world.particles().positions();
    assert_eq!(positions.len(), 16);
    let radius = POOL_BALL_RADIUS;
    for (index, position) in positions.iter().enumerate() {
        assert!(
            position.x.abs() < POOL_LENGTH / 2.0 - radius
                && position.y.abs() < POOL_WIDTH / 2.0 - radius,
            "{index}"
        );
        for (other_index, other) in positions.iter().enumerate().skip(index + 1) {
            assert!(
                (*other - *position).length() > 2.0 * radius - 1e-12,
                "balls {index} and {other_index} overlap"
            );
        }
    }
    assert_eq!(positions[1], Vec2::new(POOL_LENGTH / 4.0, 0.0));
    assert!(((positions[2] - positions[1]).length() - 2.0 * radius).abs() < 1e-12);
    let mut numbers = POOL_RACK.to_vec();
    numbers.sort_unstable();
    assert_eq!(numbers, (1..=15).collect::<Vec<u8>>());
}

#[test]
fn a_break_is_checked_and_moves_only_the_cue_ball() {
    let world = pool_break::<f64>(Solver::Impulse, NonZeroU32::MIN, 10.0, 0.0).unwrap();
    assert_eq!(world.particles().velocities()[0], Vec2::new(10.0, 0.0));
    assert!(
        world.particles().velocities()[1..]
            .iter()
            .all(|velocity| *velocity == Vec2::ZERO)
    );
    for (speed, tip) in [
        (f64::NAN, 0.0),
        (-1.0, 0.0),
        (5.0, 0.6),
        (f64::INFINITY, 0.0),
    ] {
        assert_eq!(
            pool_break::<f64>(Solver::Impulse, NonZeroU32::MIN, speed, tip).err(),
            Some(ConfigError::InvalidShot)
        );
    }
}
