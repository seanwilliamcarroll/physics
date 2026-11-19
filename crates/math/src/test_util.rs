//! Test-only helpers shared by this crate's unit tests.

use crate::Scalar;

/// Runs a generic test body `fn name<S: Scalar>()` once per scalar type, as
/// `name::f32` / `name::f64`.
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

pub(crate) fn s<S: Scalar>(value: f64) -> S {
    S::from_f64(value)
}
