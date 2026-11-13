use super::{Context, document, json_string, path};
use crate::bench::table::{Row, Throughput};

fn context() -> Context {
    Context {
        date: "2026-11-13".to_owned(),
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
fn a_second_record_the_same_day_gets_a_number() {
    assert_eq!(path("2026-11-13", "llm", 1), "docs/bench/2026-11-13-llm.md");
    assert_eq!(
        path("2026-11-13", "llm", 2),
        "docs/bench/2026-11-13-llm-2.md"
    );
}

#[test]
fn json_strings_escape_what_json_needs() {
    assert_eq!(json_string("plain"), "\"plain\"");
    assert_eq!(
        json_string("a \"b\" \\ c\nd\te\u{1}"),
        "\"a \\\"b\\\" \\\\ c\\nd\\te\\u0001\""
    );
    assert_eq!(json_string("± µs"), "\"± µs\"", "non-ASCII as is");
}
