use super::{Change, classify};

fn c(name: &str, change: f64) -> Change {
    Change {
        name: name.to_owned(),
        change,
    }
}

#[test]
fn changes_past_the_threshold_are_sorted_into_worse_and_better() {
    let (worse, better) = classify(
        vec![
            c("a", 0.05),
            c("b", 0.25),
            c("c", -0.3),
            c("d", 0.12),
            c("e", -0.02),
        ],
        0.1,
    );
    assert_eq!(worse, vec![c("b", 0.25), c("d", 0.12)], "worst first");
    assert_eq!(better, vec![c("c", -0.3)]);
}

#[test]
fn noise_under_the_threshold_is_neither() {
    let (worse, better) = classify(vec![c("a", 0.099), c("b", -0.099)], 0.1);
    assert!(worse.is_empty() && better.is_empty());
}

#[test]
fn a_change_of_exactly_the_threshold_is_noise() {
    let (worse, better) = classify(vec![c("a", 0.1), c("b", -0.1)], 0.1);
    assert!(worse.is_empty() && better.is_empty());
}

/// Criterion's layout: `<bench>/<case>/change/estimates.json`. Only a
/// directory called `change` is read, and the benchmark is named by the
/// path above it.
#[test]
fn changes_are_read_from_every_change_directory() {
    use std::fs;
    let root = std::env::temp_dir().join(format!("xtask-bench-test-{}", std::process::id()));
    let _ = fs::remove_dir_all(&root);
    let estimates = |pct: f64| format!(r#"{{"mean":{{"point_estimate":{pct}}}}}"#);
    for (dir, pct) in [
        ("step/64/change", 0.25),
        ("step/64/new", 9.0),
        ("pairs/change", -0.5),
    ] {
        fs::create_dir_all(root.join(dir)).unwrap();
        fs::write(root.join(dir).join("estimates.json"), estimates(pct)).unwrap();
    }
    let mut found = super::changes(&root);
    found.sort_by(|a, b| a.name.cmp(&b.name));
    fs::remove_dir_all(&root).unwrap();
    assert_eq!(found, vec![c("pairs", -0.5), c("step/64", 0.25)]);
}

// From the fifth mutation run: the command's decisions, pulled out of it
// to be tested (which flag criterion gets, what fails, the warnings).

use super::{
    Mode, against, compares, flag, mode, not_compared, outcome, report, toolchain_warnings,
};
use crate::bench::table::Row;

fn row(id: &str, change: Option<f64>) -> Row {
    Row {
        id: id.to_owned(),
        mean_ns: 1000.0,
        spread: 0.01,
        throughput: None,
        change,
    }
}

#[test]
fn the_command_line_picks_save_then_baseline_then_local_then_the_record() {
    assert!(matches!(mode(Some("a"), Some("b"), true), Mode::Save("a")));
    assert!(matches!(mode(None, Some("b"), true), Mode::Compare("b")));
    assert!(matches!(mode(None, None, true), Mode::Local));
    assert!(matches!(mode(None, None, false), Mode::Default));
}

#[test]
fn criterion_gets_the_flag_for_the_mode() {
    assert_eq!(flag(&Mode::Save("m"), true), Some(("--save-baseline", "m")));
    assert_eq!(flag(&Mode::Compare("m"), true), Some(("--baseline", "m")));
    assert_eq!(
        flag(&Mode::Default, true),
        Some(("--baseline-lenient", "recorded"))
    );
    assert_eq!(flag(&Mode::Default, false), None, "no record: the last run");
    assert_eq!(flag(&Mode::Local, true), None);
}

#[test]
fn only_a_named_baseline_fails_on_a_regression() {
    assert!(outcome(&Mode::Compare("m"), 2, "x", 10.0).is_err());
    assert!(outcome(&Mode::Compare("m"), 0, "x", 10.0).is_ok());
    assert!(
        outcome(&Mode::Default, 2, "x", 10.0).is_ok(),
        "the record: reported"
    );
    assert!(outcome(&Mode::Local, 2, "x", 10.0).is_ok());
    assert!(compares(&Mode::Compare("m"), false));
    assert!(compares(&Mode::Default, true));
    assert!(!compares(&Mode::Default, false));
    assert!(!compares(&Mode::Local, true));
}

#[test]
fn the_report_counts_what_got_slower_past_the_threshold() {
    let rows = [
        row("a", Some(0.05)),
        row("b", Some(0.2)),
        row("c", Some(-0.3)),
        row("d", None),
    ];
    assert_eq!(report(&rows, 10.0, "x"), 1, "b only: 10% is 0.1");
    assert_eq!(report(&rows, 25.0, "x"), 0);
}

#[test]
fn a_recorded_benchmark_without_a_change_was_not_compared() {
    let rows = [
        row("in-record", None),
        row("compared", Some(0.0)),
        row("new", None),
    ];
    let recorded = ["in-record", "compared"].map(str::to_owned).into();
    assert_eq!(not_compared(&rows, &recorded), ["in-record"]);
}

#[test]
fn a_different_rustc_or_criterion_is_warned_of() {
    let meta = "rustc=rustc 1.99.1\ncriterion=0.8.2\n";
    assert_eq!(
        toolchain_warnings(meta, "rustc 1.99.1", Some("0.8.2")).len(),
        0
    );
    let w = toolchain_warnings(meta, "rustc 1.100.0", Some("0.9.0"));
    assert_eq!(w.len(), 2, "{w:?}");
    assert!(w[0].contains("rustc 1.99.1") && w[1].contains("criterion 0.8.2"));
}

/// `table::collect` and `store::measured` take only benchmarks this run
/// measured: `new/estimates.json` written at or after the start.
#[test]
fn only_benchmarks_measured_since_the_start_are_collected() {
    use std::fs;
    use std::time::{Duration, SystemTime};
    let root = std::env::temp_dir().join(format!("xtask-fresh-test-{}", std::process::id()));
    let _ = fs::remove_dir_all(&root);
    let estimates = r#"{"mean":{"confidence_interval":{"lower_bound":9.0,"upper_bound":11.0},"point_estimate":10.0}}"#;
    let start = SystemTime::now();
    for (id, age) in [("fresh/a", 0), ("stale/b", 3600)] {
        let new = root.join(id).join("new");
        fs::create_dir_all(&new).unwrap();
        fs::write(
            new.join("benchmark.json"),
            format!(r#"{{"full_id":"{id}"}}"#),
        )
        .unwrap();
        for f in ["estimates.json", "sample.json", "tukey.json"] {
            let path = new.join(f);
            fs::write(&path, estimates).unwrap();
            let when = start + Duration::from_secs(1) - Duration::from_secs(age);
            fs::File::options()
                .write(true)
                .open(&path)
                .unwrap()
                .set_modified(when)
                .unwrap();
        }
    }
    let ids: Vec<String> = super::table::collect(&root, start)
        .into_iter()
        .map(|r| r.id)
        .collect();
    let files = super::store::measured(&root, start);
    fs::remove_dir_all(&root).unwrap();
    assert_eq!(ids, ["fresh/a"]);
    assert!(files.keys().all(|k| k.starts_with("fresh/a/")), "{files:?}");
    assert_eq!(files.len(), 4, "the four files");
}

#[test]
fn the_legend_names_what_the_change_is_from() {
    assert_eq!(
        against(&Mode::Compare("main"), true, "llm"),
        "baseline `main`"
    );
    assert_eq!(against(&Mode::Default, true, "llm"), "the record for `llm`");
    assert_eq!(
        against(&Mode::Default, false, "llm"),
        "each benchmark's previous run"
    );
    assert_eq!(
        against(&Mode::Local, true, "llm"),
        "each benchmark's previous run"
    );
}
