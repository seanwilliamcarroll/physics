use super::{Force, UniformGravity};
use crate::{Particles, Vec2};

#[test]
fn uniform_gravity_accelerates_dynamic_particles_only() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, 2.0);
    p.add_static(Vec2::ZERO);
    let mut acc = vec![Vec2::ZERO; p.len()];

    UniformGravity::new(Vec2::new(0.0, -9.81)).accumulate(&p, &mut acc);

    // Mass-independent: an acceleration, not a force.
    assert_eq!(acc, [Vec2::new(0.0, -9.81), Vec2::ZERO]);
}

#[test]
fn forces_add_into_acc_rather_than_overwrite() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, 1.0);
    let mut acc = vec![Vec2::new(1.0, 0.0)];

    UniformGravity::new(Vec2::new(0.0, -2.0)).accumulate(&p, &mut acc);

    assert_eq!(acc, [Vec2::new(1.0, -2.0)]);
}

mod pairwise {
    use super::super::{Force, PairwiseGravity};
    use crate::{Particles, Softening, Vec2};

    fn soft(e: f64) -> Softening<f64> {
        Softening::new(e).unwrap()
    }

    const G: f64 = 6.674_30e-11;

    fn accel(p: &Particles<f64>, g: &PairwiseGravity<f64>) -> Vec<Vec2<f64>> {
        let mut acc = vec![Vec2::ZERO; p.len()];
        g.accumulate(p, &mut acc);
        acc
    }

    #[test]
    fn two_bodies_feel_equal_and_opposite_forces() {
        let (m1, m2, d, eps) = (1.0e10, 3.0e10, 2.0, 0.1);
        let mut p = Particles::new();
        p.add(Vec2::ZERO, Vec2::ZERO, m1);
        p.add(Vec2::new(d, 0.0), Vec2::ZERO, m2);
        let a = accel(&p, &PairwiseGravity::new(G, soft(eps)));

        // Newton's third law: m1 a1 = -m2 a2.
        let (f1, f2) = (a[0] * m1, a[1] * m2);
        assert!(
            (f1 + f2).length() <= 1e-12 * f1.length(),
            "{f1:?} vs {f2:?}"
        );
        // Magnitude of the softened (Plummer) force on body 1, toward body 2.
        let expect = G * m2 * d / (d * d + eps * eps).powf(1.5);
        assert!(
            (a[0].x - expect).abs() <= 1e-12 * expect,
            "{} vs {expect}",
            a[0].x
        );
        assert_eq!(a[0].y, 0.0);
    }

    #[test]
    fn static_particles_neither_pull_nor_are_pulled() {
        let mut p = Particles::new();
        p.add(Vec2::ZERO, Vec2::ZERO, 1.0e10);
        p.add_static(Vec2::new(1.0, 0.0));
        assert_eq!(
            accel(&p, &PairwiseGravity::new(G, soft(0.1))),
            [Vec2::ZERO, Vec2::ZERO]
        );
    }

    #[test]
    fn coincident_bodies_without_softening_stay_finite() {
        // eps = 0 (allowed: M2 demos it) and r = 0: no direction, so the
        // pair is skipped rather than producing 0/0 = NaN.
        let mut p = Particles::new();
        p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, 1.0e10);
        p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, 1.0e10);
        assert_eq!(
            accel(&p, &PairwiseGravity::new(G, soft(0.0))),
            [Vec2::ZERO, Vec2::ZERO]
        );
    }

    #[test]
    fn each_pair_counts_once_and_adds_into_acc() {
        // Three bodies on a line: the middle one feels opposite pulls
        // that cancel; existing acc contents are kept (added to).
        let mut p = Particles::new();
        for x in [-1.0, 0.0, 1.0] {
            p.add(Vec2::new(x, 0.0), Vec2::ZERO, 1.0e10);
        }
        let mut acc: Vec<Vec2<f64>> = vec![Vec2::new(0.0, 5.0); 3];
        PairwiseGravity::new(G, soft(0.0)).accumulate(&p, &mut acc);
        assert!(acc[1].x.abs() <= 1e-15, "{:?}", acc[1]);
        // Untouched bit for bit: pairwise gravity along x adds nothing to y.
        assert!(acc.iter().all(|a| a.y.to_bits() == 5.0_f64.to_bits()));
        assert!(acc[0].x > 0.0 && acc[2].x < 0.0);
    }
}
