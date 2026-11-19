use proptest::prelude::*;

use super::Grid;

fn in_range(x: &[f32], y: &[f32], boid: usize, other: usize, range: f32) -> bool {
    let (dx, dy) = (x[boid] - x[other], y[boid] - y[other]);
    dx.abs() < range && dy.abs() < range && dx * dx + dy * dy < range * range
}

/// Each boid's neighbours found through the grid, against every pair.
fn same_neighbours(
    width: f32,
    height: f32,
    range: f32,
    x: &[f32],
    y: &[f32],
) -> Result<(), TestCaseError> {
    let mut grid = Grid::default();
    grid.rebuild(width, height, range, x, y);
    for boid in 0..x.len() {
        let mut every_pair: Vec<usize> = (0..x.len())
            .filter(|&other| other != boid && in_range(x, y, boid, other, range))
            .collect();
        let mut candidates: Vec<usize> = grid.around(x[boid], y[boid]).collect();
        // No candidate twice, and the boid itself among them.
        let before = candidates.len();
        candidates.sort_unstable();
        candidates.dedup();
        prop_assert_eq!(candidates.len(), before, "a candidate twice");
        prop_assert!(
            candidates.contains(&boid),
            "boid {} not in its own block",
            boid
        );
        let mut found: Vec<usize> = candidates
            .into_iter()
            .filter(|&other| other != boid && in_range(x, y, boid, other, range))
            .collect();
        every_pair.sort_unstable();
        found.sort_unstable();
        prop_assert_eq!(found, every_pair, "boid {}", boid);
    }
    Ok(())
}

proptest! {
    /// Exact: the grid finds every neighbour brute force does, no more,
    /// for random flocks, ranges and arenas, boids far outside included
    /// (clamped into the edge cells).
    #[test]
    fn the_grid_finds_exactly_the_neighbours(
        width in 50.0_f32..800.0,
        height in 50.0_f32..800.0,
        range in 1.0_f32..120.0,
        points in prop::collection::vec((-0.5_f32..1.5, -0.5_f32..1.5), 1..300),
    ) {
        let x: Vec<f32> = points.iter().map(|point| point.0 * width).collect();
        let y: Vec<f32> = points.iter().map(|point| point.1 * height).collect();
        same_neighbours(width, height, range, &x, &y)?;
    }

    /// Dense clumps (many boids per cell, many exactly on cell edges).
    #[test]
    fn clumps_and_cell_edges(
        range in 5.0_f32..40.0,
        points in prop::collection::vec((0_u8..20, 0_u8..20), 2..200),
    ) {
        let x: Vec<f32> = points.iter().map(|point| f32::from(point.0) * range / 2.0).collect();
        let y: Vec<f32> = points.iter().map(|point| f32::from(point.1) * range / 2.0).collect();
        same_neighbours(10.0 * range, 10.0 * range, range, &x, &y)?;
    }
}

#[test]
fn a_tiny_range_on_a_big_arena_caps_the_cells() {
    let mut grid = Grid::default();
    grid.rebuild(10_000.0, 5_000.0, 0.5, &[1.0], &[1.0]);
    // Cells of 10000/1024 (× the slack): at most 1024 a side, not 20,000.
    assert!(
        grid.columns <= 1024 && grid.rows <= 513,
        "{} × {}",
        grid.columns,
        grid.rows
    );
}

/// Each particle's neighbours through the wrapped grid, against every
/// pair by the minimum image; `None` from the grid means brute force.
fn same_neighbours_periodic(
    side: f32,
    range: f32,
    x: &[f32],
    y: &[f32],
) -> Result<(), TestCaseError> {
    let image = |distance: f32| {
        if distance > side / 2.0 {
            distance - side
        } else if distance < -side / 2.0 {
            distance + side
        } else {
            distance
        }
    };
    let near = |particle: usize, other: usize| {
        let (dx, dy) = (image(x[particle] - x[other]), image(y[particle] - y[other]));
        dx * dx + dy * dy < range * range
    };
    let mut grid = Grid::default();
    if grid.rebuild_periodic(side, range, x, y).is_none() {
        prop_assert!(
            side < 3.0 * range * super::CELL_SLACK,
            "refused a box of {} cells",
            side / range
        );
        return Ok(());
    }
    for particle in 0..x.len() {
        let mut candidates: Vec<usize> = grid
            .cells_wrapped(x[particle], y[particle])
            .into_iter()
            .flatten()
            .map(|&other| other as usize)
            .collect();
        let before = candidates.len();
        candidates.sort_unstable();
        candidates.dedup();
        prop_assert_eq!(candidates.len(), before, "a candidate twice");
        let found: Vec<usize> = candidates
            .into_iter()
            .filter(|&other| near(particle, other))
            .collect();
        let every_pair: Vec<usize> = (0..x.len())
            .filter(|&other| near(particle, other))
            .collect();
        prop_assert_eq!(found, every_pair, "particle {}", particle);
    }
    Ok(())
}

proptest! {
    /// Exact in a periodic box, boxes from under 3 cells (refused) up,
    /// particles anywhere in `[0, side)`, on cell edges included.
    #[test]
    fn the_periodic_grid_finds_exactly_the_neighbours(
        side in 1.0_f32..40.0,
        range in 0.5_f32..3.0,
        points in prop::collection::vec((0.0_f32..1.0, 0.0_f32..1.0), 1..300),
    ) {
        let x: Vec<f32> = points.iter().map(|point| (point.0 * side).min(side * (1.0 - f32::EPSILON))).collect();
        let y: Vec<f32> = points.iter().map(|point| (point.1 * side).min(side * (1.0 - f32::EPSILON))).collect();
        same_neighbours_periodic(side, range, &x, &y)?;
    }

    /// Particles on a lattice of half-cells: exactly on edges and a cell
    /// apart through the wrap.
    #[test]
    fn periodic_lattice_edges(
        cells_per_side in 3_u8..12,
        points in prop::collection::vec((0_u8..24, 0_u8..24), 2..150),
    ) {
        let side = f32::from(cells_per_side);
        let x: Vec<f32> = points.iter().map(|point| (f32::from(point.0) * 0.5) % side).collect();
        let y: Vec<f32> = points.iter().map(|point| (f32::from(point.1) * 0.5) % side).collect();
        same_neighbours_periodic(side, 1.0, &x, &y)?;
    }
}

#[test]
fn a_box_under_three_cells_is_refused() {
    let mut grid = Grid::default();
    assert!(grid.rebuild_periodic(2.9, 1.0, &[0.5], &[0.5]).is_none());
    // Fig. 2a's smallest box, L = 3.1 at r = 1: three cells (just).
    assert!(grid.rebuild_periodic(3.1, 1.0, &[0.5], &[0.5]).is_some());
    assert_eq!(grid.columns, 3);
}
