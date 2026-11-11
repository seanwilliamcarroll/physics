use super::{Purpose, draw};

#[test]
fn a_draw_depends_on_every_part_of_its_key() {
    let base = draw(1, 2, 3, 4, Purpose::Side);
    assert_eq!(base, draw(1, 2, 3, 4, Purpose::Side), "repeatable");
    for other in [
        draw(9, 2, 3, 4, Purpose::Side),
        draw(1, 9, 3, 4, Purpose::Side),
        draw(1, 2, 9, 4, Purpose::Side),
        draw(1, 2, 3, 9, Purpose::Side),
        draw(1, 2, 3, 4, Purpose::Shade),
    ] {
        assert_ne!(base, other);
    }
}

#[test]
fn the_side_bit_is_fair() {
    // Over a 200 x 200 patch of one step, the low bit is set half the time:
    // measured 0.5013, bound ±1% (the binomial σ is 0.25%).
    let ones: u32 = (0..200)
        .flat_map(|y| (0..200).map(move |x| (x, y)))
        .map(|(x, y)| u32::from(draw(7, 3, x, y, Purpose::Side) & 1 == 1))
        .sum();
    let frac = f64::from(ones) / 40_000.0;
    assert!((frac - 0.5).abs() < 0.01, "{frac}");
}
