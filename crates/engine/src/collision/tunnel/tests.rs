use super::{crosses, passed_through};
use crate::Vec2;

#[test]
fn passing_through_needs_a_deep_pass_between_the_ends() {
    let v = Vec2::new;
    // Head-on through each other: yes.
    assert!(passed_through(v(-1.0, 0.0), v(1.0, 0.0), 0.05));
    // A pass 0.04 off-centre, inside the half-reach 0.05: yes; 0.06: no.
    assert!(passed_through(v(-1.0, 0.04), v(1.0, 0.04), 0.05));
    assert!(!passed_through(v(-1.0, 0.06), v(1.0, 0.06), 0.05));
    // Approaching and bouncing back the same side: no.
    assert!(!passed_through(v(-1.0, 0.0), v(-0.5, 0.0), 0.05));
    // Ending inside isn't passing through (it's an overlap).
    assert!(!passed_through(v(-1.0, 0.0), v(0.0, 0.01), 0.05));
}

#[test]
fn crossing_is_strict() {
    let v = Vec2::new;
    assert!(crosses(
        v(0.0, 1.0),
        v(0.0, -1.0),
        v(-1.0, 0.0),
        v(1.0, 0.0)
    ));
    assert!(
        !crosses(v(0.0, 1.0), v(0.0, 0.5), v(-1.0, 0.0), v(1.0, 0.0)),
        "short of it"
    );
    assert!(
        !crosses(v(2.0, 1.0), v(2.0, -1.0), v(-1.0, 0.0), v(1.0, 0.0)),
        "past the end"
    );
}
