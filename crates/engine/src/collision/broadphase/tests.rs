use super::{HALF_NEIGHBORS, candidate_pairs, cell_of, cell_run, ordered};
use crate::Vec2;

fn pairs(positions: &[(f64, f64)], radii: &[f64], cell_size: f64) -> Vec<(usize, usize)> {
    let positions: Vec<_> = positions.iter().map(|&(x, y)| Vec2::new(x, y)).collect();
    let mut out = vec![(99, 99)];
    candidate_pairs(&positions, radii, cell_size, &mut out);
    out
}

#[test]
fn neighbors_pair_and_far_circles_dont() {
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

fn by_binary_search(
    positions: &[(f64, f64)],
    radii: &[f64],
    cell_size: f64,
) -> Vec<(usize, usize)> {
    let mut keys: Vec<(i64, i64, usize)> = positions
        .iter()
        .zip(radii)
        .enumerate()
        .filter(|(_, (_, radius))| **radius > 0.0)
        .map(|(index, (position, _))| {
            (
                cell_of(position.0, cell_size),
                cell_of(position.1, cell_size),
                index,
            )
        })
        .collect();
    keys.sort_unstable();
    let mut out = Vec::new();
    for run in keys.chunk_by(|first, second| (first.0, first.1) == (second.0, second.1)) {
        let (cell_x, cell_y, _) = run[0];
        for (offset, first) in run.iter().enumerate() {
            for second in &run[offset + 1..] {
                out.push(ordered(first.2, second.2));
            }
        }
        for (dx, dy) in HALF_NEIGHBORS {
            let neighbor = (cell_x.saturating_add(dx), cell_y.saturating_add(dy));
            let neighbor_start = keys.partition_point(|key| (key.0, key.1) < neighbor);
            let neighbor_end = keys.partition_point(|key| (key.0, key.1) <= neighbor);
            for second in &keys[neighbor_start..neighbor_end] {
                for first in run {
                    out.push(ordered(first.2, second.2));
                }
            }
        }
    }
    out.sort_unstable();
    out
}

#[test]
fn the_cursors_find_what_binary_search_did() {
    let mut state = 0x2545_f491_4f6c_dd1d_u64;
    let mut next = || {
        state = state
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1_442_695_040_888_963_407);
        f64::from(u32::try_from(state >> 40).unwrap()) / f64::from(1_u32 << 24)
    };
    for (count, span) in [(1, 1.0), (40, 3.0), (300, 6.0), (300, 40.0), (500, 2.0)] {
        let positions: Vec<(f64, f64)> = (0..count)
            .map(|_| ((next() - 0.5) * span, (next() - 0.5) * span))
            .collect();
        let radii: Vec<f64> = (0..count)
            .map(|index| if index % 8 == 3 { 0.0 } else { 0.1 })
            .collect();
        for cell_size in [0.2, 0.5, 1.7] {
            let got = pairs(&positions, &radii, cell_size);
            assert!(
                !got.is_empty() || count == 1,
                "a vacuous case: count {count}, span {span}"
            );
            assert_eq!(
                got,
                by_binary_search(&positions, &radii, cell_size),
                "count {count}, span {span}, cell_size {cell_size}"
            );
        }
    }
}

fn by_definition(positions: &[(f64, f64)], radii: &[f64], cell_size: f64) -> Vec<(usize, usize)> {
    let cells: Vec<(i128, i128)> = positions
        .iter()
        .map(|&(x, y)| {
            (
                i128::from(cell_of(x, cell_size)),
                i128::from(cell_of(y, cell_size)),
            )
        })
        .collect();
    let mut out = Vec::new();
    for first in 0..positions.len() {
        for second in first + 1..positions.len() {
            let (first_cell, second_cell) = (cells[first], cells[second]);
            if radii[first] > 0.0
                && radii[second] > 0.0
                && (first_cell.0 - second_cell.0).abs() <= 1
                && (first_cell.1 - second_cell.1).abs() <= 1
            {
                out.push((first, second));
            }
        }
    }
    out
}

#[test]
fn the_edge_of_the_cell_range_is_as_defined() {
    // Cells saturate at the i64 range: a neighbor offset from the last
    // column or row lands back on it, and a later cell's neighbor can be
    // an earlier cell (the cursors' fallback). Runaway circles at every
    // corner and edge, several a cell, among ordinary ones.
    let far = 1e300;
    let mut positions = vec![(0.05, 0.05), (0.15, 0.05), (0.1, 0.15), (-0.05, -0.05)];
    for x in [-far, 0.05, far] {
        for y in [-far, 0.05, 0.15, far] {
            positions.extend([(x, y), (x, y)]);
        }
    }
    let radii = vec![0.05; positions.len()];
    let got = pairs(&positions, &radii, 0.1);
    assert_eq!(got, by_definition(&positions, &radii, 0.1));
    assert!(got.len() > 20, "{}", got.len());
}

#[test]
fn a_neighbor_behind_the_cursor_is_still_found() {
    // Columns MAX − 1 and MAX: the +x neighbor of (MAX − 1, 5) is
    // (MAX, 5), and then (MAX, 0)'s saturates to itself, an earlier run.
    let max = i64::MAX;
    let keys = [(max - 1, 5, 10), (max, 0, 11), (max, 0, 12), (max, 5, 13)];
    let runs = [(max - 1, 5, 0), (max, 0, 1), (max, 5, 3)];
    let mut cursor = 0;
    assert_eq!(
        cell_run(&keys, &runs, &mut cursor, (max, 5)),
        [(max, 5, 13)]
    );
    assert_eq!(cursor, 2);
    assert_eq!(
        cell_run(&keys, &runs, &mut cursor, (max, 0)),
        [(max, 0, 11), (max, 0, 12)]
    );
    assert_eq!(cursor, 2, "left alone");
    assert_eq!(
        cell_run(&keys, &runs, &mut cursor, (max, 5)),
        [(max, 5, 13)]
    );
    assert_eq!(cell_run(&keys, &runs, &mut cursor, (max, 6)), []);
    assert_eq!(cursor, 3);
    assert_eq!(cell_run(&keys, &runs, &mut 0, (max, 2)), []);
}

/// At the edge of the `i64` range a neighbor offset saturates: `(+1, 0)`
/// from column `MAX` is column `MAX` again, and `(0, +1)` and `(+1, +1)`
/// reach the same cell. Each pair must come out once, and never a circle
/// with itself.
#[test]
fn saturated_cells_pair_each_circle_once_and_never_with_itself() {
    let far = 1e300;
    assert_eq!(
        pairs(&[(far, 0.0), (far, 0.25)], &[0.1, 0.1], 1.0),
        [(0, 1)]
    );
    assert_eq!(pairs(&[(far, 0.5), (far, 1.5)], &[0.1, 0.1], 1.0), [(0, 1)]);
    assert_eq!(pairs(&[(far, far)], &[0.1], 1.0), []);
}
