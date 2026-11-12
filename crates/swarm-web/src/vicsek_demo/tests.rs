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
    let mut d = VicsekDemo::new(400, 10.0, 1.0, 400, 1).unwrap();
    assert!(d.set_noise(3.0) && !d.set_noise(-1.0) && !d.set_noise(f64::NAN));
    assert_eq!(d.system().params().noise, 3.0);
    assert!(d.set_speed(0.1) && !d.set_speed(0.0));
    assert_eq!(d.advance(0.2), 12);
}

#[test]
fn the_measurement_is_capped() {
    let mut d = VicsekDemo::new(40, 3.1, 0.0, 100, 1).unwrap();
    let v = d.mean_order(10, 10).unwrap();
    assert!((0.0..=1.0).contains(&v));
    assert_eq!(d.mean_order(abi::MAX_RUN, 1), None);
    assert_eq!(d.mean_order(10, 0), None);
    assert_eq!(d.mean_order(u32::MAX, u32::MAX), None);
}

#[test]
fn render_draws_every_particle() {
    let mut d = VicsekDemo::new(50, 10.0, 1.0, 200, 3).unwrap();
    let px = d.render().to_vec();
    assert_eq!(px.len(), 200 * 200);
    let drawn = px.iter().filter(|&&p| p != BACKGROUND).count();
    assert!(drawn > 50 && drawn <= 200, "{drawn}");
}
