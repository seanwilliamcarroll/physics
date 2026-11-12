//! Build helper, run as `cargo xtask <command>` (alias in `.cargo/config.toml`).
//! Arguments are parsed by `clap`; see `docs/repo-layout.md`.
// A CLI prints by design, and with clap's derive API the doc comments on
// `Cli` and `Command` *are* the --help text, where doc_markdown's
// backticks would print literally. Cargo can't mix `workspace = true` lints
// with per-crate overrides, so the overrides live here (docs/lint-policy.md).
#![allow(clippy::print_stdout, clippy::print_stderr, clippy::doc_markdown)]

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{self, ExitCode};

use clap::{Parser, Subcommand};

mod abi_check;
mod api;
mod bench;
mod bench_wasm;
mod coverage;
mod mutants;
mod package;
mod profile;
mod serve;
mod slow;
mod smoke;

/// Where `cargo build` puts the wasm artifact, relative to the target dir.
const WASM_ARTIFACT: &str = "wasm32-unknown-unknown/release/engine_web.wasm";
/// The acoustic track's module (A1.5): `crates/acoustic-web`, served as
/// `site/pkg/acoustic.wasm`.
const ACOUSTIC_ARTIFACT: &str = "wasm32-unknown-unknown/release/acoustic_web.wasm";
/// The falling-sand module (M9): `crates/sand-web`, served as
/// `site/pkg/sand.wasm`.
const SAND_ARTIFACT: &str = "wasm32-unknown-unknown/release/sand_web.wasm";
/// The swarm module (S1): `crates/swarm-web`, built with `simd128` in its
/// own target dir ([`SIMD_TARGET`]) and served as `site/pkg/swarm.wasm`.
const SWARM_ARTIFACT: &str = "wasm32-unknown-unknown/release/swarm_web.wasm";
/// Under the target dir: builds with `-C target-feature=+simd128`. Kept
/// apart because cargo rebuilds everything when `RUSTFLAGS` changes, and
/// the other modules build without it (`docs/15-swarm.md`, S1.4: the
/// lane loop gains 1.3–1.7× from it; nothing else here is shaped for it).
const SIMD_TARGET: &str = "simd";

/// Build, test, and serve helpers for the physics engine and its demo site.
#[derive(Parser, Debug)]
// bin_name: usage lines show how it's actually invoked (argv[0] would be
// the bare binary name, "xtask").
#[command(
    name = "cargo xtask",
    bin_name = "cargo xtask",
    arg_required_else_help = true
)]
struct Cli {
    #[command(subcommand)]
    command: Command,
}

