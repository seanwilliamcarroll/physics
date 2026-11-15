engine::force::pass_one::<f64>:
Lfunc_begin74:
	.cfi_startproc
	ldr x8, [x1, #8]
	ldr x9, [x1, #24]
	ldr x10, [x1, #40]
	ldr x11, [x1, #56]
	ldr x12, [x4, #8]
	ldr x13, [x4, #24]
	cmp x9, x8
	csel x8, x9, x8, lo
	cmp x10, x8
	csel x8, x10, x8, lo
	cmp x11, x8
	csel x8, x11, x8, lo
	cmp x13, x12
	csel x9, x13, x12, lo
	cmp x8, x3
	csel x8, x8, x3, lo
	cmp x9, x8
	csel x8, x9, x8, lo
	cbz x8, LBB74_6
	ldp d0, d1, [x0]
	ldp d2, d3, [x0, #16]
	ldr x9, [x1]
	ldr x10, [x1, #16]
	ldr x11, [x1, #32]
	ldr x12, [x1, #48]
	ldr x13, [x4]
	ldr x14, [x4, #16]
	cmp x8, #8
	b.lo LBB74_3
	sub x15, x13, x14
	sub x16, x9, x13
	sub x17, x10, x13
	sub x0, x11, x13
	sub x1, x12, x13
	sub x3, x9, x14
	sub x4, x10, x14
	sub x5, x11, x14
	sub x6, x12, x14
	cmn x15, #16
	ccmn x16, #16, #2, ls
	ccmn x17, #16, #2, ls
	ccmn x0, #16, #2, ls
	ccmn x1, #16, #2, ls
	ccmn x3, #16, #2, ls
	ccmn x4, #16, #2, ls
	ccmn x5, #16, #2, ls
	ccmn x6, #16, #2, ls
	b.ls LBB74_7
LBB74_3:
	mov x15, #0
LBB74_4:
	mov x16, #0
	lsl x17, x15, #3
	add x14, x14, x17
	add x13, x13, x17
	add x12, x12, x17
	add x11, x11, x17
	add x10, x10, x17
	add x9, x9, x17
	sub x8, x8, x15
	add x15, x2, x15, lsl #4
	add x15, x15, #8
	movi.2d v4, #0000000000000000
LBB74_5:
	ldr d5, [x9, x16, lsl #3]
	ldr d6, [x10, x16, lsl #3]
	ldr d7, [x11, x16, lsl #3]
	ldr d16, [x12, x16, lsl #3]
	fsub d5, d5, d0
	fsub d6, d6, d1
	fmul d17, d5, d5
	fmul d18, d6, d6
	fadd d17, d17, d18
	fadd d17, d3, d17
	fmul d7, d2, d7
	fsqrt d18, d17
	fmul d18, d17, d18
	fdiv d7, d7, d18
	fcmp d17, #0.0
	fcsel d7, d4, d7, eq
	fmul d5, d5, d7
	fmul d6, d6, d7
	fmul d7, d16, d5
	ldp d17, d18, [x15, #-8]
	fsub d7, d17, d7
	fmul d16, d16, d6
	fsub d16, d18, d16
	stp d7, d16, [x15, #-8]
	str d5, [x13, x16, lsl #3]
	str d6, [x14, x16, lsl #3]
	add x16, x16, #1
	add x15, x15, #16
	cmp x8, x16
	b.ne LBB74_5
LBB74_6:
	ret
LBB74_7:
	and x15, x8, #0x7fffffffffffffe
	dup.2d v4, v0[0]
	dup.2d v5, v1[0]
	mov x16, x2
	mov x17, x9
	mov x0, x10
	mov x1, x11
	dup.2d v6, v3[0]
	mov x3, x12
	mov x4, x13
	mov x5, x14
	and x6, x8, #0x7fffffffffffffe
LBB74_8:
	ldr q7, [x17], #16
	ldr q16, [x0], #16
	ldr q17, [x1], #16
	ldr q18, [x3], #16
	fsub.2d v7, v7, v4
	fsub.2d v16, v16, v5
	fmul.2d v19, v7, v7
	fmul.2d v20, v16, v16
	fadd.2d v19, v19, v20
	fadd.2d v19, v6, v19
	fmul.2d v17, v17, v2[0]
	fsqrt.2d v20, v19
	fmul.2d v20, v19, v20
	fdiv.2d v17, v17, v20
	fcmeq.2d v19, v19, #0.0
	bic.16b v17, v17, v19
	fmul.2d v7, v7, v17
	fmul.2d v16, v16, v17
	fmul.2d v17, v18, v7
	ld2.2d { v19, v20 }, [x16]
	fsub.2d v21, v19, v17
	fmul.2d v17, v18, v16
	fsub.2d v22, v20, v17
	st2.2d { v21, v22 }, [x16], #32
	str q7, [x4], #16
	str q16, [x5], #16
	subs x6, x6, #2
	b.ne LBB74_8
	cmp x8, x15
	b.eq LBB74_6
	b LBB74_4
