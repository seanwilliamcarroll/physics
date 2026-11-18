//! `cargo xtask mutants-report DIR`: a cargo-mutants output directory
//! (copied back from the compute node) as a triage list.
//!
//! It reads the run's `caught.txt`, `missed.txt`, `timeout.txt` and
//! `unviable.txt` (one mutant per line, `path:line:col: description`) and
//! prints the totals, then the missed and timed-out mutants grouped by
//! file, the file with the most first.
//!
//! - `--commit SHA`, the commit the run was made on: each mutant whose
//!   source line no longer appears in that file at `HEAD` is marked
//!   `[gone]`, since the code it mutated has been rewritten since.
//! - `--previous DIR`, an earlier run: the mutants missed now but not then,
//!   and the other way round. Mutants are matched by file and
//!   description, not position, as lines move between runs.
//! - `--file TEXT`: only the files whose path contains `TEXT`.
//! - `--summary`: per-file counts only (a full run lists hundreds).

use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write as _;
use std::fs;
use std::path::Path;
use std::process;

/// One line of a cargo-mutants outcome list.
#[derive(Debug, Clone, PartialEq, Eq)]
pub(super) struct Mutant {
    pub(super) file: String,
    pub(super) line: u32,
    pub(super) col: u32,
    pub(super) description: String,
}

impl Mutant {
    /// What identifies a mutant across runs: lines move, descriptions don't.
    fn key(&self) -> (String, String) {
        (self.file.clone(), self.description.clone())
    }
}

/// A line of `missed.txt` and the like; `None` for one that isn't
/// `path:line:col: description`.
pub(super) fn parse(line: &str) -> Option<Mutant> {
    let mut parts = line.splitn(4, ':');
    let file = parts.next()?.trim();
    let line_no = parts.next()?.parse().ok()?;
    let col = parts.next()?.parse().ok()?;
    let description = parts.next()?.trim();
    if file.is_empty() || description.is_empty() {
        return None;
    }
    Some(Mutant {
        file: file.to_owned(),
        line: line_no,
        col,
        description: description.to_owned(),
    })
}

/// Every mutant in `text`, skipping lines that don't parse.
pub(super) fn parse_all(text: &str) -> Vec<Mutant> {
    text.lines().filter_map(parse).collect()
}

/// One run's outcome lists.
#[derive(Debug, Default)]
pub(super) struct Run {
    pub(super) caught: usize,
    pub(super) unviable: usize,
    pub(super) missed: Vec<Mutant>,
    pub(super) timeout: Vec<Mutant>,
}

impl Run {
    fn read(dir: &Path) -> Result<Self, String> {
        // `-o DIR` writes DIR/mutants.out; accept either.
        let nested = dir.join("mutants.out");
        let dir = if nested.join("missed.txt").is_file() {
            nested
        } else {
            dir.to_path_buf()
        };
        let list = |name: &str| -> Result<String, String> {
            let p = dir.join(name);
            match fs::read_to_string(&p) {
                Ok(s) => Ok(s),
                // A run with nothing in a category may not write its file.
                Err(e) if e.kind() == std::io::ErrorKind::NotFound && name != "missed.txt" => {
                    Ok(String::new())
                }
                Err(e) => Err(format!("{}: {e}", p.display())),
            }
        };
        Ok(Self {
            caught: list("caught.txt")?
                .lines()
                .filter(|l| !l.is_empty())
                .count(),
            unviable: list("unviable.txt")?
                .lines()
                .filter(|l| !l.is_empty())
                .count(),
            missed: parse_all(&list("missed.txt")?),
            timeout: parse_all(&list("timeout.txt")?),
        })
    }
}

/// The mutants in `now` but not in `before`, matched by [`Mutant::key`]
/// and counted, so a second identical mutant in a file still shows.
pub(super) fn only_in<'a>(now: &'a [Mutant], before: &[Mutant]) -> Vec<&'a Mutant> {
    let mut left: BTreeMap<(String, String), usize> = BTreeMap::new();
    for m in before {
        *left.entry(m.key()).or_default() += 1;
    }
    let mut out = Vec::new();
    for m in now {
        match left.get_mut(&m.key()) {
            Some(n) if *n > 0 => *n -= 1,
            _ => out.push(m),
        }
    }
    out
}

/// Whether the line `line` (1-based) of `then` still appears, ignoring
/// indentation, somewhere in `now`. A blank or missing line counts as
/// still there: there's nothing to tell.
pub(super) fn line_survives(then: &str, line: u32, now: &str) -> bool {
    let Some(text) = then
        .lines()
        .nth(line.saturating_sub(1) as usize)
        .map(str::trim)
    else {
        return true;
    };
    text.is_empty() || now.lines().any(|l| l.trim() == text)
}

/// Mutants grouped by file, the file with the most first (then by path),
/// each file's in line order.
pub(super) fn by_file<'a>(mutants: &[&'a Mutant]) -> Vec<(&'a str, Vec<&'a Mutant>)> {
    let mut groups: BTreeMap<&str, Vec<&Mutant>> = BTreeMap::new();
    for m in mutants {
        groups.entry(m.file.as_str()).or_default().push(m);
    }
    let mut out: Vec<_> = groups.into_iter().collect();
    for (_, ms) in &mut out {
        ms.sort_by_key(|m| (m.line, m.col));
    }
    out.sort_by(|a, b| b.1.len().cmp(&a.1.len()).then(a.0.cmp(b.0)));
    out
}