#[derive(Subcommand, Clone, Debug, PartialEq, Eq)]
enum Command {
    /// Compile the site TypeScript and build crates/engine-web and crates/acoustic-web for wasm32 into site/pkg/{engine,acoustic}.wasm
    Site,
    /// Build the physics-engine npm package for the website into
    /// target/package/ (engine.wasm, its types, the loader), and check the
    /// tarball by using it (docs/16-site-demos.md)
    Package,
    /// Build the site, then serve it with tsc --watch alongside; Ctrl-C stops both
    Serve {
        /// Port to serve on (1-65535)
        #[arg(long, default_value_t = serve::DEFAULT_PORT,
              value_parser = clap::value_parser!(u16).range(1..))]
        port: u16,
    },
    /// Build the site, load the demos in headless Chrome, and check they draw
    Smoke,
    /// Run the math and engine tests as wasm32-wasip1 under wasmtime
    TestWasm,
    /// Run every criterion benchmark, saving a named baseline (--save) or
    /// comparing with one (--baseline): lists what moved past the
    /// threshold and fails on regressions (docs/benchmarks.md)
    Bench {
        /// Save this run as baseline NAME
        #[arg(long, value_name = "NAME", conflicts_with = "baseline")]
        save: Option<String>,
        /// Compare this run with baseline NAME
        #[arg(long, value_name = "NAME")]
        baseline: Option<String>,
        /// The change in a mean that counts, whole percent
        #[arg(long, default_value_t = 10)]
        threshold: u32,
    },
    /// Time the cluster through engine.wasm in Node and compare with the
    /// native criterion results (run cargo bench -p engine --bench step first)
    BenchWasm {
        /// Measuring time per case, in milliseconds (at least 10)
        #[arg(long, default_value_t = 500, value_parser = clap::value_parser!(u32).range(10..))]
        budget_ms: u32,
    },
    /// Profile one example or bench under samply (built with debug info)
    /// and print its hottest functions and source lines
    /// (docs/profiling.md); arguments after -- go to the program (a bench:
    /// a filter for its cases)
    Profile {
        /// The package holding the example or bench
        #[arg(short, long)]
        package: String,
        /// Profile this example
        #[arg(
            long,
            value_name = "NAME",
            conflicts_with = "bench",
            required_unless_present = "bench"
        )]
        example: Option<String>,
        /// Profile this criterion bench
        #[arg(long, value_name = "NAME")]
        bench: Option<String>,
        /// Seconds each bench case runs (an example decides its own)
        #[arg(long, default_value_t = 5, value_parser = clap::value_parser!(u32).range(1..))]
        seconds: u32,
        /// How many functions and lines to list
        #[arg(long, default_value_t = 12, value_parser = clap::value_parser!(u32).range(1..))]
        top: u32,
        /// Arguments for the program
        #[arg(last = true)]
        args: Vec<String>,
    },
    /// Measure test coverage of the Rust crates and the site JS; report only, no thresholds
    ///
    /// Rust: cargo-llvm-cov runs the workspace tests (except xtask) instrumented,
    /// writes an HTML report to target/llvm-cov/html, and prints a line per crate
    /// (test-support is left out of the report). Site JS: node --test with
    /// --experimental-test-coverage over tests/site. Needs cargo-llvm-cov:
    /// cargo install cargo-llvm-cov
    Coverage,
    /// Point git at the tracked hooks in .githooks/
    InstallHooks,
    /// Write each library crate's public API to docs/api/CRATE.txt (cargo
    /// public-api on a pinned nightly); with --check, fail if any is stale
    Api {
        /// Compare instead of writing (pre-push)
        #[arg(long)]
        check: bool,
    },
    /// cargo mutants with TMPDIR outside the repo ($MUTANTS_TMPDIR, or
    /// $HOME/.cache/mutants-tmp), leftover build dirs cleaned, and -j 8
    /// --no-shuffle unless given; every other argument passed through, and
    /// its exit code returned
    Mutants {
        /// Arguments for cargo mutants
        #[arg(trailing_var_arg = true, allow_hyphen_values = true)]
        args: Vec<String>,
    },
    /// The slow tier, not in any hook: every test with property tests at
    /// 10 000 cases, then the long `slow_*` runs (ignored by `cargo test`),
    /// built optimized with overflow checks kept
    Slow {
        /// Cases per property test
        #[arg(long, default_value_t = slow::DEFAULT_CASES, value_parser = clap::value_parser!(u32).range(1..))]
        cases: u32,
    },
}

fn main() -> ExitCode {
    // Parse errors and --help exit here, with clap's own messages and codes.
    let cli = Cli::parse();
    match run(cli.command) {
        Ok(()) => ExitCode::SUCCESS,
        Err(e) => {
            eprintln!("xtask: {e}");
            ExitCode::FAILURE
        }
    }
}

fn run(cmd: Command) -> Result<(), String> {
    let root = workspace_root()?;
    match cmd {
        Command::Site => site(&root),
        Command::Serve { port } => serve::serve(&root, port),
        Command::Smoke => smoke::smoke(&root),
        Command::Package => package::package(&root),
        Command::TestWasm => test_wasm(&root),
        Command::Bench {
            save,
            baseline,
            threshold,
        } => match (save.as_deref(), baseline.as_deref()) {
            (Some(n), _) => bench::bench(&root, &bench::Mode::Save(n), f64::from(threshold)),
            (None, Some(n)) => bench::bench(&root, &bench::Mode::Compare(n), f64::from(threshold)),
            (None, None) => Err("give --save NAME or --baseline NAME".to_owned()),
        },
        Command::BenchWasm { budget_ms } => bench_wasm::bench_wasm(&root, budget_ms),
        Command::Profile {
            package,
            example,
            bench,
            seconds,
            top,
            args,
        } => {
            let target = match (example, bench) {
                (Some(n), _) => profile::Target::Example(n),
                (None, Some(n)) => profile::Target::Bench(n),
                (None, None) => return Err("give --example NAME or --bench NAME".to_owned()),
            };
            profile::profile(&root, &package, &target, seconds, top, &args)
        }
        Command::Coverage => coverage::coverage(&root),
        Command::InstallHooks => install_hooks(&root),
        Command::Slow { cases } => slow::slow(&root, cases),
        Command::Api { check } => api::api(&root, check),
        Command::Mutants { args } => mutants::mutants(&root, &args),
    }
}

