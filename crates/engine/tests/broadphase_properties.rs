//! The broadphase's contract (`docs/08-collision.md`, "Contact
//! generation"): its candidate pairs are a **superset** of the pairs that
//! truly overlap. Missing a pair is a bug (a collision silently skipped);
//! extra pairs only cost time.
#![cfg(test)]

use engine::Vec2;
use engine::collision::candidate_pairs;
use proptest::prelude::*;
use test_support::proptest_config;

/// Circles: position in a 4 m box, radius 0 (a point) or 1–20 cm
/// (uniform: the original distribution).
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

/// The checklist's harder distributions (§2.4): **clustered** (up to 60
/// circles in a 5 cm box, so many share a cell), and **mixed sizes**
/// (radii from 0.1 mm to 0.5 m together: the cell is sized by the
/// largest, so small circles crowd few cells).
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

/// The grid's pairs for circles `c`, each moved by `offset`.
fn grid(c: &[(f64, f64, f64)], offset: (f64, f64)) -> Grid {
    let pos: Vec<_> = c
        .iter()
        .map(|&(x, y, _)| Vec2::new(x + offset.0, y + offset.1))
        .collect();
    let radius: Vec<_> = c.iter().map(|&(_, _, r)| r).collect();
    let max_r = radius.iter().copied().fold(0.0, f64::max);
    let mut pairs = Vec::new();
    candidate_pairs(&pos, &radius, 2.0 * max_r, &mut pairs);
    (pos, radius, pairs)
}

fn brute_force(pos: &[Vec2<f64>], radius: &[f64]) -> Vec<(usize, usize)> {
    let mut pairs = Vec::new();
    for a in 0..pos.len() {
        for b in a + 1..pos.len() {
            let (ra, rb) = (radius[a], radius[b]);
            if ra > 0.0 && rb > 0.0 && (pos[b] - pos[a]).length() < ra + rb {
                pairs.push((a, b));
            }
        }
    }
    pairs
}

proptest! {
    #![proptest_config(proptest_config())]

    #[test]
    fn grid_pairs_are_a_superset_of_true_overlaps(c in circles()) {
        let pos: Vec<_> = c.iter().map(|&(x, y, _)| Vec2::new(x, y)).collect();
        let radius: Vec<_> = c.iter().map(|&(_, _, r)| r).collect();
        let max_r = radius.iter().copied().fold(0.0, f64::max);
        let mut grid = Vec::new();
        candidate_pairs(&pos, &radius, 2.0 * max_r, &mut grid);
        for pair in brute_force(&pos, &radius) {
            prop_assert!(grid.contains(&pair), "missed {pair:?}");
        }
        // Each pair once, ordered, sorted: deterministic output.
        prop_assert!(grid.iter().all(|&(a, b)| a < b));
        prop_assert!(grid.windows(2).all(|w| w[0] < w[1]));
    }

    #[test]
    fn hard_distributions_far_from_the_origin_miss_nothing(
        c in hard_circles(),
        offset in prop_oneof![Just(0.0), Just(1e3), Just(-1e6), Just(1e9), Just(1e12)],
    ) {
        let (pos, radius, pairs) = grid(&c, (offset, -offset));
        for pair in brute_force(&pos, &radius) {
            prop_assert!(pairs.contains(&pair), "missed {pair:?} at offset {offset}");
        }
    }

    #[test]
    fn insertion_order_only_renames_the_pairs(c in circles(), seed in any::<u64>()) {
        // A shuffle of the circles: the same pairs, under the new names.
        let mut order: Vec<usize> = (0..c.len()).collect();
        let mut rng = math::SplitMix64::new(seed);
        for i in (1..order.len()).rev() {
            let j = usize::try_from(rng.next_u64() % (u64::try_from(i).unwrap() + 1)).unwrap();
            order.swap(i, j);
        }
        let shuffled: Vec<_> = order.iter().map(|&i| c[i]).collect();
        let (_, _, base) = grid(&c, (0.0, 0.0));
        let (_, _, moved) = grid(&shuffled, (0.0, 0.0));
        let mut renamed: Vec<(usize, usize)> = moved
            .iter()
            .map(|&(a, b)| { let (x, y) = (order[a], order[b]); if x < y { (x, y) } else { (y, x) } })
            .collect();
        renamed.sort_unstable();
        prop_assert_eq!(renamed, base);
    }
}
