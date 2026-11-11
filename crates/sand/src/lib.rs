//! A falling-sand cellular automaton (M9, `docs/11-falling-sand.md`): a
//! grid of one-byte cells, each a material, updated in place by local
//! rules that only ever swap two cells. Integers only, so a step is
//! bit-identical on every platform.

mod grid;
mod material;
mod random;
mod rules;

pub use grid::{Grid, MAX_CELLS};
pub use material::Material;
pub use rules::DISPERSION;
