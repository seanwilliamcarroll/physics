//! What a web page could pass an export: the strategy every web crate's
//! export-sequence tests draw their `f64` arguments from.

use core::ops::Range;

use proptest::prelude::{Just, Strategy, any, prop_oneof};

/// Any `f64` a page could pass an export, weighted toward the edges: NaN,
/// the infinities, the zeros, the largest and smallest magnitudes, any
/// bit pattern at all, a wide ordinary range, and `usual` (the values the
/// page really sends, so a sequence still does something).
pub fn hostile_f64(usual: Range<f64>) -> impl Strategy<Value = f64> {
    prop_oneof![
        1 => Just(f64::NAN),
        1 => Just(f64::INFINITY),
        1 => Just(f64::NEG_INFINITY),
        1 => Just(0.0),
        1 => Just(-0.0),
        1 => Just(-1.0),
        1 => Just(f64::MAX),
        1 => Just(f64::MIN),
        1 => Just(f64::MIN_POSITIVE),
        1 => Just(1e300),
        1 => Just(-1e-300),
        1 => -1e6..1e6,
        1 => any::<f64>(),
        4 => usual,
    ]
}
