//! Collision (`docs/08-collision.md`): walls, the broadphase, and
//! contact generation. One file per piece, re-exported
//! here.

mod broadphase;
mod narrowphase;
mod segment;
mod wall;

pub use broadphase::candidate_pairs;
pub use narrowphase::{
    Body, CONTACT_MARGIN, Contact, broadphase_cell, find_contacts, pair_impact, segment_impact,
};
pub use segment::{Segment, Statics};
pub use wall::Wall;
