use super::{Counts, crate_of, per_crate, ratio};

/// Trimmed real output of `cargo llvm-cov report` (M2.7).
const TABLE: &str = "\
Filename                      Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
engine/src/particles.rs            50                 3    94.00%          11                 1    90.91%          39                 3    92.31%           0                 0         -
engine/src/world.rs                48                 9    81.25%           8                 2    75.00%          43                 7    83.72%           0                 0         -
math/src/vec2.rs                   59                 0   100.00%          13                 0   100.00%          41                 0   100.00%           0                 0         -
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                             157                12    92.36%          32                 3    90.62%         123                10    91.87%           0                 0         -
";

fn counts(
    name: &str,
    lines: u32,
    missed_lines: u32,
    functions: u32,
    missed_functions: u32,
) -> Counts {
    Counts {
        name: name.to_owned(),
        lines,
        missed_lines,
        functions,
        missed_functions,
    }
}

#[test]
fn sums_rows_per_crate_and_skips_header_rules_and_total() {
    let (crates, total) = per_crate(TABLE);
    assert_eq!(
        crates,
        vec![
            counts("engine", 82, 10, 19, 3),
            counts("math", 41, 0, 13, 0)
        ]
    );
    // Matches llvm-cov's own TOTAL row, which the parser skipped.
    assert_eq!(total, counts("total", 123, 10, 32, 3));
}

#[test]
fn empty_or_garbled_input_gives_nothing() {
    assert_eq!(per_crate("").0, vec![]);
    assert_eq!(per_crate("error: no profile data\n").0, vec![]);
}

#[test]
fn crate_is_the_component_before_src() {
    assert_eq!(crate_of("engine/src/world.rs"), Some("engine"));
    assert_eq!(
        crate_of("/repo/crates/engine-web/src/demo/x.rs"),
        Some("engine-web")
    );
    assert_eq!(crate_of(r"crates\math\src\vec2.rs"), Some("math"));
    assert_eq!(crate_of("src/lib.rs"), None);
    assert_eq!(crate_of("world.rs"), None);
}

#[test]
fn ratio_formats_covered_over_total() {
    assert_eq!(ratio(4, 1), " 75.00% (3/4)");
    assert_eq!(ratio(0, 0), "-");
}
