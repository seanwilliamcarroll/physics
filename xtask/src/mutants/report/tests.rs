use std::collections::BTreeSet;

use super::{Mutant, Run, View, by_file, line_survives, only_in, parse, parse_all, render};

fn m(file: &str, line: u32, description: &str) -> Mutant {
    Mutant {
        file: file.to_owned(),
        line,
        col: 1,
        description: description.to_owned(),
    }
}

#[test]
fn a_line_parses_into_file_position_and_description() {
    // From a real run (mutants_llm_260ef90.out/missed.txt).
    let got =
        parse("crates/acoustic/src/dispersion.rs:113:37: replace < with <= in design").unwrap();
    assert_eq!(got.file, "crates/acoustic/src/dispersion.rs");
    assert_eq!((got.line, got.col), (113, 37));
    assert_eq!(got.description, "replace < with <= in design");
    // A description with colons of its own keeps them.
    let got = parse("a.rs:1:2: replace Foo::bar -> bool with false").unwrap();
    assert_eq!(got.description, "replace Foo::bar -> bool with false");
}

#[test]
fn lines_that_are_not_mutants_are_skipped() {
    for bad in ["", "a.rs", "a.rs:x:2: d", "a.rs:1:2:", ":1:2: d"] {
        assert_eq!(parse(bad), None, "{bad:?}");
    }
    assert_eq!(parse_all("a.rs:1:2: d\n\nnoise\nb.rs:3:4: e\n").len(), 2);
}

#[test]
fn runs_are_compared_by_file_and_description_not_position() {
    let before = [m("a.rs", 10, "x"), m("a.rs", 20, "y"), m("b.rs", 5, "x")];
    // "x" in a.rs moved; "y" is fixed; "z" is new.
    let now = [m("a.rs", 14, "x"), m("b.rs", 5, "x"), m("a.rs", 30, "z")];
    let new: Vec<_> = only_in(&now, &before)
        .iter()
        .map(|m| m.description.as_str())
        .collect();
    assert_eq!(new, ["z"]);
    let fixed: Vec<_> = only_in(&before, &now)
        .iter()
        .map(|m| m.description.as_str())
        .collect();
    assert_eq!(fixed, ["y"]);
}

#[test]
fn a_repeated_mutant_counts_each_time() {
    let before = [m("a.rs", 1, "x")];
    let now = [m("a.rs", 1, "x"), m("a.rs", 9, "x")];
    assert_eq!(only_in(&now, &before).len(), 1);
}

#[test]
fn a_line_survives_if_its_text_is_still_anywhere_in_the_file() {
    let then = "fn f() {\n    a < b\n}\n";
    assert!(line_survives(then, 2, "fn g() {}\n\n        a < b\n"));
    assert!(!line_survives(then, 2, "fn f() {\n    a <= b\n}\n"));
    // Nothing to compare: not marked.
    assert!(line_survives(then, 99, ""));
    assert!(line_survives("\n\n", 1, ""));
}

#[test]
fn files_are_ordered_by_count_then_path_and_mutants_by_line() {
    let ms = [
        m("b.rs", 9, "1"),
        m("a.rs", 3, "2"),
        m("c.rs", 5, "3"),
        m("c.rs", 2, "4"),
    ];
    let refs: Vec<&Mutant> = ms.iter().collect();
    let got: Vec<(&str, Vec<u32>)> = by_file(&refs)
        .into_iter()
        .map(|(f, v)| (f, v.iter().map(|m| m.line).collect()))
        .collect();
    assert_eq!(
        got,
        [("c.rs", vec![2, 5]), ("a.rs", vec![3]), ("b.rs", vec![9])]
    );
}

#[test]
fn the_report_has_totals_the_diff_and_gone_marks() {
    let run = Run {
        caught: 7,
        unviable: 2,
        missed: vec![m("a.rs", 4, "x"), m("b.rs", 1, "y")],
        timeout: vec![m("a.rs", 8, "t")],
    };
    let prev = Run {
        missed: vec![m("b.rs", 1, "y"), m("c.rs", 1, "old")],
        ..Run::default()
    };
    let gone = BTreeSet::from([("a.rs".to_owned(), 4)]);
    let view = View {
        commit: Some("abc"),
        ..View::default()
    };
    let s = render("run", &run, Some(("prev", &prev)), &gone, &view);
    assert!(s.contains("(1 mutants since abc)"), "{s}");
    assert!(
        s.starts_with(
            "run: 7 caught, 2 missed, 1 timed out, 2 unviable (70.0% of viable caught)\n"
        ),
        "{s}"
    );
    assert!(
        s.contains("Against prev: 1 newly missed, 1 no longer missed"),
        "{s}"
    );
    assert!(s.contains("    a.rs:4: x [gone]\n"), "{s}");
    assert!(s.contains("    c.rs:1: old\n"), "{s}");
    assert!(s.contains("a.rs (1, 1 gone)\n  4:1 x [gone]\n"), "{s}");
    assert!(
        s.contains("Timed out, by file:\na.rs (1)\n  8:1 t\n"),
        "{s}"
    );
}

#[test]
fn the_file_filter_keeps_only_matching_paths() {
    let run = Run {
        missed: vec![m("crates/a/x.rs", 1, "x"), m("crates/b/y.rs", 1, "y")],
        ..Run::default()
    };
    let view = View {
        file: Some("crates/b"),
        ..View::default()
    };
    let s = render("run", &run, None, &BTreeSet::new(), &view);
    assert!(s.contains("crates/b/y.rs"), "{s}");
    assert!(!s.contains("crates/a/x.rs"), "{s}");
    // The totals stay the whole run's.
    assert!(s.contains("2 missed"), "{s}");
}

#[test]
fn the_summary_lists_files_and_counts_only() {
    let run = Run {
        missed: vec![m("a.rs", 1, "x"), m("a.rs", 2, "y")],
        ..Run::default()
    };
    let prev = Run {
        missed: vec![m("a.rs", 5, "old")],
        ..Run::default()
    };
    let view = View {
        summary: true,
        ..View::default()
    };
    let s = render("run", &run, Some(("prev", &prev)), &BTreeSet::new(), &view);
    assert!(
        s.contains("Against prev: 2 newly missed, 1 no longer missed"),
        "{s}"
    );
    assert!(s.contains("Missed, by file:\na.rs (2)\n"), "{s}");
    assert!(!s.contains("old") && !s.contains(" x"), "{s}");
}
