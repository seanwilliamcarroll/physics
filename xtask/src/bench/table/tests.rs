use super::{Row, Throughput, format, rate, row};

/// Abridged from a real run (sand's busy step, 2026-11-13).
const BENCHMARK: &str = r#"{"group_id":"sand_step","function_id":"busy","value_str":"640x360_chunks","throughput":{"Elements":230400},"full_id":"sand_step/busy/640x360_chunks","directory_name":"sand_step/busy/640x360_chunks","title":"sand_step/busy/640x360_chunks"}"#;
const ESTIMATES: &str = r#"{"mean":{"confidence_interval":{"confidence_level":0.95,"lower_bound":1513517.0,"upper_bound":1517495.0},"point_estimate":1515489.0,"standard_error":1014.2},"median":{"confidence_interval":{"confidence_level":0.95,"lower_bound":1.0,"upper_bound":2.0},"point_estimate":1513878.25,"standard_error":847.1}}"#;

#[test]
fn a_row_reads_the_id_the_mean_its_interval_and_the_throughput() {
    let r = row(BENCHMARK, ESTIMATES, Some(-0.02)).unwrap();
    assert_eq!(r.id, "sand_step/busy/640x360_chunks");
    assert_eq!(
        r.mean_ns, 1_515_489.0,
        "the mean's estimate, not the median's"
    );
    assert!(
        (r.spread - 1989.0 / 1_515_489.0).abs() < 1e-12,
        "{}",
        r.spread
    );
    assert_eq!(r.throughput, Some(Throughput::Elements(230_400.0)));
    assert_eq!(r.change, Some(-0.02));
}

#[test]
fn no_throughput_or_bytes_are_read_too() {
    let none = BENCHMARK.replace(r#"{"Elements":230400}"#, "null");
    assert_eq!(row(&none, ESTIMATES, None).unwrap().throughput, None);
    let bytes = BENCHMARK.replace("Elements", "Bytes");
    assert_eq!(
        row(&bytes, ESTIMATES, None).unwrap().throughput,
        Some(Throughput::Bytes(230_400.0))
    );
    assert_eq!(row("{}", ESTIMATES, None), None, "no id");
}

#[test]
fn rates_take_an_si_prefix() {
    assert_eq!(rate(152_030_000.0, "elem"), "152.0 Melem/s");
    assert_eq!(rate(70.6e9, "elem"), "70.6 Gelem/s");
    assert_eq!(rate(999.0, "B"), "999.0 B/s");
    assert_eq!(rate(1000.0, "B"), "1.0 KB/s");
}

#[test]
fn the_table_has_a_line_per_benchmark_sorted_by_id() {
    let mut rows = vec![
        Row {
            id: "z/slow".to_owned(),
            mean_ns: 1_515_489.0,
            spread: 0.0013,
            throughput: Some(Throughput::Elements(230_400.0)),
            change: Some(0.125),
        },
        Row {
            id: "a/fast".to_owned(),
            mean_ns: 412.0,
            spread: 0.02,
            throughput: None,
            change: None,
        },
    ];
    let table = format(&mut rows);
    let lines: Vec<&str> = table.lines().collect();
    assert_eq!(lines.len(), 4, "{table}");
    assert!(lines[0].starts_with("Benchmark"));
    assert!(
        lines[2].starts_with("a/fast") && lines[2].contains("412 ns") && lines[2].contains("2.0%")
    );
    assert!(lines[3].starts_with("z/slow"), "{table}");
    for want in ["1.52 ms", "0.1%", "152.0 Melem/s", "+12.5%"] {
        assert!(lines[3].contains(want), "{want} in {}", lines[3]);
    }
}
