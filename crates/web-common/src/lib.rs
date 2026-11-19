//! What every `*-web` crate shares around its simulation (`docs/03-wasm-shell.md`),
//! and nothing simulation-specific.

pub mod boundary;
mod fixed_step;
// Wasm-only: natively there is no unsafe, and the expectation would go unfulfilled.
#[cfg_attr(
    target_arch = "wasm32",
    expect(
        unsafe_code,
        reason = "calling a JS import with a pointer into wasm memory"
    )
)]
mod panic_hook;

pub use fixed_step::FixedStep;
pub use panic_hook::install_panic_hook;
