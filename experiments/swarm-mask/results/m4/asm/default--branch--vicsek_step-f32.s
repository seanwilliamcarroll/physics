    Finished `release` profile [optimized] target(s) in 0.06s

.section __TEXT,__text,regular,pure_instructions
	.p2align	6
<criterion::bencher::Bencher>::iter_batched_ref::<swarm::vicsek::Vicsek, (), step::models::{closure#0}::{closure#1}, <swarm::vicsek::Vicsek>::step>:
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception4
	stp d9, d8, [sp, #-112]!
	.cfi_def_cfa_offset 112
	stp x28, x27, [sp, #16]
	stp x26, x25, [sp, #32]
	stp x24, x23, [sp, #48]
	stp x22, x21, [sp, #64]
	stp x20, x19, [sp, #80]
	stp x29, x30, [sp, #96]
	add x29, sp, #96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_remember_state
	sub sp, sp, #1072
	ldr xzr, [sp]
	mov w8, #1
	strb w8, [x0, #48]
	ldr x8, [x0, #40]
	add x19, x8, #999
	cmp x19, #999
	b.ls LBB6_47
	mov x20, x1
	mov x21, x0
	mov w0, #8
	str x8, [sp, #32]
	bl <std::sys::pal::unix::time::Timespec>::now
	ldr x10, [sp, #32]
	str x0, [sp, #16]
	str w1, [sp, #12]
	str xzr, [x21]
	str x21, [sp, #64]
	str wzr, [x21, #8]
	sub x8, x10, #1
	cmp x8, #1000
	b.hs LBB6_16
	mov w19, #0
	mov x21, #0
	ldr s8, [x20, #312]
	ldr q0, [x20, #288]
	str q0, [sp, #80]
	ldr x8, [x20, #304]
	str x8, [sp, #72]
	ldrb w25, [x20, #328]
	add x26, x20, #316
	add x27, sp, #432
	add x8, sp, #96
	add x28, x8, #316
	b LBB6_5
LBB6_3:
	add x21, x21, #1
	mov w8, #13824
	movk w8, #50277, lsl #16
	add w19, w19, w8
LBB6_4:
	ldr x8, [sp, #64]
	str x21, [x8]
	str w19, [x8, #8]
	; InlineAsm Start
	; InlineAsm End
	add x0, sp, #432
	add x1, sp, #96
	mov w2, #336
	bl _memcpy
	; InlineAsm Start
	; InlineAsm End
	add x0, sp, #432
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	subs x10, x22, #1
	b.eq LBB6_43
LBB6_5:
	mov x22, x10
	add x0, sp, #776
	mov x1, x20
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	add x0, sp, #872
	add x1, x20, #96
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	sub x0, x29, #200
	add x1, x20, #192
	bl <swarm::grid::Grid as core::clone::Clone>::clone
	ldr x8, [x26]
	str x8, [x28]
	ldr w8, [x26, #8]
	str w8, [x28, #8]
	add x8, sp, #585
	ldur q0, [x8, #255]
	add x8, sp, #601
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #496]
	add x8, sp, #521
	ldur q0, [x8, #255]
	add x8, sp, #537
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #432]
	add x8, sp, #553
	ldur q0, [x8, #255]
	add x8, sp, #569
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #464]
	add x8, sp, #617
	ldur q0, [x8, #255]
	add x8, sp, #633
	ldur q1, [x8, #255]
	add x8, sp, #649
	ldur q2, [x8, #255]
	add x8, sp, #665
	ldur q3, [x8, #255]
	stp q2, q3, [x27, #128]
	stp q0, q1, [x27, #96]
	add x8, sp, #681
	ldur q0, [x8, #255]
	add x8, sp, #697
	ldur q1, [x8, #255]
	stp q0, q1, [x27, #160]
	ldur q0, [x29, #-200]
	ldur q1, [x29, #-184]
	ldur q2, [x29, #-168]
	ldur q3, [x29, #-152]
	stp q2, q3, [x27, #224]
	stp q0, q1, [x27, #192]
	ldur q0, [x29, #-136]
	ldur q1, [x29, #-120]
	stp q0, q1, [x27, #256]
	add x0, sp, #96
	add x1, sp, #432
	mov w2, #288
	bl _memcpy
	ldr q0, [sp, #80]
	str q0, [sp, #384]
	ldr x8, [sp, #72]
	str x8, [sp, #400]
	str s8, [sp, #408]
	strb w25, [sp, #424]
	add x8, sp, #96
	; InlineAsm Start
	; InlineAsm End
	mov w0, #8
	bl <std::sys::pal::unix::time::Timespec>::now
	mov x23, x0
	mov x24, x1
	add x0, sp, #96
	bl <swarm::vicsek::Vicsek>::step
	mov w0, #8
	bl <std::sys::pal::unix::time::Timespec>::now
	str x0, [sp, #872]
	str w1, [sp, #880]
	stur x23, [x29, #-200]
	stur w24, [x29, #-192]
	add x0, sp, #432
	add x1, sp, #872
	sub x2, x29, #200
	bl <std::sys::pal::unix::time::Timespec>::sub_timespec
	ldr w8, [sp, #432]
	ldr x9, [sp, #440]
	cmp w8, #0
	csel x9, xzr, x9, ne
	adds x21, x9, x21
	b.hs LBB6_15
	ldr w9, [sp, #448]
	.p2align	6, , 4
	cmp w8, #0
	csel w8, wzr, w9, ne
	add w19, w19, w8
	mov w8, #51711
	movk w8, #15258, lsl #16
	cmp w19, w8
	b.ls LBB6_4
	cmn x21, #1
	b.ne LBB6_3
LBB6_15:
Lloh56:
	adrp x0, l_anon.bbd7f61f8fe067c2f569e97358b21872.692@PAGE
Lloh57:
	add x0, x0, l_anon.bbd7f61f8fe067c2f569e97358b21872.692@PAGEOFF
Lloh58:
	adrp x2, l_anon.bbd7f61f8fe067c2f569e97358b21872.693@PAGE
Lloh59:
	add x2, x2, l_anon.bbd7f61f8fe067c2f569e97358b21872.693@PAGEOFF
	mov w1, #30
	bl core::option::expect_failed
	b LBB6_46
LBB6_16:
	str wzr, [sp, #52]
	str xzr, [sp, #56]
	mov x11, #0
	lsr x8, x19, #3
	mov x9, #63439
	movk x9, #58195, lsl #16
	movk x9, #39845, lsl #32
	movk x9, #8388, lsl #48
	umulh x8, x8, x9
	lsr x8, x8, #4
	str x8, [sp, #24]
	add x28, sp, #432
	ldr s8, [x20, #312]
	ldr q0, [x20, #288]
	str q0, [sp, #80]
	ldr x19, [x20, #304]
	ldrb w21, [x20, #328]
	add x26, x20, #316
	b LBB6_18
LBB6_17:
	ldp x10, x11, [sp, #32]
	add x11, x22, x11
	cmp x11, x10
	b.hs LBB6_43
LBB6_18:
	subs x8, x10, x11
	ldr x9, [sp, #24]
	cmp x8, x9
	csel x22, x8, x9, lo
	cmp x10, x11
	str x11, [sp, #40]
	b.ne LBB6_20
	mov x8, #0
	mov w23, #8
	b LBB6_21
LBB6_20:
	mov w8, #336
	mul x24, x22, x8
	mov x0, x24
	bl _malloc
	mov x23, x0
	mov x8, x22
	cbz x0, LBB6_48
LBB6_21:
	mov x24, #0
	str x8, [sp, #776]
	str x23, [sp, #784]
LBB6_22:
	add x0, sp, #872
	mov x1, x20
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	sub x0, x29, #200
	add x1, x20, #96
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	add x0, sp, #96
	add x1, x20, #192
	bl <swarm::grid::Grid as core::clone::Clone>::clone
	add x24, x24, #1
	add x8, sp, #681
	ldur q0, [x8, #255]
	add x8, sp, #697
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #496]
	add x8, sp, #617
	ldur q0, [x8, #255]
	add x8, sp, #633
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #432]
	add x8, sp, #649
	ldur q0, [x8, #255]
	add x8, sp, #665
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #464]
	ldur q0, [x29, #-200]
	ldur q1, [x29, #-184]
	stp q0, q1, [x28, #96]
	ldur q0, [x29, #-168]
	ldur q1, [x29, #-152]
	stp q0, q1, [x28, #128]
	ldur q0, [x29, #-136]
	ldur q1, [x29, #-120]
	stp q0, q1, [x28, #160]
	ldp q1, q0, [sp, #160]
	stp q1, q0, [x28, #256]
	ldp q1, q0, [sp, #128]
	stp q1, q0, [x28, #224]
	ldp q1, q0, [sp, #96]
	stp q1, q0, [x28, #192]
	add x1, sp, #432
	mov x0, x23
	mov w2, #288
	bl _memcpy
	ldr q0, [sp, #80]
	str q0, [x23, #288]
	str x19, [x23, #304]
	str s8, [x23, #312]
	add x8, x23, #316
	ldr x9, [x26]
	str x9, [x8]
	ldr w8, [x26, #8]
	str w8, [x23, #324]
	strb w21, [x23, #328]
	add x23, x23, #336
	cmp x22, x24
	b.ne LBB6_22
	add x8, sp, #521
	ldur q0, [x8, #255]
	str q0, [sp, #96]
	str x22, [sp, #112]
	add x8, sp, #96
	; InlineAsm Start
	; InlineAsm End
	mov w0, #8
	bl <std::sys::pal::unix::time::Timespec>::now
	mov x23, x0
	mov x24, x1
	ldr x8, [sp, #112]
	str x8, [sp, #72]
	cbz x8, LBB6_31
	ldr x25, [sp, #104]
	ldr x27, [sp, #72]
LBB6_29:
	mov x0, x25
	bl <swarm::vicsek::Vicsek>::step
	add x25, x25, #336
	subs x27, x27, #1
	b.ne LBB6_29
LBB6_31:
	mov w0, #8
	bl <std::sys::pal::unix::time::Timespec>::now
	str x0, [sp, #872]
	str w1, [sp, #880]
	stur x23, [x29, #-200]
	stur w24, [x29, #-192]
	add x0, sp, #432
	add x1, sp, #872
	sub x2, x29, #200
	bl <std::sys::pal::unix::time::Timespec>::sub_timespec
	ldr w8, [sp, #432]
	ldr x9, [sp, #440]
	cmp w8, #0
	csel x9, xzr, x9, ne
	ldr x10, [sp, #56]
	adds x10, x9, x10
	b.hs LBB6_45
	ldr w9, [sp, #448]
	.p2align	6, , 4
	cmp w8, #0
	csel w8, wzr, w9, ne
	ldr w9, [sp, #52]
	add w9, w9, w8
	mov w8, #51711
	movk w8, #15258, lsl #16
	cmp w9, w8
	b.ls LBB6_38
	cmn x10, #1
	b.eq LBB6_45
	add x10, x10, #1
	mov w8, #13824
	movk w8, #50277, lsl #16
	add w9, w9, w8
LBB6_38:
	ldr x8, [sp, #64]
	str x10, [sp, #56]
	str x10, [x8]
	str w9, [sp, #52]
	str w9, [x8, #8]
	mov w8, #1
	stp xzr, x8, [sp, #432]
	ldr x8, [sp, #72]
	str x8, [sp, #448]
	; InlineAsm Start
	; InlineAsm End
	ldp x23, x25, [sp, #104]
	cbz x25, LBB6_41
	mov x24, x23
LBB6_40:
	mov x0, x24
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	add x24, x24, #336
	subs x25, x25, #1
	b.ne LBB6_40
LBB6_41:
	ldr x8, [sp, #96]
	cbz x8, LBB6_17
	mov x0, x23
	bl _free
	b LBB6_17
LBB6_43:
	mov w0, #8
	bl <std::sys::pal::unix::time::Timespec>::now
	stur x0, [x29, #-200]
	stur w1, [x29, #-192]
	ldr x8, [sp, #16]
	str x8, [sp, #96]
	ldr w8, [sp, #12]
	str w8, [sp, #104]
	add x0, sp, #432
	sub x1, x29, #200
	add x2, sp, #96
	bl <std::sys::pal::unix::time::Timespec>::sub_timespec
	ldr w8, [sp, #432]
	ldr x9, [sp, #440]
	ldr w10, [sp, #448]
	.p2align	6, , 4
	cmp w8, #0
	csel w8, wzr, w10, ne
	csel x9, xzr, x9, ne
	ldr x10, [sp, #64]
	str x9, [x10, #16]
	str w8, [x10, #24]
	add sp, sp, #1072
	.cfi_def_cfa wsp, 112
	ldp x29, x30, [sp, #96]
	ldp x20, x19, [sp, #80]
	ldp x22, x21, [sp, #64]
	ldp x24, x23, [sp, #48]
	ldp x26, x25, [sp, #32]
	ldp x28, x27, [sp, #16]
	ldp d9, d8, [sp], #112
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	.cfi_restore w27
	.cfi_restore w28
	.cfi_restore b8
	.cfi_restore b9
	ret
LBB6_45:
	.cfi_restore_state
Lloh60:
	adrp x0, l_anon.bbd7f61f8fe067c2f569e97358b21872.692@PAGE
Lloh61:
	add x0, x0, l_anon.bbd7f61f8fe067c2f569e97358b21872.692@PAGEOFF
Lloh62:
	adrp x2, l_anon.bbd7f61f8fe067c2f569e97358b21872.693@PAGE
Lloh63:
	add x2, x2, l_anon.bbd7f61f8fe067c2f569e97358b21872.693@PAGEOFF
	mov w1, #30
	bl core::option::expect_failed
LBB6_46:
	brk #0x1
LBB6_47:
Lloh64:
	adrp x0, l_anon.888d01a071e81d69d6f98770427f376d.6@PAGE
Lloh65:
	add x0, x0, l_anon.888d01a071e81d69d6f98770427f376d.6@PAGEOFF
Lloh66:
	adrp x2, l_anon.888d01a071e81d69d6f98770427f376d.8@PAGE
Lloh67:
	add x2, x2, l_anon.888d01a071e81d69d6f98770427f376d.8@PAGEOFF
	mov w1, #57
	bl core::panicking::panic_fmt
LBB6_48:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #776
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #872
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	add x0, sp, #776
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	sub x0, x29, #200
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	b LBB6_60
	mov x19, x0
	b LBB6_61
	mov x19, x0
LBB6_60:
	add x0, sp, #872
	bl core::ptr::drop_glue::<swarm::flock::Boids>
LBB6_61:
	str x24, [sp, #792]
	add x0, sp, #776
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x19
	bl __Unwind_Resume
	mov x19, x0
	add x0, sp, #96
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x19
	bl __Unwind_Resume
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpAdd	Lloh66, Lloh67
	.loh AdrpAdd	Lloh64, Lloh65
