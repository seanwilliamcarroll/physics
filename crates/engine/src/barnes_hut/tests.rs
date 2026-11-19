use super::BarnesHut;
use crate::OpeningAngle;
use crate::params::kg;
use crate::rng::SplitMix64;
use crate::test_util::accel;
use crate::{Force, PairwiseGravity, Particles, Scalar, Softening, Vec2};

const G: f64 = 6.674_30e-11;
const SOFTENING: f64 = 0.1;

fn softening<S: Scalar>(meters: f64) -> Softening<S> {
    Softening::new(S::from_f64(meters)).unwrap()
}

fn barnes_hut<S: Scalar>(softening_meters: f64, theta: f64) -> BarnesHut<S> {
    BarnesHut::new(
        S::from_f64(G),
        softening(softening_meters),
        OpeningAngle::new(S::from_f64(theta)).unwrap(),
    )
}

fn cloud<S: Scalar>() -> Particles<S> {
    let mut particles = Particles::new();
    let mut rng = SplitMix64::new(7);
    for _ in 0..40 {
        let (x, y) = (rng.range(-2.0, 2.0), rng.range(-2.0, 2.0));
        let mass = rng.range(0.5e10, 1.5e10);
        particles.add(Vec2::from_f64(x, y), Vec2::ZERO, kg(mass));
    }
    particles.add_static(Vec2::from_f64(0.05, -0.03));
    particles
}

/// Largest |a − b| over bodies, relative to the largest |b|.
fn max_rel_diff<S: Scalar>(approximate: &[Vec2<S>], reference: &[Vec2<S>]) -> f64 {
    let scale = reference
        .iter()
        .map(|x| x.length().to_f64())
        .fold(0.0, f64::max);
    approximate
        .iter()
        .zip(reference)
        .map(|(x, y)| (*x - *y).length().to_f64())
        .fold(0.0, f64::max)
        / scale
}

/// θ = 0 never accepts a cell: the same sum as `PairwiseGravity`, up to
/// summation order. Measured: 2.7e-16 (f64), 2.1e-7 (f32)
/// relative to the largest acceleration; bounds ~10x above.
fn theta_zero_is_direct_summation<S: Scalar>(tolerance: f64) {
    let particles = cloud::<S>();
    let direct = accel(
        &particles,
        &PairwiseGravity::new(S::from_f64(G), softening(SOFTENING)),
    );
    let tree = accel(&particles, &barnes_hut::<S>(SOFTENING, 0.0));
    let error = max_rel_diff(&tree, &direct);
    assert!(error <= tolerance, "θ = 0 differs from direct by {error:e}");
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
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0));
    let (mut moment_x, mut moment_y, mut total_mass) = (0.0, 0.0, 0.0);
    for (&mass, &(dx, dy)) in masses.iter().zip(&offsets) {
        let (x, y) = (1000.0 + dx, dy);
        particles.add(Vec2::new(x, y), Vec2::ZERO, kg(mass));
        moment_x += mass * x;
        moment_y += mass * y;
        total_mass += mass;
    }
    let center_of_mass = Vec2::new(moment_x / total_mass, moment_y / total_mass);
    let offset = center_of_mass - Vec2::ZERO;
    let distance_sq = offset.length_sq() + SOFTENING * SOFTENING;
    let expect = offset * (G * total_mass / (distance_sq * distance_sq.sqrt()));

    let acceleration = accel(&particles, &barnes_hut::<f64>(SOFTENING, 0.5))[0];
    assert!(
        (acceleration - expect).length() <= 1e-12 * expect.length(),
        "{acceleration:?} vs {expect:?}"
    );
    let direct = accel(&particles, &PairwiseGravity::new(G, softening(SOFTENING)))[0];
    assert!((acceleration - direct).length() > 1e-12 * direct.length());
}

