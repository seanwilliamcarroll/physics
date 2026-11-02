//! The contract with JS: integer codes for `demo_new` (only numbers cross
//! the wasm boundary) and the positions buffer layout.
//!
//! Mirrored in `site/js/abi.js`. The test below reads that file and fails
//! if any value disagrees, so the two copies can't silently drift.

/// `demo_new` kind code: the M0 fountain.
pub const DEMO_FOUNTAIN: u32 = 0;

/// `demo_new` scalar codes.
pub const SCALAR_F32: u32 = 0;
pub const SCALAR_F64: u32 = 1;

/// Floats per particle in the positions buffer: `[x, y]`.
pub const COORDS_PER_PARTICLE: usize = 2;

#[cfg(test)]
mod tests {
    use super::{COORDS_PER_PARTICLE, DEMO_FOUNTAIN, SCALAR_F32, SCALAR_F64};

    const ABI_JS: &str = include_str!("../../../site/js/abi.js");

    #[test]
    fn js_mirror_matches() {
        let expected = [
            ("DEMO_FOUNTAIN", u64::from(DEMO_FOUNTAIN)),
            ("SCALAR_F32", u64::from(SCALAR_F32)),
            ("SCALAR_F64", u64::from(SCALAR_F64)),
            ("COORDS_PER_PARTICLE", COORDS_PER_PARTICLE as u64),
        ];
        for (name, value) in expected {
            let line = format!("export const {name} = {value};");
            assert!(ABI_JS.contains(&line), "site/js/abi.js is missing `{line}`");
        }
    }
}
