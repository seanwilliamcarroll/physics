//! Ready-made worlds, shared by tests and demos: the scene you test is the
//! scene you demo. All in SI units.
//!
//! One file per scene (`scenarios/<scene>.rs`), re-exported here, so
//! callers write `scenarios::cluster` whatever file it lives in.

mod cluster;
mod collapse;
mod disk;
mod fountain;
mod orbit;
mod pendulum;
mod shared;

pub use cluster::{
    CLUSTER_RADIUS, CLUSTER_SOFTENING, CLUSTER_SPEED, CLUSTER_SUBSTEPS, CLUSTER_TOTAL_MASS,
    CLUSTER_WEIGHT, cluster, cluster_gravity,
};
pub use collapse::{COLLAPSE_TOTAL_MASS, collapse};
pub use disk::{DISK_CENTRAL_MASS, DISK_INNER_RADIUS, DISK_ORBITERS_TOTAL_MASS, DISK_RADIUS, disk};
pub use fountain::{FOUNTAIN_SUBSTEPS, FOUNTAIN_VX, FOUNTAIN_VY, Fountain};
pub use orbit::{
    ORBIT_CIRCULAR, ORBIT_MASS_RATIO, ORBIT_NOMINAL_PERIOD, ORBIT_SEPARATION, ORBIT_SOFTENING,
    ORBIT_SUBSTEPS, ORBIT_TOTAL_MASS, orbit, orbit_gravity, orbit_period, orbit_relative_speed,
};
pub use pendulum::{PENDULUM_LENGTH, PENDULUM_MASS, pendulum, pendulum_gravity};
pub use shared::{GRAVITATIONAL_CONSTANT, STANDARD_GRAVITY, gravity};

#[cfg(test)]
mod test_util;
