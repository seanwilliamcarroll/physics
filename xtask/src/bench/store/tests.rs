use std::collections::BTreeMap;
use std::fs;

use super::{Files, benchmark_of, criterion_version, ids, load, merge, meta, meta_value, rows};

fn benchmark(id: &str) -> String {
    format!(r#"{{"full_id":"{id}","directory_name":"{id}","throughput":null}}"#)
}

fn estimates(mean: f64) -> String {
    format!(
        r#"{{"mean":{{"confidence_interval":{{"lower_bound":{},"upper_bound":{}}},"point_estimate":{mean}}}}}"#,
        mean * 0.99,
        mean * 1.01
    )
}

/// A record with benchmarks `ids`, each with all four files.
fn record(entries: &[(&str, f64)]) -> Files {
    let mut out = Files::new();
    for &(id, mean) in entries {
        out.insert(format!("{id}/benchmark.json"), benchmark(id));
        out.insert(format!("{id}/estimates.json"), estimates(mean));
        out.insert(format!("{id}/sample.json"), "{}".to_owned());
        out.insert(format!("{id}/tukey.json"), "[]".to_owned());
    }
    out
}

#[test]
fn only_criterion_s_four_files_belong_to_a_benchmark() {
    assert_eq!(
        benchmark_of("sand_step/busy/a/sample.json"),
        Some("sand_step/busy/a")
    );
    assert_eq!(benchmark_of("record.txt"), None);
    assert_eq!(benchmark_of("sand_step/report/index.html"), None);
}

#[test]
fn a_full_run_replaces_the_record_and_a_filtered_one_updates_it() {
    let old = record(&[("a", 1.0), ("b", 2.0)]);
    let new = record(&[("b", 3.0), ("c", 4.0)]);
    let full = merge(&old, &new, true);
    assert_eq!(ids(&full), ["b", "c"].map(str::to_owned).into());
    let filtered = merge(&old, &new, false);
    assert_eq!(ids(&filtered), ["a", "b", "c"].map(str::to_owned).into());
    assert_eq!(
        filtered["b/estimates.json"],
        estimates(3.0),
        "b is this run's"
    );
    assert_eq!(filtered["a/estimates.json"], estimates(1.0), "a is kept");
}

#[test]
fn rows_come_from_the_files_with_this_run_s_changes() {
    let files = record(&[("a", 100.0), ("b", 200.0)]);
    let changes = BTreeMap::from([("b".to_owned(), 0.05)]);
    let r = rows(&files, &changes);
    assert_eq!(r.len(), 2);
    assert_eq!(
        (r[0].id.as_str(), r[0].mean_ns, r[0].change),
        ("a", 100.0, None)
    );
    assert_eq!((r[1].id.as_str(), r[1].change), ("b", Some(0.05)));
}

#[test]
fn loading_puts_the_record_where_criterion_looks_and_clears_old_loads() {
    let root = std::env::temp_dir().join(format!("xtask-store-test-{}", std::process::id()));
    let _ = fs::remove_dir_all(&root);
    let (dir, criterion) = (root.join("record"), root.join("criterion"));
    for (k, v) in record(&[("g/a", 1.0)]) {
        let path = dir.join(&k);
        fs::create_dir_all(path.parent().unwrap()).unwrap();
        fs::write(path, v).unwrap();
    }
    fs::write(dir.join("record.txt"), "rustc=x\n").unwrap();
    // A benchmark loaded earlier but no longer in the record.
    fs::create_dir_all(criterion.join("old/recorded")).unwrap();
    fs::write(criterion.join("old/recorded/estimates.json"), "{}").unwrap();
    assert_eq!(load(&dir, &criterion), Ok(1));
    for f in super::FILES {
        assert!(criterion.join("g/a/recorded").join(f).is_file(), "{f}");
    }
    assert!(
        !criterion.join("old/recorded").exists(),
        "the stale load is gone"
    );
    fs::remove_dir_all(&root).unwrap();
}

#[test]
fn meta_round_trips_and_criterion_s_version_is_read_from_the_lock() {
    let m = meta("rustc 1.99.1", "0.8.2", "abc1234", "2026-11-13");
    assert_eq!(meta_value(&m, "rustc"), Some("rustc 1.99.1"));
    assert_eq!(meta_value(&m, "criterion"), Some("0.8.2"));
    assert_eq!(meta_value(&m, "nope"), None);
    let lock = "[[package]]\nname = \"criterion\"\nversion = \"0.8.2\"\nsource = \"x\"\n";
    assert_eq!(criterion_version(lock), Some("0.8.2"));
}
