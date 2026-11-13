use super::{Context, changes, document, path};
use crate::bench::store::Files;
use crate::bench::table::{Row, Throughput};

fn context() -> Context {
    Context {
        date: "2026-11-13".to_owned(),
        time: "151500".to_owned(),
        machine: "llm".to_owned(),
        system: "Linux x86_64".to_owned(),
        cpus: 16,
        rustc: "rustc 1.99.1".to_owned(),
        commit: "abc1234".to_owned(),
        subject: "the commit's subject".to_owned(),
        dirty: true,
        filter: Some("sand_step".to_owned()),
        against: "each benchmark's previous run".to_owned(),
    }
}

#[test]
fn the_record_says_where_when_and_what_then_the_table() {
    let mut rows = vec![Row {
        id: "sand_step/busy".to_owned(),
        mean_ns: 1_515_489.0,
        spread: 0.0013,
        throughput: Some(Throughput::Elements(230_400.0)),
        change: Some(0.004),
    }];
    let text = document(&context(), &mut rows);
    for want in [
        "# Benchmarks, 2026-11-13, llm",
        "`abc1234` (the commit's subject), with uncommitted changes",
        "Linux x86_64, 16 CPUs; rustc 1.99.1",
        "`cargo xtask bench sand_step`",
        "Change: from each benchmark's previous run",
        "| `sand_step/busy` | 1.52 ms | 0.1% | 152.0 Melem/s | +0.4% |",
    ] {
        assert!(text.contains(want), "{want:?} in:\n{text}");
    }
}

#[test]
fn one_record_per_machine() {
    assert_eq!(path("llm"), "docs/bench/llm.md");
}

#[test]
fn the_record_s_files_are_the_table_the_meta_the_data_and_removals() {
    let ctx = context();
    let old = Files::from([
        ("a/estimates.json".to_owned(), "old a".to_owned()),
        ("gone/estimates.json".to_owned(), "old gone".to_owned()),
    ]);
    let new = Files::from([("a/estimates.json".to_owned(), "new a".to_owned())]);
    let files = changes(&ctx, &old, &new, "rustc=x\n", &mut []);
    let paths: Vec<(&str, bool)> = files
        .iter()
        .map(|(p, t)| (p.as_str(), t.is_some()))
        .collect();
    assert_eq!(
        paths,
        [
            ("docs/bench/llm.md", true),
            ("docs/bench/llm/record.txt", true),
            ("docs/bench/llm/a/estimates.json", true),
            ("docs/bench/llm/gone/estimates.json", false),
        ]
    );
    assert_eq!(files[2].1.as_deref(), Some("new a"));
}
