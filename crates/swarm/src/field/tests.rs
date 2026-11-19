use super::{Field, MAX_CELLS};

fn all_open(width: usize, height: usize) -> Vec<bool> {
    vec![true; width * height]
}

#[test]
fn sizes_and_deposits_are_checked() {
    assert!(Field::new(0, 5).is_none() && Field::new(MAX_CELLS + 1, 1).is_none());
    let mut field = Field::new(10, 5).unwrap();
    assert!(field.deposit(3, 2, 1.5) && field.deposit(3, 2, 0.5));
    assert_eq!(field.get(3, 2), Some(2.0));
    assert!(
        !field.deposit(10, 0, 1.0) && !field.deposit(0, 0, -1.0) && !field.deposit(0, 0, f32::NAN)
    );
    assert_eq!(field.total(), 2.0);
}

#[test]
fn diffusion_spreads_to_the_eight_neighbours_and_keeps_the_rest() {
    let mut field = Field::new(5, 5).unwrap();
    field.deposit(2, 2, 8.0);
    field.diffuse(&all_open(5, 5), 0.5);
    assert_eq!(field.get(2, 2), Some(4.0));
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
        assert_eq!(field.get(x, y), Some(0.5), "({x}, {y})");
    }
    assert_eq!(field.total(), 8.0);
}

#[test]
fn diffusion_conserves_mass_at_edges_and_walls() {
    let (width, height) = (6, 6);
    let mut open = all_open(width, height);
    for (x, y) in [(3, 2), (4, 2), (5, 2), (3, 3), (3, 4), (4, 4), (5, 4)] {
        open[y * width + x] = false;
    }
    let mut field = Field::new(width, height).unwrap();
    field.deposit(0, 0, 3.0);
    field.deposit(4, 3, 5.0);
    field.diffuse(&open, 0.9);
    let corner = field.get(1, 0).unwrap();
    assert!(
        (corner - 0.9).abs() < 1e-6,
        "a corner gives to 3: 2.7 / 3, got {corner}"
    );
    // (4, 3)'s only open neighbour is (5, 3): all 4.5 goes there.
    assert_eq!((field.get(4, 3), field.get(5, 3)), (Some(0.5), Some(4.5)));
    for (x, y) in [(3, 2), (4, 2), (3, 3)] {
        assert_eq!(field.get(x, y), Some(0.0), "a wall takes nothing");
    }
    assert!((field.total() - 8.0).abs() < 1e-6);
}

#[test]
fn a_cell_with_no_open_neighbour_keeps_its_value() {
    let mut open = vec![false; 9];
    open[4] = true;
    let mut field = Field::new(3, 3).unwrap();
    field.deposit(1, 1, 2.0);
    field.diffuse(&open, 0.5);
    assert_eq!(field.get(1, 1), Some(2.0));
}

#[test]
fn decay_and_clear() {
    let mut field = Field::new(4, 4).unwrap();
    field.deposit(1, 1, 10.0);
    field.decay(0.1);
    assert_eq!(field.get(1, 1), Some(9.0));
    field.decay(f32::NAN);
    assert_eq!(
        field.get(1, 1),
        Some(9.0),
        "a non-finite rate decays nothing"
    );
    field.clear();
    assert_eq!(field.total(), 0.0);
}

#[test]
fn periodic_diffusion_wraps_and_the_mean_filter_is_rate_eight_ninths() {
    let mut field = Field::new(5, 4).unwrap();
    field.deposit(0, 0, 9.0);
    field.diffuse_periodic(8.0 / 9.0);
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
        assert!((field.get(x, y).unwrap() - 1.0).abs() < 1e-6, "({x}, {y})");
    }
    assert!((field.total() - 9.0).abs() < 1e-5);
}

