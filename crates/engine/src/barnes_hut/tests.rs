use super::BarnesHut;
use crate::OpeningAngle;
use crate::params::kg;
use crate::rng::SplitMix64;
use crate::test_util::accel;
use crate::{Force, PairwiseGravity, Particles, Scalar, Softening, Vec2};

const G: f64 = 6.674_30e-11;
const EPS: f64 = 0.1;

fn eps<S: Scalar>(eps: f64) -> Softening<S> {
    Softening::new(S::from_f64(eps)).unwrap()
}

fn bh<S: Scalar>(eps_m: f64, theta: f64) -> BarnesHut<S> {
    BarnesHut::new(
        S::from_f64(G),
        eps(eps_m),
        OpeningAngle::new(S::from_f64(theta)).unwrap(),
    )
}

/// A small irregular cloud: 40 bodies, plus one static particle in the
/// middle.
fn cloud<S: Scalar>() -> Particles<S> {
    let mut p = Particles::new();
    let mut rng = SplitMix64::new(7);
    for _ in 0..40 {
        let (x, y) = (rng.range(-2.0, 2.0), rng.range(-2.0, 2.0));
        let m = rng.range(0.5e10, 1.5e10);
        p.add(Vec2::from_f64(x, y), Vec2::ZERO, kg(m));
    }
    p.add_static(Vec2::from_f64(0.05, -0.03));
    p
}

/// Largest |a − b| over bodies, relative to the largest |b|.
fn max_rel_diff<S: Scalar>(a: &[Vec2<S>], b: &[Vec2<S>]) -> f64 {
    let scale = b.iter().map(|x| x.length().to_f64()).fold(0.0, f64::max);
    a.iter()
        .zip(b)
        .map(|(x, y)| (*x - *y).length().to_f64())
        .fold(0.0, f64::max)
        / scale
}

/// θ = 0 never accepts a cell: the same sum as `PairwiseGravity`, up to
/// summation order. Measured (2026-11-02): 2.7e-16 (f64), 2.1e-7 (f32)
/// relative to the largest acceleration; bounds ~10x above.
fn theta_zero_is_direct_summation<S: Scalar>(tol: f64) {
    let p = cloud::<S>();
    let direct = accel(&p, &PairwiseGravity::new(S::from_f64(G), eps(EPS)));
    let tree = accel(&p, &bh::<S>(EPS, 0.0));
    let err = max_rel_diff(&tree, &direct);
    assert!(err <= tol, "θ = 0 differs from direct by {err:e}");
}

#[test]
fn theta_zero_is_direct_summation_f64() {
    theta_zero_is_direct_summation::<f64>(3e-15);
}

#[test]
fn theta_zero_is_direct_summation_f32() {
    theta_zero_is_direct_summation::<f32>(2e-6);
}

#[test]
fn distant_cluster_acts_as_its_center_of_mass() {
    // A 2x2 m clump of four bodies 1000 m away: s/d = 0.002 < θ, so the
    // whole clump is one cell, felt at its center of mass with its total
    // mass. The probe body's acceleration must then match a single body of
    // mass 10e10 at the center of mass, exactly up to rounding.
    let masses = [1.0e10, 2.0e10, 3.0e10, 4.0e10];
    let offsets = [(-1.0, -1.0), (1.0, -1.0), (-1.0, 1.0), (1.0, 1.0)];
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    let (mut mx, mut my, mut m_total) = (0.0, 0.0, 0.0);
    for (&m, &(dx, dy)) in masses.iter().zip(&offsets) {
        let (x, y) = (1000.0 + dx, dy);
        p.add(Vec2::new(x, y), Vec2::ZERO, kg(m));
        mx += m * x;
        my += m * y;
        m_total += m;
    }
    let com = Vec2::new(mx / m_total, my / m_total);
    let r = com - Vec2::ZERO;
    let d_sq = r.length_sq() + EPS * EPS;
    let expect = r * (G * m_total / (d_sq * d_sq.sqrt()));

    let a = accel(&p, &bh::<f64>(EPS, 0.5))[0];
    assert!(
        (a - expect).length() <= 1e-12 * expect.length(),
        "{a:?} vs {expect:?}"
    );
    // And it is an approximation: direct summation differs (by ~(s/d)²).
    let direct = accel(&p, &PairwiseGravity::new(G, eps(EPS)))[0];
    assert!((a - direct).length() > 1e-12 * direct.length());
}

