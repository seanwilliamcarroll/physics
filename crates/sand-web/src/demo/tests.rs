use super::{SandDemo, colour};
use sand::Material;

#[test]
fn a_disc_of_paint_clipped_to_the_grid() {
    let mut demo = SandDemo::new(20, 10, 1).unwrap();
    // A radius-2 disc is 13 cells; 6 land in the grid from a corner.
    assert_eq!(demo.paint(10, 5, 2, Material::Sand), 13);
    assert_eq!(demo.paint(0, 0, 2, Material::Water), 6);
    assert_eq!(demo.paint(-50, -50, 3, Material::Water), 0);
    assert_eq!(demo.grid().count(Material::Sand), 13);
}

#[test]
fn advancing_steps_at_the_rate_and_the_cap_holds() {
    let mut demo = SandDemo::new(16, 16, 1).unwrap();
    demo.paint(8, 2, 1, Material::Sand);
    assert_eq!(demo.advance(1.0 / 60.0), 1);
    assert!(demo.last_moves() > 0);
    demo.clock().set_cap(core::num::NonZeroU32::new(2));
    assert_eq!(demo.advance(0.25), 2);
}

#[test]
fn render_writes_a_pixel_per_cell_with_the_materials_colour() {
    let mut demo = SandDemo::new(4, 2, 1).unwrap();
    demo.paint(0, 0, 0, Material::Stone);
    let pixels = demo.render().to_vec();
    assert_eq!(pixels.len(), 8);
    assert_eq!(pixels[1], colour(Material::Empty, 0), "empty isn't shaded");
    let (_, stone_shade) = sand::unpack(demo.grid().cells()[0]);
    assert_eq!(pixels[0], colour(Material::Stone, stone_shade));
    assert_eq!(pixels[0] >> 24, 0xff, "opaque");
}

#[test]
fn shades_vary_a_material_but_stay_in_range() {
    let darkest = colour(Material::Sand, 0);
    let lightest = colour(Material::Sand, 15);
    assert_ne!(darkest, lightest);
    assert_eq!(colour(Material::Empty, 0), colour(Material::Empty, 15));
}

#[test]
fn the_palette_renders_every_cell_as_its_colour() {
    let mut demo = SandDemo::new(64, 32, 3).unwrap();
    for (index, material) in Material::ALL.into_iter().enumerate() {
        let x = i64::try_from(index).unwrap() * 10 + 5;
        demo.paint(x, 16, 4, material);
    }
    let cells = demo.grid().cells().to_vec();
    let pixels = demo.render().to_vec();
    for (cell_byte, pixel) in cells.into_iter().zip(pixels) {
        let (material, shade) = sand::unpack(cell_byte);
        assert_eq!(pixel, colour(material, shade), "cell {cell_byte:#04x}");
    }
}

/// Exact colours, in `ImageData` byte order (R in the low byte): empty is
/// the page's `--stage-bg` (#161a22, which the smoke test also counts
/// against); a mid shade (8) is the material's base; a shade moves every
/// channel `SHADE_STEP` (4) a step, clamped.
#[test]
fn colours_are_exact() {
    assert_eq!(colour(Material::Empty, 0), 0xff22_1a16);
    assert_eq!(colour(Material::Empty, 15), 0xff22_1a16);
    assert_eq!(colour(Material::Sand, 8), 0xff6a_b8d8);
    // Sand, darkest: each channel −32.
    assert_eq!(colour(Material::Sand, 0), 0xff4a_98b8);
    // Lava, lightest: +28 (0x1c), red clamped at 0xff.
    assert_eq!(colour(Material::Lava, 15), 0xff3a_76ff);
    let mid_shades: Vec<u32> = Material::ALL
        .iter()
        .map(|&material| colour(material, 8))
        .collect();
    for (index, mid_shade) in mid_shades.iter().enumerate() {
        assert!(
            mid_shades[index + 1..]
                .iter()
                .all(|other| other != mid_shade),
            "two materials share {mid_shade:#x}"
        );
    }
}

#[test]
fn the_rate_sets_steps_per_second() {
    let mut demo = SandDemo::new(8, 8, 1).unwrap();
    // A fifth of a second (under FixedStep's 0.25 s frame clamp).
    assert_eq!(demo.advance(0.2), 12, "60 a second to start");
    demo.clock()
        .set_rate(core::num::NonZeroU32::new(10).unwrap());
    assert_eq!(demo.advance(0.2), 2);
}

#[test]
fn chunks_off_updates_everything_and_moves_are_reported() {
    let mut demo = SandDemo::new(64, 64, 1).unwrap();
    demo.paint(32, 2, 0, Material::Sand);
    assert_eq!(demo.advance(1.0 / 60.0), 1);
    assert_eq!(demo.last_moves(), 1);
    // Settle; then chunked, nothing is awake; off, every chunk is.
    for _ in 0..120 {
        demo.advance(1.0 / 60.0);
    }
    assert_eq!((demo.last_moves(), demo.grid().awake_chunks().0), (0, 0));
    demo.set_chunked(false);
    let (awake, all) = demo.grid().awake_chunks();
    assert_eq!(awake, all);
}
