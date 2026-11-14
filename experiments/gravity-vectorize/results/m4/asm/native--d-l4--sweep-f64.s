engine::force::sweep::<f64>:
Lfunc_begin76:
	.cfi_startproc
	sub sp, sp, #304
	.cfi_def_cfa_offset 304
	stp d15, d14, [sp, #144]
	stp d13, d12, [sp, #160]
	stp d11, d10, [sp, #176]
	stp d9, d8, [sp, #192]
	stp x28, x27, [sp, #208]
	stp x26, x25, [sp, #224]
	stp x24, x23, [sp, #240]
	stp x22, x21, [sp, #256]
	stp x20, x19, [sp, #272]
	stp x29, x30, [sp, #288]
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
	mov.16b v23, v0
	ldp x8, x10, [sp, #336]
	ldp x9, x12, [sp, #320]
	ldp x11, x13, [sp, #304]
	lsr x17, x5, #2
	lsr x19, x7, #2
	and x16, x13, #0x3
	lsr x20, x13, #2
	lsr x21, x3, #2
	cmp x17, x21
	csel x17, x17, x21, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cmp x20, x17
	csel x17, x20, x17, lo
	lsr x19, x12, #2
	lsr x20, x10, #2
	cmp x20, x19
	csel x19, x20, x19, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cbz x17, LBB76_3
	ldr q0, [x1]
	ldr d25, [x1, #16]
	dup.2d v30, v0[0]
	dup.2d v26, v0[1]
	cmp x17, #1
	b.ne LBB76_4
	mov x19, #0
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v24, #0000000000000000
	b LBB76_7
LBB76_3:
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v24, #0000000000000000
	b LBB76_9
LBB76_4:
	stp q0, q23, [sp, #16]
	and x19, x17, #0x1fffffffffffffe
	dup.2d v0, v23[0]
	stp q0, q25, [sp, #48]
	movi.2d v19, #0000000000000000
	mov x20, x2
	movi.2d v21, #0000000000000000
	mov x21, x4
	mov x22, x6
	mov x23, x11
	mov x24, x9
	mov x25, x8
	and x26, x17, #0x1fffffffffffffe
	movi.2d v20, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v4, #0000000000000000
	movi.2d v3, #0000000000000000
	movi.2d v2, #0000000000000000
	movi.2d v0, #0000000000000000
	str q26, [sp, #80]
LBB76_5:
	stp q19, q0, [sp, #96]
	str q24, [sp, #128]
	ld4.2d { v22, v23, v24, v25 }, [x20], #64
	ld4.2d { v26, v27, v28, v29 }, [x21], #64
	ld4.2d { v8, v9, v10, v11 }, [x22], #64
	ld4.2d { v12, v13, v14, v15 }, [x24]
	fsub.2d v6, v22, v30
	fsub.2d v7, v23, v30
	fsub.2d v17, v24, v30
	fsub.2d v0, v25, v30
	ldp q1, q5, [sp, #64]
	fsub.2d v16, v26, v5
	mov.16b v19, v30
	fsub.2d v30, v27, v5
	fsub.2d v31, v28, v5
	fsub.2d v26, v29, v5
	ld4.2d { v22, v23, v24, v25 }, [x23], #64
	fmul.2d v27, v6, v6
	fmul.2d v28, v16, v16
	fadd.2d v27, v27, v28
	fmul.2d v28, v8, v1[0]
	fmul.2d v29, v9, v1[0]
	fmul.2d v5, v10, v1[0]
	fmul.2d v8, v11, v1[0]
	fmul.2d v9, v7, v7
	fmul.2d v10, v30, v30
	fadd.2d v9, v9, v10
	fmul.2d v10, v17, v17
	fmul.2d v11, v31, v31
	fadd.2d v10, v10, v11
	fmul.2d v11, v0, v0
	fmul.2d v18, v26, v26
	fadd.2d v18, v11, v18
	ldr q1, [sp, #48]
	fadd.2d v27, v1, v27
	fsqrt.2d v11, v27
	fmul.2d v11, v27, v11
	fdiv.2d v28, v28, v11
	fadd.2d v9, v1, v9
	fadd.2d v10, v1, v10
	fadd.2d v18, v1, v18
	fcmeq.2d v27, v27, #0.0
	bic.16b v28, v28, v27
	fsqrt.2d v27, v9
	fmul.2d v27, v9, v27
	fdiv.2d v27, v29, v27
	fcmeq.2d v29, v9, #0.0
	bic.16b v29, v27, v29
	fsqrt.2d v27, v10
	fmul.2d v27, v10, v27
	fdiv.2d v5, v5, v27
	fcmeq.2d v27, v10, #0.0
	fsqrt.2d v9, v18
	bic.16b v5, v5, v27
	fmul.2d v27, v18, v9
	fdiv.2d v27, v8, v27
	fcmeq.2d v18, v18, #0.0
	bic.16b v18, v27, v18
	fmul.2d v27, v6, v28
	fmul.2d v6, v7, v29
	fmul.2d v7, v27, v22
	fmul.2d v8, v6, v23
	mov.16b v9, v2
	mov.16b v10, v3
	mov.16b v11, v4
	fsub.2d v1, v12, v7
	fsub.2d v2, v13, v8
	fmul.2d v7, v17, v5
	fmul.2d v17, v7, v24
	fsub.2d v3, v14, v17
	fmul.2d v0, v0, v18
	fmul.2d v17, v0, v25
	fsub.2d v4, v15, v17
	fmul.2d v16, v16, v28
	st4.2d { v1, v2, v3, v4 }, [x24], #64
	ld4.2d { v1, v2, v3, v4 }, [x25]
	fmul.2d v17, v30, v29
	mov.16b v30, v19
	fmul.2d v5, v31, v5
	fmul.2d v18, v26, v18
	fmul.2d v26, v16, v22
	fmul.2d v28, v17, v23
	fmul.2d v29, v5, v24
	fmul.2d v22, v18, v25
	fsub.2d v23, v1, v26
	fsub.2d v24, v2, v28
	fsub.2d v25, v3, v29
	fsub.2d v26, v4, v22
	st4.2d { v23, v24, v25, v26 }, [x25], #64
	ldr q1, [sp, #96]
	fadd d1, d1, d18
	mov d2, v18[1]
	fadd d19, d1, d2
	fadd d1, d21, d5
	mov d2, v5[1]
	fadd d21, d1, d2
	fadd d1, d20, d17
	mov d2, v17[1]
	fadd d20, d1, d2
	ldr q1, [sp, #128]
	fadd d1, d1, d0
	mov d0, v0[1]
	fadd d24, d1, d0
	fadd d0, d11, d7
	mov d1, v7[1]
	fadd d4, d0, d1
	fadd d0, d10, d6
	mov d1, v6[1]
	fadd d3, d0, d1
	fadd d0, d9, d27
	mov d1, v27[1]
	fadd d2, d0, d1
	ldr q0, [sp, #112]
	fadd d0, d0, d16
	mov d1, v16[1]
	fadd d0, d0, d1
	subs x26, x26, #2
	b.ne LBB76_5
	mov.d v21[1], v4[0]
	mov.d v20[1], v3[0]
	mov.d v24[1], v2[0]
	mov.d v19[1], v0[0]
	cmp x17, x19
	ldp q0, q23, [sp, #16]
	ldp q25, q26, [sp, #64]
	b.eq LBB76_9
LBB76_7:
	ext.16b v16, v0, v0, #8
	sub x17, x17, x19
	lsl x19, x19, #5
	add x20, x8, #16
	add x21, x9, #16
	dup.2d v17, v23[0]
	add x22, x11, #16
	mov x23, x6
	mov x24, x4
	mov x25, x2
LBB76_8:
	add x30, x25, x19
	add x14, x24, x19
	add x15, x23, x19
	add x28, x22, x19
	add x27, x21, x19
	add x26, x20, x19
	ldr d0, [x30, #24]
	ld1.d { v0 }[1], [x30], #8
	ldr q1, [x30]
	ldr d2, [x14, #24]
	ld1.d { v2 }[1], [x14], #8
	ldr q3, [x14]
	zip2.2d v4, v3, v1
	zip1.2d v1, v3, v1
	fsub.2d v1, v1, v16
	fsub.2d v3, v4, v16
	fmul.2d v4, v3, v3
	fmul.2d v5, v1, v1
	faddp.2d v4, v5, v4
	fadd.2d v4, v17, v4
	ldur q5, [x15, #8]
	fmul.2d v5, v5, v25[0]
	fsqrt.2d v6, v4
	fmul.2d v6, v4, v6
	fdiv.2d v5, v5, v6
	fcmeq.2d v4, v4, #0.0
	fsub.2d v0, v0, v30
	fsub.2d v2, v2, v26
	fmul.2d v6, v2, v2
	fmul.2d v7, v0, v0
	bic.16b v4, v5, v4
	fadd.2d v5, v7, v6
	fadd.2d v5, v17, v5
	ldr d6, [x15, #24]
	ld1.d { v6 }[1], [x15]
	fmul.2d v3, v3, v4[1]
	fmul.2d v6, v6, v25[0]
	fsqrt.2d v7, v5
	fmul.2d v7, v5, v7
	fdiv.2d v6, v6, v7
	fcmeq.2d v5, v5, #0.0
	fmul.2d v1, v1, v4[0]
	bic.16b v4, v6, v5
	fmul.2d v2, v2, v4
	fmul.2d v0, v0, v4
	ldp q4, q5, [x28, #-16]
	zip2.2d v6, v0, v1
	fmul.2d v6, v6, v4
	ldp q7, q18, [x27, #-16]
	ext.16b v22, v3, v0, #8
	fmul.2d v22, v22, v5
	fsub.2d v6, v7, v6
	fsub.2d v7, v18, v22
	ext.16b v18, v2, v1, #8
	fmul.2d v4, v18, v4
	ldp q18, q22, [x26, #-16]
	fsub.2d v4, v18, v4
	zip1.2d v18, v3, v2
	fmul.2d v5, v18, v5
	fsub.2d v5, v22, v5
	fadd.2d v21, v3, v21
	stp q6, q7, [x27, #-16]
	fadd.2d v20, v1, v20
	fadd.2d v24, v0, v24
	add x20, x20, #32
	add x25, x25, #32
	stp q4, q5, [x26, #-16]
	add x21, x21, #32
	fadd.2d v19, v2, v19
	add x22, x22, #32
	add x24, x24, #32
	add x23, x23, #32
	subs x17, x17, #1
	b.ne LBB76_8
LBB76_9:
	and x14, x3, #0x3
	and x15, x5, #0x3
	cmp x15, x14
	csel x14, x15, x14, lo
	and x15, x7, #0x3
	cmp x15, x14
	csel x14, x15, x14, lo
	cmp x16, x14
	csel x14, x16, x14, lo
	and x15, x12, #0x3
	and x16, x10, #0x3
	cmp x16, x15
	csel x15, x16, x15, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	mov d5, v19[1]
	mov d6, v24[1]
	cbz x14, LBB76_13
	and x15, x3, #0xffffffffffffffc
	and x16, x5, #0xffffffffffffffc
	and x17, x7, #0xffffffffffffffc
	and x3, x13, #0xffffffffffffffc
	and x5, x12, #0x7fffffffffffffc
	and x7, x10, #0x7fffffffffffffc
	add x10, x2, x15, lsl #3
	add x12, x4, x16, lsl #3
	add x13, x6, x17, lsl #3
	add x11, x11, x3, lsl #3
	add x9, x9, x5, lsl #3
	add x8, x8, x7, lsl #3
	ldp d16, d17, [x1]
	ldr d7, [x1, #16]
	ldr d0, [x10]
	ldr d1, [x12]
	ldr d2, [x13]
	ldr d3, [x11]
	fsub d4, d0, d16
	fsub d1, d1, d17
	fmul d0, d4, d4
	fmul d18, d1, d1
	fadd d0, d0, d18
	fadd d0, d23, d0
	fmul d2, d2, d7
	fsqrt d18, d0
	fmul d18, d0, d18
	fdiv d2, d2, d18
	fcmp d0, #0.0
	movi.2d v0, #0000000000000000
	fcsel d2, d0, d2, eq
	fmul d4, d4, d2
	fmul d1, d1, d2
	fmul d2, d3, d4
	ldr d18, [x9]
	fsub d2, d18, d2
	str d2, [x9]
	fmul d2, d3, d1
	ldr d3, [x8]
	fsub d2, d3, d2
	str d2, [x8]
	fadd d6, d6, d4
	fadd d5, d5, d1
	cmp x14, #1
	b.eq LBB76_13
	ldr d1, [x10, #8]
	ldr d2, [x12, #8]
	ldr d3, [x13, #8]
	ldr d4, [x11, #8]
	fsub d1, d1, d16
	fsub d2, d2, d17
	fmul d18, d1, d1
	fmul d22, d2, d2
	fadd d18, d18, d22
	fadd d18, d23, d18
	fmul d3, d3, d7
	fsqrt d22, d18
	fmul d22, d18, d22
	fdiv d3, d3, d22
	fcmp d18, #0.0
	fcsel d0, d0, d3, eq
	fmul d1, d1, d0
	fmul d0, d2, d0
	fmul d2, d4, d1
	ldr d3, [x9, #8]
	fsub d2, d3, d2
	str d2, [x9, #8]
	fmul d2, d4, d0
	ldr d3, [x8, #8]
	fsub d2, d3, d2
	str d2, [x8, #8]
	mov d2, v20[1]
	fadd d1, d2, d1
	fadd d20, d20, d0
	mov.d v20[1], v1[0]
	cmp x14, #2
	b.eq LBB76_13
	ldr d0, [x10, #16]
	ldr d1, [x12, #16]
	ldr d2, [x13, #16]
	ldr d3, [x11, #16]
	fsub d0, d0, d16
	fsub d1, d1, d17
	fmul d4, d0, d0
	fmul d16, d1, d1
	fadd d4, d4, d16
	fadd d4, d23, d4
	fmul d2, d2, d7
	fsqrt d7, d4
	fmul d7, d4, d7
	fdiv d2, d2, d7
	fcmp d4, #0.0
	movi.2d v4, #0000000000000000
	fcsel d2, d4, d2, eq
	fmul d0, d0, d2
	fmul d1, d1, d2
	fmul d2, d3, d0
	ldr d4, [x9, #16]
	fsub d2, d4, d2
	str d2, [x9, #16]
	fmul d2, d3, d1
	ldr d3, [x8, #16]
	fsub d2, d3, d2
	str d2, [x8, #16]
	mov d2, v21[1]
	fadd d0, d2, d0
	fadd d21, d21, d1
	mov.d v21[1], v0[0]
LBB76_13:
	str d6, [x0]
	zip2.2d v0, v20, v21
	stur q0, [x0, #8]
	stp d24, d5, [x0, #24]
	zip1.2d v0, v20, v21
	stur q0, [x0, #40]
	str d19, [x0, #56]
	ldp x29, x30, [sp, #288]
	ldp x20, x19, [sp, #272]
	ldp x22, x21, [sp, #256]
	ldp x24, x23, [sp, #240]
	ldp x26, x25, [sp, #224]
	ldp x28, x27, [sp, #208]
	ldp d9, d8, [sp, #192]
	ldp d11, d10, [sp, #176]
	ldp d13, d12, [sp, #160]
	ldp d15, d14, [sp, #144]
	add sp, sp, #304
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
