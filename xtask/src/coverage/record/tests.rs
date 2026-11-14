use std::collections::BTreeMap;

use super::{Kept, Meta, badge, document, fell, parse, rose};
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
    assert_eq!(
        fell(&record, &now),
        [
            "b.rs: lines missed 2 -> 3, functions missed 1 -> 1",
            "new.rs (new): lines 75.00% (3/4), functions 100.00% (1/1)",
        ]
    );
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
