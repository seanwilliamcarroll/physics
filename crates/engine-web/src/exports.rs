//! The C-ABI surface JS calls. Each export is a thin adapter over [`Demo`];
//! all `unsafe` in this crate lives in this module.
//!
//! Handles are opaque `*mut Demo` from `Box::into_raw`, so several demos can
//! coexist on one page. Wasm is single-threaded and JS never holds a Rust
//! reference, so a live handle is never aliased during a call.
//!
//! The contract every export taking a handle relies on (`// SAFETY: per the
//! contract`): `demo` is null, which is refused, or a live handle from a
//! `demo_new*` export that hasn't been freed.
//!
//! The exports are `pub(crate)`: `#[no_mangle]` in a `cdylib`, not Rust
//! visibility, puts a function in the `.wasm`'s export table.

mod collisions;
mod drag;
mod lifecycle;
mod pool;
mod readouts;
mod settings;

#[cfg(test)]
mod tests;
