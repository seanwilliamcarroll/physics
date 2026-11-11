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
    let g = Grid::new(4, 3, 1).unwrap();
    assert_eq!((g.width(), g.height(), g.cells().len()), (4, 3, 12));
    assert_eq!(g.count(Material::Empty), 12);
}

#[test]
fn painting_sets_a_material_inside_and_refuses_outside() {
    let mut g = Grid::new(4, 3, 1).unwrap();
    assert!(g.set(3, 2, Material::Water));
    assert!(!g.set(4, 0, Material::Sand) && !g.set(0, 3, Material::Sand));
    assert_eq!((g.get(3, 2), g.get(4, 0)), (Some(Material::Water), None));
    assert_eq!(g.count(Material::Water), 1);
}

// From the full mutation run at 16cea2a: chunk skipping, `keep`, the
// move count, the right edge and the step counter.

/// A layer of sand on a stone floor, run until nothing moves.
fn settled(w: usize, h: usize, chunked: bool) -> Grid {
    let mut g = Grid::new(w, h, 1).unwrap();
    g.set_chunked(chunked);
    for x in 0..w {
        g.set(x, h - 1, Material::Stone);
        g.set(x, h - 2, Material::Sand);
    }
    while g.step() > 0 {}
    // Painting woke chunks for this step and the next.
    g.step();
    g
}

#[test]
fn a_settled_grid_visits_nothing_with_chunks_and_everything_without() {
    let (w, h) = (100, 70);
    let mut g = settled(w, h, true);
    let before = g.visited;
    assert_eq!(g.step(), 0);
    assert_eq!(g.visited, before, "every chunk asleep: no cell visited");
    let mut g = settled(w, h, false);
    let before = g.visited;
    g.step();
    assert_eq!(g.visited - before, w * h, "chunks off: every cell");
}

/// Lava that could flow but waits on its coin, and blocked steam waiting
/// to condense, keep their own chunk awake though nothing moved: without
/// that, the chunk sleeps and they never move (`Chunks::keep`). Alone in
/// a still grid (random grids always have movement nearby, so the
/// equivalence property test can't see this), chunked must still match
/// every-cell, cell for cell.
#[test]
fn waiting_cells_keep_their_chunk_awake() {
    let scene = |chunked: bool| {
        let mut g = Grid::new(100, 70, 3).unwrap();
        g.set_chunked(chunked);
        for x in 0..100 {
            g.set(x, 69, Material::Stone);
            g.set(x, 0, Material::Stone);
        }
        // A lava cell on the floor, free to spread, far from the edges.
        g.set(50, 68, Material::Lava);
        // Steam under the ceiling, stone either side: fully blocked.
        g.set(70, 1, Material::Steam);
        g.set(69, 1, Material::Stone);
        g.set(71, 1, Material::Stone);
        g
    };
    let (mut chunked, mut full) = (scene(true), scene(false));
    let mut condensed = false;
    for step in 0..400 {
        chunked.step();
        full.step();
        assert_eq!(chunked.cells(), full.cells(), "diverged at step {step}");
        // Measured: at step 161 (its water then falls, meets the lava,
        // and boils again).
        condensed |= full.get(70, 1) == Some(Material::Water);
    }
    assert!(condensed, "the blocked steam condensed");
}

#[test]
fn a_step_reports_its_moves() {
    let mut g = Grid::new(5, 20, 1).unwrap();
    for y in 0..10 {
        g.set(2, y, Material::Sand);
    }
    // A free-falling column: every grain moves once.
    assert_eq!(g.step(), 10);
    // A reaction counts as a move: lava above water in a one-wide column.
    let mut r = Grid::new(1, 3, 1).unwrap();
    r.set(0, 1, Material::Lava);
    r.set(0, 2, Material::Water);
    assert_eq!(r.step(), 1);
    // Condensing counts: steam boxed in, stepped until it turns.
    let mut c = Grid::new(1, 1, 1).unwrap();
    c.set(0, 0, Material::Steam);
    let mut total = 0;
    for _ in 0..2000 {
        total += c.step();
    }
    assert_eq!((total, c.get(0, 0)), (1, Some(Material::Water)));
}

#[test]
fn the_right_edge_is_outside_and_steps_are_counted() {
    let mut g = Grid::new(4, 3, 1).unwrap();
    assert_eq!((g.get(4, 0), g.get(3, 3)), (None, None));
    assert!(!g.set(4, 0, Material::Sand), "not wrapped to the next row");
    assert_eq!(g.count(Material::Sand), 0);
    assert_eq!(g.steps(), 0);
    g.step();
    g.step();
    assert_eq!(g.steps(), 2);
}
