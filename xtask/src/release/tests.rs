use super::{State, changed_lines, notes, problems, tag};

fn ready() -> State {
    State {
        branch: "main".to_owned(),
        status: String::new(),
        head: "abc".to_owned(),
        origin_main: "abc".to_owned(),
        tags: vec!["v0.1.0".to_owned(), "old".to_owned()],
    }
}

#[test]
fn a_clean_main_at_origin_with_a_new_tag_is_ready() {
    assert_eq!(problems(&ready(), "0.1.1"), Vec::<String>::new());
    assert_eq!(tag("0.1.1"), "v0.1.1");
}

#[test]
fn each_way_of_not_being_ready_is_named() {
    let on_branch = State {
        branch: "site/p3".to_owned(),
        ..ready()
    };
    let dirty = State {
        status: " M Cargo.toml".to_owned(),
        ..ready()
    };
    let behind = State {
        head: "def".to_owned(),
        ..ready()
    };
    for (state, version, word) in [
        (on_branch, "0.1.1", "not `main`"),
        (dirty, "0.1.1", "uncommitted"),
        (behind, "0.1.1", "origin/main"),
        (ready(), "0.1.0", "tag `v0.1.0` exists"),
    ] {
        let found = problems(&state, version);
        assert_eq!(found.len(), 1, "{found:?}");
        assert!(found[0].contains(word), "{found:?}");
    }
    // All at once: all four.
    let all = State {
        branch: "x".to_owned(),
        status: "?? f".to_owned(),
        head: "1".to_owned(),
        ..ready()
    };
    assert_eq!(problems(&all, "0.1.0").len(), 4);
    // A tag that only starts the same isn't this one.
    assert_eq!(problems(&ready(), "0.1.00"), Vec::<String>::new());
}

const DIFF: &str = "\
diff --git a/site/js/abi.ts b/site/js/abi.ts
--- a/site/js/abi.ts
+++ b/site/js/abi.ts
@@ -6,0 +7 @@
+export const DEMO_NEW_SCENE = 20;
@@ -40 +41 @@
-  demo_advance(demo: DemoHandle, elapsedSeconds: number): number;
+  demo_advance(demo: DemoHandle, elapsedSeconds: number, cap: number): number;
+
";

#[test]
fn a_diffs_added_and_removed_lines_without_headers_or_blanks() {
    let (added, removed) = changed_lines(DIFF);
    assert_eq!(
        added,
        [
            "export const DEMO_NEW_SCENE = 20;",
            "demo_advance(demo: DemoHandle, elapsedSeconds: number, cap: number): number;"
        ]
    );
    assert_eq!(
        removed,
        ["demo_advance(demo: DemoHandle, elapsedSeconds: number): number;"]
    );
    assert_eq!(changed_lines(""), (vec![], vec![]));
}

#[test]
fn notes_say_first_release_or_list_the_abi_changes() {
    let first = notes("0.1.0", None, "");
    assert!(first.contains("physics-engine-0.1.0.tgz") && first.contains("The first release."));
    assert!(!first.contains("ABI changes"));
    let unchanged = notes("0.1.1", Some("v0.1.0"), "");
    assert!(unchanged.contains("## ABI changes since v0.1.0") && unchanged.contains("None:"));
    let changed = notes("0.2.0", Some("v0.1.0"), DIFF);
    assert!(changed.contains("DEMO_NEW_SCENE") && changed.contains("cap: number"));
    assert!(
        changed.contains("Removed or changed (was)") && changed.contains("Added or changed (now)")
    );
    assert!(!changed.contains("None:"));
}
