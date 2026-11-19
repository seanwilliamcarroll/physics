use super::DelayLine;
use math::convert::{f64_to_f32, usize_to_f64};

#[test]
fn front_is_the_sample_pushed_len_pushes_ago() {
    let mut line = DelayLine::<f64>::new(3).unwrap();
    for value in [1.0, 2.0, 3.0] {
        assert_eq!(line.front(), 0.0, "starts silent");
        line.push(value);
    }
    let mut fronts = Vec::new();
    for value in [4.0, 5.0, 6.0, 7.0] {
        fronts.push(line.front());
        line.push(value);
    }
    assert_eq!(fronts, vec![1.0, 2.0, 3.0, 4.0]);
    assert_eq!(
        line.iter().collect::<Vec<_>>(),
        vec![5.0, 6.0, 7.0],
        "oldest first"
    );
}

#[test]
fn fill_counts_from_the_front() {
    let mut line = DelayLine::<f32>::new(4).unwrap();
    line.push(9.0); // move the head off slot 0
    line.fill(|offset| f64_to_f32(usize_to_f64(offset)));
    assert_eq!(line.iter().collect::<Vec<_>>(), vec![0.0, 1.0, 2.0, 3.0]);
    assert_eq!(line.front(), 0.0);
}

#[test]
fn an_empty_line_is_refused() {
    assert!(DelayLine::<f64>::new(0).is_none());
}

#[test]
fn a_line_is_never_empty() {
    // The smallest line `new` accepts still holds a sample.
    let line = DelayLine::<f64>::new(1).unwrap();
    assert!(!line.is_empty());
    assert_eq!(line.len(), 1);
}

/// A line of 3 whose head is off slot 0, holding `[1, 2, 3]` from the
/// front: so a wrapped index (`offset % 3`) would land on a real sample.
fn shifted_line() -> DelayLine<f64> {
    let mut line = DelayLine::<f64>::new(3).unwrap();
    line.push(9.0);
    line.fill(|offset| usize_to_f64(offset + 1));
    line
}

#[test]
fn at_reads_from_the_front_and_zero_past_the_end() {
    let line = shifted_line();
    assert_eq!([line.at(0), line.at(1), line.at(2)], [1.0, 2.0, 3.0]);
    // Not wrapped round to the front's 1.0 (or 2.0).
    assert_eq!([line.at(3), line.at(4)], [0.0, 0.0]);
}

#[test]
fn add_at_adds_from_the_front_and_nothing_past_the_end() {
    let mut line = shifted_line();
    line.add_at(1, 10.0);
    line.add_at(3, 100.0); // past the end: would wrap onto the front
    line.add_at(4, 100.0);
    assert_eq!(line.iter().collect::<Vec<_>>(), vec![1.0, 12.0, 3.0]);
}

#[test]
fn reset_reuses_the_buffer_up_to_its_capacity() {
    let mut line = DelayLine::<f64>::with_capacity(3, 10).unwrap();
    line.push(1.0);
    assert!(line.reset(10));
    assert_eq!((line.len(), line.front()), (10, 0.0));
    assert!(!line.reset(11), "over capacity");
    assert!(!line.reset(0));
    assert_eq!(line.len(), 10, "a refused reset changes nothing");
    assert!(DelayLine::<f64>::with_capacity(5, 4).is_none());
}

#[test]
fn remove_mean_leaves_no_dc() {
    let mut line = DelayLine::<f64>::new(4).unwrap();
    line.fill(|offset| [1.0, 2.0, 3.0, 6.0][offset]);
    line.remove_mean();
    assert_eq!(line.iter().collect::<Vec<_>>(), vec![-2.0, -1.0, 0.0, 3.0]);
}