/// Whether `cargo nextest` is installed (`docs/04-testing.md`, "Test
/// runner"): `slow`, `coverage` and the pre-push hook use it when it is,
/// and fall back to `cargo test`, with a note, when it isn't.
pub(crate) fn has_nextest(cargo: &std::ffi::OsStr) -> bool {
    process::Command::new(cargo)
        .args(["nextest", "--version"])
        .stdout(process::Stdio::null())
        .stderr(process::Stdio::null())
        .status()
        .is_ok_and(|s| s.success())
}

/// The workspace root: this crate's manifest dir is `<root>/xtask`, baked
/// in at compile time, so commands work from any working directory.
fn workspace_root() -> Result<PathBuf, String> {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .map(Path::to_path_buf)
        .ok_or_else(|| "xtask manifest has no parent directory".to_owned())
}

/// Cargo's target directory: `CARGO_TARGET_DIR` if set (relative to the
/// root, or absolute), else `<root>/target`.
fn target_dir(root: &Path) -> PathBuf {
    env::var_os("CARGO_TARGET_DIR").map_or_else(|| root.join("target"), |d| root.join(d))
}

/// Compiles `site/**/*.ts` to `.js` (+ source maps) with the pinned
/// TypeScript (`tsconfig.json`). The emitted files are gitignored, so
/// the site isn't servable until this runs.
fn site_ts(root: &Path) -> Result<(), String> {
    let tsc = root.join("node_modules").join(".bin").join("tsc");
    if !tsc.is_file() {
        return Err("TypeScript not installed; run `npm ci` (see README)".to_owned());
    }
    let status = process::Command::new(&tsc)
        .current_dir(root)
        .args(["-p", "tsconfig.json"])
        .status()
        .map_err(|e| format!("failed to run tsc: {e}"))?;
    if !status.success() {
        return Err(format!("TypeScript build failed ({status})"));
    }
    println!("compiled site/**/*.ts");
    Ok(())
}

/// Builds the site: the TypeScript library, then the release wasm
/// modules, copied to `site/pkg/` (`engine.wasm`, `acoustic.wasm`,
/// `sand.wasm`; `swarm.wasm` with `simd128`).
fn site(root: &Path) -> Result<(), String> {
    site_ts(root)?;
    // `cargo run` sets CARGO to the cargo binary running us; reuse it so the
    // pinned toolchain builds the wasm too.
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "build",
            "--release",
            "--target",
            "wasm32-unknown-unknown",
            "-p",
            "engine-web",
            "-p",
            "acoustic-web",
            "-p",
            "sand-web",
        ])
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if !status.success() {
        return Err(format!("wasm build failed ({status})"));
    }
    let simd_dir = target_dir(root).join(SIMD_TARGET);
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "build",
            "--release",
            "--target",
            "wasm32-unknown-unknown",
            "-p",
            "swarm-web",
        ])
        .arg("--target-dir")
        .arg(&simd_dir)
        .env("RUSTFLAGS", "-C target-feature=+simd128")
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if !status.success() {
        return Err(format!("swarm.wasm build failed ({status})"));
    }

    let dest_dir = root.join("site").join("pkg");
    fs::create_dir_all(&dest_dir).map_err(|e| format!("creating {}: {e}", dest_dir.display()))?;
    for (artifact, name) in [
        (WASM_ARTIFACT, "engine.wasm"),
        (ACOUSTIC_ARTIFACT, "acoustic.wasm"),
        (SAND_ARTIFACT, "sand.wasm"),
    ] {
        let src = target_dir(root).join(artifact);
        let dest = dest_dir.join(name);
        let bytes = fs::copy(&src, &dest).map_err(|e| format!("copying {}: {e}", src.display()))?;
        println!("wrote {} ({bytes} bytes)", dest.display());
    }
    let (src, dest) = (simd_dir.join(SWARM_ARTIFACT), dest_dir.join("swarm.wasm"));
    let bytes = fs::copy(&src, &dest).map_err(|e| format!("copying {}: {e}", src.display()))?;
    println!("wrote {} ({bytes} bytes, simd128)", dest.display());
    check_dts(root, &dest_dir)
}