#[test]
fn static_particles_neither_pull_nor_are_pulled() {
    let mut p = Particles::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    p.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(accel(&p, &bh(EPS, 0.5)), [Vec2::ZERO, Vec2::ZERO]);

    // In a crowd too: the static one's acceleration stays zero, and
    // removing it changes nobody else's (θ > 0, so the tree is used).
    let with = accel(&cloud::<f64>(), &bh(EPS, 0.7));
    assert_eq!(with.last(), Some(&Vec2::ZERO));
    let mut without = Particles::new();
    let c = cloud::<f64>();
    for ((&x, &vel), &w) in c.pos().iter().zip(c.vel()).zip(c.inv_mass()) {
        if w != 0.0 {
            without.add(x, vel, kg(1.0 / w));
        }
    }
    let without = accel(&without, &bh(EPS, 0.7));
    assert_eq!(&with[..with.len() - 1], &without[..]);
}

#[test]
fn coincident_bodies_without_softening_stay_finite() {
    // ε = 0 and r = 0: no direction. Also exercises the depth-limit bucket
    // (the two can never be split) and a root of zero size.
    let mut p = Particles::new();
    p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
    p.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
    assert_eq!(accel(&p, &bh(0.0, 0.5)), [Vec2::ZERO, Vec2::ZERO]);

    // A coincident pair inside a crowd, for every θ: still finite, and the
    // pair is pulled identically.
    let mut p = cloud::<f64>();
    p.add(Vec2::new(0.3, 0.3), Vec2::ZERO, kg(1.0e10));
    p.add(Vec2::new(0.3, 0.3), Vec2::ZERO, kg(1.0e10));
    for theta in [0.0, 0.5, 1.0, 2.0] {
        let a = accel(&p, &bh(0.0, theta));
        assert!(a.iter().all(|a| a.x.is_finite() && a.y.is_finite()));
        let n = a.len();
        assert_eq!(a[n - 1], a[n - 2], "θ = {theta}");
    }
}

#[test]
fn adds_into_acc_rather_than_overwrite() {
    let mut p = Particles::<f64>::new();
    p.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    let mut acc = vec![Vec2::new(1.0, 2.0)];
    bh(EPS, 0.5).accumulate(&p, &mut acc);
    // A lone body feels nothing (no self-force), and acc is kept.
    assert_eq!(acc, [Vec2::new(1.0, 2.0)]);
}

#[test]
fn empty_and_all_static_worlds_are_fine() {
    let p = Particles::<f64>::new();
    assert_eq!(accel(&p, &bh(EPS, 0.5)), []);
    let mut p = Particles::<f64>::new();
    p.add_static(Vec2::ZERO);
    p.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(accel(&p, &bh(EPS, 0.5)), [Vec2::ZERO, Vec2::ZERO]);
}

#[test]
fn huge_theta_still_excludes_self() {
    // θ = 100 accepts every cell that doesn't contain the target. Three
    // bodies on a line: the middle one sits between the others, so the
    // root (containing it) must be opened, and the forces cancel.
    let mut p = Particles::new();
    for x in [-1.0, 0.0, 1.0] {
        p.add(Vec2::new(x, 0.0), Vec2::ZERO, kg(1.0e10));
    }
    let a = accel(&p, &bh(0.0, 100.0));
    assert!(a[1].length() <= 1e-15, "{:?}", a[1]);
    assert!(a[0].x > 0.0 && a[2].x < 0.0);
}

