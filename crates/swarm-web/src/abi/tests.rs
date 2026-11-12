use super::{
    DEFAULT_RATE_HZ, MAX_BOIDS, MAX_BRUTE, MAX_RATE_HZ, MAX_SCALE, MAX_SIDE, NEIGHBOURS_BRUTE,
    NEIGHBOURS_GRID, NEIGHBOURS_SORTED, PARAM_AVOID, PARAM_CENTERING, PARAM_COUNT, PARAM_MARGIN,
    PARAM_MATCHING, PARAM_MAX_SPEED, PARAM_MIN_SPEED, PARAM_PROTECTED_RANGE, PARAM_TURN,
    PARAM_VISUAL_RANGE,
};

const ABI_JS: &str = include_str!("../../../../site/js/swarm-abi.ts");

#[test]
fn js_mirror_matches() {
    for (name, value) in [
        ("NEIGHBOURS_BRUTE", NEIGHBOURS_BRUTE),
        ("NEIGHBOURS_GRID", NEIGHBOURS_GRID),
        ("NEIGHBOURS_SORTED", NEIGHBOURS_SORTED),
        ("PARAM_VISUAL_RANGE", PARAM_VISUAL_RANGE),
        ("PARAM_PROTECTED_RANGE", PARAM_PROTECTED_RANGE),
        ("PARAM_CENTERING", PARAM_CENTERING),
        ("PARAM_AVOID", PARAM_AVOID),
        ("PARAM_MATCHING", PARAM_MATCHING),
        ("PARAM_TURN", PARAM_TURN),
        ("PARAM_MARGIN", PARAM_MARGIN),
        ("PARAM_MIN_SPEED", PARAM_MIN_SPEED),
        ("PARAM_MAX_SPEED", PARAM_MAX_SPEED),
        ("PARAM_COUNT", PARAM_COUNT),
        ("MAX_BOIDS", MAX_BOIDS),
        ("MAX_BRUTE", MAX_BRUTE),
        ("MAX_SIDE", MAX_SIDE),
        ("MAX_SCALE", MAX_SCALE),
        ("MAX_VICSEK_SIDE", super::MAX_VICSEK_SIDE),
        ("MAX_VIEW", super::MAX_VIEW),
        ("MAX_PARTICLES", super::MAX_PARTICLES),
        ("MAX_RUN", super::MAX_RUN),
        ("TOOL_FOOD", super::TOOL_FOOD),
        ("TOOL_WALL", super::TOOL_WALL),
        ("TOOL_ERASE", super::TOOL_ERASE),
        ("TOOL_NEST", super::TOOL_NEST),
        ("ANT_SENSOR_ANGLE", super::ANT_SENSOR_ANGLE),
        ("ANT_SENSOR_DISTANCE", super::ANT_SENSOR_DISTANCE),
        ("ANT_TURN", super::ANT_TURN),
        ("ANT_WIGGLE", super::ANT_WIGGLE),
        ("ANT_SPEED", super::ANT_SPEED),
        ("ANT_DEPOSIT", super::ANT_DEPOSIT),
        ("ANT_FALLOFF", super::ANT_FALLOFF),
        ("ANT_DIFFUSION", super::ANT_DIFFUSION),
        ("ANT_DECAY", super::ANT_DECAY),
        ("ANT_PARAM_COUNT", super::ANT_PARAM_COUNT),
        ("MAX_ANT_SIDE", super::MAX_ANT_SIDE),
        ("MAX_ANTS", super::MAX_ANTS),
        ("MAX_ANT_BRUSH", super::MAX_ANT_BRUSH),
        ("MAX_FOOD", super::MAX_FOOD),
        ("DEFAULT_RATE_HZ", DEFAULT_RATE_HZ),
        ("MAX_RATE_HZ", MAX_RATE_HZ),
    ] {
        let line = format!("export const {name} = {value};");
        assert!(
            ABI_JS.contains(&line),
            "site/js/swarm-abi.ts is missing `{line}`"
        );
    }
}

#[test]
fn the_caps_are_the_crates() {
    assert_eq!(usize::try_from(MAX_BOIDS).unwrap(), swarm::MAX_BOIDS);
    assert_eq!(usize::try_from(super::MAX_ANTS).unwrap(), swarm::MAX_ANTS);
    assert_eq!(
        usize::try_from(super::MAX_PARTICLES).unwrap(),
        swarm::MAX_PARTICLES
    );
    const { assert!(MAX_BRUTE < MAX_BOIDS) };
}
