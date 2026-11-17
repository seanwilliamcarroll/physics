//! The builds `cargo xtask bench` can measure (`--level`), each with its
//! own record (`docs/bench/<machine>[-<level>].tsv`): the target's
//! baseline (no flags: x86's SSE2, aarch64's NEON), x86-64-v3 (AVX2) and
//! `native` (this CPU: AVX-512 where it has it), and `v8` (the benches
//! built for wasm32-wasip1 with `simd128`, run in Node: the build that
//! ships). Each runs the matching row of the kernels' tuning tables
//! (`force/pairwise/tuning.rs`, `rules/tuning.rs`), so each has its own
//! regressions to catch. `cargo xtask bench-all` runs every level this
//! machine has.

use std::path::{Path, PathBuf};
use std::process;

/// One build to measure.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub(crate) enum Level {
    Baseline,
    X86V3,
    Native,
    V8,
}

impl Level {
    pub(crate) const ALL: [Self; 4] = [Self::Baseline, Self::X86V3, Self::Native, Self::V8];

    /// Its name on the command line and in record names.
    pub(crate) const fn name(self) -> &'static str {
        match self {
            Self::Baseline => "baseline",
            Self::X86V3 => "x86-64-v3",
            Self::Native => "native",
            Self::V8 => "v8",
        }
    }

    pub(crate) fn parse(text: &str) -> Option<Self> {
        Self::ALL.into_iter().find(|l| l.name() == text)
    }

    /// The record's name: the machine's, plus the level's, except the
    /// baseline's (its records predate levels).
    pub(crate) fn record_name(self, machine: &str) -> String {
        match self {
            Self::Baseline => machine.to_owned(),
            other => format!("{machine}-{}", other.name()),
        }
    }

    /// `RUSTFLAGS` for its build; `None`: the repository's own (the
    /// baseline, and wasm's `simd128` from `.cargo/config.toml`).
    pub(crate) const fn rustflags(self) -> Option<&'static str> {
        match self {
            Self::X86V3 => Some("-C target-cpu=x86-64-v3"),
            Self::Native => Some("-C target-cpu=native"),
            Self::Baseline | Self::V8 => None,
        }
    }

    pub(crate) const fn is_wasm(self) -> bool {
        matches!(self, Self::V8)
    }

    /// Where its builds go: the baseline's in `target`, each other level's
    /// in its own (flags change every dependency's build, so sharing would
    /// rebuild everything at every switch).
    pub(crate) fn target_dir(self, target: &Path) -> PathBuf {
        match self {
            Self::Baseline => target.to_path_buf(),
            other => target.join(format!("bench-{}", other.name())),
        }
    }

    /// In words, for the record's table.
    pub(crate) fn describe(self) -> String {
        match self {
            Self::Baseline => "baseline (the target's default: no `target-cpu`)".to_owned(),
            Self::V8 => "v8 (wasm32-wasip1 with `simd128`, in Node)".to_owned(),
            other => format!("{} (`{}`)", other.name(), other.rustflags().unwrap_or("")),
        }
    }
}

/// This machine's CPU, as far as the levels care.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
#[cfg_attr(
    not(target_arch = "x86_64"),
    allow(
        dead_code,
        reason = "the x86 variants are detected only on x86 hosts (the tests use them everywhere)"
    )
)]
pub(crate) enum Cpu {
    /// Not x86 (aarch64: the baseline already is the vector unit).
    #[default]
    Other,
    X86,
    X86Avx2,
    X86Avx512,
}

/// What this machine has, for [`available`].
#[derive(Clone, Copy, Debug, Default)]
pub(crate) struct Host {
    pub cpu: Cpu,
    pub node: bool,
}

/// The levels this machine can run, in order: the baseline always;
/// x86-64-v3 with AVX2; `native` with AVX-512 (without it, on x86 it would
/// be v3 again; on aarch64 the baseline already is the M-series' vector
/// unit); `v8` where Node is.
pub(crate) fn available(host: Host) -> Vec<Level> {
    let mut out = vec![Level::Baseline];
    if matches!(host.cpu, Cpu::X86Avx2 | Cpu::X86Avx512) {
        out.push(Level::X86V3);
    }
    if host.cpu == Cpu::X86Avx512 {
        out.push(Level::Native);
    }
    if host.node {
        out.push(Level::V8);
    }
    out
}

/// What this machine has.
pub(crate) fn host(root: &Path) -> Host {
    let node = process::Command::new("node")
        .arg("--version")
        .current_dir(root)
        .output()
        .is_ok_and(|o| o.status.success());
    #[cfg(target_arch = "x86_64")]
    let cpu = if std::arch::is_x86_feature_detected!("avx512f") {
        Cpu::X86Avx512
    } else if std::arch::is_x86_feature_detected!("avx2") {
        Cpu::X86Avx2
    } else {
        Cpu::X86
    };
    #[cfg(not(target_arch = "x86_64"))]
    let cpu = Cpu::Other;
    Host { cpu, node }
}

/// Every executable in cargo's `--message-format=json` output, in order.
/// A string search, not a JSON parser (as `profile::executable`).
pub(crate) fn executables(json: &str) -> Vec<PathBuf> {
    json.lines()
        .filter_map(|l| {
            let (_, rest) = l.split_once("\"executable\":\"")?;
            let (path, _) = rest.split_once('"')?;
            Some(PathBuf::from(path))
        })
        .collect()
}

#[cfg(test)]
mod tests;
