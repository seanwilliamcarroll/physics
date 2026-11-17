//! The swarm pages' demos (`docs/15-swarm.md`): each model with its clock,
//! its settings and its drawing into an RGBA buffer, in safe Rust. A
//! [`SwarmDemo`](demo::SwarmDemo) (S1's boids), a
//! [`VicsekDemo`](vicsek_demo::VicsekDemo) (S2), an
//! [`AntDemo`](ant_demo::AntDemo) (S3, S5) and a
//! [`SlimeDemo`](slime_demo::SlimeDemo) (S4), and the [`abi`] codes they
//! share with the page.
//!
//! `swarm-web` puts the C ABI over them and is built only as a `.wasm`
//! (a cdylib). They live here, a plain library, so they can be
//! benchmarked (`benches/render.rs`): a bench can't link a cdylib, and
//! building `swarm-web` as a library too changed its `.wasm` (LTO can't
//! inline a function other crates might call).

pub mod abi;
pub mod ant_demo;
pub mod demo;
pub mod slime_demo;
pub mod vicsek_demo;
