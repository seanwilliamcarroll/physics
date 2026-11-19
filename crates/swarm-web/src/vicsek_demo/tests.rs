use super::VicsekDemo;
use crate::abi;
use crate::demo::BACKGROUND;

#[test]
fn sizes_and_settings_are_checked() {
    assert!(VicsekDemo::new(0, 10.0, 1.0, 400, 1).is_none());
    assert!(VicsekDemo::new(10, 10.0, 1.0, 0, 1).is_none());
    assert!(
        VicsekDemo::new(10, 10.0, 7.0, 400, 1).is_none(),
        "noise past 2π"
    );
    let mut demo = VicsekDemo::new(400, 10.0, 1.0, 400, 1).unwrap();
    assert!(demo.set_noise(3.0) && !demo.set_noise(-1.0) && !demo.set_noise(f64::NAN));
    assert_eq!(demo.system().params().noise, 3.0);
    assert!(demo.set_speed(0.1) && !demo.set_speed(0.0));
    assert_eq!(demo.advance(0.2), 12);
}

#[test]
fn the_measurement_is_capped() {
    let mut demo = VicsekDemo::new(40, 3.1, 0.0, 100, 1).unwrap();
    let order = demo.mean_order(10, 10).unwrap();
    assert!((0.0..=1.0).contains(&order));
    assert_eq!(demo.mean_order(abi::MAX_RUN, 1), None);
    assert_eq!(demo.mean_order(10, 0), None);
    assert_eq!(demo.mean_order(u32::MAX, u32::MAX), None);
}

#[test]
fn render_draws_every_particle() {
    let mut demo = VicsekDemo::new(50, 10.0, 1.0, 200, 3).unwrap();
    let pixels = demo.render().to_vec();
    assert_eq!(pixels.len(), 200 * 200);
    let drawn = pixels.iter().filter(|&&pixel| pixel != BACKGROUND).count();
    assert!(drawn > 50 && drawn <= 200, "{drawn}");
}

#[test]
fn a_particle_is_drawn_where_it_is_in_its_heading_s_colour() {
    let mut demo = VicsekDemo::new(1, 10.0, 1.0, 200, 9).unwrap();
    let particle = demo.system.particles().next().unwrap();
    let colour = demo.hues[crate::demo::heading_index(particle.cos, particle.sin)];
    #[expect(
        clippy::cast_possible_truncation,
        clippy::cast_sign_loss,
        reason = "inside the view"
    )]
    let (x0, y0) = (
        (particle.x * 20.0).floor() as usize,
        (particle.y * 20.0).floor() as usize,
    );
    let pixels = demo.render().to_vec();
    for y in 0..200 {
        for x in 0..200 {
            let inside = (x0..x0 + 2).contains(&x) && (y0..y0 + 2).contains(&y);
            let want = if inside { colour } else { BACKGROUND };
            assert_eq!(
                pixels[y * 200 + x],
                want,
                "({x}, {y}); the particle at ({x0}, {y0})"
            );
        }
    }
}
