<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin152:
	.cfi_startproc
	sub sp, sp, #160
	.cfi_def_cfa_offset 160
	stp d15, d14, [sp, #16]
	stp d13, d12, [sp, #32]
	stp d11, d10, [sp, #48]
	stp d9, d8, [sp, #64]
	stp x26, x25, [sp, #80]
	stp x24, x23, [sp, #96]
	stp x22, x21, [sp, #112]
	stp x20, x19, [sp, #128]
	stp x29, x30, [sp, #144]
	add x29, sp, #144
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
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	.cfi_offset b14, -136
	.cfi_offset b15, -144
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
	cbz x0, LBB152_29
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
	tbz w9, #0, LBB152_26
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
	cbz x3, LBB152_23
	ldp d20, d0, [x19]
	dup.2d v2, v0[0]
	sub x9, x3, #1
	sub x10, x21, #1
	add x11, x2, #80
	add x12, x0, #160
	movi.2d v21, #0000000000000000
	mov x13, x0
	str d20, [sp, #8]
	b LBB152_14
LBB152_13:
	stp d4, d5, [x2], #16
	add x13, x13, #32
	sub x9, x9, #1
	sub x10, x10, #1
	add x11, x11, #16
	add x12, x12, #32
	cbz x3, LBB152_23
LBB152_14:
	mov x16, x21
	cmp x9, x10
	csel x14, x9, x10, lo
	sub x21, x21, #1
	sub x3, x3, #1
	cmp x21, x3
	csel x15, x21, x3, lo
	cbz x16, LBB152_23
	ldp d4, d5, [x2]
	and x16, x3, #0xfffffffffffffff
	cmp x21, x16
	csel x16, x21, x16, lo
	cbz x16, LBB152_13
	ldr q6, [x13]
	ldp d16, d7, [x13, #16]
	fmul d16, d16, d20
	cmp x15, #7
	b.hi LBB152_18
	mov x16, #0
	b LBB152_21
LBB152_18:
	and x17, x14, #0xffffffffffffff8
	and x16, x15, #0xffffffffffffff8
	dup.2d v17, v6[0]
	dup.2d v18, v6[1]
	mov x1, x12
	mov x4, x11
LBB152_19:
	sub x5, x1, #128
	ld4.2d { v8, v9, v10, v11 }, [x5]
	sub x5, x1, #64
	ld4.2d { v24, v25, v26, v27 }, [x5]
	mov x5, x1
	ld4.2d { v20, v21, v22, v23 }, [x5], #64
	fsub.2d v19, v8, v17
	fsub.2d v31, v24, v17
	fsub.2d v29, v20, v17
	fsub.2d v28, v9, v18
	fsub.2d v30, v21, v18
	fsub.2d v12, v25, v18
	fmul.2d v13, v19, v19
	fmul.2d v14, v31, v31
	fmul.2d v15, v29, v29
	fmul.2d v1, v28, v28
	fadd.2d v1, v13, v1
	fmul.2d v13, v12, v12
	fmul.2d v3, v30, v30
	fadd.2d v13, v14, v13
	fadd.2d v3, v15, v3
	fadd.2d v1, v1, v2
	fsqrt.2d v14, v1
	fmul.2d v15, v10, v16[0]
	fmul.2d v14, v1, v14
	fdiv.2d v14, v15, v14
	fcmeq.2d v1, v1, #0.0
	bic.16b v1, v14, v1
	fadd.2d v3, v3, v2
	fmul.2d v19, v19, v1
	fmul.2d v28, v28, v1
	fmul.2d v1, v11, v19
	fmul.2d v9, v11, v28
	fmul.2d v8, v26, v16[0]
	fmul.2d v10, v22, v16[0]
	fadd.2d v11, v13, v2
	fsqrt.2d v13, v3
	fmul.2d v13, v3, v13
	fdiv.2d v10, v10, v13
	fsqrt.2d v13, v11
	fmul.2d v13, v11, v13
	fdiv.2d v8, v8, v13
	fcmeq.2d v11, v11, #0.0
	bic.16b v8, v8, v11
	fmul.2d v31, v31, v8
	fmul.2d v8, v12, v8
	fmul.2d v11, v27, v31
	fmul.2d v26, v27, v8
	ld4.2d { v12, v13, v14, v15 }, [x5]
	fcmeq.2d v3, v3, #0.0
	bic.16b v3, v10, v3
	sub x5, x4, #64
	sub x6, x4, #32
	fmul.2d v24, v29, v3
	fmul.2d v25, v30, v3
	fmul.2d v3, v23, v24
	fmul.2d v20, v23, v25
	ld2.2d { v21, v22 }, [x5]
	fsub.2d v29, v21, v1
	fsub.2d v30, v22, v9
	ld2.2d { v21, v22 }, [x6]
	fsub.2d v9, v21, v11
	fsub.2d v10, v22, v26
	st2.2d { v29, v30 }, [x5]
	fsub.2d v1, v12, v17
	mov x5, x4
	st2.2d { v9, v10 }, [x6]
	ld2.2d { v21, v22 }, [x5], #32
	fsub.2d v26, v21, v3
	fsub.2d v27, v22, v20
	fsub.2d v3, v13, v18
	fmul.2d v20, v1, v1
	fmul.2d v21, v3, v3
	fadd.2d v20, v20, v21
	fadd.2d v20, v20, v2
	st2.2d { v26, v27 }, [x4]
	fmul.2d v21, v14, v16[0]
	fsqrt.2d v22, v20
	fmul.2d v22, v20, v22
	fdiv.2d v21, v21, v22
	fcmeq.2d v20, v20, #0.0
	bic.16b v20, v21, v20
	fmul.2d v1, v1, v20
	fmul.2d v3, v3, v20
	fmul.2d v20, v15, v1
	fmul.2d v21, v15, v3
	ld2.2d { v22, v23 }, [x5]
	fsub.2d v26, v22, v20
	fsub.2d v27, v23, v21
	st2.2d { v26, v27 }, [x5]
	fmul.2d v20, v28, v7[0]
	fadd d5, d5, d20
	mov d20, v20[1]
	fadd d5, d5, d20
	fmul.2d v20, v8, v7[0]
	fadd d5, d5, d20
	mov d20, v20[1]
	fadd d5, d5, d20
	fmul.2d v20, v25, v7[0]
	fadd d5, d5, d20
	mov d20, v20[1]
	fadd d5, d5, d20
	fmul.2d v3, v3, v7[0]
	fadd d5, d5, d3
	mov d3, v3[1]
	fadd d5, d5, d3
	fmul.2d v3, v19, v7[0]
	fadd d4, d4, d3
	mov d3, v3[1]
	fadd d3, d4, d3
	fmul.2d v4, v31, v7[0]
	fadd d3, d3, d4
	mov d4, v4[1]
	fadd d3, d3, d4
	fmul.2d v4, v24, v7[0]
	fadd d3, d3, d4
	mov d4, v4[1]
	fadd d3, d3, d4
	fmul.2d v1, v1, v7[0]
	fadd d3, d3, d1
	mov d1, v1[1]
	fadd d4, d3, d1
	add x4, x4, #128
	add x1, x1, #256
	subs x17, x17, #8
	b.ne LBB152_19
	cmp x15, x16
	ldr d20, [sp, #8]
	movi.2d v21, #0000000000000000
	b.eq LBB152_13
LBB152_21:
	lsl x15, x16, #5
	lsl x17, x16, #4
	add x17, x17, #16
	sub x14, x14, x16
LBB152_22:
	add x16, x13, x15
	ldr q1, [x16, #32]
	ldp d3, d17, [x16, #48]
	fsub.2d v1, v1, v6
	fmul.2d v18, v1, v1
	faddp.2d d18, v18
	fadd d18, d18, d0
	fsqrt d19, d18
	fmul d3, d3, d16
	fmul d19, d18, d19
	fdiv d3, d3, d19
	fcmp d18, #0.0
	fcsel d3, d21, d3, eq
	fmul.2d v1, v1, v3[0]
	fmul d3, d7, d1
	fmul.d d18, d7, v1[1]
	fadd d5, d5, d18
	fmul.2d v1, v1, v17[0]
	ldr q17, [x2, x17]
	fadd d4, d4, d3
	fsub.2d v1, v17, v1
	str q1, [x2, x17]
	add x15, x15, #32
	add x17, x17, #16
	subs x14, x14, #1
	b.ne LBB152_22
	b LBB152_13
LBB152_23:
	cbz x8, LBB152_25
	mov w1, #8
	.cfi_def_cfa wsp, 160
	ldp x29, x30, [sp, #144]
	ldp x20, x19, [sp, #128]
	ldp x22, x21, [sp, #112]
	ldp x24, x23, [sp, #96]
	ldp x26, x25, [sp, #80]
	ldp d9, d8, [sp, #64]
	ldp d11, d10, [sp, #48]
	ldp d13, d12, [sp, #32]
	ldp d15, d14, [sp, #16]
	add sp, sp, #160
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
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	b __rustc::__rdl_dealloc
LBB152_25:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 160
	ldp x29, x30, [sp, #144]
	ldp x20, x19, [sp, #128]
	ldp x22, x21, [sp, #112]
	ldp x24, x23, [sp, #96]
	ldp x26, x25, [sp, #80]
	ldp d9, d8, [sp, #64]
	ldp d11, d10, [sp, #48]
	ldp d13, d12, [sp, #32]
	ldp d15, d14, [sp, #16]
	add sp, sp, #160
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
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
LBB152_26:
	.cfi_restore_state
	and x9, x21, #0x7fffffffffffffe
	fmov.2d v0, #1.00000000
	mov x10, x22
	mov x11, x23
	mov x12, x0
	and x13, x21, #0x7fffffffffffffe
LBB152_27:
	ldp q2, q1, [x10], #32
	ldr q6, [x11], #16
	fdiv.2d v7, v0, v6
	fcmeq.2d v16, v6, #0.0
	bic.16b v5, v7, v16
	zip2.2d v4, v2, v1
	zip1.2d v3, v2, v1
	st4.2d { v3, v4, v5, v6 }, [x12], #64
	subs x13, x13, #2
	b.ne LBB152_27
	cmp x21, x9
	b.eq LBB152_11
	b LBB152_9
LBB152_29:
	mov w0, #8
	mov x1, x20
	bl alloc::raw_vec::handle_error
