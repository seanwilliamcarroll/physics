use super::capped;

#[test]
fn a_size_at_the_cap_passes_and_one_more_is_refused() {
    assert_eq!(capped(40, 40), Some(40));
    assert_eq!(capped(0, 40), Some(0));
    assert_eq!(capped(41, 40), None);
    assert_eq!(capped(u32::MAX, 40), None);
}
