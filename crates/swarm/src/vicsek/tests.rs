use super::{Particle, Vicsek, VicsekParams, image, wrap};

const L: f32 = 10.0;

fn p(x: f32, y: f32, cos: f32, sin: f32) -> Particle {
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
    assert!(Vicsek::new(0, L, VicsekParams::paper(1.0), 1).is_none());
    assert!(Vicsek::new(10, 0.0, VicsekParams::paper(1.0), 1).is_none());
    let v = Vicsek::new(400, L, VicsekParams::paper(1.0), 1).unwrap();
    assert!(
        v.particles()
            .all(|q| (0.0..L).contains(&q.x) && (0.0..L).contains(&q.y))
    );
    assert!(
        v.particles()
            .all(|q| ((q.cos * q.cos + q.sin * q.sin) - 1.0).abs() < 1e-6)
    );
}

#[test]
fn the_minimum_image_and_wrapping() {
    assert_eq!(image(9.0, L), -1.0);
    assert_eq!(image(-9.0, L), 1.0);
    assert_eq!(image(4.0, L), 4.0);
    assert_eq!(
        (wrap(10.02, L), wrap(-0.03, L), wrap(5.0, L)),
        (10.02 - L, -0.03 + L, 5.0)
    );
    assert_eq!(wrap(-1e-9, L), 0.0, "rounds up to L: wrapped to 0");
}

#[test]
fn without_noise_a_particle_takes_its_neighbourhoods_heading_and_moves_by_its_old() {
    // Two particles 0.5 apart, one heading +x, one +y: both take the
    // diagonal; each moves by its own old heading (Eq. 1).
    let a = p(5.0, 5.0, 1.0, 0.0);
    let b = p(5.5, 5.0, 0.0, 1.0);
    let mut v = Vicsek::with_particles(L, VicsekParams::paper(0.0), [a, b], 1).unwrap();
    v.step();
    let h = 0.5_f32.sqrt();
    let (a1, b1) = (v.particle(0).unwrap(), v.particle(1).unwrap());
    assert!(
        (a1.cos - h).abs() < 1e-6 && (a1.sin - h).abs() < 1e-6,
        "{a1:?}"
    );
    assert_eq!((a1.x, a1.y), (5.03, 5.0));
    assert_eq!((b1.x, b1.y), (5.5, 5.03));
    assert_eq!((b1.cos, b1.sin), (a1.cos, a1.sin));
}

#[test]
fn neighbours_are_seen_across_the_walls() {
    // At x = 0.2 and x = 9.9: 0.3 apart through the wall.
    let a = p(0.2, 5.0, 1.0, 0.0);
    let b = p(9.9, 5.0, 0.0, 1.0);
    let mut v = Vicsek::with_particles(L, VicsekParams::paper(0.0), [a, b], 1).unwrap();
    v.step();
    assert!(
        v.particle(0).unwrap().sin > 0.5,
        "a sees b through the wall"
    );
    // And a particle crossing the wall reappears on the other side.
    let c = p(9.99, 5.0, 1.0, 0.0);
    let mut w = Vicsek::with_particles(L, VicsekParams::paper(0.0), [c], 1).unwrap();
    w.step();
    assert!((w.particle(0).unwrap().x - 0.02).abs() < 1e-5);
}

#[test]
fn exactly_opposite_headings_keep_their_own_and_are_counted() {
    // Two particles at one point, heading exactly opposite: the sum is
    // exactly zero (Chen & Zhang's "direction annihilation").
    let a = p(5.0, 5.0, 1.0, 0.0);
    let b = p(5.0, 5.0, -1.0, 0.0);
    let mut v = Vicsek::with_particles(L, VicsekParams::paper(0.0), [a, b], 1).unwrap();
    v.step();
    assert_eq!(v.annihilations(), 2, "both neighbourhoods cancelled");
    assert_eq!(
        (v.particle(0).unwrap().cos, v.particle(1).unwrap().cos),
        (1.0, -1.0)
    );
}

#[test]
fn the_noise_turns_by_at_most_half_eta() {
    // Alone (its own heading is the average), each step turns by Δθ with
    // |Δθ| ≤ η/2, and the heading stays a unit vector.
    let eta = 1.0_f32;
    let mut v =
        Vicsek::with_particles(L, VicsekParams::paper(eta), [p(5.0, 5.0, 1.0, 0.0)], 9).unwrap();
    let mut prev = v.particle(0).unwrap();
    let mut widest = 0.0_f32;
    for _ in 0..2000 {
        v.step();
        let q = v.particle(0).unwrap();
        let turn = (prev.cos * q.sin - prev.sin * q.cos).atan2(prev.cos * q.cos + prev.sin * q.sin);
        widest = widest.max(turn.abs());
        assert!(turn.abs() <= eta / 2.0 + 1e-6, "turned {turn}");
        assert!(((q.cos * q.cos + q.sin * q.sin) - 1.0).abs() < 1e-5);
        prev = q;
    }
    assert!(widest > 0.49, "the whole range is drawn: {widest}");
}

#[test]
fn order_is_one_aligned_and_zero_opposed() {
    let v = Vicsek::with_particles(
        L,
        VicsekParams::paper(0.0),
        [p(1.0, 1.0, 1.0, 0.0), p(8.0, 8.0, 1.0, 0.0)],
        1,
    )
    .unwrap();
    assert!((v.order() - 1.0).abs() < 1e-12);
    let w = Vicsek::with_particles(
        L,
        VicsekParams::paper(0.0),
        [p(1.0, 1.0, 1.0, 0.0), p(8.0, 8.0, -1.0, 0.0)],
        1,
    )
    .unwrap();
    assert!(w.order().abs() < 1e-12);
}

#[test]
fn given_particles_are_wrapped_into_the_box() {
    // Found by a mutation run (4b299dd): nothing placed one outside.
    let v = Vicsek::with_particles(L, VicsekParams::paper(0.0), [p(L + 1.0, -2.0, 1.0, 0.0)], 1)
        .unwrap();
    assert_eq!(v.particle(0), Some(p(1.0, L - 2.0, 1.0, 0.0)));
}