/// `git` in `root` with `args`: stdout, untrimmed.
fn git(root: &Path, args: &[&str]) -> Result<String, String> {
    let out = process::Command::new("git")
        .current_dir(root)
        .args(args)
        .output()
        .map_err(|e| format!("failed to run git: {e}"))?;
    if out.status.success() {
        Ok(String::from_utf8_lossy(&out.stdout).into_owned())
    } else {
        Err(format!(
            "git {} failed: {}",
            args.join(" "),
            String::from_utf8_lossy(&out.stderr).trim()
        ))
    }
}

/// For each file changed between `commit` and `HEAD`, the line numbers (at
/// `commit`) of `mutants` whose source line is gone from it at `HEAD`.
fn gone_lines(
    root: &Path,
    commit: &str,
    mutants: &[&Mutant],
) -> Result<BTreeSet<(String, u32)>, String> {
    let changed: BTreeSet<String> = git(root, &["diff", "--name-only", commit, "HEAD"])?
        .lines()
        .map(str::to_owned)
        .collect();
    let mut gone = BTreeSet::new();
    let files: BTreeSet<&str> = mutants.iter().map(|m| m.file.as_str()).collect();
    for file in files.into_iter().filter(|f| changed.contains(*f)) {
        let then = git(root, &["show", &format!("{commit}:{file}")])?;
        // Deleted since: every line is gone.
        let now = fs::read_to_string(root.join(file)).unwrap_or_default();
        for m in mutants.iter().filter(|m| m.file == file) {
            if !line_survives(&then, m.line, &now) {
                gone.insert((m.file.clone(), m.line));
            }
        }
    }
    Ok(gone)
}

/// How much of the report to print.
#[derive(Debug, Default)]
pub(crate) struct View<'a> {
    /// The run's commit, for the `[gone]` legend.
    pub(crate) commit: Option<&'a str>,
    /// Only files whose path contains this.
    pub(crate) file: Option<&'a str>,
    /// Per-file counts only, not each mutant.
    pub(crate) summary: bool,
}

/// The report, as text.
pub(super) fn render(
    name: &str,
    run: &Run,
    previous: Option<(&str, &Run)>,
    gone: &BTreeSet<(String, u32)>,
    view: &View,
) -> String {
    let keep = |m: &&Mutant| view.file.is_none_or(|f| m.file.contains(f));
    let mut s = String::new();
    let viable = run.caught + run.missed.len() + run.timeout.len();
    #[expect(
        clippy::cast_precision_loss,
        reason = "mutant counts are thousands, far inside f64's exact range"
    )]
    let rate = if viable == 0 {
        0.0
    } else {
        100.0 * run.caught as f64 / viable as f64
    };
    let _ = writeln!(
        s,
        "{name}: {} caught, {} missed, {} timed out, {} unviable ({:.1}% of viable caught)",
        run.caught,
        run.missed.len(),
        run.timeout.len(),
        run.unviable,
        rate
    );
    let is_gone = |m: &Mutant| gone.contains(&(m.file.clone(), m.line));
    let mark = |m: &Mutant| if is_gone(m) { " [gone]" } else { "" };
    if let Some(c) = view.commit {
        let n = run
            .missed
            .iter()
            .chain(&run.timeout)
            .filter(|m| is_gone(m))
            .count();
        let _ = writeln!(
            s,
            "[gone]: the mutated line is no longer in the file at HEAD ({n} mutants since {c})"
        );
    }

    if let Some((pname, prev)) = previous {
        let mut new = only_in(&run.missed, &prev.missed);
        let mut fixed = only_in(&prev.missed, &run.missed);
        for v in [&mut new, &mut fixed] {
            v.retain(keep);
            v.sort_by(|a, b| (&a.file, a.line, a.col).cmp(&(&b.file, b.line, b.col)));
        }
        let _ = writeln!(
            s,
            "\nAgainst {pname}: {} newly missed, {} no longer missed",
            new.len(),
            fixed.len()
        );
        for (label, list) in [("newly missed", &new), ("no longer missed", &fixed)] {
            if list.is_empty() || view.summary {
                continue;
            }
            let _ = writeln!(s, "  {label}:");
            for m in list {
                let _ = writeln!(s, "    {}:{}: {}{}", m.file, m.line, m.description, mark(m));
            }
        }
    }

    for (label, list) in [("Missed", &run.missed), ("Timed out", &run.timeout)] {
        let refs: Vec<&Mutant> = list.iter().filter(keep).collect();
        if refs.is_empty() {
            continue;
        }
        let _ = writeln!(s, "\n{label}, by file:");
        for (f, ms) in by_file(&refs) {
            let g = ms.iter().filter(|m| !mark(m).is_empty()).count();
            let tail = if g > 0 {
                format!(", {g} gone")
            } else {
                String::new()
            };
            let _ = writeln!(s, "{f} ({}{tail})", ms.len());
            if view.summary {
                continue;
            }
            for m in ms {
                let _ = writeln!(s, "  {}:{} {}{}", m.line, m.col, m.description, mark(m));
            }
        }
    }
    s
}

/// Runs `cargo xtask mutants-report`.
pub(crate) fn report(
    root: &Path,
    dir: &Path,
    previous: Option<&Path>,
    view: &View,
) -> Result<(), String> {
    let run = Run::read(dir)?;
    let prev = previous.map(Run::read).transpose()?;
    let gone = match view.commit {
        Some(c) => {
            let all: Vec<&Mutant> = run.missed.iter().chain(&run.timeout).collect();
            gone_lines(root, c, &all)?
        }
        None => BTreeSet::new(),
    };
    let pname = previous.map(|p| p.display().to_string());
    print!(
        "{}",
        render(
            &dir.display().to_string(),
            &run,
            pname.as_deref().zip(prev.as_ref()),
            &gone,
            view,
        )
    );
    Ok(())
}

#[cfg(test)]
mod tests;
