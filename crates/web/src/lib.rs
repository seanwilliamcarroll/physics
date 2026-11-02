//! Wasm shell: raw `extern "C"` exports over the engine, plus the demo glue
//! behind them. Logic lives in plain Rust modules that are tested natively.
//! Design: `docs/03-wasm-shell.md`.

// Temporary: unused until the exports land. `expect` (not `allow`) makes
// clippy fail once the code is used, forcing this attribute's removal.
#[cfg_attr(
    not(test),
    expect(
        dead_code,
        reason = "scaffolding: used by the exports, added later in this PR"
    )
)]
mod fixed_step;
