//! What `cargo xtask smoke` loads and what each load must show. One case
//! table for every milestone's pages, so it grows here, not in the runner.

/// What a case must show.
#[derive(Copy, Clone)]
pub(super) enum Check {
    /// Physics stepped and particles were drawn ([`judge`](super::judge)).
    Draws,
    /// A deliberate Rust panic reached the console via the hook ([`judge_panic`](super::judge_panic)).
    PanicReported,
    /// Audio rendered offline is finite and audible ([`judge_audio`](super::judge_audio)).
    Sounds,
}

/// One page load to check: a name (for the screenshot), the page (relative
/// to `site/`), a URL query, and what it must show.
pub(super) struct Case {
    pub(super) name: &'static str,
    pub(super) page: &'static str,
    pub(super) query: &'static str,
    pub(super) check: Check,
}

const M0: &str = "demos/m0-hello/";
const M1: &str = "demos/m1-orbits/";
const M2: &str = "demos/m2-cluster/";
const M3: &str = "demos/m3-pendulum/";
const M4_CHAIN: &str = "demos/m4-chain/";
const M5: &str = "demos/m5-jelly/";
const M6: &str = "demos/m6-collisions/";
const M6_CRADLE: &str = "demos/m6-cradle/";
const M7: &str = "demos/m7-billiards/";
const M4_DP: &str = "demos/m4-double-pendulum/";
const M9: &str = "demos/m9-falling-sand/";
const S1: &str = "demos/s1-boids/";
const S2: &str = "demos/s2-vicsek/";
const S3: &str = "demos/s3-ants/";
const A1: &str = "demos/a1-string/";
const A2: &str = "demos/a2-waveguide/";
const A3: &str = "demos/a3-piano/";

/// M0: default settings, the other scalar, the size that once rendered a
/// blank canvas (one path over Chrome's ~16 MiB draw-command limit), and
/// the panic hook. M1: all three orbit panels must draw and report finite
/// energy, in both scalars. M2: both panels on the default disk, the
/// unsoftened collapse (energy must stay finite through the blow-up), and
/// a heavier cluster. M3: both solver panels, default and the f32 stress
/// case (100 substeps). M4: the chain (both solver panels) and the double
/// pendulum in both comparison modes. M6: the box (full, with the
/// broadphase overlay), the break with gaps, the cradle and its
/// one-substep case. M7: a hard break, and the tunneling preset (no
/// speculation, one substep). M9: the hourglass, lava into water with
/// chunks off, and the 1920 × 1080 stress grid (each also checks the
/// material accounts held: `site/demos/m9-falling-sand/main.ts`). S1: the
/// default flock (10k, sorted), brute force at 2,000, and 100k boids. S2:
/// the default (4000 at rho = 4), and 10 particles (L = 1.6: under three
/// cells, so brute force). S3: the open field and the double bridge.
pub(super) const CASES: [Case; 36] = [
    Case {
        name: "default",
        page: M0,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "f64",
        page: M0,
        query: "?smoke&scalar=f64&n=1000",
        check: Check::Draws,
    },
    Case {
        name: "500k",
        page: M0,
        query: "?smoke&n=500000",
        check: Check::Draws,
    },
    Case {
        name: "panic",
        page: M0,
        query: "?smoke&panic",
        check: Check::PanicReported,
    },
    Case {
        name: "orbits",
        page: M1,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "orbits32",
        page: M1,
        query: "?smoke&scalar=f32",
        check: Check::Draws,
    },
    Case {
        name: "m2",
        page: M2,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m2eps0",
        page: M2,
        query: "?smoke&scene=collapse&eps_mm=0",
        check: Check::Draws,
    },
    Case {
        name: "m2n1024",
        page: M2,
        query: "?smoke&scene=cluster&n=1024",
        check: Check::Draws,
    },
    Case {
        name: "m3",
        page: M3,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m3f32",
        page: M3,
        query: "?smoke&scalar=f32&substeps=100&beta_pct=0",
        check: Check::Draws,
    },
    Case {
        name: "m4chain",
        page: M4_CHAIN,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m4classic",
        page: M4_CHAIN,
        query: "?smoke&stab=classic",
        check: Check::Draws,
    },
    Case {
        name: "m4dp",
        page: M4_DP,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m4dp32",
        page: M4_DP,
        query: "?smoke&mode=scalar",
        check: Check::Draws,
    },
    Case {
        name: "m5",
        page: M5,
        query: "?smoke",
        check: Check::Draws,
    },
    // Rigid: the force panel falls back to its default k (springs can't be
    // rigid), so every panel stays finite.
    Case {
        name: "m5rigid",
        page: M5,
        query: "?smoke&logk=rigid&grid=4",
        check: Check::Draws,
    },
    Case {
        name: "m6box",
        page: M6,
        query: "?smoke&balls=60&overlay=on",
        check: Check::Draws,
    },
    Case {
        name: "m6break",
        page: M6,
        query: "?smoke&scene=break&gap_mm=5",
        check: Check::Draws,
    },
    Case {
        name: "m6cradle",
        page: M6_CRADLE,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m6cradle1",
        page: M6_CRADLE,
        query: "?smoke&substeps=1&balls=8&pulled=3",
        check: Check::Draws,
    },
    Case {
        name: "m7break",
        page: M7,
        query: "?smoke&break=12",
        check: Check::Draws,
    },
    Case {
        name: "m7tunnel",
        page: M7,
        query: "?smoke&break=12&speculative=off&substeps=1",
        check: Check::Draws,
    },
    Case {
        name: "m9sand",
        page: M9,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "m9lava",
        page: M9,
        query: "?smoke&scene=lava&chunks=off",
        check: Check::Draws,
    },
    Case {
        name: "m9stress",
        page: M9,
        query: "?smoke&w=1920&h=1080",
        check: Check::Draws,
    },
    Case {
        name: "s1boids",
        page: S1,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "s1brute",
        page: S1,
        query: "?smoke&n=2000&neighbours=brute",
        check: Check::Draws,
    },
    Case {
        name: "s1many",
        page: S1,
        query: "?smoke&n=100000",
        check: Check::Draws,
    },
    Case {
        name: "s2vicsek",
        page: S2,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "s2tiny",
        page: S2,
        query: "?smoke&n=10",
        check: Check::Draws,
    },
    Case {
        name: "s3ants",
        page: S3,
        query: "?smoke",
        check: Check::Draws,
    },
    Case {
        name: "s3bridge",
        page: S3,
        query: "?smoke&scene=bridge",
        check: Check::Draws,
    },
    // A1: one second rendered offline (OfflineAudioContext): the worklet
    // loads the module from processorOptions and plays three notes.
    Case {
        name: "a1",
        page: A1,
        query: "?smoke",
        check: Check::Sounds,
    },
    // A2: A4 on the waveguide plucked at ½, rendered offline; its 2nd
    // harmonic must be missing (`missing_db`).
    Case {
        name: "a2",
        page: A2,
        query: "?smoke",
        check: Check::Sounds,
    },
    // A3: a stiff C4 struck at mf, rendered offline; its 10th partial must
    // sit at the stretched frequency, not the harmonic one (`stretch_db`).
    Case {
        name: "a3",
        page: A3,
        query: "?smoke",
        check: Check::Sounds,
    },
];
