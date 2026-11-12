# References

Canonical bibliography for all design docs. Links verified November 2026.
Prefer the open-access link where both exist.

## Solvers and constraints (`01-solvers.md`, M3–M7)

**Catto, E. (2006).** *Fast and Simple Physics using Sequential Impulses.* GDC 2006.
Origin of Box2D Lite; sequential impulses, accumulated impulses, warm starting.
- PDF: https://box2d.org/files/ErinCatto_SequentialImpulses_GDC2006.pdf

**Catto, E. (2005).** *Iterative Dynamics with Temporal Coherence.* GDC 2005.
The derivation behind sequential impulses (PGS formulation).
- PDF: https://box2d.org/files/ErinCatto_IterativeDynamics_GDC2005.pdf

**Catto, E. (2009).** *Modeling and Solving Constraints.* GDC 2009.
- PDF: https://box2d.org/files/ErinCatto_ModelingAndSolvingConstraints_GDC2009.pdf

**Catto, E. (2011).** *Soft Constraints: Reinventing the Spring.* GDC 2011.
Maps a spring (stiffness, damping) onto the impulse solver's update:
the soft form both solvers share in M4 (`06-constraints.md`).
- PDF: https://box2d.org/files/ErinCatto_SoftConstraints_GDC2011.pdf

**Catto, E. (2014).** *Understanding Constraints.* GDC 2014.
- PDF: https://box2d.org/files/ErinCatto_UnderstandingConstraints_GDC2014.pdf

**Catto, E. (2024).** *Solver2D.* box2d.org blog.
Side-by-side comparison of many 2D solvers (PGS, TGS, XPBD, soft step).
The closest existing work to our side-by-side demos.
- https://box2d.org/posts/2024/02/solver2d/

**Müller, M., Heidelberger, B., Hennix, M., Ratcliff, J.** *Position Based Dynamics.*
Workshop version: VRIPHYS 2006 (open access). Journal version: J. Visual
Communication and Image Representation 18(2):109–118, 2007.
- VRIPHYS 2006 (open): https://diglib.eg.org/items/deb0a7a1-2ddf-496f-889a-fe0df1feeb73
- Journal DOI: https://doi.org/10.1016/j.jvcir.2007.01.005

**Macklin, M., Müller, M., Chentanez, N. (2016).** *XPBD: Position-Based
Simulation of Compliant Constrained Dynamics.* Motion in Games (MIG) 2016.
- PDF: https://matthias-research.github.io/pages/publications/XPBD.pdf
- DOI: https://doi.org/10.1145/2994258.2994272

**Macklin, M., Storey, K., Lu, M., Terdiman, P., Chentanez, N., Jeschke, S.,
Müller, M. (2019).** *Small Steps in Physics Simulation.* SCA 2019.
The case for substeps over iterations.
- Eurographics Digital Library: https://diglib.eg.org/handle/10.1145/3309486-3340247
- Author PDF: http://mmacklin.com/smallsteps.pdf

**Müller, M., Macklin, M., Chentanez, N., Jeschke, S., Kim, T.-Y. (2020).**
*Detailed Rigid Body Simulation with Extended Position Based Dynamics.* SCA 2020.
XPBD for rigid bodies, including the velocity pass for restitution and friction.
- PDF: https://matthias-research.github.io/pages/publications/PBDBodies.pdf

**Müller, M.** *Ten Minute Physics.* Video tutorials and source for PBD/XPBD
demos in the browser. Useful companion for M3–M5.
- http://matthiasmueller.info/tenMinutePhysics

