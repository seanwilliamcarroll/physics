use super::{Case, mean_point_estimate, parse_cases};

/// Shape of criterion's `estimates.json` (abridged from a real file):
/// "mean" comes first, but other objects also have a "point_estimate".
const ESTIMATES: &str = r#"{"mean":{"confidence_interval":{"confidence_level":0.95,"lower_bound":984939.1,"upper_bound":993031.8},"point_estimate":988853.2,"standard_error":2063.4},"median":{"confidence_interval":{"confidence_level":0.95,"lower_bound":1.0,"upper_bound":2.0},"point_estimate":987000.0,"standard_error":1.0}}"#;

#[test]
fn reads_the_mean_not_another_point_estimate() {
    assert_eq!(mean_point_estimate(ESTIMATES), Some(988_853.2));
}

#[test]
fn malformed_estimates_give_none() {
    assert_eq!(mean_point_estimate("{}"), None);
    assert_eq!(
        mean_point_estimate(r#"{"mean":{"point_estimate":"x"}}"#),
        None
    );
}

#[test]
fn parses_the_node_scripts_lines() {
    let out = "step_f32_symplectic 16 316.1\nstep_f64_verlet 1024 2306635.5\n";
    assert_eq!(
        parse_cases(out),
        Ok(vec![
            Case {
                group: "step_f32_symplectic".to_owned(),
                n: 16,
                wasm_ns: 316.1
            },
            Case {
                group: "step_f64_verlet".to_owned(),
                n: 1024,
                wasm_ns: 2_306_635.5
            },
        ])
    );
    assert!(parse_cases("step_f32 x 1.0").is_err());
}

#[test]
fn durations_change_unit_at_a_thousand_and_a_million_nanoseconds() {
    use super::format_ns;
    assert_eq!(format_ns(999.0), "999 ns");
    assert_eq!(format_ns(1e3), "1.0 µs");
    assert_eq!(format_ns(316_100.0), "316.1 µs");
    assert_eq!(format_ns(1e6), "1.00 ms");
    assert_eq!(format_ns(2_306_635.5), "2.31 ms");
}
