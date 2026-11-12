//! Random call sequences through the C ABI, as JS could make them
//! (`docs/04-testing.md`, "Property tests"): every export, hostile values
//! (NaN, ±∞, ±0, `f64::MAX`, negatives, unknown codes, `u32::MAX`).
//!
//! After every call: no panic (wasm builds abort on one, killing the
//! page), statuses are 0 or 1, the buffers JS reads stay consistent, a
//! rejected call (status 0) changes nothing, and a grab returning −1
//! leaves nothing held.
//!
//! **Work sizes** (particle counts, links, grid sides, substeps,
//! iterations, the rate) are drawn small, so cases stay fast, or past the
//! ABI's caps (`abi::MAX_*`), which it must refuse: a demo of 4e9
//! particles or `u32::MAX` substeps is null or status 0, not a 32 GB
//! allocation or a hung tab.

use core::ptr;

use proptest::prelude::*;
use proptest::test_runner::TestCaseError;

use super::super::collisions::{
    demo_momentum_x, demo_momentum_y, demo_new_ball_box, demo_new_break_shot, demo_new_cradle,
    demo_pairs_len, demo_pairs_ptr, demo_particle_radius, demo_set_restitution, demo_update_pairs,
};
use super::super::drag::{demo_drag, demo_grab, demo_grabbable, demo_release};
use super::super::lifecycle::{
    demo_advance, demo_free, demo_links_len, demo_links_ptr, demo_new, demo_new_chain,
    demo_new_double_pendulum, demo_new_jelly, demo_positions_len, demo_positions_ptr,
};
use super::super::pool::{
    demo_at_rest, demo_ball_number, demo_new_pool, demo_pockets_len, demo_pockets_ptr,
    demo_potted_len, demo_potted_ptr, demo_respot_cue, demo_segments_len, demo_segments_ptr,
    demo_set_speculative, demo_spin_x, demo_spin_y, demo_strike, demo_tunnels,
};
use super::super::readouts::{
    demo_constraint_error, demo_energy, demo_kinetic_energy, demo_particle_x, demo_particle_y,
};
use super::super::settings::{
    demo_set_beta, demo_set_damping, demo_set_integrator, demo_set_iterations, demo_set_order,
    demo_set_rate, demo_set_softening, demo_set_solver, demo_set_stabilization, demo_set_step_cap,
    demo_set_stiffness, demo_set_substeps, demo_set_theta,
};
use crate::abi;
use crate::demo::Demo;

/// Calls per generated sequence.
const MAX_CALLS: usize = 24;
/// The small work sizes drawn (see the module doc).
const SMALL_BODIES: u32 = 24;
const SMALL_LINKS: u32 = 12;
const SMALL_GRID: u32 = 6;
const SMALL_BALLS: u32 = 12;
const SMALL_SUBSTEPS: u32 = 12;
const SMALL_ITERATIONS: u32 = 4;
/// Codes drawn from 0 up to here: every valid code and some unknown ones.
const MAX_CODE: u32 = 8;

/// What a page could pass (`test_support::hostile_f64`), around this
/// module's usual values.
fn hostile_f64() -> impl Strategy<Value = f64> {
    test_support::hostile_f64(-3.0..3.0)
}

/// A code: the valid ones, unknown ones, and `u32::MAX`.
fn code() -> impl Strategy<Value = u32> {
    prop_oneof![4 => 0..=MAX_CODE, 1 => Just(u32::MAX), 1 => any::<u32>()]
}

/// A work size: small (edges included), or past `cap`, which the ABI
/// refuses.
fn size(small: u32, cap: u32) -> impl Strategy<Value = u32> {
    prop_oneof![
        1 => Just(0),
        1 => Just(1),
        4 => 0..=small,
        1 => Just(cap + 1),
        1 => (cap + 1)..=u32::MAX,
    ]
}

#[derive(Clone, Debug)]
enum Create {
    New {
        kind: u32,
        scalar: u32,
        n: u32,
        seed: u32,
    },
    Chain {
        scalar: u32,
        links: u32,
        ratio: f64,
    },
    DoublePendulum {
        scalar: u32,
        start: u32,
        offset: f64,
    },
    Jelly {
        scalar: u32,
        body: u32,
        cols: u32,
        rows: u32,
        k: f64,
        c: f64,
    },
    BallBox {
        scalar: u32,
        n: u32,
        seed: u32,
    },
    Break {
        scalar: u32,
        gap: f64,
    },
    Cradle {
        scalar: u32,
        balls: u32,
        pulled: u32,
    },
    Pool {
        scalar: u32,
    },
}

