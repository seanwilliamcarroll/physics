use core::num::NonZeroU32;

use engine::diagnostics::{kinetic_energy, uniform_gravity_potential};
use engine::scenarios::{
    BOX_BALL_RADIUS, BREAK_BALL_MASS, BREAK_SPEED, CRADLE_RADIUS, ball_box, pendulum_gravity,
};
use engine::{Restitution, Solver, TimeStep};

use super::super::{Demo, DemoKind, ScalarKind};
use super::PHYSICS_DT;

/// Half a second: plenty of impacts in the box and the break.
const STEPS: usize = 30;

fn run(d: &mut Demo) {
    for _ in 0..STEPS {
        d.advance(PHYSICS_DT);
    }
}

#[test]
fn the_box_steps_as_the_scene_does_and_reads_its_energy() {
    let mut d = Demo::new_ball_box(ScalarKind::F64, 20, 1).unwrap();
    let mut w = ball_box::<f64>(Solver::Impulse, NonZeroU32::new(10).unwrap(), 20, 1).unwrap();
    run(&mut d);
    for _ in 0..STEPS {
        w.step(TimeStep::new(PHYSICS_DT).unwrap());
    }
    let p = w.particles();
    for (i, x) in p.pos().iter().enumerate() {
        assert_eq!(d.particle_position(i), Some((x.x, x.y)), "ball {i}");
    }
    let energy = kinetic_energy(p) + uniform_gravity_potential(p, &pendulum_gravity());
    assert_eq!(d.energy(), Some(energy));
    assert_eq!(d.particle_radius(0), Some(BOX_BALL_RADIUS));
    assert_eq!(d.particle_radius(20), None, "past the end");
}

#[test]
fn the_break_reads_kinetic_energy_and_keeps_its_momentum() {
    let mut d = Demo::new_break_shot(ScalarKind::F64, 0.0).unwrap();
    let p0 = BREAK_BALL_MASS * BREAK_SPEED;
    assert_eq!(d.momentum(), (p0, 0.0));
    assert_eq!(
        d.energy(),
        Some(0.5 * BREAK_BALL_MASS * BREAK_SPEED * BREAK_SPEED)
    );
    run(&mut d);
    let (px, py) = d.momentum();
    // Measured 0 along x, 8.9e-16 along y; bound ~10x.
    assert!((px - p0).abs() < 1e-14 && py.abs() < 1e-14, "({px}, {py})");
    assert_ne!(d.momentum(), (p0, 0.0), "the rack moved: a real test");
}

#[test]
fn the_cradle_has_a_rod_per_ball_and_pins_of_no_size() {
    let d = Demo::new_cradle(ScalarKind::F64, 5, 1).unwrap();
    assert_eq!(d.links().len(), 2 * 5);
    assert_eq!(d.particle_radius(0), Some(0.0), "a pin");
    assert_eq!(d.particle_radius(1), Some(CRADLE_RADIUS));
    assert!(d.energy().is_some());
}

#[test]
fn restitution_needs_collisions_and_changes_the_bounces() {
    let mut fountain = Demo::new(DemoKind::Fountain, ScalarKind::F64, 10, 1).unwrap();
    assert!(
        !fountain.set_restitution(Restitution::ELASTIC),
        "nothing collides"
    );
    let mut elastic = Demo::new_ball_box(ScalarKind::F64, 20, 1).unwrap();
    let mut inelastic = Demo::new_ball_box(ScalarKind::F64, 20, 1).unwrap();
    assert!(inelastic.set_restitution(Restitution::INELASTIC));
    run(&mut elastic);
    run(&mut inelastic);
    let (e1, e0) = (elastic.energy().unwrap(), inelastic.energy().unwrap());
    assert!(e0 < e1, "inelastic {e0} keeps less than elastic {e1}");
}

#[test]
fn the_pairs_cover_every_touching_pair_and_need_collisions() {
    let mut fountain = Demo::new(DemoKind::Fountain, ScalarKind::F64, 10, 1).unwrap();
    assert_eq!(fountain.update_pairs(), None);
    assert_eq!(fountain.pairs(), &[] as &[u32]);

    // The touching rack: every neighbor pair is a candidate.
    let mut d = Demo::new_break_shot(ScalarKind::F64, 0.0).unwrap();
    let cell = d.update_pairs().unwrap();
    assert!(
        cell > 2.0 * engine::scenarios::BREAK_BALL_RADIUS,
        "cell {cell}"
    );
    let pairs: Vec<(usize, usize)> = d
        .pairs()
        .chunks(2)
        .filter_map(|c| {
            Some((
                usize::try_from(*c.first()?).ok()?,
                usize::try_from(*c.get(1)?).ok()?,
            ))
        })
        .collect();
    let n = d.positions().len() / 2;
    for i in 0..n {
        for j in i + 1..n {
            let (a, b) = (
                d.particle_position(i).unwrap(),
                d.particle_position(j).unwrap(),
            );
            let dist = (b.0 - a.0).hypot(b.1 - a.1);
            let touching = dist < 2.0 * engine::scenarios::BREAK_BALL_RADIUS + 1e-9;
            let found = pairs.contains(&(i, j));
            assert!(!touching || found, "touching pair ({i}, {j}) missing");
        }
    }
    assert!(pairs.iter().all(|&(a, b)| a < b && b < n));
}
