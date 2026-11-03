use super::candidate_pairs;
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
