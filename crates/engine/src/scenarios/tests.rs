use super::{
    CLUSTER_MASS, CLUSTER_RADIUS, CLUSTER_SPEED, FOUNTAIN_VX, FOUNTAIN_VY, Fountain, cluster,
};
use super::{
    ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, orbit, orbit_gravity, orbit_period,
    orbit_relative_speed,
};
use crate::diagnostics::{center_of_mass, momentum};
use crate::{Force, Integrator, PairwiseGravity, Vec2, World};

fn in_launch_range(v: Vec2<f64>) -> bool {
    (FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&v.x) && (FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&v.y)
}

fn run(w: &mut World<f64>, steps: u32) {
    for _ in 0..steps {
        w.step(1.0 / 60.0);
    }
}

#[test]
fn launches_n_particles_upward_from_the_origin() {
    let w = Fountain::new(1).world::<f64>(100).unwrap();
    assert_eq!(w.particles.len(), 100);
    assert!(w.particles.pos().iter().all(|&p| p == Vec2::ZERO));
    assert!(w.particles.vel().iter().all(|&v| in_launch_range(v)));
}

#[test]
fn is_deterministic_per_seed() {
    let a = Fountain::new(7).world::<f32>(50).unwrap();
    let b = Fountain::new(7).world::<f32>(50).unwrap();
    let c = Fountain::new(8).world::<f32>(50).unwrap();
    assert_eq!(a.particles.vel(), b.particles.vel());
    assert_ne!(a.particles.vel(), c.particles.vel());
}

#[test]
fn particles_fall_below_launch_height_without_respawn() {
    // vy < 12 m/s under standard gravity lands within ~2.5 s.
    let mut w = Fountain::new(3).world::<f64>(20).unwrap();
    run(&mut w, 180);
    assert!(w.particles.pos().iter().all(|p| p.y < 0.0));
}

#[test]
fn respawn_relaunches_only_fallen_particles() {
    let mut scene = Fountain::new(3);
    let mut w = scene.world::<f64>(20).unwrap();
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
    let mut w = scene.world::<f64>(0).unwrap();
    let below = Vec2::new(1.0, -5.0);
    w.particles.add_static(below);
    assert_eq!(scene.respawn_fallen(&mut w), 0);
    assert_eq!(w.particles.pos(), [below]);
}

#[test]
fn steady_state_keeps_every_particle_in_play() {
    let mut scene = Fountain::new(9);
    let mut w = scene.world::<f64>(50).unwrap();
    for _ in 0..600 {
        w.step(1.0 / 60.0);
        scene.respawn_fallen(&mut w);
        assert!(w.particles.pos().iter().all(|p| p.y >= 0.0));
    }
}

#[test]
fn cluster_places_n_bodies_in_the_disk_with_bounded_mass_and_speed() {
    let w = cluster::<f64>(200, 4).unwrap();
    assert_eq!(w.particles.len(), 200);
    assert!(
        w.particles
            .pos()
            .iter()
            .all(|x| x.length() <= CLUSTER_RADIUS)
    );
    assert!(
        w.particles
            .vel()
            .iter()
            .all(|v| v.x.abs() <= CLUSTER_SPEED && v.y.abs() <= CLUSTER_SPEED)
    );
    let (lo, hi) = CLUSTER_MASS;
    assert!(
        w.particles
            .inv_mass()
            .iter()
            .all(|&iw| (lo..=hi).contains(&(1.0 / iw)))
    );
}

#[test]
fn cluster_is_deterministic_per_seed() {
    let a = cluster::<f32>(16, 1).unwrap();
    let b = cluster::<f32>(16, 1).unwrap();
    let c = cluster::<f32>(16, 2).unwrap();
    assert_eq!(a.particles.pos(), b.particles.pos());
    assert_eq!(a.particles.vel(), b.particles.vel());
    assert_ne!(a.particles.pos(), c.particles.pos());
}

#[test]
fn orbit_starts_centered_at_rest_and_at_the_separation() {
    let w = orbit::<f64>(Integrator::VelocityVerlet, 1.0).unwrap();
    let (pos, vel) = (w.particles.pos(), w.particles.vel());
    assert_eq!(pos.len(), 2);
    assert!((pos[1] - pos[0]).length() - ORBIT_SEPARATION < 1e-12);
    assert!(center_of_mass(&w.particles).unwrap().length() < 1e-12);
    // Zero net momentum, relative to the planet's own momentum.
    let planet_p = vel[1].length() / w.particles.inv_mass()[1];
    assert!(momentum(&w.particles).length() <= 1e-12 * planet_p);
}

#[test]
fn circular_speed_balances_the_softened_pull() {
    // Centripetal check without integrating: the relative acceleration
    // from the actual force must equal v_rel² / d.
    let w = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut acc = vec![Vec2::ZERO; 2];
    PairwiseGravity::new(super::GRAVITATIONAL_CONSTANT, super::ORBIT_SOFTENING)
        .accumulate(&w.particles, &mut acc);
    let a_rel = (acc[0] - acc[1]).length();
    let v_rel = (w.particles.vel()[1] - w.particles.vel()[0]).length();
    let centripetal = v_rel * v_rel / ORBIT_SEPARATION;
    assert!(
        (a_rel - centripetal).abs() <= 1e-12 * centripetal,
        "{a_rel} vs {centripetal}"
    );
    assert!((v_rel - orbit_relative_speed()).abs() <= 1e-12 * v_rel);
}

#[test]
fn softened_period_is_close_to_the_nominal_one() {
    // ε = 1 cm on a 2 m orbit lengthens the period by ~(1 + ε²/d²)^(3/4).
    let ratio = orbit_period() / ORBIT_NOMINAL_PERIOD;
    assert!(ratio > 1.0 && ratio < 1.0001, "{ratio}");
}

#[test]
fn speed_ratio_scales_the_launch_speed() {
    let circ = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let slow = orbit::<f64>(Integrator::SymplecticEuler, 0.8).unwrap();
    let ratio = slow.particles.vel()[1].length() / circ.particles.vel()[1].length();
    assert!((ratio - 0.8).abs() < 1e-12);
}

#[test]
fn orbit_gravity_is_the_force_the_scene_uses() {
    // Same accelerations from orbit_gravity() as from the world's own
    // step: one source for the force, so energy readouts match it.
    let w = orbit::<f64>(Integrator::SymplecticEuler, 1.0).unwrap();
    let mut acc = vec![Vec2::ZERO; 2];
    orbit_gravity::<f64>().accumulate(&w.particles, &mut acc);
    let mut stepped = orbit::<f64>(Integrator::ExplicitEuler, 1.0).unwrap();
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(1.0); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_eq!(*v1 - *v0, *a);
    }
}

#[test]
fn cluster_gravity_is_the_force_the_cluster_uses() {
    use super::cluster_gravity;
    let w = cluster::<f64>(8, 3).unwrap();
    let mut acc = vec![Vec2::ZERO; 8];
    cluster_gravity::<f64>().accumulate(&w.particles, &mut acc);
    let mut stepped = cluster::<f64>(8, 3).unwrap();
    stepped.set_integrator(Integrator::ExplicitEuler);
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(1.0); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_eq!(*v1 - *v0, *a);
    }
}
