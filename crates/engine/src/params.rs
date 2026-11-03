//! Checked physical parameters: each value is validated once, where it
//! enters (a scene constant, a slider at the wasm boundary), and trusted
//! afterwards (`docs/type-invariants.md`, "parse, don't validate").
//!
//! One file per type, re-exported here. The interval types share
//! [`checked_param!`]; `Mass` is written out because it also stores its
//! inverse.

/// A checked scalar newtype: `new(v) -> Option<Self>` (`None` unless
/// `valid`), `get`, and `cast` to another scalar type without
/// re-checking. `cast` is sound for every check used here: each is a
/// closed range whose bounds (0, 1) are exact in every scalar type, so
/// rounding a valid value can't leave it. NaN fails every comparison, so
/// every check rejects it.
macro_rules! checked_param {
    ($(#[$meta:meta])* $name:ident, |$v:ident| $valid:expr) => {
        $(#[$meta])*
        #[derive(Copy, Clone, Debug, PartialEq)]
        pub struct $name<S>(S);

        impl<S: crate::Scalar> $name<S> {
            /// `Some` if the value passes this type's check (see the type).
            #[must_use]
            pub fn new($v: S) -> Option<Self> {
                ($valid).then_some(Self($v))
            }

            /// The value.
            #[must_use]
            pub const fn get(self) -> S {
                self.0
            }

            /// The same value in another scalar type, not re-checked (see
            /// `checked_param!`): lets a boundary parse once in `f64` and
            /// hand the result to an engine in any `S`.
            #[must_use]
            pub fn cast<T: crate::Scalar>(self) -> $name<T> {
                $name(T::from_f64(self.0.to_f64()))
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
