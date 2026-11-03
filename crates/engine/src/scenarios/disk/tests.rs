use crate::Vec2;
use crate::diagnostics::momentum;
use crate::scenarios::{
    CLUSTER_SOFTENING, DISK_CENTRAL_MASS, DISK_INNER_RADIUS, DISK_ORBITERS_TOTAL_MASS, DISK_RADIUS,
    GRAVITATIONAL_CONSTANT, disk,
};

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
            (1.0 / w - DISK_ORBITERS_TOTAL_MASS / 49.0).abs() <= 1e-6 * DISK_ORBITERS_TOTAL_MASS
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
