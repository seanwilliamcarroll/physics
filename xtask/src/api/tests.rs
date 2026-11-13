use std::fs;
use std::path::Path;

use super::{CRATES, skips_when_missing};

/// A missing tool is skipped only by a check outside strict mode: writing
/// the snapshots needs the tool, and CI (`HOOKS_STRICT=1`) must not pass
/// by not checking.
#[test]
fn a_missing_tool_is_skipped_only_by_a_lenient_check() {
    assert!(skips_when_missing(true, false));
    assert!(!skips_when_missing(true, true));
    assert!(!skips_when_missing(false, false));
    assert!(!skips_when_missing(false, true));
}

/// Every library crate in `crates/` is snapshotted: the `cdylib`s (their
/// surface is the C ABI, checked against the `.d.ts`) and test support
/// are the only ones left out. A new crate (M9's `sand`) fails here until
/// it's added to `CRATES`.
#[test]
fn every_library_crate_is_snapshotted() {
    let crates = Path::new(env!("CARGO_MANIFEST_DIR")).join("../crates");
    for entry in fs::read_dir(&crates).unwrap() {
        let dir = entry.unwrap().path();
        let manifest = fs::read_to_string(dir.join("Cargo.toml")).unwrap();
        let name = dir.file_name().unwrap().to_str().unwrap();
        let skipped = manifest.contains("\"cdylib\"") || name == "test-support";
        assert_eq!(
            CRATES.contains(&name),
            !skipped,
            "{name}: library crates are snapshotted, cdylibs and test-support aren't"
        );
    }
}
