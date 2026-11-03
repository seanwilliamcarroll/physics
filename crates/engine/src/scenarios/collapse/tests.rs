use crate::Vec2;
use crate::diagnostics::center_of_mass;
use crate::scenarios::{CLUSTER_RADIUS, COLLAPSE_TOTAL_MASS, collapse};

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
    crate::scenarios::test_util::run(&mut w, 60);
    assert!(mean_radius(&w) < 0.9 * r0, "{} vs {r0}", mean_radius(&w));
}
