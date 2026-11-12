// S5's evolution of the ant constants, as run natively
// (crates/swarm/examples/evolve_ants.rs: 25 generations of 20, three
// common seeds a generation, seeds 2026; docs/15-swarm.md, S5.3). Data,
// not code: regenerate by rerunning the example.

/** Best and mean fitness (food delivered in S3's training scene, 3,000
 *  steps, the mean over the generation's seeds) per generation. */
export const BEST: number[] = [4493.0, 4453.3, 4887.3, 5157.3, 5150.3, 5237.3, 5198.7, 5266.3, 5254.3, 5277.0, 5289.3, 5317.7, 5344.3, 5339.0, 5412.3, 5368.7, 5448.7, 5398.0, 5426.7, 5452.3, 5434.7, 5433.3, 5436.3, 5423.3, 5435.7];
export const MEAN: number[] = [1573.9, 2313.6, 2686.6, 3345.4, 3428.4, 4074.2, 4223.7, 4517.6, 4641.6, 4667.4, 4838.3, 4770.7, 4532.2, 5068.1, 5047.2, 5040.5, 5196.5, 5171.5, 5234.1, 5240.7, 5314.8, 5326.1, 5330.4, 5327.6, 5216.1];

/** The evolved constants in ant_set_param's units (radians, cells), the
 *  same as AntParams::EVOLVED; and S3's defaults to compare. */
export const EVOLVED = { sensorAngle: 1.3922241, sensorDistance: 1.6743568, turn: 0.5732856, wiggle: 0.050456405, falloff: 0.18709908, diffusion: 0.5, decay: 0.0064318795 };

/** Held-out seeds 1000–1007: mean food delivered. */
export const HELD_OUT = {
  training: { defaults: 1701, evolved: 5394 },
  barriers: { defaults: 404, evolved: 3978 },
};
