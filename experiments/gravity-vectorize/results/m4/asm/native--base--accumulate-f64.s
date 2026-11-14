<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin152:
	.cfi_startproc
	stp x26, x25, [sp, #-80]!
	.cfi_def_cfa_offset 80
	stp x24, x23, [sp, #16]
	stp x22, x21, [sp, #32]
	stp x20, x19, [sp, #48]
	stp x29, x30, [sp, #64]
	add x29, sp, #64
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
	.cfi_remember_state
	ldr x8, [x1, #16]
	ldr x9, [x1, #64]
	cmp x9, x8
	csel x21, x9, x8, lo
	lsl x20, x21, #5
	lsr x8, x21, #59
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x20, x9
	ccmp x8, #0, #0, lo
	b.eq LBB152_2
	mov x0, #0
	mov x1, x20
	bl alloc::raw_vec::handle_error
LBB152_2:
	mov x19, x0
	ldr x22, [x1, #8]
	ldr x23, [x1, #56]
	cbz x20, LBB152_5
	mov x0, x20
	mov w1, #8
	mov x24, x3
	mov x25, x2
	bl __rustc::__rdl_alloc
	mov x2, x25
	mov x3, x24
	mov x8, x21
	cbz x0, LBB152_26
	cbnz x21, LBB152_6
	b LBB152_11
LBB152_5:
	mov x8, #0
	mov w0, #8
	cbz x21, LBB152_11
LBB152_6:
	cmp x21, #6
	b.lo LBB152_8
	add x9, x0, x20
	add x10, x22, x21, lsl #4
	add x11, x23, x21, lsl #3
	cmp x0, x10
	ccmp x22, x9, #2, lo
	cset w10, lo
	cmp x0, x11
	ccmp x23, x9, #2, lo
	csinc w9, w10, wzr, hs
	tbz w9, #0, LBB152_23
LBB152_8:
	mov x9, #0
LBB152_9:
	sub x10, x21, x9
	add x11, x0, x9, lsl #5
	add x11, x11, #16
	add x12, x23, x9, lsl #3
	add x9, x22, x9, lsl #4
	fmov d0, #1.00000000
	movi.2d v1, #0000000000000000
LBB152_10:
	ldr d2, [x12], #8
	fdiv d3, d0, d2
	fcmp d2, #0.0
	ldr q4, [x9], #16
	stur q4, [x11, #-16]
	fcsel d3, d1, d3, eq
	stp d3, d2, [x11], #32
	subs x10, x10, #1
	b.ne LBB152_10
LBB152_11:
	cbz x3, LBB152_20
	ldp d1, d0, [x19]
	sub x9, x3, #1
	sub x10, x21, #1
	mov x11, x0
	b LBB152_14
LBB152_13:
	str q2, [x2]
	sub x9, x9, #1
	sub x10, x10, #1
	mov x2, x13
	mov x11, x12
	cbz x3, LBB152_20
LBB152_14:
	cmp x9, x10
	csel x14, x9, x10, lo
	cbz x21, LBB152_20
	mov x15, #0
	sub x21, x21, #1
	sub x3, x3, #1
	add x13, x2, #16
	add x12, x11, #32
	ldr q3, [x11]
	ldr q2, [x2]
	ldp d5, d4, [x11, #16]
	fmul d5, d5, d1
LBB152_16:
	lsl x16, x15, #5
	add x16, x16, #32
	cmp x15, x14
	csel x1, x15, x14, hi
LBB152_17:
	cmp x1, x15
	b.eq LBB152_13
	mov x17, x15
	add x15, x15, #1
	ldr q6, [x11, x16]
	fsub.2d v6, v6, v3
	fmul.2d v7, v6, v6
	faddp.2d d7, v7
	fadd d7, d0, d7
	add x16, x16, #32
	fcmp d7, #0.0
	b.eq LBB152_17
	add x16, x12, x17, lsl #5
	ldp d17, d16, [x16, #16]
	lsl x16, x17, #4
	fmul d17, d17, d5
	fsqrt d18, d7
	fmul d7, d7, d18
	fdiv d7, d17, d7
	fmul.2d v6, v6, v7[0]
	fmul.2d v7, v6, v4[0]
	fadd.2d v2, v2, v7
	fmul.2d v6, v6, v16[0]
	ldr q7, [x13, x16]
	fsub.2d v6, v7, v6
	str q6, [x13, x16]
	b LBB152_16
LBB152_20:
	cbz x8, LBB152_22
	mov w1, #8
	.cfi_def_cfa wsp, 80
	ldp x29, x30, [sp, #64]
	ldp x20, x19, [sp, #48]
	ldp x22, x21, [sp, #32]
	ldp x24, x23, [sp, #16]
	ldp x26, x25, [sp], #80
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
	b __rustc::__rdl_dealloc
LBB152_22:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 80
	ldp x29, x30, [sp, #64]
	ldp x20, x19, [sp, #48]
	ldp x22, x21, [sp, #32]
	ldp x24, x23, [sp, #16]
	ldp x26, x25, [sp], #80
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
	ret
LBB152_23:
	.cfi_restore_state
	and x9, x21, #0x7fffffffffffffe
	fmov.2d v0, #1.00000000
	mov x10, x22
	mov x11, x23
	mov x12, x0
	and x13, x21, #0x7fffffffffffffe
LBB152_24:
	ldp q2, q1, [x10], #32
	ldr q6, [x11], #16
	fdiv.2d v7, v0, v6
	fcmeq.2d v16, v6, #0.0
	bic.16b v5, v7, v16
	zip2.2d v4, v2, v1
	zip1.2d v3, v2, v1
	st4.2d { v3, v4, v5, v6 }, [x12], #64
	subs x13, x13, #2
	b.ne LBB152_24
	cmp x21, x9
	b.eq LBB152_11
	b LBB152_9
LBB152_26:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
