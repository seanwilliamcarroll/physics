use proptest::prelude::*;

use super::Grid;

/// Whether `j` is within `r` of `i`, exactly as `rules::steer` decides.
fn in_range(x: &[f32], y: &[f32], i: usize, j: usize, r: f32) -> bool {
    let (dx, dy) = (x[i] - x[j], y[i] - y[j]);
    dx.abs() < r && dy.abs() < r && dx * dx + dy * dy < r * r
}

/// Each boid's neighbours found through the grid, against every pair.
fn same_neighbours(w: f32, h: f32, r: f32, x: &[f32], y: &[f32]) -> Result<(), TestCaseError> {
    let mut g = Grid::default();
    g.rebuild(w, h, r, x, y);
    for i in 0..x.len() {
        let mut brute: Vec<usize> = (0..x.len())
            .filter(|&j| j != i && in_range(x, y, i, j, r))
            .collect();
        let mut seen: Vec<usize> = g.around(x[i], y[i]).collect();
        // No candidate twice, and the boid itself among them.
        let before = seen.len();
        seen.sort_unstable();
        seen.dedup();
        prop_assert_eq!(seen.len(), before, "a candidate twice");
        prop_assert!(seen.contains(&i), "boid {} not in its own block", i);
        let mut found: Vec<usize> = seen
            .into_iter()
            .filter(|&j| j != i && in_range(x, y, i, j, r))
            .collect();
        brute.sort_unstable();
        found.sort_unstable();
        prop_assert_eq!(found, brute, "boid {}", i);
    }
    Ok(())
}

proptest! {
    /// Exact: the grid finds every neighbour brute force does, no more,
    /// for random flocks, ranges and arenas, boids far outside included
    /// (clamped into the edge cells).
    #[test]
    fn the_grid_finds_exactly_the_neighbours(
        w in 50.0_f32..800.0,
        h in 50.0_f32..800.0,
        r in 1.0_f32..120.0,
        pts in prop::collection::vec((-0.5_f32..1.5, -0.5_f32..1.5), 1..300),
    ) {
        let x: Vec<f32> = pts.iter().map(|p| p.0 * w).collect();
        let y: Vec<f32> = pts.iter().map(|p| p.1 * h).collect();
        same_neighbours(w, h, r, &x, &y)?;
    }

    /// Dense clumps (many boids per cell, many exactly on cell edges).
    #[test]
    fn clumps_and_cell_edges(
        r in 5.0_f32..40.0,
        pts in prop::collection::vec((0_u8..20, 0_u8..20), 2..200),
    ) {
        let x: Vec<f32> = pts.iter().map(|p| f32::from(p.0) * r / 2.0).collect();
        let y: Vec<f32> = pts.iter().map(|p| f32::from(p.1) * r / 2.0).collect();
        same_neighbours(10.0 * r, 10.0 * r, r, &x, &y)?;
    }
}

#[test]
fn a_tiny_range_on_a_big_arena_caps_the_cells() {
    let mut g = Grid::default();
    g.rebuild(10_000.0, 5_000.0, 0.5, &[1.0], &[1.0]);
    // Cells of 10000/1024 (× the slack): at most 1024 a side, not 20,000.
    assert!(g.cols <= 1024 && g.rows <= 513, "{} × {}", g.cols, g.rows);
}

/// Each particle's neighbours through the wrapped grid, against every
/// pair by the minimum image; `None` from the grid means brute force.
fn same_neighbours_periodic(side: f32, r: f32, x: &[f32], y: &[f32]) -> Result<(), TestCaseError> {
    let image = |d: f32| {
        if d > side / 2.0 {
            d - side
        } else if d < -side / 2.0 {
            d + side
        } else {
            d
        }
    };
    let near = |i: usize, j: usize| {
        let (dx, dy) = (image(x[i] - x[j]), image(y[i] - y[j]));
        dx * dx + dy * dy < r * r
    };
    let mut g = Grid::default();
    if g.rebuild_periodic(side, r, x, y).is_none() {
        prop_assert!(
            side < 3.0 * r * super::CELL_SLACK,
            "refused a box of {} cells",
            side / r
        );
        return Ok(());
    }
    for i in 0..x.len() {
        let mut seen: Vec<usize> = g.around_wrapped(x[i], y[i]).collect();
        let before = seen.len();
        seen.sort_unstable();
        seen.dedup();
        prop_assert_eq!(seen.len(), before, "a candidate twice");
        let found: Vec<usize> = seen.into_iter().filter(|&j| near(i, j)).collect();
        let brute: Vec<usize> = (0..x.len()).filter(|&j| near(i, j)).collect();
        prop_assert_eq!(found, brute, "particle {}", i);
    }
    Ok(())
}

proptest! {
    /// Exact in a periodic box, boxes from under 3 cells (refused) up,
    /// particles anywhere in `[0, side)`, on cell edges included.
    #[test]
    fn the_periodic_grid_finds_exactly_the_neighbours(
        side in 1.0_f32..40.0,
        r in 0.5_f32..3.0,
        pts in prop::collection::vec((0.0_f32..1.0, 0.0_f32..1.0), 1..300),
    ) {
        let x: Vec<f32> = pts.iter().map(|p| (p.0 * side).min(side * (1.0 - f32::EPSILON))).collect();
        let y: Vec<f32> = pts.iter().map(|p| (p.1 * side).min(side * (1.0 - f32::EPSILON))).collect();
        same_neighbours_periodic(side, r, &x, &y)?;
    }

    /// Particles on a lattice of half-cells: exactly on edges and a cell
    /// apart through the wrap.
    #[test]
    fn periodic_lattice_edges(k in 3_u8..12, pts in prop::collection::vec((0_u8..24, 0_u8..24), 2..150)) {
        let side = f32::from(k);
        let x: Vec<f32> = pts.iter().map(|p| (f32::from(p.0) * 0.5) % side).collect();
        let y: Vec<f32> = pts.iter().map(|p| (f32::from(p.1) * 0.5) % side).collect();
        same_neighbours_periodic(side, 1.0, &x, &y)?;
    }
}

#[test]
fn a_box_under_three_cells_is_refused() {
    let mut g = Grid::default();
    assert!(g.rebuild_periodic(2.9, 1.0, &[0.5], &[0.5]).is_none());
    // Fig. 2a's smallest box, L = 3.1 at r = 1: three cells (just).
    assert!(g.rebuild_periodic(3.1, 1.0, &[0.5], &[0.5]).is_some());
    assert_eq!(g.cols, 3);
}
