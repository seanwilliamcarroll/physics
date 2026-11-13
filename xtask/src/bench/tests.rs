use super::{Change, classify};

fn c(name: &str, change: f64) -> Change {
    Change {
        name: name.to_owned(),
        change,
    }
}

#[test]
fn changes_past_the_threshold_are_sorted_into_worse_and_better() {
    let (worse, better) = classify(
        vec![
            c("a", 0.05),
            c("b", 0.25),
            c("c", -0.3),
            c("d", 0.12),
            c("e", -0.02),
        ],
        0.1,
    );
    assert_eq!(worse, vec![c("b", 0.25), c("d", 0.12)], "worst first");
    assert_eq!(better, vec![c("c", -0.3)]);
}

#[test]
fn noise_under_the_threshold_is_neither() {
    let (worse, better) = classify(vec![c("a", 0.099), c("b", -0.099)], 0.1);
    assert!(worse.is_empty() && better.is_empty());
}

#[test]
fn a_change_of_exactly_the_threshold_is_noise() {
    let (worse, better) = classify(vec![c("a", 0.1), c("b", -0.1)], 0.1);
    assert!(worse.is_empty() && better.is_empty());
}

/// Criterion's layout: `<bench>/<case>/change/estimates.json`. Only a
/// directory called `change` is read, and the benchmark is named by the
/// path above it.
#[test]
fn changes_are_read_from_every_change_directory() {
    use std::fs;
    let root = std::env::temp_dir().join(format!("xtask-bench-test-{}", std::process::id()));
    let _ = fs::remove_dir_all(&root);
    let estimates = |pct: f64| format!(r#"{{"mean":{{"point_estimate":{pct}}}}}"#);
    for (dir, pct) in [
        ("step/64/change", 0.25),
        ("step/64/new", 9.0),
        ("pairs/change", -0.5),
    ] {
        fs::create_dir_all(root.join(dir)).unwrap();
        fs::write(root.join(dir).join("estimates.json"), estimates(pct)).unwrap();
    }
    let mut found = super::changes(&root);
    found.sort_by(|a, b| a.name.cmp(&b.name));
    fs::remove_dir_all(&root).unwrap();
    assert_eq!(found, vec![c("pairs", -0.5), c("step/64", 0.25)]);
}
