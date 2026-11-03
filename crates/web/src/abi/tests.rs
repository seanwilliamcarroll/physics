use super::{
    COORDS_PER_PARTICLE, DEFAULT_RATE_HZ, DEMO_CLUSTER, DEMO_COLLAPSE, DEMO_DISK, DEMO_FOUNTAIN,
    DEMO_ORBIT, DEMO_PENDULUM, INTEGRATOR_EXPLICIT_EULER, INTEGRATOR_SYMPLECTIC_EULER,
    INTEGRATOR_VELOCITY_VERLET, ORDER_ALTERNATING, ORDER_FORWARD, ORDER_REVERSE, SCALAR_F32,
    SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD, START_HORIZONTAL, START_RAISED, TEST_PANIC_MESSAGE,
};

const ABI_JS: &str = include_str!("../../../../site/js/abi.ts");

#[test]
fn js_mirror_matches() {
    let expected = [
        ("DEMO_FOUNTAIN", u64::from(DEMO_FOUNTAIN)),
        ("DEMO_ORBIT", u64::from(DEMO_ORBIT)),
        ("DEMO_CLUSTER", u64::from(DEMO_CLUSTER)),
        ("DEMO_DISK", u64::from(DEMO_DISK)),
        ("DEMO_COLLAPSE", u64::from(DEMO_COLLAPSE)),
        ("DEMO_PENDULUM", u64::from(DEMO_PENDULUM)),
        ("SOLVER_XPBD", u64::from(SOLVER_XPBD)),
        ("SOLVER_IMPULSE", u64::from(SOLVER_IMPULSE)),
        ("ORDER_FORWARD", u64::from(ORDER_FORWARD)),
        ("ORDER_REVERSE", u64::from(ORDER_REVERSE)),
        ("ORDER_ALTERNATING", u64::from(ORDER_ALTERNATING)),
        ("START_HORIZONTAL", u64::from(START_HORIZONTAL)),
        ("START_RAISED", u64::from(START_RAISED)),
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
