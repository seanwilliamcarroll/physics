engine::force::sweep::<f64>:
Lfunc_begin76:
	.cfi_startproc
	sub sp, sp, #192
	.cfi_def_cfa_offset 192
	stp d15, d14, [sp, #32]
	stp d13, d12, [sp, #48]
	stp d11, d10, [sp, #64]
	stp d9, d8, [sp, #80]
	stp x28, x27, [sp, #96]
	stp x26, x25, [sp, #112]
	stp x24, x23, [sp, #128]
	stp x22, x21, [sp, #144]
	stp x20, x19, [sp, #160]
	stp x29, x30, [sp, #176]
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
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
	.cfi_offset b14, -152
	.cfi_offset b15, -160
	ldp x8, x11, [sp, #224]
	ldp x9, x12, [sp, #208]
	ldp x10, x13, [sp, #192]
	and x27, x5, #0x1
	lsr x17, x5, #1
	and x15, x7, #0x1
	lsr x19, x7, #1
	and x16, x13, #0x1
	lsr x20, x13, #1
	lsr x21, x3, #1
	cmp x17, x21
	csel x17, x17, x21, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cmp x20, x17
	csel x17, x20, x17, lo
	lsr x19, x12, #1
	lsr x20, x11, #1
	cmp x20, x19
	csel x19, x20, x19, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cbz x17, LBB76_3
	ldr q18, [x1]
	ldr d14, [x1, #16]
	cmp x17, #4
	b.hs LBB76_4
	mov x19, #0
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	b LBB76_7
LBB76_3:
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	b LBB76_9
LBB76_4:
	and x19, x17, #0x3fffffffffffffc
	dup.2d v5, v18[0]
	stp q18, q0, [sp]
	dup.2d v6, v18[1]
	add x20, x8, #32
	dup.2d v7, v0[0]
	add x21, x9, #32
	add x22, x10, #32
	add x23, x6, #32
	add x24, x4, #32
	add x25, x2, #32
	movi.2d v16, #0000000000000000
	and x26, x17, #0x3fffffffffffffc
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	movi.2d v17, #0000000000000000
LBB76_5:
	sub x27, x25, #32
	sub x30, x24, #32
	sub x14, x23, #32
	sub x28, x22, #32
	ld2.2d { v18, v19 }, [x27]
	sub x27, x21, #32
	ld2.2d { v20, v21 }, [x25]
	fsub.2d v22, v18, v5
	fsub.2d v23, v20, v5
	ld2.2d { v26, v27 }, [x30]
	fsub.2d v24, v19, v5
	fsub.2d v25, v21, v5
	ld2.2d { v28, v29 }, [x24]
	fsub.2d v20, v26, v6
	fsub.2d v18, v28, v6
	fsub.2d v21, v27, v6
	fsub.2d v19, v29, v6
	fmul.2d v26, v22, v22
	fmul.2d v27, v23, v23
	fmul.2d v28, v20, v20
	fmul.2d v29, v18, v18
	fadd.2d v27, v27, v29
	fmul.2d v29, v24, v24
	fmul.2d v30, v25, v25
	fmul.2d v31, v21, v21
	fadd.2d v26, v26, v28
	fmul.2d v28, v19, v19
	ld2.2d { v8, v9 }, [x14]
	fadd.2d v27, v7, v27
	fadd.2d v29, v29, v31
	ld2.2d { v10, v11 }, [x23]
	fadd.2d v26, v7, v26
	fadd.2d v28, v30, v28
	fadd.2d v29, v7, v29
	fadd.2d v28, v7, v28
	fmul.2d v30, v8, v14[0]
	fmul.2d v31, v10, v14[0]
	fsqrt.2d v12, v26
	fsqrt.2d v13, v27
	fmul.2d v12, v26, v12
	fmul.2d v13, v27, v13
	fdiv.2d v31, v31, v13
	fcmeq.2d v26, v26, #0.0
	fdiv.2d v30, v30, v12
	fcmeq.2d v12, v27, #0.0
	fmul.2d v8, v9, v14[0]
	fmul.2d v9, v11, v14[0]
	fsqrt.2d v10, v29
	fsqrt.2d v11, v28
	bic.16b v27, v30, v26
	fmul.2d v26, v29, v10
	fmul.2d v30, v28, v11
	fdiv.2d v26, v8, v26
	fcmeq.2d v29, v29, #0.0
	bic.16b v29, v26, v29
	fdiv.2d v26, v9, v30
	fcmeq.2d v28, v28, #0.0
	ld2.2d { v8, v9 }, [x27]
	bic.16b v30, v31, v12
	bic.16b v28, v26, v28
	ld2.2d { v10, v11 }, [x21]
	fmul.2d v26, v22, v27
	fmul.2d v22, v23, v30
	ld2.2d { v12, v13 }, [x28]
	fmul.2d v23, v24, v29
	fmul.2d v24, v25, v28
	mov.16b v0, v14
	ld2.2d { v14, v15 }, [x22]
	fmul.2d v25, v12, v26
	fmul.2d v31, v13, v23
	fsub.2d v3, v8, v25
	fsub.2d v4, v9, v31
	fmul.2d v25, v14, v22
	fmul.2d v31, v15, v24
	fsub.2d v8, v10, v25
	fsub.2d v9, v11, v31
	st2.2d { v8, v9 }, [x21]
	fmul.2d v20, v20, v27
	sub x14, x20, #32
	fmul.2d v21, v21, v29
	st2.2d { v3, v4 }, [x27]
	ld2.2d { v3, v4 }, [x14]
	fmul.2d v25, v12, v20
	fmul.2d v27, v13, v21
	fsub.2d v8, v3, v25
	fsub.2d v9, v4, v27
	st2.2d { v8, v9 }, [x14]
	ld2.2d { v3, v4 }, [x20]
	fmul.2d v18, v18, v30
	fmul.2d v19, v19, v28
	fmul.2d v25, v14, v18
	fmul.2d v27, v15, v19
	mov.16b v14, v0
	fsub.2d v28, v3, v25
	fsub.2d v29, v4, v27
	st2.2d { v28, v29 }, [x20]
	fadd d3, d16, d21
	mov d4, v21[1]
	fadd d3, d3, d4
	fadd d3, d3, d19
	mov d4, v19[1]
	fadd d16, d3, d4
	fadd d1, d1, d23
	mov d3, v23[1]
	fadd d1, d1, d3
	fadd d1, d1, d24
	mov d3, v24[1]
	fadd d1, d1, d3
	fadd d2, d2, d26
	mov d3, v26[1]
	fadd d2, d2, d3
	fadd d2, d2, d22
	mov d3, v22[1]
	fadd d2, d2, d3
	fadd d3, d17, d20
	mov d4, v20[1]
	fadd d3, d3, d4
	fadd d3, d3, d18
	mov d4, v18[1]
	fadd d17, d3, d4
	add x20, x20, #64
	add x21, x21, #64
	add x22, x22, #64
	add x23, x23, #64
	add x24, x24, #64
	add x25, x25, #64
	subs x26, x26, #4
	b.ne LBB76_5
	mov.d v2[1], v17[0]
	mov.d v1[1], v16[0]
	cmp x17, x19
	ldp q18, q0, [sp]
	and x27, x5, #0x1
	b.eq LBB76_9
LBB76_7:
	mov x20, #0
	dup.2d v5, v0[0]
	lsl x14, x19, #4
	add x21, x8, x14
	add x22, x9, x14
	add x23, x10, x14
	add x24, x6, x14
	add x25, x4, x14
	add x26, x2, x14
	sub x17, x17, x19
LBB76_8:
	lsl x14, x20, #4
	ldr q3, [x26, x14]
	ldr q4, [x25, x14]
	zip2.2d v6, v3, v4
	zip1.2d v3, v3, v4
	fsub.2d v3, v3, v18
	fsub.2d v4, v6, v18
	fmul.2d v6, v4, v4
	fmul.2d v7, v3, v3
	faddp.2d v6, v7, v6
	fadd.2d v6, v5, v6
	ldr q7, [x24, x14]
	fmul.2d v7, v7, v14[0]
	fsqrt.2d v16, v6
	fmul.2d v16, v6, v16
	fdiv.2d v7, v7, v16
	fcmeq.2d v6, v6, #0.0
	bic.16b v6, v7, v6
	fmul.2d v4, v4, v6[1]
	fmul.2d v3, v3, v6[0]
	ldr q6, [x22, x14]
	ldr q7, [x23, x14]
	zip1.2d v16, v3, v4
	fmul.2d v16, v7, v16
	zip2.2d v17, v3, v4
	fsub.2d v6, v6, v16
	fmul.2d v7, v7, v17
	ldr q16, [x21, x14]
	fsub.2d v7, v16, v7
	str q6, [x22, x14]
	str q7, [x21, x14]
	fadd.2d v2, v3, v2
	fadd.2d v1, v4, v1
	add x20, x20, #1
	cmp x17, x20
	b.ne LBB76_8
LBB76_9:
	and x14, x3, #0x1
	cmp x27, x14
	csel x14, x27, x14, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	cmp x16, x14
	csel x14, x16, x14, lo
	and x15, x12, #0x1
	and x16, x11, #0x1
	cmp x16, x15
	csel x15, x16, x15, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	mov d3, v2[1]
	cbz x14, LBB76_11
	and x14, x3, #0xffffffffffffffe
	and x15, x5, #0xffffffffffffffe
	and x16, x7, #0xffffffffffffffe
	and x13, x13, #0xffffffffffffffe
	and x12, x12, #0x7fffffffffffffe
	and x11, x11, #0x7fffffffffffffe
	ldp d18, d4, [x1]
	ldr d5, [x2, x14, lsl #3]
	ldr d6, [x4, x15, lsl #3]
	ldr d7, [x6, x16, lsl #3]
	ldr d16, [x10, x13, lsl #3]
	ldr d17, [x1, #16]
	fsub d18, d5, d18
	fsub d4, d6, d4
	fmul d5, d18, d18
	fmul d6, d4, d4
	fadd d5, d5, d6
	fadd d5, d0, d5
	fmul d6, d7, d17
	fsqrt d7, d5
	fmul d7, d5, d7
	fdiv d6, d6, d7
	fcmp d5, #0.0
	movi.2d v5, #0000000000000000
	fcsel d5, d5, d6, eq
	fmul d0, d18, d5
	fmul d4, d4, d5
	ldr d5, [x9, x12, lsl #3]
	fmul d6, d16, d0
	fsub d5, d5, d6
	str d5, [x9, x12, lsl #3]
	ldr d5, [x8, x11, lsl #3]
	fmul d6, d16, d4
	fsub d5, d5, d6
	str d5, [x8, x11, lsl #3]
	fadd d2, d2, d0
	fadd d3, d3, d4
LBB76_11:
	stp d2, d1, [x0]
	str d3, [x0, #16]
	add x8, x0, #24
	st1.d { v1 }[1], [x8]
	ldp x29, x30, [sp, #176]
	ldp x20, x19, [sp, #160]
	ldp x22, x21, [sp, #144]
	ldp x24, x23, [sp, #128]
	ldp x26, x25, [sp, #112]
	ldp x28, x27, [sp, #96]
	ldp d9, d8, [sp, #80]
	ldp d11, d10, [sp, #64]
	ldp d13, d12, [sp, #48]
	ldp d15, d14, [sp, #32]
	add sp, sp, #192
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
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