/// A constructor call: mostly valid ones (so the calls after it reach a
/// live demo), sometimes hostile.
fn create() -> impl Strategy<Value = Create> {
    prop_oneof![4 => valid_create(), 1 => hostile_create()]
}

/// Valid codes and sensible values: every scene, either scalar.
fn valid_create() -> impl Strategy<Value = Create> {
    let scalar = || 0..=abi::SCALAR_F64;
    prop_oneof![
        (
            0..=abi::DEMO_PENDULUM,
            scalar(),
            1..=SMALL_BODIES,
            any::<u32>()
        )
            .prop_map(|(kind, scalar, n, seed)| Create::New {
                kind,
                scalar,
                n,
                seed
            }),
        (scalar(), 1..=SMALL_LINKS, 0.1..1000.0).prop_map(|(scalar, links, ratio)| Create::Chain {
            scalar,
            links,
            ratio
        }),
        (scalar(), 0..=abi::START_RAISED, -1e-3..1e-3).prop_map(|(scalar, start, offset)| {
            Create::DoublePendulum {
                scalar,
                start,
                offset,
            }
        }),
        (
            scalar(),
            0..=abi::JELLY_IMPULSE,
            2..=SMALL_GRID,
            2..=SMALL_GRID,
            prop_oneof![10.0..1e5, Just(f64::INFINITY)],
            0.0..2.0,
        )
            .prop_map(|(scalar, body, cols, rows, k, c)| Create::Jelly {
                scalar,
                body,
                cols,
                rows,
                k,
                c
            }),
        (scalar(), 0..=SMALL_BALLS, any::<u32>()).prop_map(|(scalar, n, seed)| Create::BallBox {
            scalar,
            n,
            seed
        }),
        (scalar(), 0.0..=abi::MAX_BREAK_GAP)
            .prop_map(|(scalar, gap)| Create::Break { scalar, gap }),
        (
            scalar(),
            0..=abi::MAX_CRADLE_BALLS,
            0..=abi::MAX_CRADLE_BALLS
        )
            .prop_map(|(scalar, balls, pulled)| Create::Cradle {
                scalar,
                balls,
                pulled
            }),
        scalar().prop_map(|scalar| Create::Pool { scalar }),
    ]
}

/// Any codes and values.
fn hostile_create() -> impl Strategy<Value = Create> {
    prop_oneof![
        (
            code(),
            code(),
            size(SMALL_BODIES, abi::MAX_PARTICLES),
            any::<u32>()
        )
            .prop_map(|(kind, scalar, n, seed)| {
                Create::New {
                    kind,
                    scalar,
                    n,
                    seed,
                }
            }),
        (
            code(),
            size(SMALL_LINKS, abi::MAX_CHAIN_LINKS),
            hostile_f64()
        )
            .prop_map(|(scalar, links, ratio)| Create::Chain {
                scalar,
                links,
                ratio
            }),
        (code(), code(), hostile_f64()).prop_map(|(scalar, start, offset)| {
            Create::DoublePendulum {
                scalar,
                start,
                offset,
            }
        }),
        (
            code(),
            code(),
            size(SMALL_GRID, abi::MAX_JELLY_SIDE),
            size(SMALL_GRID, abi::MAX_JELLY_SIDE),
            hostile_f64(),
            hostile_f64()
        )
            .prop_map(|(scalar, body, cols, rows, k, c)| Create::Jelly {
                scalar,
                body,
                cols,
                rows,
                k,
                c
            }),
        (code(), size(SMALL_BALLS, abi::MAX_BOX_BALLS), any::<u32>())
            .prop_map(|(scalar, n, seed)| Create::BallBox { scalar, n, seed }),
        (code(), hostile_f64()).prop_map(|(scalar, gap)| Create::Break { scalar, gap }),
        (
            code(),
            size(SMALL_BALLS, abi::MAX_CRADLE_BALLS),
            any::<u32>()
        )
            .prop_map(|(scalar, balls, pulled)| Create::Cradle {
                scalar,
                balls,
                pulled
            }),
        code().prop_map(|scalar| Create::Pool { scalar }),
    ]
}

