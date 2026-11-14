engine::force::sweep::<f64>:
Lfunc_begin72:
	.cfi_startproc
	stp d15, d14, [sp, #-160]!
	.cfi_def_cfa_offset 160
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	stp x28, x27, [sp, #64]
	stp x26, x25, [sp, #80]
	stp x24, x23, [sp, #96]
	stp x22, x21, [sp, #112]
	stp x20, x19, [sp, #128]
	stp x29, x30, [sp, #144]
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
	sub sp, sp, #592
	.cfi_def_cfa_offset 752
	ldr x9, [sp, #792]
	ldr x8, [sp, #784]
	ldr x11, [sp, #776]
	ldr x10, [sp, #768]
	add x14, sp, #464
	ldr x12, [sp, #752]
	ldr x13, [sp, #760]
	str xzr, [sp, #456]
	movi.2d v3, #0000000000000000
	add x15, sp, #185
	stur q3, [x15, #255]
	add x15, sp, #169
	stur q3, [x15, #255]
	add x15, sp, #153
	stur q3, [x15, #255]
	add x15, sp, #137
	stur q3, [x15, #255]
	add x15, sp, #121
	stur q3, [x15, #255]
	add x15, sp, #105
	stur q3, [x15, #255]
	and x15, x5, #0xf
	lsr x19, x5, #4
	add x16, sp, #89
	stur q3, [x16, #255]
	and x16, x7, #0xf
	lsr x20, x7, #4
	stur q3, [x14, #8]
	and x17, x13, #0xf
	lsr x21, x13, #4
	lsr x22, x3, #4
	stur q3, [x14, #24]
	stur q3, [x14, #40]
	cmp x19, x22
	csel x19, x19, x22, lo
	cmp x20, x19
	csel x19, x20, x19, lo
	stur q3, [x14, #56]
	stur q3, [x14, #72]
	cmp x21, x19
	csel x19, x21, x19, lo
	lsr x20, x11, #4
	lsr x21, x9, #4
	stur q3, [x14, #88]
	stur q3, [x14, #104]
	cmp x21, x20
	csel x20, x21, x20, lo
	cmp x20, x19
	csel x20, x20, x19, lo
	str xzr, [sp, #584]
	cbz x20, LBB72_4
	mov x19, #0
	str q0, [sp, #16]
	dup.2d v2, v0[0]
	ldr q0, [x1]
	dup.2d v1, v0[0]
	stp q1, q0, [sp, #32]
	dup.2d v6, v0[1]
	movi.2d v24, #0000000000000000
	movi.2d v16, #0000000000000000
	movi.2d v22, #0000000000000000
	movi.2d v23, #0000000000000000
	ldr d29, [x1, #16]
	lsl x20, x20, #7
	movi.2d v18, #0000000000000000
	add x21, x8, #64
	movi.2d v25, #0000000000000000
	add x22, x10, #64
	movi.2d v26, #0000000000000000
	movi.2d v0, #0000000000000000
	movi.2d v7, #0000000000000000
	movi.2d v17, #0000000000000000
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v4, #0000000000000000
LBB72_2:
	stp q26, q25, [sp, #80]
	stp q19, q5, [sp, #112]
	stp q21, q20, [sp, #144]
	stp q17, q7, [sp, #176]
	stp q0, q18, [sp, #208]
	stp q24, q23, [sp, #240]
	stp q22, q16, [sp, #272]
	stp q4, q3, [sp, #304]
	add x27, x2, x19
	add x30, x4, x19
	add x26, x6, x19
	add x25, x12, x19
	add x23, x22, x19
	ldur q0, [x27, #8]
	ldr d7, [x27]
	add x15, x4, x19
	ld1.d { v7 }[1], [x15], #8
	add x24, x21, x19
	add x28, x30, #120
	ldr q5, [sp, #32]
	fsub.2d v1, v0, v5
	ldr q0, [x15]
	fsub.2d v3, v0, v6
	fmul.2d v4, v1, v1
	fmul.2d v16, v3, v3
	ldur q0, [x26, #8]
	fmul.2d v0, v0, v29[0]
	str q0, [sp, #64]
	ldur q0, [x27, #24]
	fsub.2d v0, v0, v5
	ldur q17, [x30, #24]
	fadd.2d v4, v4, v16
	fsub.2d v10, v17, v6
	fmul.2d v16, v0, v0
	fmul.2d v17, v10, v10
	fadd.2d v16, v16, v17
	fadd.2d v16, v2, v16
	fadd.2d v18, v2, v4
	ldur q4, [x26, #24]
	fmul.2d v17, v4, v29[0]
	fsqrt.2d v4, v16
	fcmeq.2d v19, v16, #0.0
	ldur q20, [x27, #40]
	fmul.2d v21, v16, v4
	fsub.2d v4, v20, v5
	ldur q16, [x30, #40]
	fsub.2d v11, v16, v6
	fmul.2d v16, v4, v4
	fmul.2d v20, v11, v11
	fsqrt.2d v22, v18
	fadd.2d v16, v16, v20
	fadd.2d v20, v2, v16
	ldur q16, [x26, #40]
	fmul.2d v23, v16, v29[0]
	fsqrt.2d v24, v20
	fcmeq.2d v16, v18, #0.0
	fmul.2d v24, v20, v24
	fcmeq.2d v20, v20, #0.0
	ldur q25, [x27, #56]
	fsub.2d v25, v25, v5
	ldur q26, [x30, #56]
	fdiv.2d v21, v17, v21
	fsub.2d v17, v26, v6
	fmul.2d v26, v25, v25
	fmul.2d v30, v17, v17
	fadd.2d v26, v26, v30
	fadd.2d v26, v2, v26
	fdiv.2d v23, v23, v24
	ldur q24, [x26, #56]
	fmul.2d v24, v24, v29[0]
	fsqrt.2d v30, v26
	fmul.2d v30, v26, v30
	fdiv.2d v24, v24, v30
	fmul.2d v18, v18, v22
	fcmeq.2d v22, v26, #0.0
	ldur q26, [x27, #72]
	fsub.2d v26, v26, v5
	ldur q30, [x30, #72]
	fsub.2d v15, v30, v6
	bic.16b v19, v21, v19
	fmul.2d v21, v26, v26
	fmul.2d v30, v15, v15
	fadd.2d v21, v21, v30
	fadd.2d v21, v2, v21
	ldur q30, [x26, #72]
	bic.16b v20, v23, v20
	fmul.2d v23, v30, v29[0]
	fsqrt.2d v30, v21
	fmul.2d v30, v21, v30
	fdiv.2d v23, v23, v30
	fcmeq.2d v21, v21, #0.0
	bic.16b v22, v24, v22
	ldur q24, [x27, #88]
	fsub.2d v24, v24, v5
	ldur q30, [x30, #88]
	fsub.2d v27, v30, v6
	fmul.2d v30, v24, v24
	bic.16b v21, v23, v21
	fmul.2d v23, v27, v27
	fadd.2d v23, v30, v23
	fadd.2d v23, v2, v23
	ldur q30, [x26, #88]
	fmul.2d v31, v30, v29[0]
	fmul.2d v30, v0, v19
	fsqrt.2d v0, v23
	fmul.2d v0, v23, v0
	fdiv.2d v0, v31, v0
	fcmeq.2d v23, v23, #0.0
	bic.16b v23, v0, v23
	fmul.2d v31, v4, v20
	ldur q0, [x27, #104]
	fsub.2d v0, v0, v5
	ldur q4, [x30, #104]
	fsub.2d v28, v4, v6
	fmul.2d v4, v0, v0
	fmul.2d v8, v25, v22
	fmul.2d v25, v28, v28
	fadd.2d v4, v4, v25
	fadd.2d v4, v2, v4
	ldur q25, [x26, #104]
	fmul.2d v25, v25, v29[0]
	fmul.2d v9, v26, v21
	fsqrt.2d v26, v4
	fmul.2d v26, v4, v26
	fdiv.2d v25, v25, v26
	fcmeq.2d v4, v4, #0.0
	bic.16b v25, v25, v4
	fmul.2d v4, v24, v23
	fmul.2d v0, v0, v25
	fmul.2d v12, v10, v19
	fmul.2d v13, v11, v20
	fmul.2d v14, v17, v22
	fmul.2d v15, v15, v21
	fmul.2d v10, v27, v23
	fmul.2d v11, v28, v25
	ldr d17, [x27, #120]
	ld1.d { v17 }[1], [x28]
	ldp q5, q19, [sp, #48]
	fsub.2d v17, v17, v5
	fdiv.2d v18, v19, v18
	fsub.2d v19, v7, v5
	fmul.2d v7, v19, v19
	fmul.2d v20, v17, v17
	faddp.2d v7, v20, v7
	fadd.2d v7, v2, v7
	bic.16b v18, v18, v16
	ldr d16, [x26, #120]
	ld1.d { v16 }[1], [x26]
	fmul.2d v20, v16, v29[0]
	fsqrt.2d v21, v7
	fmul.2d v16, v1, v18
	fmul.2d v1, v7, v21
	fdiv.2d v1, v20, v1
	fcmeq.2d v7, v7, #0.0
	bic.16b v20, v1, v7
	fmul.2d v1, v17, v20[0]
	fmul.2d v7, v3, v18
	fmul.2d v3, v19, v20[1]
	ldp q17, q22, [x23, #-48]
	ldp q19, q20, [x25, #16]
	ext.16b v18, v30, v31, #8
	ext.16b v23, v16, v30, #8
	ldr q21, [x25, #48]
	fmul.2d v18, v18, v20
	ldur q24, [x23, #-16]
	ext.16b v25, v31, v8, #8
	fsub.2d v26, v22, v18
	fmul.2d v18, v25, v21
	fsub.2d v24, v24, v18
	ext.16b v25, v8, v9, #8
	ldp q22, q18, [x25, #64]
	fmul.2d v27, v23, v19
	fmul.2d v23, v25, v22
	ldp q25, q28, [x23]
	fsub.2d v23, v25, v23
	stp q26, q24, [x23, #-32]
	ext.16b v24, v9, v4, #8
	fmul.2d v24, v24, v18
	fsub.2d v24, v28, v24
	ext.16b v26, v4, v0, #8
	stp q23, q24, [x23]
	ldp q25, q23, [x25, #96]
	fmul.2d v24, v26, v25
	ldp q26, q28, [x23, #32]
	fsub.2d v17, v17, v27
	fsub.2d v24, v26, v24
	dup.2d v26, v0[1]
	zip1.2d v26, v26, v1
	fmul.2d v26, v26, v23
	fsub.2d v26, v28, v26
	dup.2d v27, v7[0]
	dup.2d v28, v3[1]
	mov.d v28[1], v27[1]
	ext.16b v27, v7, v12, #8
	fmul.2d v19, v27, v19
	ext.16b v27, v12, v13, #8
	fmul.2d v20, v27, v20
	ldp q27, q5, [x24, #-32]
	fsub.2d v20, v27, v20
	ext.16b v27, v13, v14, #8
	fmul.2d v21, v27, v21
	fsub.2d v5, v5, v21
	ldur q21, [x24, #-48]
	fsub.2d v19, v21, v19
	ldr q21, [x25]
	stp q20, q5, [x24, #-32]
	dup.2d v20, v16[0]
	mov.d v20[0], v3[0]
	fmul.2d v20, v20, v21
	ext.16b v5, v14, v15, #8
	fmul.2d v5, v5, v22
	ldp q22, q27, [x24]
	fmul.2d v21, v28, v21
	fsub.2d v5, v22, v5
	ext.16b v22, v15, v10, #8
	fmul.2d v18, v22, v18
	ldur q22, [x23, #-64]
	fsub.2d v20, v22, v20
	fsub.2d v18, v27, v18
	stp q5, q18, [x24]
	ldur q5, [x24, #-64]
	ext.16b v18, v10, v11, #8
	fsub.2d v5, v5, v21
	fmul.2d v18, v18, v25
	ldp q21, q22, [x24, #32]
	fsub.2d v18, v21, v18
	dup.2d v21, v11[1]
	mov.d v21[1], v1[1]
	fmul.2d v21, v21, v23
	fsub.2d v21, v22, v21
	ldp q23, q22, [sp, #256]
	stp q24, q26, [x23, #32]
	ldr q24, [sp, #240]
	ldp q26, q25, [sp, #80]
	fadd.2d v24, v16, v24
	ldr q16, [sp, #288]
	fadd.2d v16, v30, v16
	fadd.2d v22, v31, v22
	fadd.2d v23, v8, v23
	stp q18, q21, [x24, #32]
	ldr q18, [sp, #224]
	fadd.2d v18, v9, v18
	fadd.2d v25, v4, v25
	ldr q4, [sp, #304]
	fadd.2d v26, v0, v26
	ldr q0, [sp, #208]
	fadd.2d v0, v7, v0
	stp q20, q17, [x23, #-64]
	ldp q21, q20, [sp, #144]
	ldp q17, q7, [sp, #176]
	fadd.2d v7, v12, v7
	fadd.2d v17, v13, v17
	fadd.2d v20, v14, v20
	fadd.2d v21, v15, v21
	stp q5, q19, [x24, #-64]
	ldp q19, q5, [sp, #112]
	fadd.2d v5, v10, v5
	fadd.2d v19, v11, v19
	fadd.2d v4, v3, v4
	ldr q3, [sp, #320]
	fadd.2d v3, v1, v3
	add x19, x19, #128
	cmp x20, x19
	b.ne LBB72_2
	add x15, sp, #464
	add x19, sp, #89
	stur q24, [x19, #255]
	add x15, x15, #120
	add x19, sp, #105
	stur q16, [x19, #255]
	add x19, sp, #121
	stur q22, [x19, #255]
	add x19, sp, #137
	stur q23, [x19, #255]
	add x19, sp, #153
	stur q18, [x19, #255]
	add x19, sp, #169
	stur q25, [x19, #255]
	add x19, sp, #185
	stur q26, [x19, #255]
	str d3, [sp, #456]
	stur q0, [x14, #8]
	stur q7, [x14, #24]
	stur q17, [x14, #40]
	stur q20, [x14, #56]
	stur q21, [x14, #72]
	stur q5, [x14, #88]
	stur q19, [x14, #104]
	mov d1, v4[1]
	st1.d { v3 }[1], [x15]
	ldr q0, [sp, #16]
	and x15, x5, #0xf
	b LBB72_5
LBB72_4:
	movi.2d v1, #0000000000000000
	movi.2d v4, #0000000000000000
LBB72_5:
	str d4, [sp, #336]
	str d1, [sp, #464]
	and x14, x3, #0xf
	cmp x15, x14
	csel x14, x15, x14, lo
	cmp x16, x14
	csel x14, x16, x14, lo
	cmp x17, x14
	csel x14, x17, x14, lo
	and x15, x11, #0xf
	and x16, x9, #0xf
	cmp x16, x15
	csel x15, x16, x15, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	cbz x14, LBB72_8
	and x15, x3, #0xffffffffffffff0
	add x15, x2, x15, lsl #3
	and x16, x5, #0xffffffffffffff0
	and x17, x7, #0xffffffffffffff0
	add x16, x4, x16, lsl #3
	and x13, x13, #0xffffffffffffff0
	and x2, x11, #0x7fffffffffffff0
	and x3, x9, #0x7fffffffffffff0
	add x9, x6, x17, lsl #3
	add x11, x12, x13, lsl #3
	add x10, x10, x2, lsl #3
	ldp d17, d1, [x1]
	ldr d2, [x1, #16]
	add x12, sp, #464
	add x13, sp, #336
	movi.2d v3, #0000000000000000
	add x8, x8, x3, lsl #3
LBB72_7:
	ldr d4, [x15], #8
	ldr d5, [x16], #8
	fsub d4, d4, d17
	fsub d5, d5, d1
	fmul d6, d4, d4
	fmul d7, d5, d5
	fadd d6, d6, d7
	fadd d6, d0, d6
	ldr d7, [x9], #8
	fmul d7, d7, d2
	fsqrt d16, d6
	fmul d16, d6, d16
	fdiv d7, d7, d16
	ldr d16, [x11], #8
	fcmp d6, #0.0
	fcsel d6, d3, d7, eq
	fmul d4, d4, d6
	fmul d5, d5, d6
	ldr d6, [x10]
	fmul d7, d16, d4
	fsub d6, d6, d7
	fmul d7, d16, d5
	ldr d16, [x8]
	fsub d7, d16, d7
	str d6, [x10], #8
	ldr d6, [x13]
	fadd d4, d6, d4
	str d4, [x13], #8
	str d7, [x8], #8
	ldr d4, [x12]
	fadd d4, d4, d5
	str d4, [x12], #8
	subs x14, x14, #1
	b.ne LBB72_7
LBB72_8:
	ldp q0, q1, [sp, #400]
	stp q0, q1, [x0, #64]
	ldp q0, q1, [sp, #432]
	stp q0, q1, [x0, #96]
	ldp q0, q1, [sp, #336]
	stp q0, q1, [x0]
	ldp q0, q1, [sp, #368]
	stp q0, q1, [x0, #32]
	ldp q0, q1, [sp, #464]
	ldp q2, q3, [sp, #496]
	stp q2, q3, [x0, #160]
	stp q0, q1, [x0, #128]
	ldp q0, q1, [sp, #528]
	ldp q2, q3, [sp, #560]
	stp q2, q3, [x0, #224]
	stp q0, q1, [x0, #192]
	add sp, sp, #592
	.cfi_def_cfa_offset 160
	ldp x29, x30, [sp, #144]
	ldp x20, x19, [sp, #128]
	ldp x22, x21, [sp, #112]
	ldp x24, x23, [sp, #96]
	ldp x26, x25, [sp, #80]
	ldp x28, x27, [sp, #64]
	ldp d9, d8, [sp, #48]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #160
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
