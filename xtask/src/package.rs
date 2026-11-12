//! `cargo xtask package`: the `physics-engine` npm package for the
//! website (`docs/16-site-demos.md`): `engine.wasm`, its types, the ABI's
//! constants, the loader and the buffer views, as a tarball in
//! `target/package/`. Not published to a registry: the tarball is
//! attached to a GitHub release, and the site depends on its URL.
//!
//! The command checks what it made: it unpacks the tarball as a
//! dependency of a scratch project, type-checks a consumer against the
//! package's `.d.ts`, and runs the fountain through the package's own
//! entry points in Node. A package that can't be used fails here.

use std::env;
use std::ffi::OsString;
use std::fs;
use std::path::{Path, PathBuf};
use std::process;

/// The package's name: in its `package.json`, its tarball, and the
/// website's imports.
pub(crate) const NAME: &str = "physics-engine";

/// The files compiled from `site/js/` (`package/tsconfig.json`), each a
/// `.js` with a `.d.ts`.
const COMPILED: [&str; 4] = ["engine-package", "engine-loader", "engine-views", "abi"];

/// The workspace's version: `version = "…"` under `[workspace.package]`
/// in the root `Cargo.toml`. A string search, not a TOML parser: one
/// field of our own file.
#[must_use]
pub(crate) fn workspace_version(cargo_toml: &str) -> Option<&str> {
    let (_, section) = cargo_toml.split_once("[workspace.package]")?;
    // The section ends at the next table header.
    let section = section.split("\n[").next()?;
    section.lines().find_map(|line| {
        let (key, value) = line.split_once('=')?;
        (key.trim() == "version").then(|| value.trim().trim_matches('"'))
    })
}

/// Whether `v` is `MAJOR.MINOR.PATCH`, digits only: what a release is
/// tagged with.
#[must_use]
pub(crate) fn is_release_version(v: &str) -> bool {
    let parts: Vec<&str> = v.split('.').collect();
    parts.len() == 3
        && parts
            .iter()
            .all(|p| !p.is_empty() && p.bytes().all(|b| b.is_ascii_digit()))
}

/// The package's `package.json`.
#[must_use]
pub(crate) fn package_json(version: &str) -> String {
    format!(
        r#"{{
  "name": "{NAME}",
  "version": "{version}",
  "description": "The physics engine as WebAssembly, with its types and a loader.",
  "license": "MIT",
  "repository": "github:seanwilliamcarroll/physics",
  "type": "module",
  "sideEffects": false,
  "exports": {{
    ".": {{
      "types": "./engine-package.d.ts",
      "default": "./engine-package.js"
    }},
    "./engine.wasm": "./engine.wasm"
  }},
  "types": "./engine-package.d.ts",
  "files": [
    "*.js",
    "*.d.ts",
    "engine.wasm"
  ]
}}
"#
    )
}

/// A `.d.ts` with its relative `"./x.ts"` specifiers pointing at
/// `"./x.js"`. `tsc` rewrites them in the `.js` it emits
/// (`rewriteRelativeImportExtensions`) but leaves declarations as
/// written, and the package holds no `.ts` sources for them to find.
#[must_use]
pub(crate) fn js_specifiers(dts: &str) -> String {
    dts.lines()
        .map(|line| {
            let relative = line.contains("from \"./") || line.contains("import(\"./");
            if relative {
                line.replace(".ts\"", ".js\"")
            } else {
                line.to_owned()
            }
        })
        .collect::<Vec<_>>()
        .join("\n")
        + "\n"
}

/// The tarball's file name, as `npm pack` writes it.
#[must_use]
pub(crate) fn tarball_name(version: &str) -> String {
    format!("{NAME}-{version}.tgz")
}

/// Runs `program` with `args` in `dir`; an error naming `what` if it
/// can't start or fails.
fn run(what: &str, program: &Path, args: &[&str], dir: &Path) -> Result<(), String> {
    let status = process::Command::new(program)
        .current_dir(dir)
        .args(args)
        .status()
        .map_err(|e| format!("failed to run {what}: {e}"))?;
    if status.success() {
        Ok(())
    } else {
        Err(format!("{what} failed ({status})"))
    }
}

fn copy(from: &Path, to: &Path) -> Result<(), String> {
    fs::copy(from, to)
        .map(|_| ())
        .map_err(|e| format!("copying {} to {}: {e}", from.display(), to.display()))
}

fn write(path: &Path, text: &str) -> Result<(), String> {
    fs::write(path, text).map_err(|e| format!("writing {}: {e}", path.display()))
}

