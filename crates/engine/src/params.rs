//! Checked physical parameters: each value is validated once, where it
//! enters (a scene constant, a slider at the wasm boundary), and trusted
//! afterwards (`docs/type-invariants.md`, "parse, don't validate").
//!
//! One file per type, re-exported here. Every interval type shares
//! [`checked_param!`]; `Mass` is written out because it also stores its
//! inverse.

/// A checked scalar newtype: `new(v) -> Option<Self>`, `None` unless the
/// value is finite *and* passes the type's own check (`valid`); `get`;
/// and `cast` to another scalar type, which checks again.
///
/// **Finite always.** NaN fails every comparison, so every check rejects
/// it, but `±∞` passes an open-ended one (`α ≥ 0`): an infinite compliance
/// made XPBD compute `∞ · 0 = NaN` (audit, after A3). The finiteness test
/// reads through [`Scalar::to_f64`](crate::Scalar::to_f64), lossless for
/// `f32` and `f64`; a fixed-point scalar has no infinities, so it passes
/// there trivially.
///
/// **`cast` re-checks.** Narrowing can leave the type: a valid `1e300`
/// (`f64`) is `+∞` in `f32`. Only a range bounded by exactly representable
/// ends (`[0, 1]`) survives rounding, and re-checking costs one comparison
/// at a boundary, never in a hot loop.
macro_rules! checked_param {
    ($(#[$meta:meta])* $name:ident, |$v:ident| $valid:expr) => {
        $(#[$meta])*
        #[derive(Copy, Clone, Debug, PartialEq)]
        pub struct $name<S>(S);

        impl<S: crate::Scalar> $name<S> {
            /// `Some` if the value is finite and passes this type's check
            /// (see the type).
            #[must_use]
            pub fn new($v: S) -> Option<Self> {
                ($v.to_f64().is_finite() && $valid).then_some(Self($v))
            }

            /// The value.
            #[must_use]
            pub const fn get(self) -> S {
                self.0
            }

            /// The same value in another scalar type, checked again: `None`
            /// if it leaves the type there (overflows to `±∞`, or rounds out
            /// of range). Lets a boundary parse once in `f64` and hand the
            /// result to an engine in any `S`.
            #[must_use]
            pub fn cast<T: crate::Scalar>(self) -> Option<$name<T>> {
                $name::new(T::from_f64(self.0.to_f64()))
            }
        }
    };
}

mod baumgarte;
mod compliance;
mod damping;
mod mass;
mod opening_angle;
mod radius;
mod restitution;
mod softening;
mod stiffness;

pub use baumgarte::{Baumgarte, DEFAULT_BAUMGARTE};
pub use compliance::Compliance;
pub use damping::Damping;
pub use mass::Mass;
#[cfg(test)]
pub(crate) use mass::kg;
pub use opening_angle::OpeningAngle;
pub use radius::Radius;
pub use restitution::Restitution;
pub use softening::Softening;
pub use stiffness::Stiffness;
