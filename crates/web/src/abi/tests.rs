use super::{
    COORDS_PER_PARTICLE, DEFAULT_RATE_HZ, DEMO_CLUSTER, DEMO_COLLAPSE, DEMO_DISK, DEMO_FOUNTAIN,
    DEMO_ORBIT, DEMO_PENDULUM, INTEGRATOR_EXPLICIT_EULER, INTEGRATOR_SYMPLECTIC_EULER,
    INTEGRATOR_VELOCITY_VERLET, JELLY_IMPULSE, JELLY_SPRINGS, JELLY_XPBD, MAX_BOX_BALLS,
    MAX_BREAK_GAP, MAX_CHAIN_LINKS, MAX_CRADLE_BALLS, MAX_GRAVITY_BODIES, MAX_ITERATIONS,
    MAX_JELLY_SIDE, MAX_PARTICLES, MAX_RATE_HZ, MAX_SUBSTEPS, ORDER_ALTERNATING, ORDER_FORWARD,
    ORDER_REVERSE, SCALAR_F32, SCALAR_F64, SOLVER_IMPULSE, SOLVER_XPBD, STABILIZATION_BAUMGARTE,
    STABILIZATION_SPLIT, START_HORIZONTAL, START_RAISED, TEST_PANIC_MESSAGE,
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
            "STABILIZATION_BAUMGARTE",
            u64::from(STABILIZATION_BAUMGARTE),
        ),
        ("STABILIZATION_SPLIT", u64::from(STABILIZATION_SPLIT)),
        ("JELLY_SPRINGS", u64::from(JELLY_SPRINGS)),
        ("JELLY_XPBD", u64::from(JELLY_XPBD)),
        ("JELLY_IMPULSE", u64::from(JELLY_IMPULSE)),
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
        ("MAX_PARTICLES", u64::from(MAX_PARTICLES)),
        ("MAX_GRAVITY_BODIES", u64::from(MAX_GRAVITY_BODIES)),
        ("MAX_CHAIN_LINKS", u64::from(MAX_CHAIN_LINKS)),
        ("MAX_JELLY_SIDE", u64::from(MAX_JELLY_SIDE)),
        ("MAX_BOX_BALLS", u64::from(MAX_BOX_BALLS)),
        ("MAX_CRADLE_BALLS", u64::from(MAX_CRADLE_BALLS)),
        ("MAX_SUBSTEPS", u64::from(MAX_SUBSTEPS)),
        ("MAX_ITERATIONS", u64::from(MAX_ITERATIONS)),
        ("MAX_RATE_HZ", u64::from(MAX_RATE_HZ)),
    ];
    for (name, value) in expected {
        let line = format!("export const {name} = {value};");
        assert!(ABI_JS.contains(&line), "site/js/abi.ts is missing `{line}`");
    }
    // Floats: Rust's Debug prints the shortest round-trip form, as JS does.
    let line = format!("export const MAX_BREAK_GAP = {MAX_BREAK_GAP:?};");
    assert!(ABI_JS.contains(&line), "site/js/abi.ts is missing `{line}`");
    // Strings: Rust's Debug quoting matches a plain JS double-quoted literal.
    let line = format!("export const TEST_PANIC_MESSAGE = {TEST_PANIC_MESSAGE:?};");
    assert!(ABI_JS.contains(&line), "site/js/abi.ts is missing `{line}`");
}

#[test]
fn box_cap_is_the_scenes_slots() {
    assert_eq!(
        usize::try_from(MAX_BOX_BALLS).ok(),
        Some(engine::scenarios::BOX_MAX_BALLS)
    );
}