#[test]
fn static_particles_neither_pull_nor_are_pulled() {
    let mut particles = Particles::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    particles.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(
        accel(&particles, &barnes_hut(SOFTENING, 0.5)),
        [Vec2::ZERO, Vec2::ZERO]
    );

    // In a crowd too: the static one's acceleration stays zero, and
    // removing it changes nobody else's (θ > 0, so the tree is used).
    let with = accel(&cloud::<f64>(), &barnes_hut(SOFTENING, 0.7));
    assert_eq!(with.last(), Some(&Vec2::ZERO));
    let mut without = Particles::new();
    let original = cloud::<f64>();
    for ((&x, &vel), &inverse_mass) in original
        .positions()
        .iter()
        .zip(original.velocities())
        .zip(original.inverse_mass())
    {
        if inverse_mass != 0.0 {
            without.add(x, vel, kg(1.0 / inverse_mass));
        }
    }
    let without = accel(&without, &barnes_hut(SOFTENING, 0.7));
    assert_eq!(&with[..with.len() - 1], &without[..]);
}

#[test]
fn coincident_bodies_without_softening_stay_finite() {
    // ε = 0 and r = 0: no direction. Also exercises the depth-limit bucket
    // (the two can never be split) and a root of zero size.
    let mut particles = Particles::new();
    particles.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
    particles.add(Vec2::new(1.0, 1.0), Vec2::ZERO, kg(1.0e10));
    assert_eq!(
        accel(&particles, &barnes_hut(0.0, 0.5)),
        [Vec2::ZERO, Vec2::ZERO]
    );

    // A coincident pair inside a crowd, for every θ: still finite, and the
    // pair is pulled identically.
    let mut particles = cloud::<f64>();
    particles.add(Vec2::new(0.3, 0.3), Vec2::ZERO, kg(1.0e10));
    particles.add(Vec2::new(0.3, 0.3), Vec2::ZERO, kg(1.0e10));
    for theta in [0.0, 0.5, 1.0, 2.0] {
        let accelerations = accel(&particles, &barnes_hut(0.0, theta));
        assert!(
            accelerations
                .iter()
                .all(|accelerations| accelerations.x.is_finite() && accelerations.y.is_finite())
        );
        let count = accelerations.len();
        assert_eq!(
            accelerations[count - 1],
            accelerations[count - 2],
            "θ = {theta}"
        );
    }
}

#[test]
fn adds_into_acc_rather_than_overwrite() {
    let mut particles = Particles::<f64>::new();
    particles.add(Vec2::ZERO, Vec2::ZERO, kg(1.0e10));
    let mut acc = vec![Vec2::new(1.0, 2.0)];
    barnes_hut(SOFTENING, 0.5).accumulate(&particles, &mut acc);
    assert_eq!(acc, [Vec2::new(1.0, 2.0)]);
}

#[test]
fn empty_and_all_static_worlds_are_fine() {
    let particles = Particles::<f64>::new();
    assert_eq!(accel(&particles, &barnes_hut(SOFTENING, 0.5)), []);
    let mut particles = Particles::<f64>::new();
    particles.add_static(Vec2::ZERO);
    particles.add_static(Vec2::new(1.0, 0.0));
    assert_eq!(
        accel(&particles, &barnes_hut(SOFTENING, 0.5)),
        [Vec2::ZERO, Vec2::ZERO]
    );
}

#[test]
fn huge_theta_still_excludes_self() {
    // θ = 100 accepts every cell that doesn't contain the target. Three
    // bodies on a line: the middle one sits between the others, so the
    // root (containing it) must be opened, and the forces cancel.
    let mut particles = Particles::new();
    for x in [-1.0, 0.0, 1.0] {
        particles.add(Vec2::new(x, 0.0), Vec2::ZERO, kg(1.0e10));
    }
    let accelerations = accel(&particles, &barnes_hut(0.0, 100.0));
    assert!(accelerations[1].length() <= 1e-15, "{:?}", accelerations[1]);
    assert!(accelerations[0].x > 0.0 && accelerations[2].x < 0.0);
}

