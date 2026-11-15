engine::force::sweep::<f64>:
Lfunc_begin76:
	.cfi_startproc
	ldr x8, [sp, #24]
	ldr x9, [sp, #40]
	ldr x10, [sp, #8]
	cmp x5, x3
	csel x11, x5, x3, lo
	cmp x7, x11
	csel x11, x7, x11, lo
	cmp x10, x11
	csel x10, x10, x11, lo
	cmp x9, x8
	csel x8, x9, x8, lo
	cmp x8, x10
	csel x8, x8, x10, lo
	cbz x8, LBB76_3
	ldr x11, [sp, #32]
	ldr x10, [sp, #16]
	ldr x9, [sp]
	ldp d1, d2, [x1]
	movi.2d v3, #0000000000000000
	ldr d4, [x1, #16]
	cmp x8, #4
	b.hs LBB76_4
	mov x12, #0
	movi.2d v5, #0000000000000000
	movi.2d v6, #0000000000000000
	b LBB76_7
LBB76_3:
	movi.2d v6, #0000000000000000
	movi.2d v5, #0000000000000000
	stp d5, d6, [x0]
	ret
LBB76_4:
	dup.2d v7, v1[0]
	dup.2d v16, v2[0]
	and x12, x8, #0x7fffffffffffffc
	add x13, x2, #16
	dup.2d v17, v0[0]
	add x14, x11, #16
	add x15, x4, #16
	add x16, x10, #16
	add x17, x6, #16
	add x1, x9, #16
	movi.2d v5, #0000000000000000
	and x3, x8, #0x7fffffffffffffc
	movi.2d v6, #0000000000000000
LBB76_5:
	ldp q18, q19, [x13, #-16]
	fsub.2d v18, v18, v7
	ldp q20, q21, [x15, #-16]
	fsub.2d v19, v19, v7
	fsub.2d v20, v20, v16
	fsub.2d v21, v21, v16
	fmul.2d v22, v18, v18
	fmul.2d v23, v20, v20
	fmul.2d v24, v19, v19
	fmul.2d v25, v21, v21
	fadd.2d v22, v22, v23
	fadd.2d v23, v24, v25
	fadd.2d v22, v17, v22
	ldp q24, q25, [x17, #-16]
	fadd.2d v23, v17, v23
	fmul.2d v24, v24, v4[0]
	fmul.2d v25, v25, v4[0]
	fsqrt.2d v26, v22
	fmul.2d v26, v22, v26
	fsqrt.2d v27, v23
	fmul.2d v27, v23, v27
	fdiv.2d v24, v24, v26
	fcmeq.2d v22, v22, #0.0
	bic.16b v22, v24, v22
	fcmeq.2d v23, v23, #0.0
	fdiv.2d v24, v25, v27
	bic.16b v23, v24, v23
	fmul.2d v18, v18, v22
	mov d24, v18[1]
	fmul.2d v19, v19, v23
	fmul.2d v20, v20, v22
	mov d22, v19[1]
	mov d25, v20[1]
	fmul.2d v21, v21, v23
	ldp q23, q26, [x16, #-16]
	ldp q27, q29, [x1, #-16]
	mov d28, v21[1]
	fmul.2d v30, v27, v18
	fmul.2d v31, v29, v19
	fsub.2d v23, v23, v30
	fsub.2d v26, v26, v31
	ldp q30, q31, [x14, #-16]
	fmul.2d v27, v27, v20
	fmul.2d v29, v29, v21
	fsub.2d v27, v30, v27
	stp q23, q26, [x16, #-16]
	fsub.2d v23, v31, v29
	stp q27, q23, [x14, #-16]
	fadd d5, d5, d18
	fadd d5, d5, d24
	fadd d5, d5, d19
	fadd d6, d6, d20
	fadd d6, d6, d25
	fadd d6, d6, d21
	add x13, x13, #32
	add x14, x14, #32
	fadd d5, d5, d22
	add x15, x15, #32
	fadd d6, d6, d28
	add x16, x16, #32
	add x17, x17, #32
	add x1, x1, #32
	subs x3, x3, #4
	b.ne LBB76_5
	cmp x8, x12
	b.eq LBB76_9
LBB76_7:
	mov x13, #0
	lsl x16, x12, #3
	add x11, x11, x16
	add x10, x10, x16
	add x9, x9, x16
	add x14, x6, x16
	add x15, x4, x16
	add x16, x2, x16
	sub x8, x8, x12
LBB76_8:
	ldr d7, [x16, x13, lsl #3]
	fsub d7, d7, d1
	ldr d16, [x15, x13, lsl #3]
	fsub d16, d16, d2
	fmul d17, d7, d7
	fmul d18, d16, d16
	fadd d17, d17, d18
	fadd d17, d0, d17
	ldr d18, [x14, x13, lsl #3]
	fmul d18, d18, d4
	fsqrt d19, d17
	fmul d19, d17, d19
	fdiv d18, d18, d19
	fcmp d17, #0.0
	fcsel d17, d3, d18, eq
	fmul d7, d7, d17
	fmul d16, d16, d17
	ldr d17, [x10, x13, lsl #3]
	ldr d18, [x9, x13, lsl #3]
	fmul d19, d18, d7
	fsub d17, d17, d19
	str d17, [x10, x13, lsl #3]
	ldr d17, [x11, x13, lsl #3]
	fmul d18, d18, d16
	fsub d17, d17, d18
	str d17, [x11, x13, lsl #3]
	fadd d5, d5, d7
	fadd d6, d16, d6
	add x13, x13, #1
	cmp x8, x13
	b.ne LBB76_8
LBB76_9:
	stp d5, d6, [x0]
	ret