/// One call on the live demo (or on null, if creating it failed).
#[derive(Clone, Debug)]
enum Call {
    /// Free the demo and create another.
    Replace(Create),
    Advance(f64),
    Integrator(u32),
    Rate(u32),
    Softening(f64),
    Theta(f64),
    Solver(u32),
    Beta(f64),
    Substeps(u32),
    Iterations(u32),
    Order(u32),
    Stabilization(u32),
    Stiffness(f64),
    Damping(f64),
    Grab(f64, f64, f64),
    Drag(f64, f64),
    Release,
    Restitution(f64),
    /// Read particle `i`'s exact position and radius.
    Particle(u32),
    /// Recompute the broadphase's pairs.
    Pairs,
    Strike(f64, f64, f64, f64),
    StepCap(u32),
    Speculative(u32),
    Respot,
}

fn call() -> impl Strategy<Value = Call> {
    let f = hostile_f64;
    prop_oneof![
        1 => create().prop_map(Call::Replace),
        6 => f().prop_map(Call::Advance),
        1 => code().prop_map(Call::Integrator),
        1 => size(abi::MAX_RATE_HZ, abi::MAX_RATE_HZ).prop_map(Call::Rate),
        1 => f().prop_map(Call::Softening),
        1 => f().prop_map(Call::Theta),
        1 => code().prop_map(Call::Solver),
        1 => f().prop_map(Call::Beta),
        1 => size(SMALL_SUBSTEPS, abi::MAX_SUBSTEPS).prop_map(Call::Substeps),
        1 => size(SMALL_ITERATIONS, abi::MAX_ITERATIONS).prop_map(Call::Iterations),
        1 => code().prop_map(Call::Order),
        1 => code().prop_map(Call::Stabilization),
        1 => f().prop_map(Call::Stiffness),
        1 => f().prop_map(Call::Damping),
        // Grabs mostly near the scenes (within a few m), sometimes hostile.
        2 => (prop_oneof![-3.0..3.0, f()], prop_oneof![-3.0..3.0, f()], prop_oneof![0.0..2.0, f()])
            .prop_map(|(x, y, r)| Call::Grab(x, y, r)),
        2 => (prop_oneof![-3.0..3.0, f()], prop_oneof![-3.0..3.0, f()]).prop_map(|(x, y)| Call::Drag(x, y)),
        1 => Just(Call::Release),
        1 => f().prop_map(Call::Restitution),
        1 => Just(Call::Pairs),
        // Strikes mostly in range (so the table moves), sometimes hostile.
        2 => (prop_oneof![-1.0..1.0, f()], prop_oneof![-1.0..1.0, f()], prop_oneof![0.0..12.0, f()], prop_oneof![-0.5..0.5, f()])
            .prop_map(|(x, y, v, t)| Call::Strike(x, y, v, t)),
        1 => code().prop_map(Call::Speculative),
        1 => Just(Call::Respot),
        1 => size(4, abi::MAX_RATE_HZ).prop_map(Call::StepCap),
        1 => any::<u32>().prop_map(|i| Call::Particle(i % (2 * SMALL_BODIES + 4))),
    ]
}

fn make(c: &Create) -> *mut Demo {
    match *c {
        Create::New {
            kind,
            scalar,
            n,
            seed,
        } => demo_new(kind, scalar, n, seed),
        Create::Chain {
            scalar,
            links,
            ratio,
        } => demo_new_chain(scalar, links, ratio),
        Create::DoublePendulum {
            scalar,
            start,
            offset,
        } => demo_new_double_pendulum(scalar, start, offset),
        Create::Jelly {
            scalar,
            body,
            cols,
            rows,
            k,
            c,
        } => demo_new_jelly(scalar, body, cols, rows, k, c),
        Create::BallBox { scalar, n, seed } => demo_new_ball_box(scalar, n, seed),
        Create::Break { scalar, gap } => demo_new_break_shot(scalar, gap),
        Create::Cradle {
            scalar,
            balls,
            pulled,
        } => demo_new_cradle(scalar, balls, pulled),
        Create::Pool { scalar } => demo_new_pool(scalar),
    }
}

/// Everything JS can read from a demo, bit for bit (NaN included), after
/// checking the buffers are consistent.
#[derive(Debug, PartialEq)]
struct Observed {
    positions: Vec<u32>,
    links: Vec<u32>,
    readouts: [u64; 6],
    potted: Vec<u32>,
    at_rest: u32,
    grabbable: u32,
}

