use super::{Particle, Vicsek, VicsekParams, minimum_image, wrap_into_box};

const SIDE: f32 = 10.0;

fn particle(x: f32, y: f32, cos: f32, sin: f32) -> Particle {
    Particle { x, y, cos, sin }
}

#[test]
fn params_and_sizes_are_checked() {
    assert!(VicsekParams::paper(1.0).checked().is_some());
    for bad in [
        VicsekParams {
            radius: 0.0,
            ..VicsekParams::paper(1.0)
        },
        VicsekParams {
            speed: f32::NAN,
            ..VicsekParams::paper(1.0)
        },
        VicsekParams::paper(-0.1),
        VicsekParams::paper(7.0),
    ] {
        assert_eq!(bad.checked(), None, "{bad:?}");
    }
    assert!(Vicsek::new(0, SIDE, VicsekParams::paper(1.0), 1).is_none());
    assert!(Vicsek::new(10, 0.0, VicsekParams::paper(1.0), 1).is_none());
    let vicsek = Vicsek::new(400, SIDE, VicsekParams::paper(1.0), 1).unwrap();
    assert!(
        vicsek
            .particles()
            .all(|q| (0.0..SIDE).contains(&q.x) && (0.0..SIDE).contains(&q.y))
    );
    assert!(
        vicsek
            .particles()
            .all(|q| ((q.cos * q.cos + q.sin * q.sin) - 1.0).abs() < 1e-6)
    );
}

#[test]
fn the_minimum_image_and_wrapping() {
    assert_eq!(minimum_image(9.0, SIDE), -1.0);
    assert_eq!(minimum_image(-9.0, SIDE), 1.0);
    assert_eq!(minimum_image(4.0, SIDE), 4.0);
    assert_eq!(
        (
            wrap_into_box(10.02, SIDE),
            wrap_into_box(-0.03, SIDE),
            wrap_into_box(5.0, SIDE)
        ),
        (10.02 - SIDE, -0.03 + SIDE, 5.0)
    );
    assert_eq!(
        wrap_into_box(-1e-9, SIDE),
        0.0,
        "rounds up to the side: wrapped to 0"
    );
}

#[test]
fn without_noise_a_particle_takes_its_neighbourhoods_heading_and_moves_by_its_old() {
    // Two particles 0.5 apart, one heading +x, one +y: both take the
    // diagonal; each moves by its own old heading (Eq. 1).
    let first = particle(5.0, 5.0, 1.0, 0.0);
    let second = particle(5.5, 5.0, 0.0, 1.0);
    let mut vicsek =
        Vicsek::with_particles(SIDE, VicsekParams::paper(0.0), [first, second], 1).unwrap();
    vicsek.step();
    let diagonal = 0.5_f32.sqrt();
    let (first_after, second_after) = (vicsek.particle(0).unwrap(), vicsek.particle(1).unwrap());
    assert!(
        (first_after.cos - diagonal).abs() < 1e-6 && (first_after.sin - diagonal).abs() < 1e-6,
        "{first_after:?}"
    );
    assert_eq!((first_after.x, first_after.y), (5.03, 5.0));
    assert_eq!((second_after.x, second_after.y), (5.5, 5.03));
    assert_eq!(
        (second_after.cos, second_after.sin),
        (first_after.cos, first_after.sin)
    );
}

#[test]
fn neighbours_are_seen_across_the_walls() {
    let first = particle(0.2, 5.0, 1.0, 0.0);
    let second = particle(9.9, 5.0, 0.0, 1.0);
    let mut vicsek =
        Vicsek::with_particles(SIDE, VicsekParams::paper(0.0), [first, second], 1).unwrap();
    vicsek.step();
    assert!(
        vicsek.particle(0).unwrap().sin > 0.5,
        "the first sees the second through the wall"
    );
    let crossing = particle(9.99, 5.0, 1.0, 0.0);
    let mut alone = Vicsek::with_particles(SIDE, VicsekParams::paper(0.0), [crossing], 1).unwrap();
    alone.step();
    assert!((alone.particle(0).unwrap().x - 0.02).abs() < 1e-5);
}

#[test]
fn exactly_opposite_headings_keep_their_own_and_are_counted() {
    // Two particles at one point, heading exactly opposite: the sum is
    // exactly zero (Chen & Zhang's "direction annihilation").
    let first = particle(5.0, 5.0, 1.0, 0.0);
    let second = particle(5.0, 5.0, -1.0, 0.0);
    let mut vicsek =
        Vicsek::with_particles(SIDE, VicsekParams::paper(0.0), [first, second], 1).unwrap();
    vicsek.step();
    assert_eq!(vicsek.annihilations(), 2, "both neighbourhoods cancelled");
    assert_eq!(
        (
            vicsek.particle(0).unwrap().cos,
            vicsek.particle(1).unwrap().cos
        ),
        (1.0, -1.0)
    );
}

