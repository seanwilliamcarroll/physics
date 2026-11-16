//! Like the gravity loop: per block of four, a force from a square root
//! and a division, subtracted from an output array (body j's share) and
//! added to two sets of four running sums (body i's x and y).
use std::hint::black_box;
use std::time::Instant;

#[inline(never)]
pub fn sweep(xs: &[[f64; 4]], ys: &[[f64; 4]], out: &mut [[f64; 4]], k: f64) -> ([f64; 4], [f64; 4]) {
    let (mut sx, mut sy) = ([0.0f64; 4], [0.0f64; 4]);
    for ((x4, y4), o4) in xs.iter().zip(ys).zip(out.iter_mut()) {
        for l in 0..4 {
            let (x, y) = (x4[l], y4[l]);
            let d = x * x + y * y;
            let s = k / (d * d.sqrt());
            let (fx, fy) = (x * s, y * s);
            o4[l] -= fx;
            sx[l] += fx;
            sy[l] += fy;
        }
    }
    (sx, sy)
}

fn main() {
    let n = 1024;
    let xs: Vec<[f64; 4]> = (0..n).map(|i| { let x = 1.0 + i as f64; [x, x + 0.25, x + 0.5, x + 0.75] }).collect();
    let ys: Vec<[f64; 4]> = xs.iter().map(|b| b.map(|v| v * 0.5)).collect();
    let mut out = vec![[0.0f64; 4]; n];
    let reps = 20_000;
    let mut best = f64::INFINITY;
    for _ in 0..5 {
        let t = Instant::now();
        for _ in 0..reps {
            black_box(sweep(black_box(&xs), black_box(&ys), black_box(&mut out), black_box(2.0)));
        }
        best = best.min(t.elapsed().as_secs_f64() / reps as f64);
    }
    println!("{:.2} µs per call ({n} blocks of 4)", best * 1e6);
}
