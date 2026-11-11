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
    let (_, stone) = sand::unpack(d.grid().cells()[0]);
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

#[test]
fn the_palette_renders_every_cell_as_its_colour() {
    let mut d = SandDemo::new(64, 32, 3).unwrap();
    for (i, m) in Material::ALL.into_iter().enumerate() {
        let x = i64::try_from(i).unwrap() * 10 + 5;
        d.paint(x, 16, 4, m);
    }
    let cells = d.grid().cells().to_vec();
    let px = d.render().to_vec();
    for (c, p) in cells.into_iter().zip(px) {
        let (m, shade) = sand::unpack(c);
        assert_eq!(p, colour(m, shade), "cell {c:#04x}");
    }
}

// From the full mutation run at 16cea2a: colours were only ever compared
// with `colour` itself, and three setters with nothing.

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
    let mids: Vec<u32> = Material::ALL.iter().map(|&m| colour(m, 8)).collect();
    for (i, a) in mids.iter().enumerate() {
        assert!(
            mids[i + 1..].iter().all(|b| b != a),
            "two materials share {a:#x}"
        );
    }
}

#[test]
fn the_rate_sets_steps_per_second() {
    let mut d = SandDemo::new(8, 8, 1).unwrap();
    // A fifth of a second (under FixedStep's 0.25 s frame clamp).
    assert_eq!(d.advance(0.2), 12, "60 a second to start");
    d.set_rate(core::num::NonZeroU32::new(10).unwrap());
    assert_eq!(d.advance(0.2), 2);
}

#[test]
fn chunks_off_updates_everything_and_moves_are_reported() {
    let mut d = SandDemo::new(64, 64, 1).unwrap();
    d.paint(32, 2, 0, Material::Sand);
    assert_eq!(d.advance(1.0 / 60.0), 1);
    assert_eq!(d.last_moves(), 1);
    // Settle; then chunked, nothing is awake; off, every chunk is.
    for _ in 0..120 {
        d.advance(1.0 / 60.0);
    }
    assert_eq!((d.last_moves(), d.grid().awake_chunks().0), (0, 0));
    d.set_chunked(false);
    let (awake, all) = d.grid().awake_chunks();
    assert_eq!(awake, all);
}
