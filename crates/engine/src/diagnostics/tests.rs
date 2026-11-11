use super::{
    center_of_mass, constraint_potential, gravity_potential, kinetic_energy, momentum,
    rotational_energy, total_energy,
};
use crate::params::kg;
use crate::{PairwiseGravity, Softening};
use crate::{Particles, Vec2};

fn two_dynamic_one_static() -> Particles<f64> {
    let mut p = Particles::new();
    p.add(Vec2::ZERO, Vec2::new(3.0, 4.0), kg(2.0)); // |v|² = 25
    p.add(Vec2::ZERO, Vec2::new(-1.0, 0.5), kg(4.0));
    p.add_static(Vec2::new(9.0, 9.0));
    p
}

#[test]
fn momentum_sums_m_v_over_dynamic_particles() {
    // 2*(3,4) + 4*(-1,0.5) = (6,8) + (-4,2) = (2,10)
    assert_eq!(momentum(&two_dynamic_one_static()), Vec2::new(2.0, 10.0));
}

#[test]
fn kinetic_energy_sums_half_m_v_squared() {
    // ½*2*25 + ½*4*1.25 = 25 + 2.5
    assert_eq!(kinetic_energy(&two_dynamic_one_static()), 27.5);
}

#[test]
fn static_particles_contribute_nothing_even_if_moving() {
    // A static particle with velocity (set via vel_mut) has infinite mass
    // in principle; it must be skipped, not divided by zero.
    let mut p = Particles::<f64>::new();
    p.add_static(Vec2::ZERO);
    p.vel_mut()[0] = Vec2::new(1.0, 1.0);
    assert_eq!(momentum(&p), Vec2::ZERO);
    assert_eq!(kinetic_energy(&p), 0.0);
}

#[test]
fn empty_is_zero() {
    let p = Particles::<f32>::new();
    assert_eq!(momentum(&p), Vec2::ZERO);
    assert_eq!(kinetic_energy(&p), 0.0);
}

#[test]
fn center_of_mass_is_mass_weighted_and_skips_static() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::new(0.0, 0.0), Vec2::ZERO, kg(1.0));
    p.add(Vec2::new(4.0, 2.0), Vec2::ZERO, kg(3.0)); // (0*1 + 4*3)/4 = 3
    p.add_static(Vec2::new(100.0, 100.0));
    assert_eq!(center_of_mass(&p), Some(Vec2::new(3.0, 1.5)));
}

#[test]
fn center_of_mass_is_none_without_dynamic_particles() {
    let mut p = Particles::<f32>::new();
    assert_eq!(center_of_mass(&p), None);
    p.add_static(Vec2::new(1.0, 1.0));
    assert_eq!(center_of_mass(&p), None);
}

const G: f64 = 6.674_30e-11;

#[test]
fn potential_of_a_pair_is_the_softened_plummer_form() {
    let (m1, m2, d, eps) = (1.0e10, 3.0e10, 2.0, 0.1);
    let mut p = Particles::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(m1));
    p.add(Vec2::new(d, 0.0), Vec2::ZERO, kg(m2));
    let u = gravity_potential(&p, &PairwiseGravity::new(G, Softening::new(eps).unwrap()));
    let expect = -G * m1 * m2 / (d * d + eps * eps).sqrt();
    assert!(
        (u - expect).abs() <= 1e-12 * expect.abs(),
        "{u} vs {expect}"
    );
}

#[test]
fn potential_sums_every_pair_once() {
    // Three unit-ish bodies at the corners of a 3-4-5 triangle,
    // unsoftened: U = -G m² (1/3 + 1/4 + 1/5).
    let m = 1.0e10;
    let mut p = Particles::new();
    for (x, y) in [(0.0, 0.0), (3.0, 0.0), (0.0, 4.0)] {
        p.add(Vec2::new(x, y), Vec2::ZERO, kg(m));
    }
    let u = gravity_potential(&p, &PairwiseGravity::new(G, Softening::new(0.0).unwrap()));
    let expect = -G * m * m * (1.0 / 3.0 + 1.0 / 4.0 + 1.0 / 5.0);
    assert!(
        (u - expect).abs() <= 1e-12 * expect.abs(),
        "{u} vs {expect}"
    );
}

#[test]
fn potential_skips_static_and_coincident_unsoftened_pairs() {
    let g = PairwiseGravity::new(G, Softening::new(0.0).unwrap());
    let mut p = Particles::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    p.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(gravity_potential(&p, &g), 0.0);
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10)); // coincident with body 0
    assert!(gravity_potential(&p, &g).is_finite());
    assert_eq!(gravity_potential(&p, &g), 0.0);
}

#[test]
fn total_energy_is_kinetic_plus_potential() {
    let g = PairwiseGravity::new(G, Softening::new(0.1).unwrap());
    let p = two_dynamic_one_static();
    let sum = kinetic_energy(&p) + gravity_potential(&p, &g);
    assert_eq!(total_energy(&p, &g).to_bits(), sum.to_bits());
}