/// A fresh, empty directory at `path`.
fn fresh_dir(path: &Path) -> Result<(), String> {
    if path.exists() {
        fs::remove_dir_all(path).map_err(|e| format!("removing {}: {e}", path.display()))?;
    }
    fs::create_dir_all(path).map_err(|e| format!("creating {}: {e}", path.display()))
}

/// Builds the site (the wasm, checked against its `.d.ts`), assembles
/// the package, packs it, and checks the tarball.
pub(crate) fn package(root: &Path) -> Result<(), String> {
    let manifest = fs::read_to_string(root.join("Cargo.toml"))
        .map_err(|e| format!("reading Cargo.toml: {e}"))?;
    let version = workspace_version(&manifest)
        .filter(|v| is_release_version(v))
        .ok_or("no MAJOR.MINOR.PATCH `version` under [workspace.package] in Cargo.toml")?;
    super::site(root)?;

    let out = super::target_dir(root).join("package");
    let dir = out.join(NAME);
    fresh_dir(&dir)?;
    let tsc = root.join("node_modules").join(".bin").join("tsc");
    let out_dir = dir.to_string_lossy();
    run(
        "tsc (the package's sources)",
        &tsc,
        &["-p", "package/tsconfig.json", "--outDir", &out_dir],
        root,
    )?;
    for name in COMPILED {
        for ext in ["js", "d.ts"] {
            let file = dir.join(format!("{name}.{ext}"));
            if !file.is_file() {
                return Err(format!("tsc didn't emit {}", file.display()));
            }
        }
        let dts = dir.join(format!("{name}.d.ts"));
        let text =
            fs::read_to_string(&dts).map_err(|e| format!("reading {}: {e}", dts.display()))?;
        write(&dts, &js_specifiers(&text))?;
    }
    let js = root.join("site").join("js");
    copy(&js.join("engine.d.ts"), &dir.join("engine.d.ts"))?;
    copy(
        &root.join("site").join("pkg").join("engine.wasm"),
        &dir.join("engine.wasm"),
    )?;
    copy(
        &root.join("package").join("README.md"),
        &dir.join("README.md"),
    )?;
    copy(&root.join("LICENSE"), &dir.join("LICENSE"))?;
    write(&dir.join("package.json"), &package_json(version))?;

    let tarball = out.join(tarball_name(version));
    if tarball.exists() {
        fs::remove_file(&tarball).map_err(|e| format!("removing {}: {e}", tarball.display()))?;
    }
    let npm = PathBuf::from(env::var_os("NPM").unwrap_or_else(|| OsString::from("npm")));
    let out_str = out.to_string_lossy();
    run(
        "npm pack",
        &npm,
        &["pack", "--silent", "--pack-destination", &out_str],
        &dir,
    )?;
    if !tarball.is_file() {
        return Err(format!("npm pack didn't write {}", tarball.display()));
    }
    check(root, &out, &tarball, &tsc)?;
    let bytes = fs::metadata(&tarball).map_or(0, |m| m.len());
    println!("package: wrote {} ({bytes} bytes)", tarball.display());
    Ok(())
}

/// Uses the tarball as a consumer would: unpacked as
/// `node_modules/physics-engine` of a scratch project, a TypeScript
/// consumer type-checked against it, and the fountain run in Node
/// (`xtask/package_check.mjs`).
fn check(root: &Path, out: &Path, tarball: &Path, tsc: &Path) -> Result<(), String> {
    let scratch = out.join("check");
    let installed = scratch.join("node_modules").join(NAME);
    fresh_dir(&installed)?;
    let (tar, dest) = (tarball.to_string_lossy(), installed.to_string_lossy());
    // npm's tarballs hold one top-level directory, `package/`.
    run(
        "tar (unpacking the tarball)",
        Path::new("tar"),
        &["-xzf", &tar, "-C", &dest, "--strip-components", "1"],
        root,
    )?;
    let xtask = root.join("xtask");
    copy(&xtask.join("package_check.mjs"), &scratch.join("check.mjs"))?;
    copy(
        &xtask.join("package_check.ts"),
        &scratch.join("consumer.ts"),
    )?;
    write(
        &scratch.join("tsconfig.json"),
        r#"{ "compilerOptions": { "strict": true, "noEmit": true, "target": "ES2022", "lib": ["ES2022", "DOM"], "module": "ESNext", "moduleResolution": "Bundler", "skipLibCheck": false }, "files": ["consumer.ts"] }
"#,
    )?;
    run(
        "tsc (a consumer of the package)",
        tsc,
        &["-p", "tsconfig.json"],
        &scratch,
    )?;
    run(
        "node (the fountain through the package)",
        Path::new("node"),
        &["check.mjs"],
        &scratch,
    )
}

#[cfg(test)]
mod tests;
