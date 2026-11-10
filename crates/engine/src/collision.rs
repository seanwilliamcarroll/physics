//! Collision (`docs/08-collision.md`): walls, the broadphase, and
//! contact generation. One file per piece, re-exported
//! here.

mod broadphase;
mod narrowphase;
mod wall;

pub use broadphase::candidate_pairs;
pub use narrowphase::{Body, CONTACT_MARGIN, Contact, broadphase_cell, find_contacts};
pub use wall::Wall;
