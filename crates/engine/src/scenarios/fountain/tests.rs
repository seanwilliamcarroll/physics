use super::{FOUNTAIN_VX, FOUNTAIN_VY, Fountain};
use crate::Vec2;
use crate::scenarios::test_util::run;

fn in_launch_range(v: Vec2<f64>) -> bool {
    (FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&v.x) && (FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&v.y)
}

#[test]
fn launches_n_particles_upward_from_the_origin() {
    let w = Fountain::new(1).world::<f64>(100);
    assert_eq!(w.particles.len(), 100);
    assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
    assert!(w.particles.vel().iter().all(|&v| in_launch_range(v)));
}

#[test]
fn is_deterministic_per_seed() {
    let a = Fountain::new(7).world::<f32>(50);
    let b = Fountain::new(7).world::<f32>(50);
    let c = Fountain::new(8).world::<f32>(50);
    assert_eq!(a.particles.vel(), b.particles.vel());
    assert_ne!(a.particles.vel(), c.particles.vel());
}

#[test]
fn particles_fall_below_launch_height_without_respawn() {
    // vy < 12 m/s under standard gravity lands within ~2.5 s.
    let mut w = Fountain::new(3).world::<f64>(20);
    run(&mut w, 180);
    assert!(w.particles.pos().iter().all(|p| p.y < 0.0));
}

#[test]
fn respawn_relaunches_only_fallen_particles() {
    let mut scene = Fountain::new(3);
    let mut w = scene.world::<f64>(20);
    run(&mut w, 30); // 0.5 s: everything still rising or airborne
    let airborne = (w.particles.pos().to_vec(), w.particles.vel().to_vec());
    assert_eq!(scene.respawn_fallen(&mut w), 0);
    assert_eq!(w.particles.pos(), airborne.0);
    assert_eq!(w.particles.vel(), airborne.1);

    run(&mut w, 150); // 3 s total: everything has fallen
    assert_eq!(scene.respawn_fallen(&mut w), 20);
    assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
    assert!(w.particles.vel().iter().all(|&v| in_launch_range(v)));
}

#[test]
fn respawn_skips_static_particles() {
    let mut scene = Fountain::new(3);
    let mut w = scene.world::<f64>(0);
    let below = Vec2::new(1.0, -5.0);
    w.particles.add_static(below);
    assert_eq!(scene.respawn_fallen(&mut w), 0);
    assert_eq!(w.particles.pos(), [below]);
}

#[test]
fn steady_state_keeps_every_particle_in_play() {
    let mut scene = Fountain::new(9);
    let mut w = scene.world::<f64>(50);
    for _ in 0..600 {
        w.step(1.0 / 60.0);
        scene.respawn_fallen(&mut w);
        assert!(w.particles.pos().iter().all(|p| p.y >= 0.0));
    }
}
