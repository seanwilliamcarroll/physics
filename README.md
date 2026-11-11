# physics

A 2D physics engine in Rust, compiled to WebAssembly, driving interactive
demos. A learning project first: clarity and correctness of the core matter
more than feature breadth.

- Design docs: [`docs/`](docs/), starting at [`00-scope.md`](docs/00-scope.md)
- Roadmap: [`docs/05-roadmap.md`](docs/05-roadmap.md)
- Current milestone tasks: [`TASKS.md`](TASKS.md)

## Setup

**A fresh machine: [`docs/setup.md`](docs/setup.md)**, step by step
(system packages, `rustup`, Node through `nvm` and `.nvmrc`, wasmtime,
cargo-nextest, the optional tools, and a check that it all works).

In short: `rustup` (the toolchain and wasm targets are pinned in
`rust-toolchain.toml`), Node 22.18+ via `nvm install` (`.nvmrc`), Python
3, Chrome or Chromium, `wasmtime-cli` and `cargo-nextest`. Then, once
per clone:

```sh
cargo xtask install-hooks     # = git config core.hooksPath .githooks
nvm use && npm ci             # Node from .nvmrc; the pinned TypeScript
```

| Hook | Runs |
|---|---|
| `pre-commit` | JS syntax and type checks (`tsc`), `cargo fmt --check`, `cargo clippy -D warnings` (native and wasm32) |
| `pre-push` | `cargo test`, `node --test`, `cargo xtask test-wasm`, `cargo check --target wasm32-unknown-unknown`, `cargo xtask smoke` |

The hooks check the working tree, not just what's staged.

## Build and test

```sh
cargo test --workspace
cargo clippy --workspace --all-targets -- -D warnings
```

Build and serve the demo site in one command (browsers won't instantiate
wasm from `file://`):

```sh
cargo xtask serve             # http://127.0.0.1:8000/  (or --port N)
```

It compiles the TypeScript and the wasm, serves `site/`, and keeps
`tsc --watch` running, so `.ts` edits only need a page reload. Rust
edits need a rerun. Ctrl-C stops everything. The generated `.js` and
`.js.map` files are gitignored; `cargo xtask site` builds without
serving.

Test coverage (report only, no thresholds; see
[`docs/04-testing.md`](docs/04-testing.md), Coverage):

```sh
cargo xtask coverage          # Rust per crate + HTML in target/llvm-cov/html; site JS
```

`cargo xtask help` lists all commands.

## License

MIT; see [`LICENSE`](LICENSE).

## Contributing

`main` is protected: all changes land through a pull request (squash merge).
Lint policy lives in the root `Cargo.toml` (`[workspace.lints]`) and
`clippy.toml`; the rationale is in [`docs/lint-policy.md`](docs/lint-policy.md).
