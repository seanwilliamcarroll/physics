    Finished `release` profile [optimized] target(s) in 0.02s

.section __TEXT,__text,regular,pure_instructions
	.p2align	2
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
	sub sp, sp, #1184
	ldr xzr, [sp]
	str x1, [sp, #168]
	mov w8, #1
	strb w8, [x0, #48]
	ldr x8, [x0, #40]
	add x19, x8, #999
	cmp x19, #999
	b.ls LBB6_50
	mov x21, x0
	str x8, [sp, #16]
	bl <std::time::Instant>::now
	ldr x10, [sp, #16]
	str x0, [sp, #192]
	str w1, [sp, #200]
	str xzr, [x21]
	str x21, [sp, #48]
	str wzr, [x21, #8]
	sub x8, x10, #1
	cmp x8, #1000
	b.hs LBB6_14
	mov w22, #0
	mov x23, #0
	ldr x19, [sp, #168]
	ldr s8, [x19, #312]
	ldr q0, [x19, #288]
	str q0, [sp, #176]
	ldr x8, [x19, #304]
	str x8, [sp, #160]
	ldrb w27, [x19, #328]
	add x28, x19, #316
	add x24, sp, #544
	add x8, sp, #208
	add x20, sp, #208
	add x25, x8, #316
	b LBB6_5
LBB6_3:
	add x23, x23, #1
	mov w8, #13824
	movk w8, #50277, lsl #16
	add w22, w22, w8
LBB6_4:
	ldr x8, [sp, #48]
	str x23, [x8]
	str w22, [x8, #8]
	; InlineAsm Start
	; InlineAsm End
	add x0, sp, #544
	add x1, sp, #208
	mov w2, #336
	bl _memcpy
	; InlineAsm Start
	; InlineAsm End
	add x0, sp, #544
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	subs x10, x26, #1
	b.eq LBB6_48
LBB6_5:
	mov x26, x10
	add x0, sp, #888
	mov x1, x19
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	add x0, sp, #984
	add x1, x19, #96
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	sub x0, x29, #200
	add x1, x19, #192
	bl <swarm::grid::Grid as core::clone::Clone>::clone
	ldr x8, [x28]
	str x8, [x25]
	ldr w8, [x28, #8]
	str w8, [x25, #8]
	add x8, sp, #697
	ldur q0, [x8, #255]
	add x8, sp, #713
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #608]
	add x8, sp, #633
	ldur q0, [x8, #255]
	add x8, sp, #649
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #544]
	add x8, sp, #665
	ldur q0, [x8, #255]
	add x8, sp, #681
	ldur q1, [x8, #255]
	stp q0, q1, [sp, #576]
	add x8, sp, #729
	ldur q0, [x8, #255]
	add x8, sp, #745
	ldur q1, [x8, #255]
	add x8, sp, #761
	ldur q2, [x8, #255]
	add x8, sp, #777
	ldur q3, [x8, #255]
	stp q2, q3, [x24, #128]
	stp q0, q1, [x24, #96]
	add x8, sp, #793
	ldur q0, [x8, #255]
	add x8, sp, #809
	ldur q1, [x8, #255]
	stp q0, q1, [x24, #160]
	ldur q0, [x29, #-200]
	ldur q1, [x29, #-184]
	ldur q2, [x29, #-168]
	ldur q3, [x29, #-152]
	stp q2, q3, [x24, #224]
	stp q0, q1, [x24, #192]
	ldur q0, [x29, #-136]
	ldur q1, [x29, #-120]
	stp q0, q1, [x24, #256]
	add x0, sp, #208
	add x1, sp, #544
	mov w2, #288
	bl _memcpy
	ldr q0, [sp, #176]
	str q0, [sp, #496]
	ldr x8, [sp, #160]
	str x8, [sp, #512]
	str s8, [sp, #520]
	strb w27, [sp, #536]
	; InlineAsm Start
	; InlineAsm End
	bl <std::time::Instant>::now
	mov x19, x0
	mov x21, x1
	add x0, sp, #208
	bl <swarm::vicsek::Vicsek>::step
	str x19, [sp, #544]
	str w21, [sp, #552]
	add x0, sp, #544
	bl <std::time::Instant>::elapsed
	adds x23, x0, x23
	ldr x19, [sp, #168]
	b.hs LBB6_13
	add w22, w22, w1
	mov w8, #51711
	movk w8, #15258, lsl #16
	cmp w22, w8
	b.ls LBB6_4
	cmn x23, #1
	b.ne LBB6_3
LBB6_13:
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
	b LBB6_54
LBB6_14:
	str wzr, [sp, #44]
	str xzr, [sp, #32]
	mov x11, #0
	lsr x8, x19, #3
	ldr x13, [sp, #168]
	ldr s8, [x13, #312]
	mov x9, #63439
	movk x9, #58195, lsl #16
	movk x9, #39845, lsl #32
	movk x9, #8388, lsl #48
	ldr q0, [x13, #288]
	str q0, [sp, #144]
	ldr x12, [x13, #304]
	str x12, [sp, #136]
	umulh x8, x8, x9
	lsr x8, x8, #4
	str x8, [sp, #8]
	ldrb w8, [x13, #328]
	str w8, [sp, #132]
	ldr s9, [x13, #280]
	ldr x8, [x13, #272]
	str x8, [sp, #120]
	ldp x9, x24, [x13, #200]
	lsl x8, x24, #2
	stp x9, x8, [sp, #80]
	ldp x9, x26, [x13, #224]
	lsl x22, x26, #2
	ldp x8, x21, [x13, #248]
	stp x8, x9, [sp, #56]
	lsl x8, x21, #2
	str x8, [sp, #72]
	ldr q0, [x13, #256]
	str q0, [sp, #96]
	add x23, sp, #544
	str x24, [sp, #160]
	b LBB6_16
LBB6_15:
	ldp x10, x11, [sp, #16]
	ldr x8, [sp, #176]
	add x11, x8, x11
	cmp x11, x10
	mov x22, x20
	b.hs LBB6_48
LBB6_16:
	subs x8, x10, x11
	ldr x9, [sp, #8]
	cmp x8, x9
	csel x20, x8, x9, lo
	cmp x10, x11
	str x11, [sp, #24]
	str x20, [sp, #176]
	b.ne LBB6_18
	mov x8, #0
	mov w27, #8
	b LBB6_19
LBB6_18:
	mov w8, #336
	mul x19, x20, x8
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_alloc
	mov x27, x0
	mov x8, x20
	cbz x0, LBB6_55
LBB6_19:
	mov x25, #0
	str x8, [sp, #984]
	str x27, [sp, #992]
	ldr x19, [sp, #168]
	b LBB6_22
LBB6_20:
	mov w22, #4
LBB6_21:
	add x25, x25, #1
	ldur q0, [x29, #-136]
	ldur q1, [x29, #-120]
	stp q0, q1, [sp, #608]
	ldur q0, [x29, #-200]
	ldur q1, [x29, #-184]
	stp q0, q1, [sp, #544]
	ldur q0, [x29, #-168]
	ldur q1, [x29, #-152]
	stp q0, q1, [sp, #576]
	ldp q0, q1, [sp, #208]
	stp q0, q1, [x23, #96]
	ldp q0, q1, [sp, #240]
	stp q0, q1, [x23, #128]
	ldp q0, q1, [sp, #272]
	stp q0, q1, [x23, #160]
	ldr q0, [sp, #672]
	str q0, [x27, #128]
	ldr q0, [sp, #688]
	str q0, [x27, #144]
	ldr q0, [sp, #704]
	str q0, [x27, #160]
	ldr q0, [sp, #720]
	str q0, [x27, #176]
	ldr q0, [sp, #608]
	str q0, [x27, #64]
	ldr q0, [sp, #624]
	str q0, [x27, #80]
	ldr q0, [sp, #640]
	str q0, [x27, #96]
	ldr q0, [sp, #656]
	str q0, [x27, #112]
	ldr q0, [sp, #544]
	str q0, [x27]
	ldr q0, [sp, #560]
	str q0, [x27, #16]
	ldr q0, [sp, #576]
	str q0, [x27, #32]
	ldr q0, [sp, #592]
	str q0, [x27, #48]
	ldr x24, [sp, #160]
	stp x24, x28, [x27, #192]
	stp x24, x26, [x27, #208]
	stp x19, x26, [x27, #224]
	stp x21, x22, [x27, #240]
	ldr q0, [sp, #96]
	str q0, [x27, #256]
	ldr x8, [sp, #120]
	str x8, [x27, #272]
	str s9, [x27, #280]
	ldr q0, [sp, #144]
	str q0, [x27, #288]
	ldr x8, [sp, #136]
	str x8, [x27, #304]
	str s8, [x27, #312]
	add x8, x27, #316
	ldr x19, [sp, #168]
	add x10, x19, #316
	ldr x9, [x10]
	str x9, [x8]
	ldr w8, [x10, #8]
	str w8, [x27, #324]
	ldr w8, [sp, #132]
	strb w8, [x27, #328]
	add x27, x27, #336
	ldr x8, [sp, #176]
	cmp x8, x25
	mov x22, x20
	b.eq LBB6_33
LBB6_22:
	sub x0, x29, #200
	mov x1, x19
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	add x0, sp, #208
	add x1, x19, #96
	bl <swarm::flock::Boids as core::clone::Clone>::clone
	cbz x24, LBB6_29
	ldr x19, [sp, #88]
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB6_52
	mov x28, x0
	ldr x1, [sp, #80]
	mov x2, x19
	bl _memcpy
	cbz x26, LBB6_30
LBB6_27:
	mov x0, x22
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB6_51
	mov x19, x0
	ldr x1, [sp, #64]
	mov x2, x22
	bl _memcpy
	mov x20, x22
	cbnz x21, LBB6_31
	b LBB6_20
LBB6_29:
	mov w28, #4
	cbnz x26, LBB6_27
LBB6_30:
	mov w19, #4
	mov x20, x22
	cbz x21, LBB6_20
LBB6_31:
	mov x24, x21
	ldr x21, [sp, #72]
	mov x0, x21
	mov w1, #4
	bl __rustc::__rdl_alloc
	cbz x0, LBB6_53
	mov x22, x0
	ldr x1, [sp, #56]
	mov x2, x21
	bl _memcpy
	mov x21, x24
	b LBB6_21
LBB6_33:
	add x8, sp, #729
	ldur q0, [x8, #255]
	str q0, [sp, #208]
	ldr x8, [sp, #176]
	str x8, [sp, #224]
	add x8, sp, #208
	; InlineAsm Start
	; InlineAsm End
	bl <std::time::Instant>::now
	mov x19, x0
	mov x22, x1
	ldr x25, [sp, #224]
	cbz x25, LBB6_38
	ldr x27, [sp, #216]
	mov x28, x25
LBB6_36:
	mov x0, x27
	bl <swarm::vicsek::Vicsek>::step
	add x27, x27, #336
	subs x28, x28, #1
	b.ne LBB6_36
LBB6_38:
	str x19, [sp, #544]
	str w22, [sp, #552]
	add x0, sp, #544
	bl <std::time::Instant>::elapsed
	ldr x10, [sp, #32]
	adds x10, x0, x10
	ldr w9, [sp, #44]
	b.hs LBB6_49
	add w9, w9, w1
	mov w8, #51711
	movk w8, #15258, lsl #16
	cmp w9, w8
	b.ls LBB6_43
	cmn x10, #1
	b.eq LBB6_49
	add x10, x10, #1
	mov w8, #13824
	movk w8, #50277, lsl #16
	add w9, w9, w8
LBB6_43:
	ldr x8, [sp, #48]
	str x10, [sp, #32]
	str x10, [x8]
	str w9, [sp, #44]
	str w9, [x8, #8]
	str xzr, [sp, #544]
	mov w8, #1
	str x8, [sp, #552]
	str x25, [sp, #560]
	; InlineAsm Start
	; InlineAsm End
	ldp x19, x25, [sp, #216]
	cbz x25, LBB6_46
	mov x22, x19
LBB6_45:
	mov x0, x22
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	add x22, x22, #336
	subs x25, x25, #1
	b.ne LBB6_45
LBB6_46:
	ldr x8, [sp, #208]
	cbz x8, LBB6_15
	mov x0, x19
	mov w1, #8
	bl __rustc::__rdl_dealloc
	b LBB6_15
LBB6_48:
	add x0, sp, #192
	bl <std::time::Instant>::elapsed
	ldr x8, [sp, #48]
	str x0, [x8, #16]
	str w1, [x8, #24]
	add sp, sp, #1184
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
LBB6_49:
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
	b LBB6_54
LBB6_50:
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
LBB6_51:
	mov w0, #4
	mov x1, x22
	bl alloc::raw_vec::handle_error
	b LBB6_54
LBB6_52:
	mov w0, #4
	mov x1, x19
	bl alloc::raw_vec::handle_error
	b LBB6_54
LBB6_53:
	mov w0, #4
	mov x1, x21
	bl alloc::raw_vec::handle_error
LBB6_54:
	brk #0x1
LBB6_55:
	mov w0, #8
	mov x1, x19
	bl alloc::raw_vec::handle_error
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #888
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #984
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	add x0, sp, #888
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	ldr x24, [sp, #160]
	cbz x26, LBB6_68
	mov x0, x19
	mov w1, #4
	bl __rustc::__rdl_dealloc
	b LBB6_68
	mov x20, x0
	b LBB6_70
	mov x20, x0
LBB6_68:
	cbz x24, LBB6_70
	mov x0, x28
	mov w1, #4
	bl __rustc::__rdl_dealloc
LBB6_70:
	add x0, sp, #208
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	b LBB6_72
	mov x20, x0
LBB6_72:
	sub x0, x29, #200
	bl core::ptr::drop_glue::<swarm::flock::Boids>
	b LBB6_74
	mov x20, x0
LBB6_74:
	str x25, [sp, #1000]
	add x0, sp, #984
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<alloc::vec::Vec<swarm::vicsek::Vicsek>>
	mov x0, x20
	bl __Unwind_Resume
	mov x20, x0
	add x0, sp, #208
	bl core::ptr::drop_glue::<swarm::vicsek::Vicsek>
	mov x0, x20
	bl __Unwind_Resume
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpAdd	Lloh56, Lloh57
	.loh AdrpAdd	Lloh62, Lloh63
	.loh AdrpAdd	Lloh60, Lloh61
	.loh AdrpAdd	Lloh66, Lloh67
	.loh AdrpAdd	Lloh64, Lloh65
