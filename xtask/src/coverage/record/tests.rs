use std::collections::BTreeMap;

use super::{Kept, Meta, badge, document, fell, missing_lines, parse, rose};
use crate::coverage::Counts;

fn counts(
    name: &str,
    lines: u32,
    missed_lines: u32,
    functions: u32,
    missed_functions: u32,
) -> Counts {
    Counts {
        name: name.to_owned(),
        lines,
        missed_lines,
        functions,
        missed_functions,
    }
}

fn meta() -> Meta {
    Meta {
        date: "2026-11-13".to_owned(),
        commit: "abc1234".to_owned(),
        subject: "a commit".to_owned(),
        rustc: "rustc 1.99.1".to_owned(),
    }
}

#[test]
fn the_record_reads_back_what_it_wrote() {
    let files = [
        counts("engine/src/world.rs", 43, 7, 8, 2),
        counts("math/src/vec2.rs", 41, 0, 13, 0),
        counts("web-common/src/empty.rs", 0, 0, 0, 0),
    ];
    let text = document(
        &meta(),
        &[counts("engine", 43, 7, 8, 2)],
        &counts("total", 84, 7, 21, 2),
        &files,
    );
    assert!(
        text.contains("| `engine` | 83.72% (36/43) | 75.00% (6/8) |"),
        "{text}"
    );
    assert!(text.contains("- **Commit:** `abc1234` (a commit)"));
    let back = parse(&text);
    assert_eq!(back.len(), 3, "files only, not crates");
    assert_eq!(
        back["engine/src/world.rs"],
        Kept {
            lines: 43,
            missed_lines: 7,
            functions: 8,
            missed_functions: 2
        }
    );
    assert_eq!(
        back["web-common/src/empty.rs"].lines, 0,
        "`-` reads as nothing"
    );
}

#[test]
fn a_fall_is_more_missed_or_a_new_file_short_of_full() {
    let record = BTreeMap::from([
        (
            "a.rs".to_owned(),
            Kept {
                lines: 10,
                missed_lines: 1,
                functions: 2,
                missed_functions: 0,
            },
        ),
        (
            "b.rs".to_owned(),
            Kept {
                lines: 10,
                missed_lines: 2,
                functions: 2,
                missed_functions: 1,
            },
        ),
        (
            "gone.rs".to_owned(),
            Kept {
                lines: 5,
                missed_lines: 5,
                functions: 1,
                missed_functions: 1,
            },
        ),
    ]);
    let now = [
        // More code, all of it covered: not a fall, though the share moved.
        counts("a.rs", 20, 1, 4, 0),
        // One more line missed.
        counts("b.rs", 10, 3, 2, 1),
        counts("new.rs", 4, 1, 1, 0),
        counts("new-covered.rs", 4, 0, 1, 0),
    ];
    let falls = fell(&record, &now);
    assert_eq!(
        falls.iter().map(|f| f.text.as_str()).collect::<Vec<_>>(),
        [
            "b.rs: lines missed 2 -> 3, functions missed 1 -> 1",
            "new.rs (new): lines 75.00% (3/4), functions 100.00% (1/1)",
        ]
    );
    assert_eq!(falls[0].file, "b.rs");
    assert_eq!(rose(&record, &now), 0);
    assert_eq!(rose(&record, &[counts("b.rs", 10, 0, 2, 0)]), 1);
}

#[test]
fn the_badge_shows_the_share_of_lines_covered_and_its_colour() {
    assert_eq!(
        badge(&counts("total", 9065, 240, 1456, 28)),
        "{\"schemaVersion\":1,\"label\":\"coverage\",\"message\":\"97.4%\",\"color\":\"brightgreen\"}\n"
    );
    assert!(badge(&counts("total", 100, 15, 1, 0)).contains("\"85.0%\",\"color\":\"yellow\""));
    assert!(
        badge(&counts("total", 0, 0, 0, 0)).contains("\"0.0%\""),
        "nothing to cover"
    );
}

/// Each colour from its threshold up: at exactly 90, 80 and 70 per cent
/// the better colour.
#[test]
fn the_badge_colours_start_at_their_thresholds() {
    let colour = |covered: u32| {
        let b = badge(&counts("total", 100, 100 - covered, 1, 0));
        b.split("\"color\":\"")
            .nth(1)
            .unwrap()
            .split('"')
            .next()
            .unwrap()
            .to_owned()
    };
    for (covered, expected) in [
        (95, "brightgreen"),
        (94, "yellowgreen"),
        (90, "yellowgreen"),
        (89, "yellow"),
        (80, "yellow"),
        (79, "orange"),
        (70, "orange"),
        (69, "red"),
    ] {
        assert_eq!(colour(covered), expected, "{covered}%");
    }
}

/// Fewer missed is never a fall, and a new file falls short on functions
/// alone too; a file rises on either count alone.
#[test]
fn falls_and_rises_count_lines_and_functions_each() {
    let kept = |missed_lines, missed_functions| Kept {
        lines: 10,
        missed_lines,
        functions: 4,
        missed_functions,
    };
    let record = BTreeMap::from([("a.rs".to_owned(), kept(3, 2))]);
    assert!(
        fell(&record, &[counts("a.rs", 10, 2, 4, 2)]).is_empty(),
        "fewer lines missed"
    );
    assert!(
        fell(&record, &[counts("a.rs", 10, 3, 4, 1)]).is_empty(),
        "fewer functions missed"
    );
    assert_eq!(
        fell(&record, &[counts("a.rs", 10, 3, 4, 3)]).len(),
        1,
        "a function more"
    );
    assert_eq!(
        fell(&record, &[counts("new.rs", 10, 0, 4, 1)]).len(),
        1,
        "new, every line covered, a function not"
    );
    assert_eq!(
        rose(&record, &[counts("a.rs", 10, 2, 4, 2)]),
        1,
        "lines alone"
    );
    assert_eq!(
        rose(&record, &[counts("a.rs", 10, 3, 4, 1)]),
        1,
        "functions alone"
    );
    assert_eq!(
        rose(&record, &[counts("a.rs", 10, 3, 4, 3)]),
        0,
        "a function more"
    );
}

#[test]
fn missing_lines_are_read_from_llvm_cov_s_section_by_file() {
    let report = "Filename  Regions ...\nTOTAL 1 2 3\n\nUncovered Lines:\n/home/r/physics/crates/swarm/src/vicsek.rs: 301, 305, 306\n/home/r/physics/crates/swarm/src/field.rs: 52\n";
    assert_eq!(
        missing_lines(report, "swarm/src/vicsek.rs"),
        Some("301, 305, 306")
    );
    assert_eq!(missing_lines(report, "src/field.rs"), Some("52"));
    assert_eq!(missing_lines(report, "swarm/src/other.rs"), None);
}