#[test]
fn the_noise_turns_by_at_most_half_eta() {
    let eta = 1.0_f32;
    let mut vicsek = Vicsek::with_particles(
        SIDE,
        VicsekParams::paper(eta),
        [particle(5.0, 5.0, 1.0, 0.0)],
        9,
    )
    .unwrap();
    let mut previous = vicsek.particle(0).unwrap();
    let mut widest = 0.0_f32;
    for _ in 0..2000 {
        vicsek.step();
        let now = vicsek.particle(0).unwrap();
        let turn = (previous.cos * now.sin - previous.sin * now.cos)
            .atan2(previous.cos * now.cos + previous.sin * now.sin);
        widest = widest.max(turn.abs());
        assert!(turn.abs() <= eta / 2.0 + 1e-6, "turned {turn}");
        assert!(((now.cos * now.cos + now.sin * now.sin) - 1.0).abs() < 1e-5);
        previous = now;
    }
    assert!(widest > 0.49, "the whole range is drawn: {widest}");
}

#[test]
fn order_is_one_aligned_and_zero_opposed() {
    let aligned = Vicsek::with_particles(
        SIDE,
        VicsekParams::paper(0.0),
        [particle(1.0, 1.0, 1.0, 0.0), particle(8.0, 8.0, 1.0, 0.0)],
        1,
    )
    .unwrap();
    assert!((aligned.order() - 1.0).abs() < 1e-12);
    let opposed = Vicsek::with_particles(
        SIDE,
        VicsekParams::paper(0.0),
        [particle(1.0, 1.0, 1.0, 0.0), particle(8.0, 8.0, -1.0, 0.0)],
        1,
    )
    .unwrap();
    assert!(opposed.order().abs() < 1e-12);
}

#[test]
fn given_particles_are_wrapped_into_the_box() {
    let vicsek = Vicsek::with_particles(
        SIDE,
        VicsekParams::paper(0.0),
        [particle(SIDE + 1.0, -2.0, 1.0, 0.0)],
        1,
    )
    .unwrap();
    assert_eq!(
        vicsek.particle(0),
        Some(particle(1.0, SIDE - 2.0, 1.0, 0.0))
    );
}

#[test]
fn the_accessors_report_the_system() {
    let mut vicsek = Vicsek::new(40, SIDE, VicsekParams::paper(1.0), 1).unwrap();
    assert_eq!(
        (
            vicsek.len(),
            vicsek.is_empty(),
            vicsek.side(),
            vicsek.steps()
        ),
        (40, false, SIDE, 0)
    );
    vicsek.step();
    vicsek.step();
    assert_eq!(vicsek.steps(), 2);
}

#[test]
fn params_are_replaced_only_by_usable_ones() {
    let mut vicsek = Vicsek::new(10, SIDE, VicsekParams::paper(1.0), 1).unwrap();
    assert!(vicsek.set_params(VicsekParams::paper(2.0)));
    assert_eq!(vicsek.params(), VicsekParams::paper(2.0));
    let unusable = VicsekParams {
        speed: 0.0,
        ..VicsekParams::paper(3.0)
    };
    assert!(!vicsek.set_params(unusable), "a speed of 0 is refused");
    assert_eq!(vicsek.params(), VicsekParams::paper(2.0));
}

#[test]
fn given_particles_number_one_to_the_maximum() {
    use super::MAX_PARTICLES;
    let one = particle(1.0, 1.0, 1.0, 0.0);
    let given = |count: usize| {
        Vicsek::with_particles(
            SIDE,
            VicsekParams::paper(1.0),
            core::iter::repeat_n(one, count),
            1,
        )
    };
    assert!(given(0).is_none());
    assert_eq!(
        given(MAX_PARTICLES).map(|vicsek| vicsek.len()),
        Some(MAX_PARTICLES)
    );
    assert!(given(MAX_PARTICLES + 1).is_none());
}

/// A radius other than 1 (where r² = r) reaches the neighbour.
#[test]
fn the_neighbourhood_is_the_radius_not_one() {
    // Radius 2, a neighbour 1.5 away heading +y: the mean of the two
    // headings is the diagonal.
    let params = VicsekParams {
        radius: 2.0,
        ..VicsekParams::paper(0.0)
    };
    let mut vicsek = Vicsek::with_particles(
        SIDE,
        params,
        [particle(5.0, 5.0, 1.0, 0.0), particle(6.5, 5.0, 0.0, 1.0)],
        1,
    )
    .unwrap();
    vicsek.step();
    let first = vicsek.particle(0).unwrap();
    let half = core::f32::consts::FRAC_1_SQRT_2;
    assert!(
        (first.cos - half).abs() < 1e-6 && (first.sin - half).abs() < 1e-6,
        "{first:?}"
    );
}
