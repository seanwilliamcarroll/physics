use super::{FOUNTAIN_VX, FOUNTAIN_VY, Fountain};
use crate::Vec2;
use crate::test_util::{run, time_step};

fn in_launch_range(velocity: Vec2<f64>) -> bool {
    (FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&velocity.x)
        && (FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&velocity.y)
}

#[test]
fn launches_n_particles_upward_from_the_origin() {
    let world = Fountain::new(1).world::<f64>(100);
    assert_eq!(world.particles.len(), 100);
    assert!(
        world
            .particles
            .pos()
            .iter()
            .all(|&position| position == Vec2::ZERO)
    );
    assert!(
        world
            .particles
            .vel()
            .iter()
            .all(|&velocity| in_launch_range(velocity))
    );
}

#[test]
fn is_deterministic_per_seed() {
    let first = Fountain::new(7).world::<f32>(50);
    let repeat = Fountain::new(7).world::<f32>(50);
    let other_seed = Fountain::new(8).world::<f32>(50);
    assert_eq!(first.particles.vel(), repeat.particles.vel());
    assert_ne!(first.particles.vel(), other_seed.particles.vel());
}

#[test]
fn particles_fall_below_launch_height_without_respawn() {
    // vy < 12 m/s under standard gravity lands within ~2.5 s.
    let mut world = Fountain::new(3).world::<f64>(20);
    run(&mut world, 180);
    assert!(
        world
            .particles
            .pos()
            .iter()
            .all(|position| position.y < 0.0)
    );
}

#[test]
fn respawn_relaunches_only_fallen_particles() {
    let mut fountain = Fountain::new(3);
    let mut world = fountain.world::<f64>(20);
    run(&mut world, 30); // 0.5 s: everything still rising or airborne
    let airborne = (
        world.particles.pos().to_vec(),
        world.particles.vel().to_vec(),
    );
    assert_eq!(fountain.respawn_fallen(&mut world), 0);
    assert_eq!(world.particles.pos(), airborne.0);
    assert_eq!(world.particles.vel(), airborne.1);

    run(&mut world, 150); // 3 s total: everything has fallen
    assert_eq!(fountain.respawn_fallen(&mut world), 20);
    assert!(
        world
            .particles
            .pos()
            .iter()
            .all(|&position| position == Vec2::ZERO)
    );
    assert!(
        world
            .particles
            .vel()
            .iter()
            .all(|&velocity| in_launch_range(velocity))
    );
}

#[test]
fn respawn_skips_static_particles() {
    let mut fountain = Fountain::new(3);
    let mut world = fountain.world::<f64>(0);
    let below = Vec2::new(1.0, -5.0);
    world.particles.add_static(below);
    assert_eq!(fountain.respawn_fallen(&mut world), 0);
    assert_eq!(world.particles.pos(), [below]);
}

#[test]
fn steady_state_keeps_every_particle_in_play() {
    let mut fountain = Fountain::new(9);
    let mut world = fountain.world::<f64>(50);
    for _ in 0..600 {
        world.step(time_step(1.0 / 60.0));
        fountain.respawn_fallen(&mut world);
        assert!(
            world
                .particles
                .pos()
                .iter()
                .all(|position| position.y >= 0.0)
        );
    }
}