#[test]
fn uniform_potential_is_m_g_h_over_dynamic_particles() {
    use super::uniform_gravity_potential;
    use crate::UniformGravity;
    let p = two_dynamic_one_static();
    let mut p2 = p.clone();
    p2.add(Vec2::new(0.0, 3.0), Vec2::ZERO, kg(2.0));
    let g = UniformGravity::new(Vec2::new(0.0, -10.0));
    // The first two sit at the origin (no potential), the static one is
    // excluded, the new one is 2 kg at 3 m: 2 * 10 * 3 = 60 J.
    assert_eq!(uniform_gravity_potential(&p, &g), 0.0);
    assert_eq!(uniform_gravity_potential(&p2, &g), 60.0);
}

#[test]
fn constraint_error_is_max_and_rms_of_c() {
    use super::constraint_error;
    use crate::DistanceConstraint;
    let mut p = Particles::<f64>::new();
    let a = p.add_static(Vec2::ZERO);
    let b = p.add(Vec2::new(1.0, 0.0), Vec2::ZERO, kg(1.0));
    let c = p.add(Vec2::new(0.0, 2.0), Vec2::ZERO, kg(1.0));
    let rods = [
        DistanceConstraint::between(&p, a, b).unwrap(),
        DistanceConstraint::between(&p, a, c).unwrap(),
    ];
    assert_eq!(constraint_error(&p, &rods), Some((0.0, 0.0)));
    // Stretch the first rod by 3 cm and compress the second by 4 cm.
    p.pos[1] = Vec2::new(1.03, 0.0);
    p.pos[2] = Vec2::new(0.0, 1.96);
    let (max, rms) = constraint_error(&p, &rods).unwrap();
    assert!((max - 0.04).abs() < 1e-12);
    assert!((rms - f64::midpoint(0.03 * 0.03, 0.04 * 0.04).sqrt()).abs() < 1e-12);
    assert_eq!(
        constraint_error::<f64, DistanceConstraint<f64>>(&p, &[]),
        None
    );
}

#[test]
fn constraint_potential_is_half_c_squared_over_alpha_for_soft_rods_only() {
    // From the full cargo-mutants run: every operator in it could change
    // unnoticed (the jelly's readout was its only use).
    use crate::{Compliance, DistanceConstraint};
    let mut p = Particles::new();
    let pin = p.add_static(Vec2::ZERO).id();
    let a = p.add(Vec2::new(1.2, 0.0), Vec2::ZERO, kg(1.0));
    let b = p.add(Vec2::new(0.0, -0.5), Vec2::ZERO, kg(1.0));
    let rod = |x, y, length, alpha: f64| {
        DistanceConstraint::with_length(&p, x, y, length, Compliance::new(alpha).unwrap()).unwrap()
    };
    // Stretched 0.2 m at α = 0.01: ½ · 0.04 / 0.01 = 2 J. Compressed
    // 0.25 m at α = 0.05: ½ · 0.0625 / 0.05 = 0.625 J. Rigid (α = 0),
    // stretched 0.3 m: none.
    let soft = [rod(pin, a, 1.0, 0.01), rod(pin, b, 0.75, 0.05)];
    let rigid = rod(a, b, 1.0, 0.0);
    assert!((constraint_potential(&p, &soft[..1]) - 2.0).abs() < 1e-12);
    assert!((constraint_potential(&p, &soft) - 2.625).abs() < 1e-12);
    assert_eq!(constraint_potential(&p, &[rigid]), 0.0);
    let all = [soft[0], rigid, soft[1]];
    assert!((constraint_potential(&p, &all) - 2.625).abs() < 1e-12);
    // Bodies not in `p` (a mismatched set): skipped.
    assert_eq!(constraint_potential(&Particles::<f64>::new(), &soft), 0.0);
}

/// `m R² |ω|² / 5` over spinning circles; statics and points carry none
/// (the full mutation run: `&&` → `||` in the filter survived, which
/// divides a static circle's 0 by its inverse mass 0: NaN).
#[test]
fn rotational_energy_skips_statics_and_points() {
    let mut p = Particles::new();
    p.add_circle(
        Vec2::ZERO,
        Vec2::ZERO,
        kg(2.0),
        crate::Radius::new(0.5).unwrap(),
    );
    p.add_circle(
        Vec2::new(5.0, 0.0),
        Vec2::ZERO,
        kg(1.0),
        crate::Radius::new(0.5).unwrap(),
    );
    assert!(
        p.set_body(1, Vec2::new(5.0, 0.0), 0.0, 0.5),
        "a static circle"
    );
    p.add(Vec2::new(9.0, 0.0), Vec2::ZERO, kg(1.0));
    let spin = [
        Vec2::new(3.0, 4.0),
        Vec2::new(1.0, 0.0),
        Vec2::new(1.0, 0.0),
    ];
    // 2 kg × 0.25 m² × 25 / 5.
    assert_eq!(rotational_energy(&p, &spin), 2.5);
}
