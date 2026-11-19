//! The broadphase's contract (`docs/08-collision.md`, "Contact
//! generation"): its candidate pairs are a **superset** of the pairs that
//! truly overlap. Missing a pair is a bug (a collision silently skipped);
//! extra pairs only cost time.
#![cfg(test)]

use engine::Vec2;
use engine::collision::candidate_pairs;
use proptest::prelude::*;
use test_support::proptest_config;

/// Circles: position in a 4 m box, radius 0 (a point) or 1–20 cm.
fn circles() -> impl Strategy<Value = Vec<(f64, f64, f64)>> {
    prop::collection::vec(
        (
            -2.0..2.0_f64,
            -2.0..2.0_f64,
            prop_oneof![Just(0.0), 0.01..0.2_f64],
        ),
        0..60,
    )
}

/// The harder distributions: **clustered** (up to 60 circles in a 5 cm
/// box, so many share a cell), and **mixed sizes** (radii from 0.1 mm to
/// 0.5 m together: the cell is sized by the largest, so small circles crowd
/// few cells).
fn hard_circles() -> impl Strategy<Value = Vec<(f64, f64, f64)>> {
    prop_oneof![
        prop::collection::vec(
            (-0.025..0.025_f64, -0.025..0.025_f64, 0.001..0.01_f64),
            0..60
        ),
        prop::collection::vec(
            (
                -2.0..2.0_f64,
                -2.0..2.0_f64,
                prop_oneof![1e-4..1e-3_f64, 0.01..0.1_f64, 0.2..0.5_f64]
            ),
            0..60,
        ),
    ]
}

/// Positions, radii, and the grid's candidate pairs.
type Grid = (Vec<Vec2<f64>>, Vec<f64>, Vec<(usize, usize)>);

/// The grid's pairs for `circles`, each moved by `offset`.
fn grid(circles: &[(f64, f64, f64)], offset: (f64, f64)) -> Grid {
    let positions: Vec<_> = circles
        .iter()
        .map(|&(x, y, _)| Vec2::new(x + offset.0, y + offset.1))
        .collect();
    let radii: Vec<_> = circles.iter().map(|&(_, _, radius)| radius).collect();
    let max_radius = radii.iter().copied().fold(0.0, f64::max);
    let mut pairs = Vec::new();
    candidate_pairs(&positions, &radii, 2.0 * max_radius, &mut pairs);
    (positions, radii, pairs)
}

fn brute_force(positions: &[Vec2<f64>], radii: &[f64]) -> Vec<(usize, usize)> {
    let mut pairs = Vec::new();
    for first in 0..positions.len() {
        for second in first + 1..positions.len() {
            let (first_radius, second_radius) = (radii[first], radii[second]);
            if first_radius > 0.0
                && second_radius > 0.0
                && (positions[second] - positions[first]).length() < first_radius + second_radius
            {
                pairs.push((first, second));
            }
        }
    }
    pairs
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn grid_pairs_are_a_superset_of_true_overlaps(circles in circles()) {
        let positions: Vec<_> = circles.iter().map(|&(x, y, _)| Vec2::new(x, y)).collect();
        let radii: Vec<_> = circles.iter().map(|&(_, _, radius)| radius).collect();
        let max_radius = radii.iter().copied().fold(0.0, f64::max);
        let mut grid = Vec::new();
        candidate_pairs(&positions, &radii, 2.0 * max_radius, &mut grid);
        for pair in brute_force(&positions, &radii) {
            prop_assert!(grid.contains(&pair), "missed {pair:?}");
        }
        // Each pair once, ordered, sorted: deterministic output.
        prop_assert!(grid.iter().all(|&(first, second)| first < second));
        prop_assert!(grid.windows(2).all(|window| window[0] < window[1]));
    }

    #[test]
    fn hard_distributions_far_from_the_origin_miss_nothing(
        circles in hard_circles(),
        offset in prop_oneof![Just(0.0), Just(1e3), Just(-1e6), Just(1e9), Just(1e12)],
    ) {
        let (positions, radii, pairs) = grid(&circles, (offset, -offset));
        for pair in brute_force(&positions, &radii) {
            prop_assert!(pairs.contains(&pair), "missed {pair:?} at offset {offset}");
        }
    }

    #[test]
    fn insertion_order_only_renames_the_pairs(circles in circles(), seed in any::<u64>()) {
        // A shuffle of the circles: the same pairs, under the new names.
        let mut order: Vec<usize> = (0..circles.len()).collect();
        let mut rng = math::SplitMix64::new(seed);
        for index in (1..order.len()).rev() {
            let swap_with = usize::try_from(rng.next_u64() % (u64::try_from(index).unwrap() + 1)).unwrap();
            order.swap(index, swap_with);
        }
        let shuffled: Vec<_> = order.iter().map(|&index| circles[index]).collect();
        let (_, _, base) = grid(&circles, (0.0, 0.0));
        let (_, _, moved) = grid(&shuffled, (0.0, 0.0));
        let mut renamed: Vec<(usize, usize)> = moved
            .iter()
            .map(|&(first, second)| {
                let (first_original, second_original) = (order[first], order[second]);
                if first_original < second_original {
                    (first_original, second_original)
                } else {
                    (second_original, first_original)
                }
            })
            .collect();
        renamed.sort_unstable();
        prop_assert_eq!(renamed, base);
    }
}
