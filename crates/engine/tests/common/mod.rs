//! Helpers shared by the integration tests.
// Each tests/*.rs compiles this module separately and uses a different
// subset, so unused helpers are expected. `expect` isn't possible: it
// would be unfulfilled in whichever test file does use everything.
#![allow(
    dead_code,
    reason = "each test crate uses a different subset of these helpers"
)]

use engine::diagnostics::total_energy;
use engine::scenarios::{orbit_gravity, orbit_period};
use engine::{Particles, Scalar, Vec2, World};

/// Per-scalar tolerances. These are hypotheses: when one fails, first decide
/// whether the tolerance or the physics is wrong, and record why here.
pub trait Tol: Scalar {
    /// Absolute position/velocity error allowed from rounding alone, for
    /// scenes of order 10 m over order 100 steps. Set ~10x above measured.
    const POS_ABS: f64;
    /// Momentum drift allowed, relative to `Σ m |v|` (16-body cluster,
    /// 1000 steps). Set ~10x above measured.
    const MOMENTUM_REL: f64;
    /// Center-of-mass error allowed after the same run, m. ~10x measured.
    const COM_ABS: f64;
    /// Relative energy error from rounding alone over 100 orbits: added to
    /// every orbit energy bound. In f32 it exceeds velocity Verlet's own
    /// truncation error, so f32 can't resolve Verlet's accuracy.
    const ENERGY_FLOOR: f64;
}

// Measured (2026-11-02): free fall, 64 steps: max error 1.5e-6.
// Cluster, 1000 steps: momentum drift 8.4e-8 of Σm|v|; COM error 1.5e-6 m.
impl Tol for f32 {
    const POS_ABS: f64 = 1e-5;
    const MOMENTUM_REL: f64 = 1e-6;
    const COM_ABS: f64 = 2e-5;
    // Orbit, Verlet, 100 orbits: 9.7e-6 (vs 3.7e-7 in f64): rounding.
    const ENERGY_FLOOR: f64 = 1e-4;
}

// Measured (same runs): free fall 8.9e-16. Cluster: momentum drift
// 7.5e-16 of Σm|v| (rounding level: forces are equal and opposite by
// construction); COM error 1.6e-14 m.
impl Tol for f64 {
    const POS_ABS: f64 = 1e-14;
    const MOMENTUM_REL: f64 = 1e-14;
    const COM_ABS: f64 = 2e-13;
    // f64 orbit errors match truncation formulas to 3 digits; rounding is
    // far below them.
    const ENERGY_FLOOR: f64 = 1e-12;
}

/// Runs a generic test body `fn name<S: Tol>()` once per scalar type.
macro_rules! for_each_scalar {
    ($name:ident) => {
        mod $name {
            #[test]
            fn f32() {
                super::$name::<f32>();
            }
            #[test]
            fn f64() {
                super::$name::<f64>();
            }
        }
    };
}

/// Shorthand for `S::from_f64(v)`.
pub fn s<S: Scalar>(v: f64) -> S {
    S::from_f64(v)
}

/// Shorthand for a `Vec2` from `f64` literals.
pub fn v<S: Scalar>(x: f64, y: f64) -> Vec2<S> {
    Vec2::new(s(x), s(y))
}

/// Exact bit pattern of a vector, for bit-identity assertions.
/// `to_f64` is lossless for f32 and f64, so equal bits here mean equal bits
/// in `S` (`==` would also accept `-0.0 == 0.0`).
pub fn bits<S: Scalar>(p: Vec2<S>) -> (u64, u64) {
    (p.x.to_f64().to_bits(), p.y.to_f64().to_bits())
}

/// Total energy of a `scenarios::orbit` world, under the scene's own force.
pub fn orbit_energy<S: Scalar>(w: &World<S>) -> f64 {
    total_energy(&w.particles, &orbit_gravity()).to_f64()
}

/// Distance between the two bodies of an orbit world, m.
pub fn separation<S: Scalar>(w: &World<S>) -> f64 {
    let p = w.particles.pos();
    (p[1] - p[0]).length().to_f64()
}

/// Steps of `dt` for `orbits` periods of the circular orbit (rounded).
#[expect(
    clippy::cast_possible_truncation,
    clippy::cast_sign_loss,
    reason = "a small positive step count, rounded on purpose"
)]
pub fn steps_for(orbits: f64, dt: f64) -> u32 {
    (orbits * orbit_period() / dt).round() as u32
}

/// Runs `steps` steps of `dt`, returning the relative energy error
/// `(E - E0) / |E0|` after each step and the separation's (min, max).
pub fn energy_errors<S: Scalar>(w: &mut World<S>, dt: f64, steps: u32) -> (Vec<f64>, (f64, f64)) {
    let e0 = orbit_energy(w);
    let (mut lo, mut hi) = (f64::INFINITY, 0.0_f64);
    let errors = (0..steps)
        .map(|_| {
            w.step(S::from_f64(dt));
            let d = separation(w);
            lo = lo.min(d);
            hi = hi.max(d);
            (orbit_energy(w) - e0) / e0.abs()
        })
        .collect();
    (errors, (lo, hi))
}

/// Largest |value| in a slice (the error envelope).
pub fn envelope(errors: &[f64]) -> f64 {
    errors.iter().fold(0.0, |m, e| m.max(e.abs()))
}

/// FNV-1a, 64-bit: a tiny hash with published constants and fixed output,
/// unlike `std`'s `DefaultHasher`, which may change between Rust versions.
/// Golden hashes need output that never changes. Not for adversarial
/// input (it isn't collision-resistant); fine for change detection.
pub struct Fnv1a(u64);

impl Fnv1a {
    /// The FNV-1a 64-bit offset basis (Fowler, Noll, Vo; IETF draft
    /// "The FNV Non-Cryptographic Hash Algorithm").
    const OFFSET_BASIS: u64 = 0xcbf2_9ce4_8422_2325;
    /// The FNV 64-bit prime, 2⁴⁰ + 2⁸ + 0xb3.
    const PRIME: u64 = 0x0000_0100_0000_01b3;

    pub const fn new() -> Self {
        Self(Self::OFFSET_BASIS)
    }

    pub fn write(&mut self, bytes: &[u8]) {
        for &b in bytes {
            self.0 = (self.0 ^ u64::from(b)).wrapping_mul(Self::PRIME);
        }
    }

    pub const fn finish(&self) -> u64 {
        self.0
    }
}

/// Hash of the full particle state: every position, velocity, and inverse
/// mass, as the little-endian bits of `to_f64()`. That conversion is exact
/// for f32, so every distinct f32 value (including -0.0 vs 0.0) hashes
/// differently.
pub fn state_hash<S: Scalar>(p: &Particles<S>) -> u64 {
    let mut h = Fnv1a::new();
    let mut put = |x: S| h.write(&x.to_f64().to_bits().to_le_bytes());
    for ((x, v), &w) in p.pos().iter().zip(p.vel()).zip(p.inv_mass()) {
        put(x.x);
        put(x.y);
        put(v.x);
        put(v.y);
        put(w);
    }
    h.finish()
}
