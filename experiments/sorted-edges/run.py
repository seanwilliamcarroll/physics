#!/usr/bin/env python3
"""Boids Sorted's span edges (crates/swarm/src/rules/knobs.rs): one set of
lanes per boid (SWARM_SPAN), a masked last block for each span's
leftovers (SWARM_TAIL), and the grid's cell lookup without `floor`
(SWARM_CELL): the 2 x 2 for the first two, the third alone, and all
three. The machinery is experiments/sweep/ (its README).

    experiments/sorted-edges/run.py --levels default,x86-64-v3,native,v8-simd128
"""

import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "sweep"))
from sweep import Experiment, Suite, main  # noqa: E402

# Every knob set in every build: unset, each is the target's (tuning.rs),
# which since round 1 differs between native and wasm.
BEFORE = {"SWARM_SPAN": "per-span", "SWARM_TAIL": "scalar", "SWARM_CELL": "floor"}
SPAN = {"SWARM_SPAN": "per-boid"}
TAIL = {"SWARM_TAIL": "masked"}
CELL = {"SWARM_CELL": "truncate"}
ALL = {**SPAN, **TAIL, **CELL}
TABLE = {**ALL, "SWARM_TAIL": "table"}
# 8 lanes in wasm (16 by default there; natively Sorted already has 8, so
# these match `all` and `table` there).
EIGHT = {"SWARM_LANES": "8"}
EXPERIMENTS = {
    # Round 1: the 2 x 2 of span and tail, the cell alone, all three.
    "base": Experiment(BEFORE),
    "cell": Experiment({**BEFORE, **CELL}),
    "span": Experiment({**BEFORE, **SPAN}),
    "tail": Experiment({**BEFORE, **TAIL}),
    "span-tail": Experiment({**BEFORE, **SPAN, **TAIL}),
    "all": Experiment(ALL),
    # Round 2: the mask from a table, and 8 lanes (for wasm).
    "table": Experiment(TABLE),
    "all-8": Experiment({**ALL, **EIGHT}),
    "table-8": Experiment({**TABLE, **EIGHT}),
}

SUITE = Suite(
    title="Boids Sorted's span edges",
    package="swarm",
    knobs=("SWARM_SPAN", "SWARM_TAIL", "SWARM_CELL", "SWARM_LANES"),
    experiments=EXPERIMENTS,
    reference="base",
    results=HERE / "results",
    functions=(("step_sorted", "<swarm::flock::Flock>::step_sorted"),
               ("grid_fill", "<swarm::grid::Grid>::fill")),
    v8_functions=(("step_sorted", "5Flock11step_sorted"),
                  ("grid_fill", "4Grid4fill")),
    v8_filter="^swarm_step/Sorted/10000$",
    filter="^swarm_step/Sorted/(1000|10000|100000)$",
    perf_benches="swarm_step/Sorted/10000,swarm_step/Sorted/100000",
)

if __name__ == "__main__":
    main(SUITE, __doc__)
