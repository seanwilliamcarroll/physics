use super::{HALF_NEIGHBORS, candidate_pairs, cell_of, cell_run, ordered};
use crate::Vec2;

fn pairs(pos: &[(f64, f64)], radius: &[f64], cell: f64) -> Vec<(usize, usize)> {
    let pos: Vec<_> = pos.iter().map(|&(x, y)| Vec2::new(x, y)).collect();
    let mut out = vec![(99, 99)];
    candidate_pairs(&pos, radius, cell, &mut out);
    out
}

#[test]
fn neighbors_pair_and_far_circles_dont() {
    // 0 and 1 overlap across a cell boundary; 2 is far away.
    let got = pairs(&[(0.09, 0.0), (0.11, 0.0), (5.0, 5.0)], &[0.05; 3], 0.1);
    assert_eq!(got, vec![(0, 1)], "and `out` is cleared first");
}

#[test]
fn points_never_pair() {
    let got = pairs(
        &[(0.0, 0.0), (0.0, 0.0), (0.01, 0.0)],
        &[0.0, 0.1, 0.1],
        0.2,
    );
    assert_eq!(got, vec![(1, 2)]);
}

#[test]
fn diagonal_and_negative_cells_are_neighbors() {
    // Across the origin: cells (-1, -1) and (0, 0), and (-1, 0) and (0, -1).
    let got = pairs(
        &[(-0.01, -0.01), (0.01, 0.01), (-0.01, 0.01), (0.01, -0.01)],
        &[0.05; 4],
        0.1,
    );
    assert_eq!(got, vec![(0, 1), (0, 2), (0, 3), (1, 2), (1, 3), (2, 3)]);
}

#[test]
fn no_cell_size_means_no_pairs() {
    assert_eq!(pairs(&[(0.0, 0.0), (0.0, 0.0)], &[0.1, 0.1], 0.0), vec![]);
}

/// The algorithm before the cursors, kept as the reference: each
/// neighbor cell found by two binary searches over all the keys.
fn by_binary_search(pos: &[(f64, f64)], radius: &[f64], cell: f64) -> Vec<(usize, usize)> {
    let mut keys: Vec<(i64, i64, usize)> = pos
        .iter()
        .zip(radius)
        .enumerate()
        .filter(|(_, (_, r))| **r > 0.0)
        .map(|(i, (p, _))| (cell_of(p.0, cell), cell_of(p.1, cell), i))
        .collect();
    keys.sort_unstable();
    let mut out = Vec::new();
    for here in keys.chunk_by(|p, q| (p.0, p.1) == (q.0, q.1)) {
        let (cx, cy, _) = here[0];
        for (i, a) in here.iter().enumerate() {
            for b in &here[i + 1..] {
                out.push(ordered(a.2, b.2));
            }
        }
        for (dx, dy) in HALF_NEIGHBORS {
            let there = (cx.saturating_add(dx), cy.saturating_add(dy));
            let lo = keys.partition_point(|k| (k.0, k.1) < there);
            let hi = keys.partition_point(|k| (k.0, k.1) <= there);
            for b in &keys[lo..hi] {
                for a in here {
                    out.push(ordered(a.2, b.2));
                }
            }
        }
    }
    out.sort_unstable();
    out
}

#[test]
fn the_cursors_find_what_binary_search_did() {
    // A fixed stream (an LCG): clusters, gaps, and negative cells.
    let mut state = 0x2545_f491_4f6c_dd1d_u64;
    let mut next = || {
        state = state
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1_442_695_040_888_963_407);
        f64::from(u32::try_from(state >> 40).unwrap()) / f64::from(1_u32 << 24)
    };
    for (n, span) in [(1, 1.0), (40, 3.0), (300, 6.0), (300, 40.0), (500, 2.0)] {
        let pos: Vec<(f64, f64)> = (0..n)
            .map(|_| ((next() - 0.5) * span, (next() - 0.5) * span))
            .collect();
        // One in eight a point: never pairs.
        let radius: Vec<f64> = (0..n).map(|i| if i % 8 == 3 { 0.0 } else { 0.1 }).collect();
        for cell in [0.2, 0.5, 1.7] {
            let got = pairs(&pos, &radius, cell);
            assert!(
                !got.is_empty() || n == 1,
                "a vacuous case: n {n}, span {span}"
            );
            assert_eq!(
                got,
                by_binary_search(&pos, &radius, cell),
                "n {n}, span {span}, cell {cell}"
            );
        }
    }
}

#[test]
fn the_edge_of_the_cell_range_is_as_it_was() {
    // Cells saturate at the i64 range: a neighbor offset from the last
    // column or row lands back on it, and a later cell's neighbor can be
    // an earlier cell (the cursors' fallback). Runaway circles at every
    // corner and edge, several a cell, among ordinary ones.
    let far = 1e300;
    let mut pos = vec![(0.05, 0.05), (0.15, 0.05), (0.1, 0.15), (-0.05, -0.05)];
    for x in [-far, 0.05, far] {
        for y in [-far, 0.05, 0.15, far] {
            pos.extend([(x, y), (x, y)]);
        }
    }
    let radius = vec![0.05; pos.len()];
    let got = pairs(&pos, &radius, 0.1);
    assert_eq!(got, by_binary_search(&pos, &radius, 0.1));
    assert!(got.len() > 20, "{}", got.len());
}

#[test]
fn a_neighbor_behind_the_cursor_is_still_found() {
    // Columns MAX − 1 and MAX: the +x neighbor of (MAX − 1, 5) is
    // (MAX, 5), and then (MAX, 0)'s saturates to itself, an earlier run.
    let m = i64::MAX;
    let keys = [(m - 1, 5, 10), (m, 0, 11), (m, 0, 12), (m, 5, 13)];
    let runs = [(m - 1, 5, 0), (m, 0, 1), (m, 5, 3)];
    let mut cursor = 0;
    assert_eq!(cell_run(&keys, &runs, &mut cursor, (m, 5)), [(m, 5, 13)]);
    assert_eq!(cursor, 2);
    assert_eq!(
        cell_run(&keys, &runs, &mut cursor, (m, 0)),
        [(m, 0, 11), (m, 0, 12)]
    );
    assert_eq!(cursor, 2, "left alone");
    // Forward again, past the end, and an empty cell between runs.
    assert_eq!(cell_run(&keys, &runs, &mut cursor, (m, 5)), [(m, 5, 13)]);
    assert_eq!(cell_run(&keys, &runs, &mut cursor, (m, 6)), []);
    assert_eq!(cursor, 3);
    assert_eq!(cell_run(&keys, &runs, &mut 0, (m, 2)), []);
}
