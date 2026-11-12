use super::{Field, MAX_CELLS};

fn open(w: usize, h: usize) -> Vec<bool> {
    vec![true; w * h]
}

#[test]
fn sizes_and_deposits_are_checked() {
    assert!(Field::new(0, 5).is_none() && Field::new(MAX_CELLS + 1, 1).is_none());
    let mut f = Field::new(10, 5).unwrap();
    assert!(f.deposit(3, 2, 1.5) && f.deposit(3, 2, 0.5));
    assert_eq!(f.get(3, 2), Some(2.0));
    assert!(!f.deposit(10, 0, 1.0) && !f.deposit(0, 0, -1.0) && !f.deposit(0, 0, f32::NAN));
    assert_eq!(f.total(), 2.0);
}

#[test]
fn diffusion_spreads_to_the_eight_neighbours_and_keeps_the_rest() {
    let mut f = Field::new(5, 5).unwrap();
    f.deposit(2, 2, 8.0);
    f.diffuse(&open(5, 5), 0.5);
    // Keeps 4, gives 4: 0.5 to each of eight neighbours.
    assert_eq!(f.get(2, 2), Some(4.0));
    for (x, y) in [
        (1, 1),
        (2, 1),
        (3, 1),
        (1, 2),
        (3, 2),
        (1, 3),
        (2, 3),
        (3, 3),
    ] {
        assert_eq!(f.get(x, y), Some(0.5), "({x}, {y})");
    }
    assert_eq!(f.total(), 8.0);
}

#[test]
fn diffusion_conserves_mass_at_edges_and_walls() {
    // A corner (three neighbours) and a cell boxed by walls on all sides
    // but one: nothing leaks.
    let (w, h) = (6, 6);
    let mut walls = open(w, h);
    for (x, y) in [(3, 2), (4, 2), (5, 2), (3, 3), (3, 4), (4, 4), (5, 4)] {
        walls[y * w + x] = false;
    }
    let mut f = Field::new(w, h).unwrap();
    f.deposit(0, 0, 3.0);
    f.deposit(4, 3, 5.0);
    f.diffuse(&walls, 0.9);
    let corner = f.get(1, 0).unwrap();
    assert!(
        (corner - 0.9).abs() < 1e-6,
        "a corner gives to 3: 2.7 / 3, got {corner}"
    );
    // (4, 3)'s only open neighbour is (5, 3): all 4.5 goes there.
    assert_eq!((f.get(4, 3), f.get(5, 3)), (Some(0.5), Some(4.5)));
    for (x, y) in [(3, 2), (4, 2), (3, 3)] {
        assert_eq!(f.get(x, y), Some(0.0), "a wall takes nothing");
    }
    assert!((f.total() - 8.0).abs() < 1e-6);
}

#[test]
fn a_cell_with_no_open_neighbour_keeps_its_value() {
    let mut walls = vec![false; 9];
    walls[4] = true;
    let mut f = Field::new(3, 3).unwrap();
    f.deposit(1, 1, 2.0);
    f.diffuse(&walls, 0.5);
    assert_eq!(f.get(1, 1), Some(2.0));
}

#[test]
fn decay_and_clear() {
    let mut f = Field::new(4, 4).unwrap();
    f.deposit(1, 1, 10.0);
    f.decay(0.1);
    assert_eq!(f.get(1, 1), Some(9.0));
    f.decay(f32::NAN);
    assert_eq!(f.get(1, 1), Some(9.0), "a non-finite rate decays nothing");
    f.clear();
    assert_eq!(f.total(), 0.0);
}

#[test]
fn periodic_diffusion_wraps_and_the_mean_filter_is_d_eight_ninths() {
    let mut f = Field::new(5, 4).unwrap();
    f.deposit(0, 0, 9.0);
    f.diffuse_periodic(8.0 / 9.0);
    // The corner's eight neighbours, wrapped: (4,3) (0,3) (1,3) (4,0) (1,0)
    // (4,1) (0,1) (1,1); each gets a ninth, the cell keeps a ninth.
    for (x, y) in [
        (0, 0),
        (4, 3),
        (0, 3),
        (1, 3),
        (4, 0),
        (1, 0),
        (4, 1),
        (0, 1),
        (1, 1),
    ] {
        assert!((f.get(x, y).unwrap() - 1.0).abs() < 1e-6, "({x}, {y})");
    }
    assert!((f.total() - 9.0).abs() < 1e-5);
}

#[test]
fn top_share_of_uniform_and_concentrated_fields() {
    let mut f = Field::new(10, 10).unwrap();
    assert_eq!(f.top_share(0.1), 0.0, "empty");
    for y in 0..10 {
        for x in 0..10 {
            f.deposit(x, y, 1.0);
        }
    }
    assert!((f.top_share(0.1) - 0.1).abs() < 1e-12, "uniform");
    let mut g = Field::new(10, 10).unwrap();
    g.deposit(3, 3, 5.0);
    assert!((g.top_share(0.1) - 1.0).abs() < 1e-12, "all in one cell");
}
