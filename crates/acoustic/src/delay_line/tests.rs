use super::DelayLine;

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
    #[expect(clippy::cast_precision_loss, reason = "tiny test indices")]
    d.fill(|i| i as f32);
    assert_eq!(d.iter().collect::<Vec<_>>(), vec![0.0, 1.0, 2.0, 3.0]);
    assert_eq!(d.front(), 0.0);
}

#[test]
fn an_empty_line_is_refused() {
    assert!(DelayLine::<f64>::new(0).is_none());
}
