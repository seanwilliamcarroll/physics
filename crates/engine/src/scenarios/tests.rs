use super::{
    CLUSTER_RADIUS, CLUSTER_SPEED, CLUSTER_TOTAL_MASS, CLUSTER_WEIGHT, FOUNTAIN_VX, FOUNTAIN_VY,
    Fountain, cluster,
};
use super::{
    ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, orbit, orbit_gravity, orbit_period,
    orbit_relative_speed,
};
use crate::diagnostics::{center_of_mass, momentum};
use crate::{Force, Integrator, Vec2, World};

fn in_launch_range(v: Vec2<f64>) -> bool {
    (FOUNTAIN_VX.0..FOUNTAIN_VX.1).contains(&v.x) && (FOUNTAIN_VY.0..FOUNTAIN_VY.1).contains(&v.y)
}

/// `got` equals `want` up to the rounding of `v0 + want` then `- v0`: a
/// few ulps of the larger magnitude. A different force (other ε or G)
/// would differ by far more.
fn assert_same_up_to_rounding(got: Vec2<f64>, want: Vec2<f64>, v0: Vec2<f64>) {
    let tol = 4.0 * f64::EPSILON * (want.length() + v0.length());
    assert!((got - want).length() <= tol, "{got:?} vs {want:?}");
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
    // Fixed total, whatever N; relative weights keep their spread.
    let masses: Vec<f64> = w.particles.inv_mass().iter().map(|iw| 1.0 / iw).collect();
    let total: f64 = masses.iter().sum();
    assert!((total - CLUSTER_TOTAL_MASS).abs() <= 1e-12 * CLUSTER_TOTAL_MASS);
    let (lo, hi) = masses
        .iter()
        .fold((f64::INFINITY, 0.0_f64), |(lo, hi), &m| {
            (lo.min(m), hi.max(m))
        });
    assert!(hi / lo <= CLUSTER_WEIGHT.1 / CLUSTER_WEIGHT.0);
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
    orbit_gravity::<f64>()
        .unwrap()
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
    orbit_gravity::<f64>()
        .unwrap()
        .accumulate(&w.particles, &mut acc);
    let mut stepped = orbit::<f64>(Integrator::ExplicitEuler, 1.0).unwrap();
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(1.0); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_same_up_to_rounding(*v1 - *v0, *a, *v0);
    }
}

#[test]
fn cluster_gravity_is_the_force_the_cluster_uses() {
    use super::cluster_gravity;
    let w = cluster::<f64>(8, 3).unwrap();
    let mut acc = vec![Vec2::ZERO; 8];
    cluster_gravity::<f64>()
        .unwrap()
        .accumulate(&w.particles, &mut acc);
    let mut stepped = cluster::<f64>(8, 3).unwrap();
    stepped.set_integrator(Integrator::ExplicitEuler);
    let v0 = stepped.particles.vel().to_vec();
    stepped.step(1.0); // explicit Euler: v1 = v0 + a(x0) * 1
    for ((v1, v0), a) in stepped.particles.vel().iter().zip(&v0).zip(&acc) {
        assert_same_up_to_rounding(*v1 - *v0, *a, *v0);
    }
}

#[test]
fn invalid_softening_constant_is_a_config_error() {
    assert_eq!(
        super::softening::<f64>(-0.1),
        Err(crate::ConfigError::InvalidSoftening)
    );
    assert_eq!(
        super::softening::<f32>(f64::NAN),
        Err(crate::ConfigError::InvalidSoftening)
    );
    assert!(
        crate::ConfigError::InvalidSoftening
            .to_string()
            .contains("softening")
    );
}

#[test]
fn invalid_mass_constant_is_a_config_error() {
    use crate::ConfigError::InvalidMass;
    assert_eq!(super::mass::<f64>(0.0), Err(InvalidMass));
    assert_eq!(super::mass::<f64>(-1.0e10), Err(InvalidMass));
    // Positive in f64 but rounds to 0 in f32.
    assert_eq!(super::mass::<f32>(1.0e-50), Err(InvalidMass));
    assert_eq!(super::mass::<f64>(2.0).map(crate::Mass::get), Ok(2.0));
}

mod disk {
    use super::super::{
        CLUSTER_SOFTENING, DISK_CENTRAL_MASS, DISK_INNER_RADIUS, DISK_ORBITERS_TOTAL_MASS,
        DISK_RADIUS, GRAVITATIONAL_CONSTANT, disk,
    };
    use crate::Vec2;
    use crate::diagnostics::momentum;

    #[test]
    fn heavy_center_then_orbiters_in_the_annulus() {
        let w = disk::<f64>(50, 1).unwrap();
        let p = &w.particles;
        assert_eq!(p.len(), 50);
        assert_eq!(p.pos()[0], Vec2::ZERO);
        assert_eq!(1.0 / p.inv_mass()[0], DISK_CENTRAL_MASS);
        for (x, &w) in p.pos().iter().zip(p.inv_mass()).skip(1) {
            let r = x.length();
            assert!((DISK_INNER_RADIUS..=DISK_RADIUS).contains(&r), "r = {r}");
            // Orbiters share DISK_ORBITERS_TOTAL_MASS equally.
            assert!(
                (1.0 / w - DISK_ORBITERS_TOTAL_MASS / 49.0).abs()
                    <= 1e-6 * DISK_ORBITERS_TOTAL_MASS
            );
        }
    }

