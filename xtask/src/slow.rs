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
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let nextest = crate::has_nextest(&cargo);
    if !nextest {
        println!("slow tier: cargo-nextest not installed, using cargo test");
    }
    stage(
        root,
        nextest,
        &format!("every test, property tests at {cases} cases"),
        Ignored::Skip,
        &[("PROPTEST_CASES", cases.as_str())],
    )?;
    stage(
        root,
        nextest,
        "the long runs (slow_*)",
        Ignored::SlowOnly,
        &[],
    )?;
    println!("slow tier: passed");
    Ok(())
}

/// Which `#[ignore]`d tests a stage runs.
#[derive(Copy, Clone)]
enum Ignored {
    /// None (the default).
    Skip,
    /// Only the `slow_*` ones.
    SlowOnly,
}

/// Every test in the workspace built with the `slow` profile, by nextest
/// (or `cargo test` without it), with `envs`, timed.
fn stage(
    root: &Path,
    nextest: bool,
    what: &str,
    ignored: Ignored,
    envs: &[(&str, &str)],
) -> Result<(), String> {
    println!("slow tier: {what}");
    let started = Instant::now();
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let mut cmd = process::Command::new(cargo);
    cmd.current_dir(root);
    if nextest {
        cmd.args([
            "nextest",
            "run",
            "--workspace",
            "--cargo-profile",
            "slow",
            // nextest's own profile (.config/nextest.toml): the default
            // stops a test at 2 minutes, which is for pushes.
            "--profile",
            "slow",
            "--no-fail-fast",
        ]);
        if let Ignored::SlowOnly = ignored {
            cmd.args(["--run-ignored", "only", "-E", "test(~slow_)"]);
        }
    } else {
        cmd.args(["test", "--workspace", "--quiet", "--profile", "slow"]);
        if let Ignored::SlowOnly = ignored {
            cmd.args(["--", "--ignored", "slow_"]);
        }
    }
    let status = cmd
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
