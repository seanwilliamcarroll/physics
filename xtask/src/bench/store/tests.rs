use std::collections::BTreeMap;

use super::{
    Record, compare, criterion_version, from_rows, merge, meta, meta_value, parse, render, rows,
};
use crate::bench::table::{Row, Throughput};

fn row(id: &str, mean_ns: f64) -> Row {
    Row {
        id: id.to_owned(),
        mean_ns,
        spread: 0.01,
        throughput: None,
        change: None,
    }
}

fn record(entries: &[(&str, f64)]) -> Record {
    from_rows(
        &entries
            .iter()
            .map(|&(id, m)| row(id, m))
            .collect::<Vec<_>>(),
    )
}

#[test]
fn a_record_round_trips_through_its_text() {
    let mut rows = vec![
        row("pairwise_f64/1024", 523_510.5),
        row("sand_step/busy", 1_515_489.0),
        row("fft/4096", 20_000.0),
    ];
    rows[1].throughput = Some(Throughput::Elements(230_400.0));
    rows[2].throughput = Some(Throughput::Bytes(65_536.0));
    rows[0].change = Some(0.2);
    assert_eq!(
        from_rows(&rows)["pairwise_f64/1024"].change,
        None,
        "a record keeps no changes"
    );
    let m = meta(
        "rustc 1.99.1",
        "0.8.2",
        "abc1234",
        "2026-11-15",
        "baseline",
        "",
    );
    let text = render(&from_rows(&rows), &m);
    assert!(
        text.starts_with("# rustc=rustc 1.99.1\n# criterion=0.8.2\n"),
        "{text}"
    );
    assert!(
        text.contains("id\tmean_ns\tci_half_ns\tthroughput\n"),
        "{text}"
    );
    assert!(
        text.contains("sand_step/busy\t1515489\t15154.89\telements:230400\n"),
        "{text}"
    );
    let (back, back_meta) = parse(&text);
    assert_eq!(back_meta, m);
    assert_eq!(back.len(), 3);
    let busy = &back["sand_step/busy"];
    assert_eq!(busy.throughput, Some(Throughput::Elements(230_400.0)));
    assert_eq!(
        back["fft/4096"].throughput,
        Some(Throughput::Bytes(65_536.0))
    );
    assert!((busy.spread - 0.01).abs() < 1e-12);
    assert_eq!(
        back["pairwise_f64/1024"].change, None,
        "changes aren't recorded"
    );
}

#[test]
fn unreadable_lines_are_skipped() {
    let (r, _) =
        parse("id\tmean_ns\tci_half_ns\tthroughput\nok\t10\t1\t\nbad\tx\t1\t\nshort\t10\n");
    assert_eq!(r.keys().collect::<Vec<_>>(), ["ok"]);
}

#[test]
fn a_change_is_the_mean_against_the_recorded_mean() {
    let rec = record(&[("a", 100.0), ("b", 200.0)]);
    let mut now = vec![row("a", 110.0), row("b", 150.0), row("new", 5.0)];
    compare(&mut now, &rec);
    let got: Vec<Option<f64>> = now.iter().map(|r| r.change).collect();
    assert_eq!(got.len(), 3);
    assert!((got[0].unwrap() - 0.10).abs() < 1e-12);
    assert!((got[1].unwrap() + 0.25).abs() < 1e-12);
    assert_eq!(got[2], None, "not in the record");
}

#[test]
fn a_full_run_replaces_the_record_and_a_filtered_one_updates_it() {
    let old = record(&[("a", 1.0), ("b", 2.0)]);
    let new = record(&[("b", 3.0), ("c", 4.0)]);
    let full = merge(&old, &new, true);
    assert_eq!(full.keys().collect::<Vec<_>>(), ["b", "c"]);
    let filtered = merge(&old, &new, false);
    assert_eq!(filtered.keys().collect::<Vec<_>>(), ["a", "b", "c"]);
    assert_eq!(filtered["b"].mean_ns, 3.0, "b is this run's");
    assert_eq!(filtered["a"].mean_ns, 1.0, "a is kept");
}

#[test]
fn rows_come_from_the_record_with_this_run_s_changes() {
    let rec = record(&[("a", 100.0), ("b", 200.0)]);
    let changes = BTreeMap::from([("b".to_owned(), 0.05)]);
    let r = rows(&rec, &changes);
    assert_eq!((r[0].id.as_str(), r[0].change), ("a", None));
    assert_eq!((r[1].id.as_str(), r[1].change), ("b", Some(0.05)));
}

#[test]
fn meta_round_trips_and_criterion_s_version_is_read_from_the_lock() {
    let m = meta(
        "rustc 1.99.1",
        "0.8.2",
        "abc1234",
        "2026-11-13",
        "native",
        "-C target-cpu=native",
    );
    assert_eq!(meta_value(&m, "rustc"), Some("rustc 1.99.1"));
    assert_eq!(meta_value(&m, "criterion"), Some("0.8.2"));
    assert_eq!(meta_value(&m, "level"), Some("native"));
    assert_eq!(meta_value(&m, "rustflags"), Some("-C target-cpu=native"));
    assert_eq!(meta_value(&m, "nope"), None);
    let lock = "[[package]]\nname = \"criterion\"\nversion = \"0.8.2\"\nsource = \"x\"\n";
    assert_eq!(criterion_version(lock), Some("0.8.2"));
}

/// Every committed record (`docs/bench/*.tsv`) parses whole: as many
/// benchmarks as data lines, so no hand edit or format slip drops any.
#[test]
fn every_committed_record_parses_completely() {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../docs/bench");
    let mut seen = 0;
    for entry in std::fs::read_dir(&dir).unwrap().flatten() {
        let path = entry.path();
        if path.extension().is_none_or(|e| e != "tsv") {
            continue;
        }
        let text = std::fs::read_to_string(&path).unwrap();
        let data_lines = text
            .lines()
            .filter(|l| !l.starts_with('#') && !l.starts_with("id\t"))
            .count();
        let (record, meta) = parse(&text);
        assert_eq!(record.len(), data_lines, "{}", path.display());
        assert!(meta_value(&meta, "rustc").is_some(), "{}", path.display());
        seen += 1;
    }
    assert!(seen > 0, "no records in {}", dir.display());
}
