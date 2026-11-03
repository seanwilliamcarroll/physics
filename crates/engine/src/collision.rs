//! Collision (`docs/08-collision.md`): walls, the broadphase, and
//! (section 4) contact generation. One file per piece, re-exported
//! here.

mod broadphase;
mod wall;

pub use broadphase::candidate_pairs;
pub use wall::Wall;
