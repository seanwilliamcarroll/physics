use super::DelayLine;
use math::convert::{f64_to_f32, usize_to_f64};

#[test]
fn front_is_the_sample_pushed_len_pushes_ago() {
    let mut d = DelayLine::<f64>::new(3).unwrap();
    for v in [1.0, 2.0, 3.0] {
        assert_eq!(d.front(), 0.0, "starts silent");
        d.push(v);
    }
    let mut out = Vec::new();
    for v in [4.0, 5.0, 6.0, 7.0] {
        out.push(d.front());
        d.push(v);
    }
    assert_eq!(out, vec![1.0, 2.0, 3.0, 4.0]);
    assert_eq!(
        d.iter().collect::<Vec<_>>(),
        vec![5.0, 6.0, 7.0],
        "oldest first"
    );
}

#[test]
fn fill_counts_from_the_front() {
    let mut d = DelayLine::<f32>::new(4).unwrap();
    d.push(9.0); // move the head off slot 0
    d.fill(|i| f64_to_f32(usize_to_f64(i)));
    assert_eq!(d.iter().collect::<Vec<_>>(), vec![0.0, 1.0, 2.0, 3.0]);
    assert_eq!(d.front(), 0.0);
}

#[test]
fn an_empty_line_is_refused() {
    assert!(DelayLine::<f64>::new(0).is_none());
}

#[test]
fn a_line_is_never_empty() {
    // The smallest line `new` accepts still holds a sample.
    let d = DelayLine::<f64>::new(1).unwrap();
    assert!(!d.is_empty());
    assert_eq!(d.len(), 1);
}

/// A line of 3 whose head is off slot 0, holding `[1, 2, 3]` from the
/// front: so a wrapped index (`j % 3`) would land on a real sample.
fn shifted_line() -> DelayLine<f64> {
    let mut d = DelayLine::<f64>::new(3).unwrap();
    d.push(9.0);
    d.fill(|i| usize_to_f64(i + 1));
    d
}

#[test]
fn at_reads_from_the_front_and_zero_past_the_end() {
    let d = shifted_line();
    assert_eq!([d.at(0), d.at(1), d.at(2)], [1.0, 2.0, 3.0]);
    // Not wrapped round to the front's 1.0 (or 2.0).
    assert_eq!([d.at(3), d.at(4)], [0.0, 0.0]);
}

#[test]
fn add_at_adds_from_the_front_and_nothing_past_the_end() {
    let mut d = shifted_line();
    d.add_at(1, 10.0);
    d.add_at(3, 100.0); // past the end: would wrap onto the front
    d.add_at(4, 100.0);
    assert_eq!(d.iter().collect::<Vec<_>>(), vec![1.0, 12.0, 3.0]);
}

#[test]
fn reset_reuses_the_buffer_up_to_its_capacity() {
    let mut d = DelayLine::<f64>::with_capacity(3, 10).unwrap();
    d.push(1.0);
    assert!(d.reset(10));
    assert_eq!((d.len(), d.front()), (10, 0.0));
    assert!(!d.reset(11), "over capacity");
    assert!(!d.reset(0));
    assert_eq!(d.len(), 10, "a refused reset changes nothing");
    assert!(DelayLine::<f64>::with_capacity(5, 4).is_none());
}

#[test]
fn remove_mean_leaves_no_dc() {
    let mut d = DelayLine::<f64>::new(4).unwrap();
    d.fill(|i| [1.0, 2.0, 3.0, 6.0][i]);
    d.remove_mean();
    assert_eq!(d.iter().collect::<Vec<_>>(), vec![-2.0, -1.0, 0.0, 3.0]);
}
