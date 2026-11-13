//! What every `*-web` crate (engine, acoustic, sand, swarm)
//! shares around its simulation, and nothing about any simulation: the
//! common part of the wasm shell (`docs/03-wasm-shell.md`). Scope is kept
//! to that; anything simulation-specific belongs in its own `*-web` crate.
//!
//! - [`install_panic_hook`]: a Rust panic's message to the browser console
//!   (the `env.console_error` import).
//! - [`FixedStep`]: frame times to a whole number of fixed physics steps,
//!   with the step budget's cap.
//! - [`boundary`]: parsing helpers for values crossing the C ABI.
//!
//! No simulation crate depends on this one.

pub mod boundary;
mod fixed_step;
// Only wasm builds contain unsafe here (the import call), so the
// expectation is wasm-only too; natively it would go unfulfilled.
#[cfg_attr(
    target_arch = "wasm32",
    expect(
        unsafe_code,
        reason = "calling a JS import with a pointer into wasm memory"
    )
)]
mod panic_hook;

pub use fixed_step::{FixedStep, MAX_FRAME_TIME};
pub use panic_hook::install_panic_hook;