#[test]
fn same_input_gives_bit_identical_output() {
    let p = cloud::<f32>();
    let f = bh::<f32>(EPS, 0.6);
    let bits = |a: Vec<Vec2<f32>>| {
        a.iter()
            .map(|a| (a.x.to_bits(), a.y.to_bits()))
            .collect::<Vec<_>>()
    };
    assert_eq!(bits(accel(&p, &f)), bits(accel(&p, &f)));
}

#[test]
fn approximating_takes_g_and_softening_from_the_pairwise_force() {
    let exact = PairwiseGravity::new(G, eps(EPS));
    let theta = OpeningAngle::new(0.7).unwrap();
    assert_eq!(
        BarnesHut::approximating(&exact, theta),
        BarnesHut::new(G, eps(EPS), theta)
    );
}

/// A target just outside a **lopsided** cell: the north-east quadrant of a
/// [0, 2]² root holds 90% of its mass at its east edge and 10% at its west
/// edge, and the target is 0.6 outside that west edge. The cell's center of
/// mass is far (`s/d ≈ 0.68 < θ = 0.7`), so the classic test used the cell
/// as one point, though the target is beside its western body
/// (Salmon & Warren 1994): measured 25% off (audit after A3). Counting the
/// center of mass's offset δ from the cell's center (`s/(d − δ) < θ`)
/// opens it.
#[test]
fn a_target_just_outside_a_lopsided_cell_is_accurate() {
    let mut p = Particles::<f64>::new();
    let target = p.add(Vec2::new(0.4, 1.5), Vec2::ZERO, kg(1.0));
    // Featherweight corners pin the root square to [0, 2]².
    p.add(Vec2::new(0.0, 0.0), Vec2::ZERO, kg(1.0));
    p.add(Vec2::new(2.0, 2.0), Vec2::ZERO, kg(1.0));
    for i in -5..5 {
        p.add(
            Vec2::new(1.97, 1.5 + 0.02 * f64::from(i)),
            Vec2::ZERO,
            kg(0.9e10),
        );
    }
    p.add(Vec2::new(1.03, 1.5), Vec2::ZERO, kg(1.0e10));
    let exact = accel(&p, &PairwiseGravity::new(G, eps(1e-3)));
    let approx = accel(&p, &bh::<f64>(1e-3, 0.7));
    let (a, b) = (approx[target.index()], exact[target.index()]);
    let err = (a - b).length() / b.length();
    println!("target's acceleration off by {:.2}%", 100.0 * err);
    assert!(err < LOPSIDED_TOL, "{err}");
}

/// What θ = 0.7 allows a well-behaved cell at the edge of acceptance (an
/// evenly filled one measured 5.3% off): the lopsided cell must do no
/// worse. Measured (audit after A3): 25.5% with the classic test, 0.03%
/// with δ (the cell is opened).
const LOPSIDED_TOL: f64 = 0.053;

/// From the full mutation run of 2026-11-12: bodies at the same point
/// share a bucket, whose mass is their sum; seen from far enough to
/// accept the bucket whole (θ = 1), it pulls like the two together.
#[test]
fn coincident_bodies_pull_as_their_total_mass() {
    let mut p = Particles::<f64>::new();
    // Off the origin: there a bucket's moment (mass × position) is zero
    // however it's summed (the fifth mutation run: `+=` for `-=` hid).
    p.add(Vec2::from_f64(10.0, 5.0), Vec2::ZERO, kg(1e10));
    p.add(Vec2::from_f64(10.0, 5.0), Vec2::ZERO, kg(2e10));
    p.add(Vec2::from_f64(110.0, -20.0), Vec2::ZERO, kg(1.0));
    let direct = accel(&p, &PairwiseGravity::new(G, eps(EPS)));
    let tree = accel(&p, &bh::<f64>(EPS, 1.0));
    let (d, t) = (direct[2], tree[2]);
    assert!((t - d).length() / d.length() < 1e-12, "{t:?} vs {d:?}");
}
