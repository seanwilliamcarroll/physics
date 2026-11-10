//! `cargo xtask slow`: the slow tier (`docs/04-testing.md`, "Running
//! strategy"). Not part of any hook: run it by hand before a release, or
//! nightly (the compute node, next to the mutation runs).
//!
//! 1. Every test, with each property test at `cases` cases
//!    (`PROPTEST_CASES`; every-commit runs use 64).
//! 2. The long runs: `#[ignore = "slow: …"]` tests named `slow_*`. The
//!    name is the filter, so other ignored tests (generators, such as the
//!    hammer table's) stay out.
//!
//! Both build with the `slow` profile: optimized, with debug assertions and
//! overflow checks kept, so overflow still panics.

use std::env;
use std::ffi::OsString;
use std::path::Path;
use std::process;
use std::time::Instant;

/// The default case count per property test.
pub(crate) const DEFAULT_CASES: u32 = 10_000;

/// Runs both stages, stopping at the first failure.
pub(crate) fn slow(root: &Path, cases: u32) -> Result<(), String> {
    let cases = cases.to_string();
    stage(
        root,
        &format!("every test, property tests at {cases} cases"),
        &[],
        &[("PROPTEST_CASES", cases.as_str())],
    )?;
    stage(
        root,
        "the long runs (slow_*)",
        &["--", "--ignored", "slow_"],
        &[],
    )?;
    println!("slow tier: passed");
    Ok(())
}

/// `cargo test --workspace --profile slow`, plus `extra` args and `envs`,
/// timed.
fn stage(root: &Path, what: &str, extra: &[&str], envs: &[(&str, &str)]) -> Result<(), String> {
    println!("slow tier: {what}");
    let started = Instant::now();
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args(["test", "--workspace", "--quiet", "--profile", "slow"])
        .args(extra)
        .envs(envs.iter().copied())
        .status()
        .map_err(|e| format!("failed to run cargo test: {e}"))?;
    let secs = started.elapsed().as_secs_f64();
    if status.success() {
        println!("slow tier: {what}: ok in {secs:.0} s");
        Ok(())
    } else {
        Err(format!("{what}: failed after {secs:.0} s ({status})"))
    }
}
