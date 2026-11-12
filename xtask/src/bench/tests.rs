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
