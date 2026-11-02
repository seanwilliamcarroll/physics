//! The contract with JS: integer codes for `demo_new` (only numbers cross
//! the wasm boundary) and the positions buffer layout.
//!
//! Mirrored in `site/js/abi.js`. The test below reads that file and fails
//! if any value disagrees, so the two copies can't silently drift.

/// `demo_new` kind codes: the M0 fountain, the M1 star–planet orbit.
pub const DEMO_FOUNTAIN: u32 = 0;
pub const DEMO_ORBIT: u32 = 1;

/// `demo_set_integrator` codes.
pub const INTEGRATOR_SYMPLECTIC_EULER: u32 = 0;
pub const INTEGRATOR_EXPLICIT_EULER: u32 = 1;
pub const INTEGRATOR_VELOCITY_VERLET: u32 = 2;

/// `demo_new` scalar codes.
pub const SCALAR_F32: u32 = 0;
pub const SCALAR_F64: u32 = 1;

/// Floats per particle in the positions buffer: `[x, y]`.
pub const COORDS_PER_PARTICLE: usize = 2;

/// What [`demo_panic_for_test`](crate::exports::demo_panic_for_test)
/// panics with. The smoke test checks that this text reached JS through the
/// panic hook.
pub const TEST_PANIC_MESSAGE: &str = "deliberate test panic";

#[cfg(test)]
mod tests {
    use super::{
        COORDS_PER_PARTICLE, DEMO_FOUNTAIN, DEMO_ORBIT, INTEGRATOR_EXPLICIT_EULER,
        INTEGRATOR_SYMPLECTIC_EULER, INTEGRATOR_VELOCITY_VERLET, SCALAR_F32, SCALAR_F64,
        TEST_PANIC_MESSAGE,
    };

    const ABI_JS: &str = include_str!("../../../site/js/abi.js");

    #[test]
    fn js_mirror_matches() {
        let expected = [
            ("DEMO_FOUNTAIN", u64::from(DEMO_FOUNTAIN)),
            ("DEMO_ORBIT", u64::from(DEMO_ORBIT)),
            (
                "INTEGRATOR_SYMPLECTIC_EULER",
                u64::from(INTEGRATOR_SYMPLECTIC_EULER),
            ),
            (
                "INTEGRATOR_EXPLICIT_EULER",
                u64::from(INTEGRATOR_EXPLICIT_EULER),
            ),
            (
                "INTEGRATOR_VELOCITY_VERLET",
                u64::from(INTEGRATOR_VELOCITY_VERLET),
            ),
            ("SCALAR_F32", u64::from(SCALAR_F32)),
            ("SCALAR_F64", u64::from(SCALAR_F64)),
            ("COORDS_PER_PARTICLE", COORDS_PER_PARTICLE as u64),
        ];
        for (name, value) in expected {
            let line = format!("export const {name} = {value};");
            assert!(ABI_JS.contains(&line), "site/js/abi.js is missing `{line}`");
        }
        // Strings: Rust's Debug quoting matches a plain JS double-quoted literal.
        let line = format!("export const TEST_PANIC_MESSAGE = {TEST_PANIC_MESSAGE:?};");
        assert!(ABI_JS.contains(&line), "site/js/abi.js is missing `{line}`");
    }
}
