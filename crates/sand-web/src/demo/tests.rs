use super::{SandDemo, colour};
use sand::Material;

#[test]
fn a_disc_of_paint_clipped_to_the_grid() {
    let mut d = SandDemo::new(20, 10, 1).unwrap();
    // A radius-2 disc is 13 cells; centred in a corner, a quarter-ish
    // (6 cells: (0,0) (1,0) (2,0) (0,1) (1,1) (0,2)) lands in the grid.
    assert_eq!(d.paint(10, 5, 2, Material::Sand), 13);
    assert_eq!(d.paint(0, 0, 2, Material::Water), 6);
    assert_eq!(d.paint(-50, -50, 3, Material::Water), 0);
    assert_eq!(d.grid().count(Material::Sand), 13);
}

#[test]
fn advancing_steps_at_the_rate_and_the_cap_holds() {
    let mut d = SandDemo::new(16, 16, 1).unwrap();
    d.paint(8, 2, 1, Material::Sand);
    assert_eq!(d.advance(1.0 / 60.0), 1);
    assert!(d.last_moves() > 0);
    d.set_step_cap(core::num::NonZeroU32::new(2));
    assert_eq!(d.advance(0.25), 2);
}

#[test]
fn render_writes_a_pixel_per_cell_with_the_materials_colour() {
    let mut d = SandDemo::new(4, 2, 1).unwrap();
    d.paint(0, 0, 0, Material::Stone);
    let px = d.render().to_vec();
    assert_eq!(px.len(), 8);
    assert_eq!(px[1], colour(Material::Empty, 0), "empty isn't shaded");
    let stone = d.grid().shade_at(0, 0).unwrap();
    assert_eq!(px[0], colour(Material::Stone, stone));
    assert_eq!(px[0] >> 24, 0xff, "opaque");
}

#[test]
fn shades_vary_a_material_but_stay_in_range() {
    let lo = colour(Material::Sand, 0);
    let hi = colour(Material::Sand, 15);
    assert_ne!(lo, hi);
    assert_eq!(colour(Material::Empty, 0), colour(Material::Empty, 15));
}