    #[test]
    fn small_counts() {
        assert_eq!(disk::<f32>(0, 1).unwrap().particles.len(), 0);
        let one = disk::<f32>(1, 1).unwrap();
        assert_eq!(one.particles.len(), 1);
        assert_eq!(one.particles.vel(), [Vec2::ZERO]);
    }

    #[test]
    fn is_deterministic_per_seed() {
        let (a, b, c) = (
            disk::<f32>(30, 7).unwrap(),
            disk::<f32>(30, 7).unwrap(),
            disk::<f32>(30, 8).unwrap(),
        );
        assert_eq!(a.particles.pos(), b.particles.pos());
        assert_eq!(a.particles.vel(), b.particles.vel());
        assert_ne!(a.particles.pos(), c.particles.pos());
    }

    #[test]
    fn net_momentum_is_zero() {
        let w = disk::<f64>(200, 3).unwrap();
        let p = &w.particles;
        // Relative to one orbiter's momentum, a typical term in the sum.
        let typical = p.vel()[1].length() / p.inv_mass()[1];
        assert!(momentum(p).length() <= 1e-10 * typical, "{:?}", momentum(p));
    }

    #[test]
    fn launch_speeds_balance_the_enclosed_mass() {
        // Relative to the center, each orbiter moves counterclockwise at
        // the softened circular speed for the mass inside its radius:
        // v² (r² + ε²)^(3/2) / r² = G M_enc. Recomputed here the slow way.
        let w = disk::<f64>(100, 5).unwrap();
        let p = &w.particles;
        let (x, v, inv) = (p.pos(), p.vel(), p.inv_mass());
        let eps_sq = CLUSTER_SOFTENING * CLUSTER_SOFTENING;
        for i in 1..p.len() {
            let r_i = x[i].length();
            let enclosed: f64 = (1..p.len())
                .filter(|&j| x[j].length_sq() < x[i].length_sq())
                .map(|j| 1.0 / inv[j])
                .sum::<f64>()
                + DISK_CENTRAL_MASS;
            let rel = v[i] - v[0];
            let q = r_i * r_i + eps_sq;
            let lhs = rel.length_sq() * q * q.sqrt() / (r_i * r_i);
            let rhs = GRAVITATIONAL_CONSTANT * enclosed;
            assert!((lhs - rhs).abs() <= 1e-12 * rhs, "body {i}: {lhs} vs {rhs}");
            // Tangential and counterclockwise: r x v > 0, r · v = 0.
            let (r, u) = (x[i] - x[0], rel);
            assert!(r.x * u.y - r.y * u.x > 0.0);
            assert!((r.x * u.x + r.y * u.y).abs() <= 1e-12 * r_i * u.length());
        }
    }
}

mod collapse {
    use super::super::{CLUSTER_RADIUS, COLLAPSE_TOTAL_MASS, collapse};
    use crate::Vec2;
    use crate::diagnostics::center_of_mass;

    #[test]
    fn cold_cloud_in_the_disk() {
        let w = collapse::<f64>(64, 1).unwrap();
        let p = &w.particles;
        assert_eq!(p.len(), 64);
        assert!(p.vel().iter().all(|&v| v == Vec2::ZERO));
        assert!(p.pos().iter().all(|x| x.length() <= CLUSTER_RADIUS));
        let total: f64 = p.inv_mass().iter().map(|w| 1.0 / w).sum();
        assert!((total - COLLAPSE_TOTAL_MASS).abs() <= 1e-12 * COLLAPSE_TOTAL_MASS);
    }

    #[test]
    fn is_deterministic_per_seed() {
        let (a, b, c) = (
            collapse::<f32>(30, 7).unwrap(),
            collapse::<f32>(30, 7).unwrap(),
            collapse::<f32>(30, 8).unwrap(),
        );
        assert_eq!(a.particles.pos(), b.particles.pos());
        assert_ne!(a.particles.pos(), c.particles.pos());
    }

    #[test]
    fn falls_in_on_itself() {
        // Mean distance from the center of mass shrinks: it collapses
        // rather than drifting or expanding. 1 s is about half the
        // free-fall scale; measured 0.83-0.85 of the start over seeds 2-4.
        let mean_radius = |w: &crate::World<f64>| {
            let c = center_of_mass(&w.particles).unwrap();
            let p = w.particles.pos();
            p.iter().map(|x| (*x - c).length()).sum::<f64>() / 64.0
        };
        let mut w = collapse::<f64>(64, 2).unwrap();
        let r0 = mean_radius(&w);
        super::run(&mut w, 60);
        assert!(mean_radius(&w) < 0.9 * r0, "{} vs {r0}", mean_radius(&w));
    }
}