#[test]
fn top_share_of_uniform_and_concentrated_fields() {
    let mut uniform = Field::new(10, 10).unwrap();
    assert_eq!(uniform.top_share(0.1), 0.0, "empty");
    for y in 0..10 {
        for x in 0..10 {
            uniform.deposit(x, y, 1.0);
        }
    }
    assert!((uniform.top_share(0.1) - 0.1).abs() < 1e-12, "uniform");
    let mut concentrated = Field::new(10, 10).unwrap();
    concentrated.deposit(3, 3, 5.0);
    assert!(
        (concentrated.top_share(0.1) - 1.0).abs() < 1e-12,
        "all in one cell"
    );
}

#[test]
fn open_neighbours_counts_the_eight_less_edges_and_walls() {
    let field = Field::new(4, 3).unwrap();
    let mut open = all_open(4, 3);
    open[5] = false;
    #[rustfmt::skip]
    let expected = [
        2, 4, 4, 3,
        4, 8, 7, 5,
        2, 4, 4, 3,
    ];
    assert_eq!(field.open_neighbours(&open), expected);
}

#[test]
fn diffusing_with_given_counts_is_diffusing() {
    let mut open = all_open(7, 5);
    open[9] = false;
    open[17] = false;
    let (mut counted_each_call, mut counted_once) =
        (Field::new(7, 5).unwrap(), Field::new(7, 5).unwrap());
    for (x, y, amount) in [(0, 0, 1.0), (3, 2, 2.5), (6, 4, 0.3), (2, 2, 7.0)] {
        assert!(counted_each_call.deposit(x, y, amount) && counted_once.deposit(x, y, amount));
    }
    let counts = counted_each_call.open_neighbours(&open);
    for _ in 0..5 {
        counted_each_call.diffuse(&open, 0.3);
        counted_once.diffuse_counted(&open, &counts, 0.3);
    }
    assert_eq!(
        counted_each_call.values(),
        counted_once.values(),
        "bit for bit"
    );
}

#[test]
fn the_size_is_reported_and_a_column_past_the_edge_is_outside() {
    let mut field = Field::new(7, 5).unwrap();
    assert_eq!((field.width(), field.height()), (7, 5));
    assert_eq!(field.get(7, 0), None);
    assert_eq!(field.get(0, 5), None);
    assert!(!field.deposit(7, 0, 1.0));
    assert_eq!(field.total(), 0.0);
}

#[test]
fn diffusion_at_the_right_edge_does_not_wrap_to_the_next_row() {
    let mut field = Field::new(5, 5).unwrap();
    field.deposit(4, 2, 5.0);
    assert_eq!(
        field.open_neighbours(&all_open(5, 5)).get(2 * 5 + 4),
        Some(&5)
    );
    field.diffuse(&all_open(5, 5), 0.5);
    for y in 0..5 {
        assert_eq!(field.get(0, y), Some(0.0), "row {y}'s first cell");
    }
    assert_eq!(field.get(4, 2), Some(2.5));
    assert_eq!(field.get(3, 1), Some(0.5));
}

#[test]
fn a_value_inside_a_wall_goes_nowhere() {
    // Walls hold nothing (a colony clears them); a value left in one is
    // dropped, not spread.
    let mut field = Field::new(5, 5).unwrap();
    let mut open = all_open(5, 5);
    open[12] = false;
    field.deposit(2, 2, 4.0);
    field.diffuse(&open, 0.5);
    assert_eq!(field.total(), 0.0);
}

#[test]
fn zero_clears_one_cell() {
    let mut field = Field::new(4, 3).unwrap();
    field.deposit(1, 1, 2.0);
    field.deposit(2, 1, 3.0);
    field.zero(5);
    assert_eq!((field.get(1, 1), field.get(2, 1)), (Some(0.0), Some(3.0)));
}

#[test]
fn the_top_share_of_everything_is_everything() {
    let mut field = Field::new(4, 3).unwrap();
    field.deposit(1, 1, 2.0);
    field.deposit(2, 1, 6.0);
    assert_eq!(field.top_share(1.0), 1.0);
    // The top cell of twelve (a twelfth, rounded to one cell): 6 of 8.
    assert_eq!(field.top_share(1.0 / 12.0), 0.75);
    assert_eq!(field.top_share(2.0 / 12.0), 1.0);
}