/// Each module's export table against its hand-written `.d.ts`
/// (`abi_check.rs`): the C ABI's types, which no compiler checks.
fn check_dts(root: &Path, pkg: &Path) -> Result<(), String> {
    let js = root.join("site").join("js");
    for (wasm, dts, interface) in [
        ("engine.wasm", "engine.d.ts", "EngineExports"),
        ("acoustic.wasm", "acoustic.d.ts", "AcousticExports"),
        ("sand.wasm", "sand.d.ts", "SandExports"),
        ("swarm.wasm", "swarm.d.ts", "SwarmExports"),
    ] {
        let bytes = fs::read(pkg.join(wasm)).map_err(|e| format!("reading {wasm}: {e}"))?;
        let text = fs::read_to_string(js.join(dts)).map_err(|e| format!("reading {dts}: {e}"))?;
        abi_check::check(&bytes, &text, interface, &format!("{wasm} vs {dts}"))?;
    }
    println!(
        "checked engine.d.ts, acoustic.d.ts, sand.d.ts and swarm.d.ts against the .wasm exports"
    );
    Ok(())
}

/// Runs the math, engine, acoustic, sand and swarm test suites compiled to `wasm32-wasip1`,
/// executed by wasmtime (the runner set in `.cargo/config.toml`). The same
/// golden hashes then have to match on wasm as natively: the cross-platform
/// determinism check (`docs/04-testing.md`).
fn test_wasm(root: &Path) -> Result<(), String> {
    // Fail with an install hint, not cargo's "cannot execute binary file".
    let found = process::Command::new("wasmtime")
        .arg("--version")
        .stdout(process::Stdio::null())
        .status()
        .is_ok_and(|s| s.success());
    if !found {
        return Err(
            "wasmtime not found; install it with `cargo install wasmtime-cli` \
                    (or MacPorts: `sudo port install wasmtime`)"
                .to_owned(),
        );
    }
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "test",
            "--quiet",
            "-p",
            "math",
            "-p",
            "engine",
            "-p",
            "acoustic",
            "-p",
            "sand",
            "-p",
            "swarm",
            "--target",
            "wasm32-wasip1",
        ])
        // wasm targets use panic = abort: a failing test kills the process
        // before libtest prints the output it captured, so the panic message
        // would be lost. --nocapture prints it as it happens.
        .args(["--", "--nocapture"])
        // Test builds optimized: debug wasm under wasmtime took 88 s, this
        // 15 s. Overflow checks and debug assertions stay on (they're
        // separate settings), and optimization doesn't change float results
        // in Rust (no fast-math), so the goldens still compare exactly.
        .env("CARGO_PROFILE_TEST_OPT_LEVEL", "1")
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if !status.success() {
        return Err(format!("wasm tests failed ({status})"));
    }
    // swarm again, built as swarm.wasm ships: with simd128 (its own
    // target dir, as in `site`). The same goldens must hold.
    let cargo = env::var_os("CARGO").unwrap_or_else(|| OsString::from("cargo"));
    let status = process::Command::new(cargo)
        .current_dir(root)
        .args([
            "test",
            "--quiet",
            "-p",
            "swarm",
            "--target",
            "wasm32-wasip1",
        ])
        .arg("--target-dir")
        .arg(target_dir(root).join(SIMD_TARGET))
        .args(["--", "--nocapture"])
        .env("CARGO_PROFILE_TEST_OPT_LEVEL", "1")
        .env("RUSTFLAGS", "-C target-feature=+simd128")
        .status()
        .map_err(|e| format!("failed to run cargo: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!("wasm tests with simd128 failed ({status})"))
    }
}

/// Points git at `.githooks/` (fmt + clippy on commit, tests + wasm check
/// on push). Per clone, because git never copies hook config.
fn install_hooks(root: &Path) -> Result<(), String> {
    let status = process::Command::new("git")
        .current_dir(root)
        .args(["config", "core.hooksPath", ".githooks"])
        .status()
        .map_err(|e| format!("failed to run git: {e}"))?;
    if !status.success() {
        return Err(format!("git config failed ({status})"));
    }
    println!("git hooks enabled: core.hooksPath = .githooks");
    Ok(())
}

#[cfg(test)]
mod tests;
