# Setting up a fresh machine

Everything this repo needs, in order, on macOS (MacPorts) or Linux
(Debian/Ubuntu `apt`; other distributions have the same packages under
similar names). Steps 1–5 are required to build, test, and commit; step 6
is optional tooling. Step 7 checks it all works.

## 1. System packages

A C linker (Rust needs one), git, curl, Python 3 (the local dev server),
and Chrome or Chromium (the pre-push browser smoke test).

**macOS:**

```sh
xcode-select --install                 # the linker, git and python3
# Chrome: https://www.google.com/chrome/ (found in /Applications)
```

**Linux:**

```sh
sudo apt install build-essential git curl python3 chromium
```

The smoke test looks for Chrome in `/Applications` and for
`google-chrome`, `google-chrome-stable`, `chromium` or
`chromium-browser` on `PATH`; elsewhere, set `CHROME=/path/to/chrome`.

## 2. Rust, with `rustup`

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

That's all: the exact toolchain (`1.99.1`), its components (rustfmt,
clippy, llvm-tools, rust-analyzer) and both wasm targets are pinned in
`rust-toolchain.toml` and installed by `rustup` the first time `cargo`
runs in the repo.

## 3. Node.js and npm, with `nvm`

Node runs the TypeScript compiler and the site's unit tests. Install it
with [nvm](https://github.com/nvm-sh/nvm), not the system package
manager: the repo pins the version in `.nvmrc`, and nvm reads it.

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.41.0/install.sh | bash
# open a new shell (the installer adds nvm to your shell profile), then,
# in the repo:
nvm install                            # reads .nvmrc: the latest Node 22
```

**Node 22.18 or later.** `node --test` imports the site's `.ts` modules
directly, which needs Node's built-in type stripping, on by default
from 22.18. `nvm install` gets the newest 22.x, which is enough.

In a new shell, `nvm use` (in the repo) picks the pinned version again,
or make it the default once: `nvm alias default 22`.

## 4. wasmtime and cargo-nextest

`wasmtime` runs the crates' tests compiled to wasm (pre-push: goldens
must match native). `cargo-nextest` runs the native tests (pre-push
falls back to `cargo test`, about 6× slower, without it).

```sh
cargo install --locked wasmtime-cli    # or MacPorts: sudo port install wasmtime
cargo install --locked cargo-nextest
```

## 5. The repo, once per clone

```sh
git clone git@github.com:seanwilliamcarroll/physics.git
cd physics
cargo xtask install-hooks              # git config core.hooksPath .githooks
nvm use                                # Node from .nvmrc
npm ci                                 # the pinned TypeScript
```

## 6. Optional tooling

| For | Install |
|---|---|
| `cargo xtask api` (pre-push checks the public API; skipped without it) | `cargo install --locked cargo-public-api` and `rustup toolchain install nightly-2026-10-15 --profile minimal` |
| `cargo xtask mutants`, and the pre-push report with `MUTANTS=1` | `cargo install --locked cargo-mutants` |
| `cargo xtask coverage` | `cargo install --locked cargo-llvm-cov` |
| `cargo xtask profile` (`docs/profiling.md`) | `cargo install --locked samply` |
| Unused dependencies, checked on push when installed | `cargo install --locked cargo-machete` |
| The duplication report (`docs/04-testing.md`, "Duplication") | `cargo install --locked cargo-dupes` |

## 7. Check it works

```sh
cargo xtask site                       # builds the wasm and the TypeScript
cargo nextest run --workspace          # native tests
cargo xtask test-wasm                  # the same tests as wasm, under wasmtime
node --test 'tests/site/**/*.test.js'  # the site's unit tests
cargo xtask smoke                      # headless Chrome loads every page
cargo xtask serve                      # http://127.0.0.1:8000/
```

`git push` runs all of these (`.githooks/pre-push`), so a clean push is
the end-to-end check.

**Long runs** (full mutation testing, `cargo xtask slow`) belong on a
machine that can sit busy for a while; `docs/04-testing.md` has the
commands.
