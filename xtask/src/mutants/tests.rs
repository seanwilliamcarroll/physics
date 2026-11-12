use std::fs;
use std::path::Path;

use super::{clean_leftovers, is_leftover, refuse_inside, with_defaults};

fn args(a: &[&str]) -> Vec<String> {
    a.iter().map(|s| (*s).to_owned()).collect()
}

#[test]
fn defaults_fill_in_only_what_isnt_given() {
    assert_eq!(
        with_defaults(&args(&["--list"]), false),
        args(&["-j", "8", "--no-shuffle", "--list"])
    );
    for given in [&["-j", "4"][..], &["-j4"], &["--jobs", "2"], &["--jobs=2"]] {
        let out = with_defaults(&args(given), false);
        assert_eq!(
            out.iter().filter(|a| a.as_str() == "8").count(),
            0,
            "{given:?}"
        );
        assert!(out.contains(&"--no-shuffle".to_owned()));
    }
    assert_eq!(
        with_defaults(&args(&["--shuffle"]), false),
        args(&["-j", "8", "--shuffle"])
    );
}

#[test]
fn nextest_runs_the_tests_when_installed_unless_a_tool_is_given() {
    assert_eq!(
        with_defaults(&args(&["--list"]), true),
        args(&[
            "-j",
            "8",
            "--no-shuffle",
            "--test-tool",
            "nextest",
            "--list"
        ])
    );
    for given in [&["--test-tool", "cargo"][..], &["--test-tool=cargo"]] {
        let out = with_defaults(&args(given), true);
        assert!(!out.contains(&"nextest".to_owned()), "{given:?}: {out:?}");
    }
    // Not installed: cargo-mutants' own default (cargo test).
    assert!(!with_defaults(&args(&[]), false).contains(&"--test-tool".to_owned()));
}

#[test]
fn only_cargo_mutants_build_dirs_are_leftovers() {
    assert!(is_leftover("cargo-mutants-physics-AbC123.tmp"));
    assert!(!is_leftover("cargo-mutants-physics"));
    assert!(!is_leftover("my-cargo-mutants-x.tmp"));
    assert!(!is_leftover("notes.tmp"));
}

#[test]
fn a_scratch_dir_inside_the_workspace_is_refused() {
    let root = Path::new("/work/physics");
    assert!(refuse_inside(Path::new("/work/physics/target/tmp"), root).is_err());
    assert!(refuse_inside(root, root).is_err());
    assert!(refuse_inside(Path::new("/home/me/.cache/mutants-tmp"), root).is_ok());
    // A sibling whose name starts the same isn't inside.
    assert!(refuse_inside(Path::new("/work/physics-tmp"), root).is_ok());
}

#[test]
fn cleaning_removes_leftovers_and_nothing_else() {
    let dir = std::env::temp_dir().join(format!("xtask-mutants-test-{}", std::process::id()));
    fs::create_dir_all(dir.join("cargo-mutants-a-1.tmp/src")).unwrap();
    fs::write(dir.join("cargo-mutants-a-1.tmp/src/x.rs"), "").unwrap();
    fs::write(dir.join("cargo-mutants-b-2.tmp"), "").unwrap();
    fs::create_dir_all(dir.join("keep")).unwrap();
    fs::write(dir.join("keep.tmp"), "").unwrap();
    clean_leftovers(&dir).unwrap();
    let mut left: Vec<String> = fs::read_dir(&dir)
        .unwrap()
        .map(|e| e.unwrap().file_name().to_string_lossy().into_owned())
        .collect();
    left.sort();
    assert_eq!(left, ["keep", "keep.tmp"]);
    fs::remove_dir_all(&dir).unwrap();
}