**Smith, B., Kaufman, D. M., Vouga, E., Tamstorf, R., Grinspun, E.
(2012).** *Reflections on Simultaneous Impact.* ACM Transactions on
Graphics 31(4) (SIGGRAPH 2012). Why simultaneous impacts are hard: the
LCP sticks (no break-away, Newton's cradle), pairwise Gauss–Seidel
breaks symmetry; Generalized Reflections (rounds of jointly reflected
approaching contacts) keeps both, and energy. The impulse solver's
impact stage (M6.7, `08-collision.md`). A later paper by the same
group, *All's Well That Ends Well* (2017,
https://doi.org/10.1145/3072959.3073689), guarantees termination.
- DOI: https://doi.org/10.1145/2185520.2185602
- Project page: https://www.cs.columbia.edu/cg/rosi/

## Billiards (`09-billiards.md`, M7)

**World Pool-Billiard Association.** *Recommended Equipment
Specifications* (effective November 2001). Table, ball, pocket and
cushion dimensions (§5, §7, §9, §16).
- PDF: https://wpapool.com/wp-content/uploads/2024/01/RECOMMENDED-EQUIPMENT-SPECIFICATIONS.pdf

**Mathavan, S., Jackson, M. R. & Parkin, R. M. (2009).** Application of
high-speed imaging to determine the dynamics of billiards. *American
Journal of Physics* 77(9), 788–794. Measured sliding and rolling
friction (values behind the paywall; not used).
- DOI: https://doi.org/10.1119/1.3157159

**Mathavan, S., Jackson, M. R. & Parkin, R. M. (2010).** A theoretical
analysis of billiard ball dynamics under cushion impacts. *Proceedings of
the IMechE, Part C* 224(9), 1863–1873. The cushion above the ball's
centre (not modelled); `e = 0.98` and `μ = 0.14` under their model.
- DOI: https://doi.org/10.1243/09544062JMES1964

**Alciatore, D. G.** *Pool and Billiards Physics Resources*, Colorado State
University: typical physical properties (`μ_s` 0.2, `μ_r` 0.01, ball–ball
`e` 0.90–0.96) and technical proofs. The page refuses automated fetches;
values taken via his proofs and pooltool's defaults, to confirm by hand.
- https://billiards.colostate.edu/faq/physics/physical-properties/

**Kiefl, E.** *pooltool* (billiards simulator). Its ball parameter
defaults, citing Alciatore.
- https://pooltool.readthedocs.io/

## Falling sand (`11-falling-sand.md`, M9)

**Purho, P. (2019).** *Exploring the Tech and Design of Noita.* GDC 2019,
Independent Games Summit. Bottom-up updates, chunks with dirty
rectangles, a four-pass checkerboard for threads (as summarized by
80.lv, below; the talk is free on GDC's YouTube channel).
- https://gdcvault.com/play/1025695/Exploring-the-Tech-and-Design
- https://80.lv/articles/noita-a-game-based-on-falling-sand-simulation/

**Toffoli, T. & Margolus, N. (1987).** *Cellular Automata Machines: A New
Environment for Modeling.* MIT Press. The Margolus (block) neighbourhood:
order-free and conserving by construction; weighed for M9, noted for M10.
- DOI: https://doi.org/10.7551/mitpress/1763.001.0001

## Swarms (`15-swarm.md`, S1–S5)

**Reynolds, C. W. (1987).** *Flocks, herds and schools: a distributed
behavioral model.* SIGGRAPH Computer Graphics 21(4), 25–34. Boids:
separation, alignment and cohesion from local perception.
- DOI: https://doi.org/10.1145/37402.37406

**Couzin, I. D., Krause, J., James, R., Ruxton, G. D. & Franks, N. R.
(2002).** *Collective memory and spatial sorting in animal groups.* J.
Theor. Biol. 218(1), 1–11. Zones of repulsion, orientation and
attraction; group polarization, S1's order measure.
- DOI: https://doi.org/10.1006/jtbi.2002.3065

**Vicsek, T., Czirók, A., Ben-Jacob, E., Cohen, I. & Shochet, O.
(1995).** *Novel type of phase transition in a system of self-driven
particles.* Phys. Rev. Lett. 75(6), 1226–1229. The order parameter `v_a`
and its transition with noise (S2).
- DOI: https://doi.org/10.1103/PhysRevLett.75.1226

**Grégoire, G. & Chaté, H. (2004).** *Onset of collective and cohesive
motion.* Phys. Rev. Lett. 92(2), 025702. The Vicsek transition is
"always discontinuous" (S2's reading of its curves).
- DOI: https://doi.org/10.1103/PhysRevLett.92.025702

**Chaté, H., Ginelli, F., Grégoire, G. & Raynaud, F. (2008).**
*Collective motion of self-propelled particles interacting without
cohesion.* Phys. Rev. E 77(4), 046113. First-order-like onset;
propagating high-density structures near it.
- DOI: https://doi.org/10.1103/PhysRevE.77.046113

**Chen, M. Z. Q. & Zhang, H.-T. (2007).** *Comment on "Novel type of
phase transition in a system of self-driven particles".* arXiv
preprint (no journal version found). The 0/0 case, "direction
annihilation", and three fixes; S2 keeps the heading and counts it.
- arXiv: https://arxiv.org/abs/cond-mat/0703532

**Baglietto, G. & Albano, E. V. (2008).** *Finite-size scaling analysis
and dynamic study of the critical behavior of a model for the
collective displacement of self-driven individuals.* Phys. Rev. E
78(2), 021125. (Cited, not yet read.)
- DOI: https://doi.org/10.1103/PhysRevE.78.021125

**Goss, S., Aron, S., Deneubourg, J.-L. & Pasteels, J. M. (1989).**
*Self-organized shortcuts in the Argentine ant.* Naturwissenschaften
76(12), 579–581. The double bridge: a colony converging on the shorter
route (S3's experiment is ours, in its spirit). Not yet read.
- DOI: https://doi.org/10.1007/BF00462870

**Deneubourg, J.-L., Aron, S., Goss, S. & Pasteels, J. M. (1990).** *The
self-organizing exploratory pattern of the Argentine ant.* J. Insect
Behav. 3(2), 159–168. Trail laying and following. Not yet read.
- DOI: https://doi.org/10.1007/BF01417909

**Beckers, R., Deneubourg, J.-L. & Goss, S. (1992).** *Trails and U-turns
in the selection of a path by the ant Lasius niger.* J. Theor. Biol.
159(4), 397–415. U-turns. Not yet read.
- DOI: https://doi.org/10.1016/S0022-5193(05)80686-1

**Dorigo, M., Maniezzo, V. & Colorni, A. (1996).** *Ant system:
optimization by a colony of cooperating agents.* IEEE Trans. SMC-B
26(1), 29–41. Pheromone as positive feedback with evaporation, on
graphs (context for S3). Not yet read.
- DOI: https://doi.org/10.1109/3477.484436

**Jones, J. (2011; online 2010).** *Influences on the formation and
evolution of Physarum polycephalum inspired emergent transport
networks.* Natural Computing 10(4), 1345–1369. Networks between nutrient
sources (S4's nodes). Not read.
- DOI: https://doi.org/10.1007/s11047-010-9223-z

*Secondary:* Jenson, S., *physarum*
(https://cargocollective.com/sagejenson/physarum): the agent step's
structure, the 3 × 3 mean filter, multiplicative decay; no values.

**Eiben, A. E. & Smith, J. E. (2015).** *Introduction to Evolutionary
Computing*, 2nd ed. Springer. The terms S5 uses (tournament selection,
Gaussian mutation, elitism). Not read.
- DOI: https://doi.org/10.1007/978-3-662-44874-8

**Hansen, N. & Ostermeier, A. (2001).** *Completely derandomized
self-adaptation in evolution strategies.* Evolutionary Computation
9(2), 159–195. CMA-ES: noted for S5, not built. Not read.
- DOI: https://doi.org/10.1162/106365601750190398

**Werfel, J., Petersen, K. & Nagpal, R. (2014).** *Designing collective
behavior in a termite-inspired robot construction team.* Science
343(6172), 754–758. Collective construction: S5's deferred half. Not
read.
- DOI: https://doi.org/10.1126/science.1245842

**Allen, M. P. & Tildesley, D. J. (2017).** *Computer Simulation of
Liquids*, 2nd ed. Oxford University Press. Cell lists for fixed-radius
neighbours: S1's grid.
- DOI: https://doi.org/10.1093/oso/9780198803195.001.0001

**Hockney, R. W. & Eastwood, J. W.** *Computer Simulation Using
Particles* (1981; CRC Press reprint 2021). The chaining mesh, the cell
list's origin.
- DOI: https://doi.org/10.1201/9780367806934

*Secondary:* Adams, V. H., *Boids algorithm* (ECE 4760, Cornell; the
parameter values and update order, read 2026-11-11):
https://vanhunteradams.com/Pico/Animal_Movement/Boids-algorithm.html.
Reynolds, C. W. (1999), *Steering behaviors for autonomous characters*,
GDC (flee): http://www.red3d.com/cwr/steer/gdc99/. Le Grand, S. (2007),
*Broad-phase collision detection with CUDA*, GPU Gems 3, ch. 32.

## Integrators and stability (`07-soft-bodies.md`, M1–M5)

**Hairer, E., Lubich, C., Wanner, G. (2006).** *Geometric Numerical
Integration: Structure-Preserving Algorithms for Ordinary Differential
Equations.* 2nd ed., Springer Series in Computational Mathematics 31.
Symplectic methods (symplectic Euler, Störmer–Verlet) and why they keep
phase-space area; the linear stability analysis behind M5's `k_crit`.
- DOI: https://doi.org/10.1007/3-540-30666-8

## N-body (M1–M2)

**Barnes, J., Hut, P. (1986).** *A hierarchical O(N log N) force-calculation
algorithm.* Nature 324:446–449. (M2 stretch: Barnes–Hut quadtree;
`barnes-hut.md`.)
- DOI: https://doi.org/10.1038/324446a0

**Salmon, J. K., Warren, M. S. (1994).** *Skeletons from the Treecode
Closet.* Journal of Computational Physics 111(1):136–155. Worst-case
errors of tree codes: the classic opening test's error has no bound for a
target just outside a lopsided cell; why the engine's test adds the
center of mass's offset δ (audit after A3, `barnes-hut.md`).
- DOI: https://doi.org/10.1006/jcph.1994.1050

## Acoustic track (A1–A5)

**Karplus, K., Strong, A. (1983).** *Digital Synthesis of Plucked-String and
Drum Timbres.* Computer Music Journal 7(2):43–55.
The original loop: noise in a delay line, fed back through a two-point
average (A1).
- DOI: https://doi.org/10.2307/3680062

**Jaffe, D. A., Smith, J. O. (1983).** *Extensions of the Karplus-Strong
Plucked-String Algorithm.* Computer Music Journal 7(2):56–69.
Fractional-delay tuning, decay stretching, dynamics, pick position (A1).
- DOI: https://doi.org/10.2307/3680063
- JSTOR: https://www.jstor.org/stable/3680063

**Smith, J. O.** *Physical Audio Signal Processing.* Online book (CCRMA,
Stanford), 2010 edition; print by W3K Publishing, ISBN 978-0-9745607-2-4.
Digital waveguides, Karplus–Strong as a waveguide special case, commuted
losses, piano models (A1–A3; `13-waveguide.md`).
- https://ccrma.stanford.edu/~jos/pasp/

**Van Duyne, S. A., Smith, J. O. (1993).** *Physical Modeling with the 2-D
Digital Waveguide Mesh.* Proc. ICMC 1993, pp. 40–47.
Shows the mesh coincides with the standard FD scheme for the 2D wave
equation and derives its dispersion error (A5).
- PDF (CCRMA): https://ccrma.stanford.edu/~jos/pdf/mesh.pdf
- Mirror (Land, ECE 5760): https://people.ece.cornell.edu/land/courses/ece5760/LABS/f2008/vanduyne93physical.pdf

**Chaigne, A., Askenfelt, A. (1994).** *Numerical simulations of piano strings.
I. A physical model for a struck string using finite difference methods.*
J. Acoust. Soc. Am. 95(2):1112–1118. Nonlinear felt hammer, stiff string (A3).
- DOI: https://doi.org/10.1121/1.408459

**Chaigne, A., Askenfelt, A. (1994).** *Numerical simulations of piano strings.
II. Comparisons with measurements and systematic exploration of some hammer-string
parameters.* J. Acoust. Soc. Am. 95(3):1631–1640 (A3).
- DOI: https://doi.org/10.1121/1.408549

**Fletcher, H. (1964).** *Normal Vibration Frequencies of a Stiff Piano String.*
J. Acoust. Soc. Am. 36(1):203–209. `f_k = k F₀ √(1 + B k²)` (A3,
`14-piano.md`).
- DOI: https://doi.org/10.1121/1.1918933

**Young, R. W. (1952).** *Inharmonicity of Plain Wire Piano Strings.* J.
Acoust. Soc. Am. 24(3):267–273 (A3).
- DOI: https://doi.org/10.1121/1.1906888

**Rigaud, F., David, B., Daudet, L. (2011).** *A Parametric Model of Piano
Tuning.* Proc. DAFx-11, Paris, pp. 393–399. `B` along the keyboard as two
log-linear asymptotes; the treble line's constants (A3).
- PDF: https://www.dafx.de/paper-archive/2011/Papers/53_e.pdf
- HAL: https://hal.science/hal-00727395

**Ortiz-Berenguer, L. I., Casajús-Quirós, F. J., Torres-Guijarro, M.,
Beracoechea, J. A. (2004).** *Piano Transcription Using Pattern Recognition:
Aspects on Parameter Extraction.* Proc. DAFx-04, Naples. `B` ≈ 2 · 10⁻⁴ for A0
on a Steinway & Sons grand (A3).
- PDF: https://dafx.de/paper-archive/2004/P_212.PDF

**Dalmont, J.-P. (2021).** *Piano bass strings with reduced inharmonicity:
theory and experiments.* Acta Acustica 5:9. The order of `B` in the bass (A3).
- DOI: https://doi.org/10.1051/aacus/2021002

**Van Duyne, S. A., Smith, J. O. (1994).** *A Simplified Approach to Modeling
Dispersion Caused by Stiffness in Strings and Plates.* Proc. ICMC 1994,
Aarhus. The allpass cascade (A3).
- https://quod.lib.umich.edu/i/icmc/bbp2372.1994.105

**Rauhala, J., Välimäki, V. (2006).** *Tunable Dispersion Filter Design for
Piano Synthesis.* IEEE Signal Processing Letters 13(5):253–256 (A3).
- DOI: https://doi.org/10.1109/LSP.2006.870376

**Abel, J. S., Välimäki, V., Smith, J. O. (2010).** *Robust, Efficient
Design of Allpass Filters for Dispersive String Sound Synthesis.* IEEE
Signal Processing Letters 17(4):406–409. The biquad cascade's placement
(A3.2), from its Matlab, `adf.m`, on the CCRMA wiki.
- DOI: https://doi.org/10.1109/LSP.2010.2040924
- `adf.m`: https://ccrma.stanford.edu/wiki/Dispersion_Filter_Design

**Bristow-Johnson, R.** *Audio EQ Cookbook* (W3C Group Note, from his
Audio-EQ-Cookbook.txt). Biquad designs; the body's bandpasses (constant
0 dB peak gain) (A3.4).
- https://www.w3.org/TR/audio-eq-cookbook/

**Chabassier, J., Chaigne, A., Joly, P. (2013).** *Modeling and Simulation
of a Grand Piano.* J. Acoust. Soc. Am. 134(1):648–665. A full piano model
whose discrete equations are energy-preserving schemes; the hammer's
energy-conserving step (A3.3).
- DOI: https://doi.org/10.1121/1.4809649

**Weinreich, G. (1977).** *Coupled Piano Strings.* J. Acoust. Soc. Am.
62(6):1474–1484. Double decay and polarization from coupling at the bridge
(A3, out of scope).
- DOI: https://doi.org/10.1121/1.381677

**Russell, D. A.** *The piano hammer as a nonlinear spring.* Acoustics and
Vibration Animations, Penn State. Measured ranges of the felt exponent `p`
(A3).
- https://www.acs.psu.edu/drussell/piano/nonlinearhammer.html

**Askenfelt, A.** *From touch to string vibrations* (lecture notes, KTH Speech,
Music and Hearing). Hammer–string contact times by register and dynamic (A3).
- https://www.speech.kth.se/music/5_lectures/askenflt/stricont.html

**Bilbao, S. (2009).** *Numerical Sound Synthesis: Finite Difference Schemes
and Simulation in Musical Acoustics.* Wiley. ISBN 978-0-470-51046-9.
Ch. 6 (1D wave), Ch. 11 (2D wave, incl. waveguide meshes and lumped
mass–spring networks: a direct bridge to the core engine), stiff strings,
nonlinear strings and plates (A2–A5).
- Publisher info and MATLAB code: https://au.mathworks.com/academia/books/numerical-sound-synthesis-bilbao.html

**Adib, A. B. (2000).** *Study Notes on Numerical Solutions of the Wave Equation
with the Finite Difference Method.* arXiv:physics/0009068.
Leapfrog scheme, Courant criterion, 1D and 2D. Assigned reading in Land's
ECE 5760; the basis of the drum lab (A4).
- arXiv: https://arxiv.org/abs/physics/0009068

**Cooley, J. W., Tukey, J. W. (1965).** *An Algorithm for the Machine
Calculation of Complex Fourier Series.* Mathematics of Computation
19(90):297–301. The radix-2 FFT behind A2's spectrum
(`13-waveguide.md`).
- DOI: https://doi.org/10.1090/S0025-5718-1965-0178586-1

**W3C. *Web Audio API 1.1*.** Working Draft (September 2026 when checked).
`AudioContext`, `AudioWorklet`, the render quantum (128 frames by
default; `renderSizeHint`) (A1, `12-acoustic-foundations.md`).
- https://www.w3.org/TR/webaudio/

## Course material (Bruce Land, Cornell)

**ECE 5760 drum lab** (FD 2D wave equation on FPGA). Archived per semester.
- Spring 2016: https://people.ece.cornell.edu/land/courses/ece5760/LABS/s2016/lab3.html
- Spring 2019 (with tension nonlinearity): https://people.ece.cornell.edu/land/courses/ece5760/LABS/s2019/lab2_drum.html

**ECE 4760 Karplus–Strong synthesis** (current RP2040 version).
- https://people.ece.cornell.edu/land/courses/ece4760/RP2040/C_SDK_DSP/index_KS_synth.html

**Carroll, S., Moore, N., Talmage, J. (2015).** *Piano Gloves.* ECE 4760 final
project, Fall 2015. Starting point for the acoustic track.
- https://people.ece.cornell.edu/land/courses/ece4760/FinalProjects/f2015/swc63_ncm42_jmt329/swc63_ncm42_jmt329/webpage/

## Tooling

**Sunsetting the rustwasm GitHub org** (Inside Rust blog, July 2025).
Context for the wasm-bindgen decision in `03-wasm-shell.md`.
- https://blog.rust-lang.org/inside-rust/2025/07/21/sunsetting-the-rustwasm-github-org
