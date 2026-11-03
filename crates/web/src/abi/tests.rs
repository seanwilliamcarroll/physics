use super::{
    COORDS_PER_PARTICLE, DEFAULT_RATE_HZ, DEMO_FOUNTAIN, DEMO_ORBIT, INTEGRATOR_EXPLICIT_EULER,
    INTEGRATOR_SYMPLECTIC_EULER, INTEGRATOR_VELOCITY_VERLET, SCALAR_F32, SCALAR_F64,
    TEST_PANIC_MESSAGE,
};

const ABI_JS: &str = include_str!("../../../../site/js/abi.ts");

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
        ("DEFAULT_RATE_HZ", u64::from(DEFAULT_RATE_HZ)),
    ];
    for (name, value) in expected {
        let line = format!("export const {name} = {value};");
        assert!(ABI_JS.contains(&line), "site/js/abi.ts is missing `{line}`");
    }
    // Strings: Rust's Debug quoting matches a plain JS double-quoted literal.
    let line = format!("export const TEST_PANIC_MESSAGE = {TEST_PANIC_MESSAGE:?};");
    assert!(ABI_JS.contains(&line), "site/js/abi.ts is missing `{line}`");
}
