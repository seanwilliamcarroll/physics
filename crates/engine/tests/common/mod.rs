//! Helpers shared by the integration tests.

use engine::{Scalar, Vec2};

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
}

// Measured (2026-11-02): free fall, 64 steps: max error 1.5e-6.
// Cluster, 1000 steps: momentum drift 8.4e-8 of Σm|v|; COM error 1.5e-6 m.
impl Tol for f32 {
    const POS_ABS: f64 = 1e-5;
    const MOMENTUM_REL: f64 = 1e-6;
    const COM_ABS: f64 = 2e-5;
}

// Measured (same runs): free fall 8.9e-16. Cluster: momentum drift
// 7.5e-16 of Σm|v| (rounding level: forces are equal and opposite by
// construction); COM error 1.6e-14 m.
impl Tol for f64 {
    const POS_ABS: f64 = 1e-14;
    const MOMENTUM_REL: f64 = 1e-14;
    const COM_ABS: f64 = 2e-13;
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
