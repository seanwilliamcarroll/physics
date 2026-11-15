<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin153:
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
	lsl x20, x21, #4
	lsr x8, x21, #60
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x20, x9
	ccmp x8, #0, #0, lo
	b.eq LBB153_2
	mov x0, #0
	mov x1, x20
	bl alloc::raw_vec::handle_error
LBB153_2:
	mov x19, x0
	ldr x22, [x1, #8]
	ldr x23, [x1, #56]
	cbz x20, LBB153_5
	mov x0, x20
	mov w1, #4
	mov x24, x3
	mov x25, x2
	bl __rustc::__rdl_alloc
	mov x2, x25
	mov x3, x24
	mov x8, x21
	cbz x0, LBB153_26
	cbnz x21, LBB153_6
	b LBB153_11
LBB153_5:
	mov x8, #0
	mov w0, #4
	cbz x21, LBB153_11
LBB153_6:
	cmp x21, #8
	b.lo LBB153_8
	add x9, x0, x20
	add x10, x22, x21, lsl #3
	add x11, x23, x21, lsl #2
	cmp x0, x10
	ccmp x22, x9, #2, lo
	cset w10, lo
	cmp x0, x11
	ccmp x23, x9, #2, lo
	csinc w9, w10, wzr, hs
	tbz w9, #0, LBB153_23
LBB153_8:
	mov x9, #0
LBB153_9:
	sub x10, x21, x9
	add x11, x0, x9, lsl #4
	add x11, x11, #8
	add x12, x23, x9, lsl #2
	add x9, x22, x9, lsl #3
	fmov s0, #1.00000000
	movi.2d v1, #0000000000000000
LBB153_10:
	ldr s2, [x12], #4
	fdiv s3, s0, s2
	fcmp s2, #0.0
	ldr d4, [x9], #8
	stur d4, [x11, #-8]
	fcsel s3, s1, s3, eq
	stp s3, s2, [x11], #16
	subs x10, x10, #1
	b.ne LBB153_10
LBB153_11:
	cbz x3, LBB153_20
	ldp s1, s0, [x19]
	sub x9, x3, #1
	sub x10, x21, #1
	mov x11, x0
	b LBB153_14
LBB153_13:
	str d2, [x2]
	sub x9, x9, #1
	sub x10, x10, #1
	mov x2, x13
	mov x11, x12
	cbz x3, LBB153_20
LBB153_14:
	cmp x9, x10
	csel x14, x9, x10, lo
	cbz x21, LBB153_20
	mov x15, #0
	sub x21, x21, #1
	sub x3, x3, #1
	add x13, x2, #8
	add x12, x11, #16
	ldr d3, [x11]
	ldr d2, [x2]
	ldp s5, s4, [x11, #8]
	fmul s5, s5, s1
LBB153_16:
	lsl x16, x15, #4
	add x17, x16, #16
	cmp x15, x14
	csel x1, x15, x14, hi
LBB153_17:
	cmp x1, x15
	b.eq LBB153_13
	mov x16, x15
	add x15, x15, #1
	ldr d6, [x11, x17]
	fsub.2s v6, v6, v3
	fmul.2s v7, v6, v6
	faddp.2s s7, v7
	fadd s7, s0, s7
	add x17, x17, #16
	fcmp s7, #0.0
	b.eq LBB153_17
	add x17, x12, x16, lsl #4
	ldp s17, s16, [x17, #8]
	fmul s17, s17, s5
	fsqrt s18, s7
	fmul s7, s7, s18
	fdiv s7, s17, s7
	fmul.2s v6, v6, v7[0]
	fmul.2s v7, v6, v4[0]
	fadd.2s v2, v2, v7
	fmul.2s v6, v6, v16[0]
	ldr d7, [x13, x16, lsl #3]
	fsub.2s v6, v7, v6
	str d6, [x13, x16, lsl #3]
	b LBB153_16
LBB153_20:
	cbz x8, LBB153_22
	mov w1, #4
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
LBB153_22:
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
LBB153_23:
	.cfi_restore_state
	and x9, x21, #0xffffffffffffffc
	fmov.4s v0, #1.00000000
	mov x10, x22
	mov x11, x23
	mov x12, x0
	and x13, x21, #0xffffffffffffffc
LBB153_24:
	ldp q2, q1, [x10], #32
	ldr q6, [x11], #16
	fdiv.4s v7, v0, v6
	fcmeq.4s v16, v6, #0.0
	bic.16b v5, v7, v16
	uzp2.4s v4, v2, v1
	uzp1.4s v3, v2, v1
	st4.4s { v3, v4, v5, v6 }, [x12], #64
	subs x13, x13, #4
	b.ne LBB153_24
	cmp x21, x9
	b.eq LBB153_11
	b LBB153_9
LBB153_26:
	mov w0, #4
	mov x1, x20
	bl alloc::raw_vec::handle_error