/// Reads every buffer and readout of `d` (null allowed), checking what JS
/// relies on: positions are (x, y) pairs, links are pairs of particle
/// indices that exist, and a null demo reads as empty and NaN.
///
/// # Safety
/// `d` must be null or a live handle.
unsafe fn observe(d: *mut Demo) -> Result<Observed, TestCaseError> {
    // SAFETY: per this function's contract.
    unsafe {
        let (pos_len, links_len) = (demo_positions_len(d), demo_links_len(d));
        prop_assert_eq!(pos_len % 2, 0, "positions are (x, y) pairs");
        prop_assert_eq!(links_len % 2, 0, "links are index pairs");
        let positions = if pos_len == 0 {
            Vec::new()
        } else {
            let p = demo_positions_ptr(d);
            prop_assert!(!p.is_null());
            core::slice::from_raw_parts(p, pos_len)
                .iter()
                .map(|v| v.to_bits())
                .collect()
        };
        let links = if links_len == 0 {
            Vec::new()
        } else {
            let p = demo_links_ptr(d);
            prop_assert!(!p.is_null());
            core::slice::from_raw_parts(p, links_len).to_vec()
        };
        let particles = pos_len / 2;
        for &i in &links {
            prop_assert!(
                (i as usize) < particles,
                "link to particle {i} of {particles}"
            );
        }
        // The table's buffers: segments by fours, pockets by threes, and
        // the potted list's pairs naming balls and pockets that exist.
        prop_assert_eq!(demo_segments_len(d) % 4, 0);
        let pockets = demo_pockets_len(d);
        prop_assert_eq!(pockets % 3, 0);
        for (len, p) in [
            (demo_segments_len(d), demo_segments_ptr(d)),
            (pockets, demo_pockets_ptr(d)),
        ] {
            if len > 0 {
                prop_assert!(
                    core::slice::from_raw_parts(p, len)
                        .iter()
                        .all(|v| v.is_finite())
                );
            }
        }
        let potted = if demo_potted_len(d) == 0 {
            Vec::new()
        } else {
            core::slice::from_raw_parts(demo_potted_ptr(d), demo_potted_len(d)).to_vec()
        };
        for p in potted.chunks(2) {
            prop_assert!(
                (p[0] as usize) < pos_len / 2 && (p[1] as usize) < pockets / 3,
                "potted {p:?}"
            );
        }
        let at_rest = demo_at_rest(d);
        prop_assert!(at_rest <= 1);
        let grabbable = demo_grabbable(d);
        prop_assert!(grabbable <= 1);
        if d.is_null() {
            prop_assert!(demo_energy(d).is_nan() && demo_kinetic_energy(d).is_nan());
        }
        Ok(Observed {
            positions,
            links,
            readouts: [
                demo_energy(d),
                demo_kinetic_energy(d),
                demo_constraint_error(d),
                demo_momentum_x(d),
                demo_momentum_y(d),
                demo_tunnels(d),
            ]
            .map(f64::to_bits),
            potted,
            at_rest,
            grabbable,
        })
    }
}

