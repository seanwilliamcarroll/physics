//! Generated: the hammers' smooth fit (`fit.rs`), at
//! [`FITTED_AT`](super::FITTED_AT): cubics in the key coordinate
//! `t = (midi − 64.5) / 43.5`, constant term first, for `ln M` (kg) and
//! `ln K` (N/mᵖ). To regenerate, run
//! `cargo test --release -p acoustic --lib regenerate_the_table -- --ignored --nocapture`
//! and paste its output here.
#![expect(
    clippy::unreadable_literal,
    reason = "generated, pasted as printed (round-trip exact)"
)]

/// The keyboard's ends, MIDI (A0, C8).
pub(super) const FIRST: u8 = 21;
pub(super) const LAST: u8 = 108;

pub(super) const MASS: [f64; 4] = [
    -6.211296210600148,
    0.1504663738692845,
    1.3198071958137154,
    -0.8597360357127521,
];
pub(super) const STIFFNESS: [f64; 4] = [
    23.100850260529146,
    4.101046874682732,
    1.0315642307036146,
    1.6244463096195039,
];
