use super::{Grid, MAX_CELLS};
use crate::Material;

#[test]
fn sizes_are_checked() {
    assert!(Grid::new(0, 10, 1).is_none());
    assert!(Grid::new(10, 0, 1).is_none());
    assert!(Grid::new(MAX_CELLS, 2, 1).is_none());
    assert!(
        Grid::new(usize::MAX, 2, 1).is_none(),
        "overflow is refused, not wrapped"
    );
    let grid = Grid::new(4, 3, 1).unwrap();
    assert_eq!(
        (grid.width(), grid.height(), grid.cells().len()),
        (4, 3, 12)
    );
    assert_eq!(grid.count(Material::Empty), 12);
}

#[test]
fn painting_sets_a_material_inside_and_refuses_outside() {
    let mut grid = Grid::new(4, 3, 1).unwrap();
    assert!(grid.set(3, 2, Material::Water));
    assert!(!grid.set(4, 0, Material::Sand) && !grid.set(0, 3, Material::Sand));
    assert_eq!(
        (grid.get(3, 2), grid.get(4, 0)),
        (Some(Material::Water), None)
    );
    assert_eq!(grid.count(Material::Water), 1);
}

/// A layer of sand on a stone floor, run until nothing moves.
fn settled(width: usize, height: usize, chunked: bool) -> Grid {
    let mut grid = Grid::new(width, height, 1).unwrap();
    grid.set_chunked(chunked);
    for x in 0..width {
        grid.set(x, height - 1, Material::Stone);
        grid.set(x, height - 2, Material::Sand);
    }
    while grid.step() > 0 {}
    // Painting woke chunks for this step and the next.
    grid.step();
    grid
}

#[test]
fn a_settled_grid_visits_nothing_with_chunks_and_everything_without() {
    let (width, height) = (100, 70);
    let mut grid = settled(width, height, true);
    let before = grid.visited;
    assert_eq!(grid.step(), 0);
    assert_eq!(grid.visited, before, "every chunk asleep: no cell visited");
    let mut grid = settled(width, height, false);
    let before = grid.visited;
    grid.step();
    assert_eq!(
        grid.visited - before,
        width * height,
        "chunks off: every cell"
    );
}

/// Lava that could flow but waits on its coin, and blocked steam waiting
/// to condense, keep their own chunk awake though nothing moved: without
/// that, the chunk sleeps and they never move. Alone in a still grid
/// (random grids always have movement nearby, so the equivalence property
/// test can't see this), chunked must still match every-cell.
#[test]
fn waiting_cells_keep_their_chunk_awake() {
    let scene = |chunked: bool| {
        let mut grid = Grid::new(100, 70, 3).unwrap();
        grid.set_chunked(chunked);
        for x in 0..100 {
            grid.set(x, 69, Material::Stone);
            grid.set(x, 0, Material::Stone);
        }
        // A lava cell on the floor, free to spread, far from the edges.
        grid.set(50, 68, Material::Lava);
        // Steam under the ceiling, stone either side: fully blocked.
        grid.set(70, 1, Material::Steam);
        grid.set(69, 1, Material::Stone);
        grid.set(71, 1, Material::Stone);
        grid
    };
    let (mut chunked, mut every_cell) = (scene(true), scene(false));
    let mut condensed = false;
    for step in 0..400 {
        chunked.step();
        every_cell.step();
        assert_eq!(
            chunked.cells(),
            every_cell.cells(),
            "diverged at step {step}"
        );
        // Measured: it condenses at step 161.
        condensed |= every_cell.get(70, 1) == Some(Material::Water);
    }
    assert!(condensed, "the blocked steam condensed");
}

#[test]
fn a_step_reports_its_moves() {
    let mut falling = Grid::new(5, 20, 1).unwrap();
    for y in 0..10 {
        falling.set(2, y, Material::Sand);
    }
    // A free-falling column: every grain moves once.
    assert_eq!(falling.step(), 10);
    // A reaction counts as a move: lava above water in a one-wide column.
    let mut reacting = Grid::new(1, 3, 1).unwrap();
    reacting.set(0, 1, Material::Lava);
    reacting.set(0, 2, Material::Water);
    assert_eq!(reacting.step(), 1);
    // Condensing counts: steam boxed in, stepped until it turns.
    let mut condensing = Grid::new(1, 1, 1).unwrap();
    condensing.set(0, 0, Material::Steam);
    let mut total = 0;
    for _ in 0..2000 {
        total += condensing.step();
    }
    assert_eq!((total, condensing.get(0, 0)), (1, Some(Material::Water)));
}

#[test]
fn the_right_edge_is_outside_and_steps_are_counted() {
    let mut grid = Grid::new(4, 3, 1).unwrap();
    assert_eq!((grid.get(4, 0), grid.get(3, 3)), (None, None));
    assert!(
        !grid.set(4, 0, Material::Sand),
        "not wrapped to the next row"
    );
    assert_eq!(grid.count(Material::Sand), 0);
    assert_eq!(grid.steps(), 0);
    grid.step();
    grid.step();
    assert_eq!(grid.steps(), 2);
}
