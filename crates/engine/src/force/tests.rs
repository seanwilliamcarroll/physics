use super::{Force, UniformGravity};
use crate::params::kg;
use crate::{Particles, Vec2};

#[test]
fn uniform_gravity_accelerates_dynamic_particles_only() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(2.0));
    particles.add_static(Vec2::ZERO);
    let mut accelerations = vec![Vec2::ZERO; particles.len()];

    UniformGravity::new(Vec2::new(0.0, -9.81)).accumulate(&particles, &mut accelerations);

    // Mass-independent: an acceleration, not a force.
    assert_eq!(accelerations, [Vec2::new(0.0, -9.81), Vec2::ZERO]);
}

#[test]
fn forces_add_into_acc_rather_than_overwrite() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    let mut accelerations = vec![Vec2::new(1.0, 0.0)];

    UniformGravity::new(Vec2::new(0.0, -2.0)).accumulate(&particles, &mut accelerations);

    assert_eq!(accelerations, [Vec2::new(1.0, -2.0)]);
}

mod pairwise {
    use super::super::{Force, PairwiseGravity};
    use crate::params::kg;
    use crate::{Particles, Softening, Vec2};

    fn soft(epsilon: f64) -> Softening<f64> {
        Softening::new(epsilon).unwrap()
    }

    const G: f64 = 6.674_30e-11;

    fn accel(particles: &Particles<f64>, gravity: &PairwiseGravity<f64>) -> Vec<Vec2<f64>> {
        let mut accelerations = vec![Vec2::ZERO; particles.len()];
        gravity.accumulate(particles, &mut accelerations);
        accelerations
    }

    #[test]
    fn two_bodies_feel_equal_and_opposite_forces() {
        let (mass_1, mass_2, distance, epsilon) = (1.0e10, 3.0e10, 2.0, 0.1);
        let mut particles = Particles::new();
        particles.add(Vec2::ZERO, Vec2::ZERO, kg(mass_1));
        particles.add(Vec2::new(distance, 0.0), Vec2::ZERO, kg(mass_2));
        let accelerations = accel(&particles, &PairwiseGravity::new(G, soft(epsilon)));

        // Newton's third law: m1 a1 = -m2 a2.
        let (force_1, force_2) = (accelerations[0] * mass_1, accelerations[1] * mass_2);
        assert!(
            (force_1 + force_2).length() <= 1e-12 * force_1.length(),
            "{force_1:?} vs {force_2:?}"
        );
        // Magnitude of the softened (Plummer) force on body 1, toward body 2.
        let expect = G * mass_2 * distance / (distance * distance + epsilon * epsilon).powf(1.5);
        assert!(
            (accelerations[0].x - expect).abs() <= 1e-12 * expect,
            "{} vs {expect}",
            accelerations[0].x
        );
        assert_eq!(accelerations[0].y, 0.0);
    }

    #[test]
    fn static_particles_neither_pull_nor_are_pulled() {
        let mut particles = Particles::new();
        particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
        particles.add_static(Vec2::new(1.0, 0.0));
        assert_eq!(
            accel(&particles, &PairwiseGravity::new(G, soft(0.1))),
            [Vec2::ZERO, Vec2::ZERO]
        );
    }

    #[test]
    fn coincident_bodies_without_softening_stay_finite() {
        // Zero softening and zero distance: no direction, so the pair is
        // skipped rather than producing 0/0 = NaN.
        let mut particles = Particles::new();
        particles.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
        particles.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
        assert_eq!(
            accel(&particles, &PairwiseGravity::new(G, soft(0.0))),
            [Vec2::ZERO, Vec2::ZERO]
        );
    }

    #[test]
    fn each_pair_counts_once_and_adds_into_acc() {
        // Three bodies on a line: the middle one feels opposite pulls
        // that cancel; existing acc contents are kept (added to).
        let mut particles = Particles::new();
        for x in [-1.0, 0.0, 1.0] {
            particles.add(Vec2::new(x, 0.0), Vec2::ZERO, kg(1.0e10));
        }
        let mut accelerations: Vec<Vec2<f64>> = vec![Vec2::new(0.0, 5.0); 3];
        PairwiseGravity::new(G, soft(0.0)).accumulate(&particles, &mut accelerations);
        assert!(accelerations[1].x.abs() <= 1e-15, "{:?}", accelerations[1]);
        // Untouched bit for bit: pairwise gravity along x adds nothing to y.
        assert!(
            accelerations
                .iter()
                .all(|acceleration| acceleration.y.to_bits() == 5.0_f64.to_bits())
        );
        assert!(accelerations[0].x > 0.0 && accelerations[2].x < 0.0);
    }
}
