//! Wasm shell: raw `extern "C"` exports over the engine, plus the demo glue
//! behind them. Logic lives in plain Rust modules that are tested natively.
//! Design: `docs/03-wasm-shell.md`.

mod demo;
#[expect(unsafe_code, reason = "the C ABI boundary: raw pointers in and out")]
mod exports;
mod fixed_step;
