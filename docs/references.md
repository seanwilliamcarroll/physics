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

## N-body (M1–M2)

**Barnes, J., Hut, P. (1986).** *A hierarchical O(N log N) force-calculation
algorithm.* Nature 324:446–449. (M2 stretch: Barnes–Hut quadtree.)
- DOI: https://doi.org/10.1038/324446a0

## Acoustic track (A1–A5)

**Jaffe, D. A., Smith, J. O. (1983).** *Extensions of the Karplus-Strong
Plucked-String Algorithm.* Computer Music Journal 7(2):56–69.
Fractional-delay tuning, decay stretching, dynamics, pick position (A1).
- DOI: https://doi.org/10.2307/3680063
- JSTOR: https://www.jstor.org/stable/3680063

**Smith, J. O.** *Physical Audio Signal Processing.* Online book (CCRMA,
Stanford), 2010 edition; print by W3K Publishing, ISBN 978-0-9745607-2-4.
Digital waveguides, Karplus–Strong as a waveguide special case, piano models (A1–A3).
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
