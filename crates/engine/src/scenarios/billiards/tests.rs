use core::num::NonZeroU32;

use super::{
    CORNER_CUT_DEG, JAW_LENGTH, POOL_BALL_RADIUS, POOL_CORNER_MOUTH, POOL_LENGTH, POOL_RACK,
    POOL_SIDE_MOUTH, POOL_WIDTH, SIDE_CUT_DEG, pool_break, pool_rack, pool_table,
};
use crate::{ConfigError, Solver, Vec2};

#[test]
fn the_table_has_six_rails_twelve_jaws_and_six_pockets() {
    let w = pool_table::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    assert_eq!((w.segments().len(), w.pockets().len()), (18, 6));
    assert!(w.table().is_some() && w.particles().is_empty());
}

/// The geometry against WPA §9, independent of how `pool_table` builds
/// it (the full mutation run: 55 changes to the jaws, rails and pockets
/// survived, pinned only by what a 4 s break happened to touch). Rails
/// are the segments on the surface's edge; each leaves a mouth of the
/// specified width at each pocket; each jaw leaves a mouth point at its
/// cut angle to the rail, outward, `JAW_LENGTH` long; each pocket's
/// sensor sits where the doc says.
#[test]
fn the_table_matches_the_specification() {
    const TOL: f64 = 1e-12;
    let w = pool_table::<f64>(Solver::Impulse, NonZeroU32::MIN).unwrap();
    let (hl, hw) = (POOL_LENGTH / 2.0, POOL_WIDTH / 2.0);
    let on_edge = |p: Vec2<f64>| {
        let on_long = (p.y.abs() - hw).abs() < TOL && p.x.abs() <= hl + TOL;
        let on_short = (p.x.abs() - hl).abs() < TOL && p.y.abs() <= hw + TOL;
        on_long || on_short
    };
    let (rails, jaws): (Vec<_>, Vec<_>) = w
        .segments()
        .iter()
        .map(|s| s.ends())
        .partition(|[a, b]| on_edge(*a) && on_edge(*b));
    assert_eq!((rails.len(), jaws.len()), (6, 12));
    // Every rail end is a mouth point, and each mouth point pairs with
    // exactly one other across a pocket at the specified width.
    let ends: Vec<Vec2<f64>> = rails.iter().flatten().copied().collect();
    for &p in &ends {
        let side = p.x.abs() < hl / 2.0;
        let mouth = if side {
            POOL_SIDE_MOUTH
        } else {
            POOL_CORNER_MOUTH
        };
        let partners = ends
            .iter()
            .filter(|&&q| ((q - p).length() - mouth).abs() < TOL)
            .count();
        assert_eq!(partners, 1, "mouth point {p:?}");
    }
    // Each jaw starts at a rail end, at the cut angle to that rail.
    let mut starts = Vec::new();
    for [a, b] in &jaws {
        let (start, tip) = if on_edge(*a) { (*a, *b) } else { (*b, *a) };
        assert!(!on_edge(tip), "a jaw's tip is off the table");
        assert!(
            ((tip - start).length() - JAW_LENGTH).abs() < TOL,
            "jaw length"
        );
        assert!(
            tip.x.abs() > hl - TOL || tip.y.abs() > hw - TOL,
            "jaw at {start:?} points onto the table"
        );
        let rail = rails
            .iter()
            .find(|r| r.contains(&start))
            .expect("a jaw starts at a rail's end");
        let other = if rail[0] == start { rail[1] } else { rail[0] };
        let (u, v) = (other - start, tip - start);
        let angle = (u.dot(v) / (u.length() * v.length())).acos().to_degrees();
        let cut = if start.x.abs() < hl / 2.0 {
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
    // One jaw at every mouth point.
    starts.sort_by(|a, b| a.x.total_cmp(&b.x).then(a.y.total_cmp(&b.y)));
    let mut sorted = ends.clone();
    sorted.sort_by(|a, b| a.x.total_cmp(&b.x).then(a.y.total_cmp(&b.y)));
    assert_eq!(starts, sorted);
    // Pockets: corners centred on the table's corners, reaching the mouth's
    // midpoint; sides a ball's radius behind the rail, as wide as the mouth.
    let a = POOL_CORNER_MOUTH / 2.0_f64.sqrt();
    let mut expected = Vec::new();
    for sy in [1.0, -1.0] {
        for sx in [1.0, -1.0] {
            expected.push((Vec2::new(sx * hl, sy * hw), a / 2.0_f64.sqrt()));
        }
        expected.push((
            Vec2::new(0.0, sy * (hw + POOL_BALL_RADIUS)),
            POOL_SIDE_MOUTH / 2.0,
        ));
    }
    for (centre, radius) in expected {
        let found = w
            .pockets()
            .iter()
            .any(|p| (p.center() - centre).length() < TOL && (p.radius() - radius).abs() < TOL);
        assert!(found, "no pocket of radius {radius} at {centre:?}");
    }
}

#[test]
fn the_rack_is_sixteen_balls_on_the_table_touching_not_overlapping() {
    let w = pool_rack::<f64>(Solver::Xpbd, NonZeroU32::MIN).unwrap();
    let pos = w.particles().pos();
    assert_eq!(pos.len(), 16);
    let r = POOL_BALL_RADIUS;
    for (i, x) in pos.iter().enumerate() {
        assert!(
            x.x.abs() < POOL_LENGTH / 2.0 - r && x.y.abs() < POOL_WIDTH / 2.0 - r,
            "{i}"
        );
        for (j, y) in pos.iter().enumerate().skip(i + 1) {
            assert!(
                (*y - *x).length() > 2.0 * r - 1e-12,
                "balls {i} and {j} overlap"
            );
        }
    }
    // The apex on the foot spot, its neighbours touching it.
    assert_eq!(pos[1], Vec2::new(POOL_LENGTH / 4.0, 0.0));
    assert!(((pos[2] - pos[1]).length() - 2.0 * r).abs() < 1e-12);
    // Every number once.
    let mut numbers = POOL_RACK.to_vec();
    numbers.sort_unstable();
    assert_eq!(numbers, (1..=15).collect::<Vec<u8>>());
}

#[test]
fn a_break_is_checked_and_moves_only_the_cue_ball() {
    let w = pool_break::<f64>(Solver::Impulse, NonZeroU32::MIN, 10.0, 0.0).unwrap();
    assert_eq!(w.particles().vel()[0], Vec2::new(10.0, 0.0));
    assert!(w.particles().vel()[1..].iter().all(|v| *v == Vec2::ZERO));
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
