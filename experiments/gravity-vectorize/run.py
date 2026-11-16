#!/usr/bin/env python3
"""Pairwise gravity's build settings, swept: the engine's gravity knobs
(GRAVITY_LOOP, GRAVITY_LANES, GRAVITY_PLAIN_BELOW;
crates/engine/src/force/pairwise/knobs.rs) at each CPU level and in wasm.
The machinery is experiments/sweep/ (its README: levels, output, flags).

    experiments/gravity-vectorize/run.py --experiments sweep
    experiments/gravity-vectorize/run.py --levels default --quick
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "sweep"))
from sweep import Experiment, Suite, main  # noqa: E402

TWO_PASS = ("pass_one", "engine::force::pairwise::two_pass::pass_one::<{s}>")
BLOCKED = ("sweep", "engine::force::pairwise::blocked::sweep::<{s}>")
LANE_COUNTS = (1, 2, 4, 8, 16)

# `default` is the engine as it ships; `plain` the plain loop at every size
# (what main was before the vector loops). The loop experiments set
# GRAVITY_PLAIN_BELOW=1 so every size runs the loop being measured.
EXPERIMENTS = {
    "default": Experiment({}, (TWO_PASS,)),
    "plain": Experiment({"GRAVITY_PLAIN_BELOW": "1000000"}),
}
for n in LANE_COUNTS:
    for loop, fn in (("two-pass", TWO_PASS), ("blocked", BLOCKED)):
        EXPERIMENTS[f"{loop}-l{n}"] = Experiment(
            {"GRAVITY_LOOP": loop, "GRAVITY_LANES": str(n), "GRAVITY_PLAIN_BELOW": "1"},
            (fn,))

SUITE = Suite(
    title="Gravity experiments",
    package="engine",
    knobs=("GRAVITY_LOOP", "GRAVITY_LANES", "GRAVITY_PLAIN_BELOW"),
    experiments=EXPERIMENTS,
    # sweep: both loops (the same bits at each lane count; only the loop
    # differs) at every lane count, against plain.
    presets={"sweep": ["plain"] + [f"{loop}-l{n}" for loop in ("two-pass", "blocked")
                                   for n in LANE_COUNTS]},
    reference="plain",
    results=HERE / "results",
    functions=(("accumulate",
                "<engine::force::PairwiseGravity<{s}> as engine::force::Force<{s}>>::accumulate"),),
    filter="^pairwise_",
    perf_benches="pairwise_f64/1024,pairwise_f32/1024",
    scalars=("f64", "f32"),
    pairs=True,
)

if __name__ == "__main__":
    main(SUITE, __doc__)
