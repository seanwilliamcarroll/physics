//! Wasm shell: raw `extern "C"` exports over the engine, plus the demo glue
//! behind them. Logic lives in plain Rust modules that are tested natively.
//! Design: `docs/03-wasm-shell.md`.

mod abi;
mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
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
mod imports;