#[test]
fn same_input_gives_bit_identical_output() {
    let particles = cloud::<f32>();
    let force = barnes_hut::<f32>(SOFTENING, 0.6);
    let bits = |acceleration: Vec<Vec2<f32>>| {
        acceleration
            .iter()
            .map(|acceleration| (acceleration.x.to_bits(), acceleration.y.to_bits()))
            .collect::<Vec<_>>()
    };
    assert_eq!(
        bits(accel(&particles, &force)),
        bits(accel(&particles, &force))
    );
}

#[test]
fn approximating_takes_g_and_softening_from_the_pairwise_force() {
    let exact = PairwiseGravity::new(G, softening(SOFTENING));
    let theta = OpeningAngle::new(0.7).unwrap();
    assert_eq!(
        BarnesHut::approximating(&exact, theta),
        BarnesHut::new(G, softening(SOFTENING), theta)
    );
}

/// A target just outside a **lopsided** cell: the north-east quadrant of a
/// [0, 2]² root holds 90% of its mass at its east edge and 10% at its west
/// edge, and the target is 0.6 outside that west edge. The cell's center of
/// mass is far (`s/d ≈ 0.68 < θ = 0.7`), so the classic test used the cell
/// as one point, though the target is beside its western body
/// (Salmon & Warren 1994): measured 25% off. Counting the
/// center of mass's offset δ from the cell's center (`s/(d − δ) < θ`)
/// opens it.
#[test]
fn a_target_just_outside_a_lopsided_cell_is_accurate() {
    let mut particles = Particles::<f64>::new();
    let target = particles.add(Vec2::new(0.4, 1.5), Vec2::ZERO, kg(1.0));
    // Featherweight corners pin the root square to [0, 2]².
    particles.add(Vec2::new(0.0, 0.0), Vec2::ZERO, kg(1.0));
    particles.add(Vec2::new(2.0, 2.0), Vec2::ZERO, kg(1.0));
    for step in -5..5 {
        particles.add(
            Vec2::new(1.97, 1.5 + 0.02 * f64::from(step)),
            Vec2::ZERO,
            kg(0.9e10),
        );
    }
    particles.add(Vec2::new(1.03, 1.5), Vec2::ZERO, kg(1.0e10));
    let exact = accel(&particles, &PairwiseGravity::new(G, softening(1e-3)));
    let approx = accel(&particles, &barnes_hut::<f64>(1e-3, 0.7));
    let (approximate, exact_acceleration) = (approx[target.index()], exact[target.index()]);
    let error = (approximate - exact_acceleration).length() / exact_acceleration.length();
    println!("target's acceleration off by {:.2}%", 100.0 * error);
    assert!(error < LOPSIDED_TOL, "{error}");
}

/// What θ = 0.7 allows a well-behaved cell at the edge of acceptance (an
/// evenly filled one measured 5.3% off): the lopsided cell must do no
/// worse. Measured: 25.5% with the classic test, 0.03%
/// with δ (the cell is opened).
const LOPSIDED_TOL: f64 = 0.053;

/// Bodies at the same point
/// share a bucket, whose mass is their sum; seen from far enough to
/// accept the bucket whole (θ = 1), it pulls like the two together.
#[test]
fn coincident_bodies_pull_as_their_total_mass() {
    let mut particles = Particles::<f64>::new();
    // Off the origin: there a bucket's moment (mass × position) is zero
    // however it's summed.
    particles.add(Vec2::from_f64(10.0, 5.0), Vec2::ZERO, kg(1e10));
    particles.add(Vec2::from_f64(10.0, 5.0), Vec2::ZERO, kg(2e10));
    particles.add(Vec2::from_f64(110.0, -20.0), Vec2::ZERO, kg(1.0));
    let direct = accel(&particles, &PairwiseGravity::new(G, softening(SOFTENING)));
    let tree = accel(&particles, &barnes_hut::<f64>(SOFTENING, 1.0));
    let (direct_acceleration, tree_acceleration) = (direct[2], tree[2]);
    assert!(
        (tree_acceleration - direct_acceleration).length() / direct_acceleration.length() < 1e-12,
        "{tree_acceleration:?} vs {direct_acceleration:?}"
    );
}
