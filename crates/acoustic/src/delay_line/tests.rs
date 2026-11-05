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
