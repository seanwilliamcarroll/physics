engine::force::pass_one::<f32>:
Lfunc_begin75:
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
	cbz x8, LBB75_6
	ldp s0, s1, [x0]
	ldp s2, s3, [x0, #8]
	ldr x9, [x1]
	ldr x10, [x1, #16]
	ldr x11, [x1, #32]
	ldr x12, [x1, #48]
	ldr x13, [x4]
	ldr x14, [x4, #16]
	cmp x8, #8
	b.lo LBB75_3
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
	b.ls LBB75_7
LBB75_3:
	mov x15, #0
LBB75_4:
	mov x16, #0
	lsl x17, x15, #2
	add x14, x14, x17
	add x13, x13, x17
	add x12, x12, x17
	add x11, x11, x17
	add x10, x10, x17
	add x9, x9, x17
	sub x8, x8, x15
	add x15, x2, x15, lsl #3
	add x15, x15, #4
	movi.2d v4, #0000000000000000
LBB75_5:
	ldr s5, [x9, x16, lsl #2]
	ldr s6, [x10, x16, lsl #2]
	ldr s7, [x11, x16, lsl #2]
	ldr s16, [x12, x16, lsl #2]
	fsub s5, s5, s0
	fsub s6, s6, s1
	fmul s17, s5, s5
	fmul s18, s6, s6
	fadd s17, s17, s18
	fadd s17, s3, s17
	fmul s7, s2, s7
	fsqrt s18, s17
	fmul s18, s17, s18
	fdiv s7, s7, s18
	fcmp s17, #0.0
	fcsel s7, s4, s7, eq
	fmul s5, s5, s7
	fmul s6, s6, s7
	fmul s7, s16, s5
	ldp s17, s18, [x15, #-4]
	fsub s7, s17, s7
	fmul s16, s16, s6
	fsub s16, s18, s16
	stp s7, s16, [x15, #-4]
	str s5, [x13, x16, lsl #2]
	str s6, [x14, x16, lsl #2]
	add x16, x16, #1
	add x15, x15, #8
	cmp x8, x16
	b.ne LBB75_5
LBB75_6:
	ret
LBB75_7:
	and x15, x8, #0xffffffffffffffc
	dup.4s v4, v0[0]
	dup.4s v5, v1[0]
	mov x16, x2
	mov x17, x9
	mov x0, x10
	mov x1, x11
	dup.4s v6, v3[0]
	mov x3, x12
	mov x4, x13
	mov x5, x14
	and x6, x8, #0xffffffffffffffc
LBB75_8:
	ldr q7, [x17], #16
	ldr q16, [x0], #16
	ldr q17, [x1], #16
	ldr q18, [x3], #16
	fsub.4s v7, v7, v4
	fsub.4s v16, v16, v5
	fmul.4s v19, v7, v7
	fmul.4s v20, v16, v16
	fadd.4s v19, v19, v20
	fadd.4s v19, v6, v19
	fmul.4s v17, v17, v2[0]
	fsqrt.4s v20, v19
	fmul.4s v20, v19, v20
	fdiv.4s v17, v17, v20
	fcmeq.4s v19, v19, #0.0
	bic.16b v17, v17, v19
	fmul.4s v7, v7, v17
	fmul.4s v16, v16, v17
	fmul.4s v17, v18, v7
	ld2.4s { v19, v20 }, [x16]
	fsub.4s v21, v19, v17
	fmul.4s v17, v18, v16
	fsub.4s v22, v20, v17
	st2.4s { v21, v22 }, [x16], #32
	str q7, [x4], #16
	str q16, [x5], #16
	subs x6, x6, #4
	b.ne LBB75_8
	cmp x8, x15
	b.eq LBB75_6
	b LBB75_4
