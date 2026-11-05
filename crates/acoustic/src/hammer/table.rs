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
    -6.207273017055323,
    0.13301962176753201,
    1.2930899700705598,
    -0.8166498481672584,
];
pub(super) const STIFFNESS: [f64; 4] = [
    23.11301126056475,
    4.049922644482891,
    0.9574478190499022,
    1.7355949890281435,
];