/// Makes `call` on `d`; returns whether it was refused (status 0, grab −1),
/// checking a status is 0 or 1.
///
/// # Safety
/// `d` must be null or a live handle; `Replace` is handled by the caller.
unsafe fn apply(d: *mut Demo, call: &Call) -> Result<bool, TestCaseError> {
    // SAFETY: per this function's contract.
    let status = unsafe {
        match *call {
            Call::Replace(_) => return Err(TestCaseError::fail("handled by the caller")),
            Call::Advance(t) => {
                let steps = demo_advance(d, t);
                // At most 0.25 s (the frame clamp) of steps at the highest rate.
                prop_assert!(steps <= abi::MAX_RATE_HZ / 4 + 1, "{steps} steps from {t}");
                return Ok(false);
            }
            Call::Particle(i) => {
                let (x, y) = (demo_particle_x(d, i), demo_particle_y(d, i));
                let count = demo_positions_len(d) / 2;
                let r = demo_particle_radius(d, i);
                let (wx, wy) = (demo_spin_x(d, i), demo_spin_y(d, i));
                let number = demo_ball_number(d, i);
                if (i as usize) >= count {
                    prop_assert!(
                        x.is_nan() && y.is_nan() && r.is_nan(),
                        "past the end reads NaN"
                    );
                    prop_assert!(wx.is_nan() && wy.is_nan() && number == -1);
                } else {
                    prop_assert!(r >= 0.0, "radius {r}");
                    prop_assert!((-1..=15).contains(&number), "number {number}");
                }
                return Ok(false);
            }
            Call::Grab(x, y, r) => {
                // Not a refusal: a grab replaces the held one, hit or miss.
                // −1 means nothing is held now, so there's nothing to drag.
                let i = demo_grab(d, x, y, r);
                prop_assert!(i >= -1);
                if i == -1 {
                    prop_assert_eq!(demo_drag(d, 0.0, 0.0), 0, "−1 left a grab held");
                }
                return Ok(false);
            }
            Call::Pairs => {
                // Not a setting: it fills a buffer JS reads. Pairs are
                // `a < b`, both particles that exist.
                let cell = demo_update_pairs(d);
                prop_assert!(cell.is_nan() || cell > 0.0, "cell {cell}");
                let len = demo_pairs_len(d);
                prop_assert_eq!(len % 2, 0);
                if len > 0 {
                    let count = demo_positions_len(d) / 2;
                    let pairs = core::slice::from_raw_parts(demo_pairs_ptr(d), len);
                    for p in pairs.chunks(2) {
                        prop_assert!(p[0] < p[1] && (p[1] as usize) < count, "pair {p:?}");
                    }
                }
                return Ok(false);
            }
            Call::Restitution(e) => demo_set_restitution(d, e),
            Call::Strike(x, y, v, t) => demo_strike(d, x, y, v, t),
            Call::Speculative(c) => demo_set_speculative(d, c),
            Call::Respot => demo_respot_cue(d),
            Call::StepCap(n) => demo_set_step_cap(d, n),
            Call::Integrator(c) => demo_set_integrator(d, c),
            Call::Rate(hz) => demo_set_rate(d, hz),
            Call::Softening(e) => demo_set_softening(d, e),
            Call::Theta(t) => demo_set_theta(d, t),
            Call::Solver(c) => demo_set_solver(d, c),
            Call::Beta(b) => demo_set_beta(d, b),
            Call::Substeps(n) => demo_set_substeps(d, n),
            Call::Iterations(n) => demo_set_iterations(d, n),
            Call::Order(c) => demo_set_order(d, c),
            Call::Stabilization(c) => demo_set_stabilization(d, c),
            Call::Stiffness(k) => demo_set_stiffness(d, k),
            Call::Damping(c) => demo_set_damping(d, c),
            Call::Drag(x, y) => demo_drag(d, x, y),
            Call::Release => demo_release(d),
        }
    };
    prop_assert!(status <= 1, "status {status} from {call:?}");
    Ok(status == 0)
}

fn run(first: &Create, calls: &[Call]) -> Result<(), TestCaseError> {
    let mut d = make(first);
    // SAFETY: `d` is always null or the one live handle from `make`; it is
    // freed exactly once, when replaced or at the end.
    unsafe {
        for call in calls {
            let before = observe(d)?;
            if let Call::Replace(c) = call {
                demo_free(d);
                d = make(c);
                observe(d)?;
                continue;
            }
            let refused = apply(d, call)?;
            let after = observe(d)?;
            if refused {
                prop_assert_eq!(&before, &after, "refused {:?} changed the demo", call);
            }
        }
        demo_free(d);
    }
    Ok(())
}

proptest! {
    #![proptest_config(test_support::proptest_config())]

    #[test]
    fn any_call_sequence_is_safe(first in create(), calls in prop::collection::vec(call(), 0..MAX_CALLS)) {
        run(&first, &calls)?;
    }
}

/// Every export on a null handle, once: what a page holding a freed or
/// failed demo would see.
#[test]
fn every_call_on_null_is_refused() {
    let null = ptr::null_mut();
    for call in [
        Call::Advance(1.0),
        Call::Integrator(0),
        Call::Rate(60),
        Call::Softening(0.1),
        Call::Theta(0.5),
        Call::Solver(0),
        Call::Beta(0.2),
        Call::Substeps(1),
        Call::Iterations(1),
        Call::Order(0),
        Call::Stabilization(0),
        Call::Stiffness(100.0),
        Call::Damping(0.1),
        Call::Grab(0.0, 0.0, 1.0),
        Call::Drag(0.0, 0.0),
        Call::Release,
        Call::Restitution(0.5),
        Call::Strike(1.0, 0.0, 1.0, 0.0),
        Call::Speculative(1),
        Call::Respot,
        Call::StepCap(1),
    ] {
        // SAFETY: null is allowed by every export's contract.
        let refused = unsafe { apply(null, &call) }.unwrap();
        // Advance and Grab aren't statuses (0 steps; −1, checked by `apply`).
        assert!(
            refused || matches!(call, Call::Advance(_) | Call::Grab(..)),
            "{call:?} on null"
        );
    }
}
