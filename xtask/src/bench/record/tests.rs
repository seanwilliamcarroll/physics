use super::{Context, changes, document, path, proposal};
use crate::bench::level::Level;
use crate::bench::table::{Row, Throughput};

fn context() -> Context {
    Context {
        date: "2026-11-13".to_owned(),
        time: "151500".to_owned(),
        machine: "llm".to_owned(),
        level: Level::Baseline,
        name: "llm".to_owned(),
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
fn the_record_s_files_are_the_table_then_the_record() {
    let files = changes(&context(), "the record\n", &mut []);
    let paths: Vec<&str> = files.iter().map(|(p, _)| p.as_str()).collect();
    assert_eq!(paths, ["docs/bench/llm.md", "docs/bench/llm.tsv"]);
    assert_eq!(files[1].1.as_deref(), Some("the record\n"));
}

fn at(level: Level) -> Context {
    Context {
        level,
        name: level.record_name("llm"),
        ..context()
    }
}

#[test]
fn a_level_s_record_is_named_for_it_and_says_how_it_was_built() {
    let ctx = at(Level::Native);
    let mut rows = Vec::new();
    let text = document(&ctx, &mut rows);
    assert!(
        text.starts_with("# Benchmarks, 2026-11-13, llm-native"),
        "{text}"
    );
    assert!(
        text.contains("- **Level:** native (`-C target-cpu=native`)"),
        "{text}"
    );
    assert!(
        text.contains("`cargo xtask bench --level native sand_step`"),
        "{text}"
    );
    let files = changes(&ctx, "the record", &mut rows);
    assert_eq!(files[0].0, "docs/bench/llm-native.md");
    assert_eq!(files[1].0, "docs/bench/llm-native.tsv");
    let base = document(&at(Level::Baseline), &mut rows);
    assert!(
        base.contains("`cargo xtask bench sand_step`"),
        "no --level for the baseline: {base}"
    );
}

#[test]
fn one_pull_request_carries_every_level() {
    let run = |l: Level| {
        let ctx = at(l);
        let files = vec![
            (path(&ctx.name), Some(format!("table of {}", ctx.name))),
            (format!("docs/bench/{}.tsv", ctx.name), Some(String::new())),
        ];
        (ctx, files)
    };
    let (branch, title, body) = proposal(&[run(Level::Baseline)]);
    assert_eq!(branch, "bench/llm-2026-11-13-151500");
    assert_eq!(title, "bench: results of 2026-11-13 on llm");
    assert!(body.contains("table of llm\n"));
    let (branch, title, body) =
        proposal(&[run(Level::Baseline), run(Level::Native), run(Level::V8)]);
    assert_eq!(branch, "bench/llm-all-2026-11-13-151500");
    assert_eq!(
        title,
        "bench: results of 2026-11-13 on llm (baseline, native, v8)"
    );
    for name in [
        "table of llm\n",
        "table of llm-native",
        "table of llm-v8",
        "`docs/bench/llm-v8.tsv`",
    ] {
        assert!(body.contains(name), "{name}: {body}");
    }
}
