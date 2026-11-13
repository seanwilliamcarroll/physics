//! `cargo xtask bench-wasm`: time the cluster through `engine.wasm` in Node
//! (`xtask/bench_wasm.mjs`) and compare with criterion's native results for
//! the same cases (`crates/engine/benches/step.rs`): the native/wasm ratio
//! `docs/04-testing.md` tracks.

use std::env;
use std::fs;
use std::path::Path;
use std::process;

/// One measured case: criterion group name, body count, wasm ns per step.
#[derive(Debug, PartialEq)]
pub(crate) struct Case {
    pub group: String,
    pub n: usize,
    pub wasm_ns: f64,
}

/// Parses the Node script's output: `<group> <n> <ns>` per line. Pure, so
/// it's unit-tested.
pub(crate) fn parse_cases(stdout: &str) -> Result<Vec<Case>, String> {
    stdout
        .lines()
        .filter(|l| !l.trim().is_empty())
        .map(|line| {
            let mut parts = line.split_whitespace();
            let (Some(group), Some(n), Some(ns), None) =
                (parts.next(), parts.next(), parts.next(), parts.next())
            else {
                return Err(format!("unexpected line from the wasm benchmark: `{line}`"));
            };
            Ok(Case {
                group: group.to_owned(),
                n: n.parse().map_err(|e| format!("bad n in `{line}`: {e}"))?,
                wasm_ns: ns
                    .parse()
                    .map_err(|e| format!("bad time in `{line}`: {e}"))?,
            })
        })
        .collect()
}

/// The mean's `point_estimate` (ns) from criterion's `estimates.json`.
/// Other objects ("median", ...) have a `point_estimate` too, so this looks
/// inside `"mean"` only. A string search, not a JSON parser: the format is
/// criterion's own and stable, and a JSON crate isn't worth it here.
#[must_use]
pub(crate) fn mean_point_estimate(json: &str) -> Option<f64> {
    let (_, mean) = json.split_once("\"mean\":")?;
    let (_, rest) = mean.split_once("\"point_estimate\":")?;
    let end = rest.find([',', '}'])?;
    rest.get(..end)?.trim().parse().ok()
}

/// Builds the site, runs the Node benchmark, and prints native vs wasm.
pub(crate) fn bench_wasm(root: &Path, budget_ms: u32) -> Result<(), String> {
    super::site(root)?;
    let wasm = root.join("site").join("pkg").join("engine.wasm");
    let script = root.join("xtask").join("bench_wasm.mjs");
    println!("timing engine.wasm in Node ({budget_ms} ms per case)…");
    let output = process::Command::new("node")
        .arg(&script)
        .arg(&wasm)
        .arg(budget_ms.to_string())
        .output()
        .map_err(|e| format!("failed to run node: {e}"))?;
    if !output.status.success() {
        return Err(format!(
            "wasm benchmark failed ({}): {}",
            output.status,
            String::from_utf8_lossy(&output.stderr)
        ));
    }
    let cases = parse_cases(&String::from_utf8_lossy(&output.stdout))?;

    let criterion = env::var_os("CARGO_TARGET_DIR")
        .map_or_else(|| root.join("target"), |d| root.join(d))
        .join("criterion");
    println!(
        "{:<22} {:>6} {:>12} {:>12} {:>9}",
        "case", "n", "native", "wasm", "wasm/nat"
    );
    let mut missing = false;
    for c in &cases {
        let path = criterion
            .join(&c.group)
            .join(c.n.to_string())
            .join("new")
            .join("estimates.json");
        let native = fs::read_to_string(&path)
            .ok()
            .as_deref()
            .and_then(mean_point_estimate);
        missing |= native.is_none();
        let (nat, ratio) = native.map_or(("—".to_owned(), "—".to_owned()), |ns| {
            (format_ns(ns), format!("{:.2}", c.wasm_ns / ns))
        });
        println!(
            "{:<22} {:>6} {nat:>12} {:>12} {ratio:>9}",
            c.group,
            c.n,
            format_ns(c.wasm_ns)
        );
    }
    if missing {
        println!(
            "(no native numbers for some cases: run `cargo bench -p engine --bench step` first)"
        );
    }
    println!("note: wasm times include the O(n) render-buffer fill; native is World::step alone");
    modules(root, budget_ms)
}

/// The other modules (`xtask/bench_modules.mjs`): sand, boids, Vicsek,
/// ants and Physarum through their exports, as the docs quote them.
fn modules(root: &Path, budget_ms: u32) -> Result<(), String> {
    let script = root.join("xtask").join("bench_modules.mjs");
    println!("\ntiming sand.wasm and swarm.wasm in Node ({budget_ms} ms per case)…");
    let output = process::Command::new("node")
        .arg(&script)
        .arg(root.join("site").join("pkg"))
        .arg(budget_ms.to_string())
        .output()
        .map_err(|e| format!("failed to run node: {e}"))?;
    if !output.status.success() {
        return Err(format!(
            "module benchmark failed ({}): {}",
            output.status,
            String::from_utf8_lossy(&output.stderr)
        ));
    }
    println!("{:<10} {:<28} {:>12}", "module", "case", "wasm");
    for line in String::from_utf8_lossy(&output.stdout).lines() {
        let mut parts = line.split('\t');
        if let (Some(m), Some(case), Some(ns)) = (parts.next(), parts.next(), parts.next()) {
            let ns: f64 = ns
                .parse()
                .map_err(|e| format!("bad time in `{line}`: {e}"))?;
            println!("{m:<10} {case:<28} {:>12}", format_ns(ns));
        }
    }
    Ok(())
}

/// Nanoseconds as a readable duration.
pub(crate) fn format_ns(ns: f64) -> String {
    if ns < 1e3 {
        format!("{ns:.0} ns")
    } else if ns < 1e6 {
        format!("{:.1} µs", ns / 1e3)
    } else {
        format!("{:.2} ms", ns / 1e6)
    }
}

#[cfg(test)]
mod tests;
