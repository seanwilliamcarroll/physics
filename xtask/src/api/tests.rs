use std::fs;
use std::path::Path;

use super::CRATES;

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
