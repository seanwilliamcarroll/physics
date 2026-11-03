//! Test-only helpers shared by this crate's unit tests.

use crate::Scalar;

/// Runs a generic test body `fn name<S: Scalar>()` once per scalar type.
///
/// Expands to a module named after the test with one `#[test]` per scalar,
/// so failures read as `name::f32` / `name::f64`.
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

/// Shorthand for `S::from_f64(v)` in tests.
pub(crate) fn s<S: Scalar>(v: f64) -> S {
    S::from_f64(v)
}
