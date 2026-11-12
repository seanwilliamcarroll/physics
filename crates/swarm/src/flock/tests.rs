use super::{Boid, Flock, MAX_BOIDS};
use crate::{Arena, Params};

const P: Params = Params::ECE4760;

fn arena() -> Arena {
    Arena::new(640.0, 480.0).unwrap()
}

#[test]
fn a_random_flock_starts_inside_the_margins_in_the_speed_band() {
    let f = Flock::new(500, arena(), P, 7).unwrap();
    assert_eq!(f.len(), 500);
    for b in f.boids() {
        assert!(
            (100.0..=540.0).contains(&b.x) && (100.0..=380.0).contains(&b.y),
            "{b:?}"
        );
        let s = (b.vx * b.vx + b.vy * b.vy).sqrt();
        assert!((3.0 - 1e-5..=6.0 + 1e-5).contains(&s), "speed {s}");
    }
    // Repeatable; another seed differs.
    let again = Flock::new(500, arena(), P, 7).unwrap();
    assert!(f.boids().eq(again.boids()));
    assert!(
        !f.boids()
            .eq(Flock::new(500, arena(), P, 8).unwrap().boids())
    );
}

#[test]
fn sizes_and_params_are_checked() {
    assert!(Flock::new(0, arena(), P, 1).is_none());
    assert!(Flock::new(MAX_BOIDS + 1, arena(), P, 1).is_none());
    assert!(
        Flock::new(
            1,
            arena(),
            Params {
                min_speed: -1.0,
                ..P
            },
            1
        )
        .is_none()
    );
    assert!(Flock::with_boids(arena(), P, []).is_none());
    // A narrow arena (under two margins): anywhere in it.
    let small = Arena::new(50.0, 50.0).unwrap();
    let f = Flock::new(100, small, P, 3).unwrap();
    assert!(
        f.boids()
            .all(|b| (0.0..=50.0).contains(&b.x) && (0.0..=50.0).contains(&b.y))
    );
    let mut f = Flock::new(10, arena(), P, 1).unwrap();
    assert!(!f.set_params(Params {
        protected_range: 50.0,
        ..P
    }));
    assert_eq!(f.params(), P);
    assert!(f.set_params(Params { avoid: 0.1, ..P }));
    assert_eq!(f.params().avoid, 0.1);
}

#[test]
fn a_step_reads_one_instant_and_counts() {
    // Two boids 20 apart, mutually in range: each must see the other's
    // state from before the step, whichever is stored first.
    let a = Boid {
        x: 300.0,
        y: 240.0,
        vx: 4.0,
        vy: 0.0,
    };
    let b = Boid {
        x: 320.0,
        y: 240.0,
        vx: 0.0,
        vy: 4.0,
    };
    let mut ab = Flock::with_boids(arena(), P, [a, b]).unwrap();
    let mut ba = Flock::with_boids(arena(), P, [b, a]).unwrap();
    ab.step();
    ba.step();
    assert_eq!((ab.boid(0), ab.boid(1)), (ba.boid(1), ba.boid(0)));
    assert_eq!(ab.steps(), 1);
}

#[test]
fn polarization_is_one_aligned_and_zero_opposed() {
    let at = |vx: f32, vy: f32| Boid {
        x: 300.0,
        y: 200.0,
        vx,
        vy,
    };
    let aligned = Flock::with_boids(arena(), P, [at(3.0, 0.0), at(6.0, 0.0)]).unwrap();
    assert!((aligned.polarization() - 1.0).abs() < 1e-12);
    let opposed = Flock::with_boids(arena(), P, [at(3.0, 0.0), at(-5.0, 0.0)]).unwrap();
    assert!(opposed.polarization().abs() < 1e-12);
}

#[test]
fn state_bytes_are_every_component() {
    let f = Flock::new(3, arena(), P, 1).unwrap();
    assert_eq!(f.state_bytes().count(), 3 * 4 * 4);
}

// The tests below close gaps a mutation run found (4b299dd).

#[test]
fn a_flock_holds_up_to_the_cap_and_no_more() {
    let b = Boid {
        x: 300.0,
        y: 200.0,
        vx: 3.0,
        vy: 0.0,
    };
    let of = |n: usize| Flock::with_boids(arena(), P, core::iter::repeat_n(b, n));
    assert_eq!(of(MAX_BOIDS).map(|f| f.len()), Some(MAX_BOIDS));
    assert!(of(MAX_BOIDS + 1).is_none());
    assert!(!of(1).unwrap().is_empty());
}

#[test]
fn the_predator_is_set_removed_and_refused_if_not_finite() {
    let mut f = Flock::new(10, arena(), P, 1).unwrap();
    assert_eq!(f.predator(), None);
    assert!(f.set_predator(Some((30.0, 40.0))));
    assert_eq!(f.predator(), Some((30.0, 40.0)));
    for bad in [(f32::NAN, 1.0), (1.0, f32::INFINITY)] {
        assert!(!f.set_predator(Some(bad)), "{bad:?}");
        assert_eq!(f.predator(), Some((30.0, 40.0)), "refused: unchanged");
    }
    assert!(f.set_predator(None));
    assert_eq!(f.predator(), None);
}

#[test]
fn polarization_uses_each_heading_and_counts_a_boid_at_rest() {
    let at = |vx: f32, vy: f32| Boid {
        x: 300.0,
        y: 200.0,
        vx,
        vy,
    };
    // One boid, off the axes: its heading's length is 1.
    let one = Flock::with_boids(arena(), P, [at(3.0, 4.0)]).unwrap();
    assert!((one.polarization() - 1.0).abs() < 1e-12);
    // Perpendicular headings: |(1, 1)| / 2.
    let two = Flock::with_boids(arena(), P, [at(2.0, 0.0), at(0.0, 5.0)]).unwrap();
    assert!((two.polarization() - 0.5_f64.sqrt()).abs() < 1e-12);
    // A boid at rest has no heading but still counts: 2 of 3.
    let rest = Flock::with_boids(arena(), P, [at(3.0, 0.0), at(6.0, 0.0), at(0.0, 0.0)]).unwrap();
    assert!((rest.polarization() - 2.0 / 3.0).abs() < 1e-12);
}
