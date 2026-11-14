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
	sub sp, sp, #432
	.cfi_def_cfa_offset 592
	ldr x10, [sp, #632]
	ldr x8, [sp, #624]
	ldr x12, [sp, #616]
	ldr x9, [sp, #608]
	ldr x11, [sp, #592]
	ldr x13, [sp, #600]
	lsr x14, x5, #3
	lsr x17, x7, #3
	and x16, x13, #0x7
	lsr x19, x13, #3
	lsr x20, x3, #3
	cmp x14, x20
	csel x14, x14, x20, lo
	cmp x17, x14
	csel x14, x17, x14, lo
	cmp x19, x14
	csel x14, x19, x14, lo
	lsr x17, x12, #3
	lsr x19, x10, #3
	cmp x19, x17
	csel x17, x19, x17, lo
	cmp x17, x14
	csel x17, x17, x14, lo
	str q0, [sp, #32]
	cbz x17, LBB72_3
	ldr q2, [x1]
	ldr d1, [x1, #16]
	dup.2d v6, v2[0]
	dup.2d v22, v2[1]
	cmp x17, #1
	str q1, [sp, #368]
	b.ne LBB72_4
	mov x19, #0
	movi.2d v29, #0000000000000000
	movi.2d v11, #0000000000000000
	movi.2d v28, #0000000000000000
	movi.2d v27, #0000000000000000
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v12, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v13, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v15, #0000000000000000
	movi.2d v17, #0000000000000000
	movi.2d v30, #0000000000000000
	b LBB72_7
LBB72_3:
	movi.2d v29, #0000000000000000
	movi.2d v11, #0000000000000000
	movi.2d v28, #0000000000000000
	movi.2d v27, #0000000000000000
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v12, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v13, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v15, #0000000000000000
	movi.2d v17, #0000000000000000
	movi.2d v30, #0000000000000000
	b LBB72_9
LBB72_4:
	str q2, [sp, #16]
	dup.2d v0, v0[0]
	str q0, [sp, #48]
	movi.2d v29, #0000000000000000
	and x19, x17, #0xfffffffffffffe
	movi.2d v2, #0000000000000000
	mov x20, x2
	movi.2d v17, #0000000000000000
	mov x21, x4
	movi.2d v3, #0000000000000000
	mov x22, x6
	movi.2d v24, #0000000000000000
	mov x23, x11
	movi.2d v13, #0000000000000000
	mov x24, x9
	movi.2d v18, #0000000000000000
	mov x25, x8
	movi.2d v4, #0000000000000000
	and x26, x17, #0xfffffffffffffe
	movi.2d v5, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v20, #0000000000000000
	movi.2d v27, #0000000000000000
	movi.2d v28, #0000000000000000
	movi.2d v11, #0000000000000000
	movi.2d v12, #0000000000000000
	str q22, [sp, #384]
	str q6, [sp, #64]
LBB72_5:
	stp q3, q18, [sp, #144]
	stp q5, q4, [sp, #176]
	stp q12, q13, [sp, #208]
	stp q11, q27, [sp, #240]
	stp q29, q28, [sp, #272]
	stp q17, q2, [sp, #400]
	stp q24, q21, [sp, #304]
	stp q19, q20, [sp, #336]
	ldp q1, q0, [x20, #64]
	ldp q16, q2, [x20]
	zip1.2d v17, v16, v1
	zip2.2d v16, v16, v1
	zip1.2d v19, v2, v0
	zip2.2d v22, v2, v0
	ldp q0, q1, [x20, #96]
	ldp q2, q20, [x20, #32]
	zip1.2d v24, v2, v0
	zip2.2d v21, v2, v0
	zip1.2d v2, v20, v1
	zip2.2d v1, v20, v1
	ldp q20, q0, [x21, #64]
	ldp q25, q23, [x21]
	zip1.2d v26, v25, v20
	zip2.2d v20, v25, v20
	zip1.2d v28, v23, v0
	ldp q29, q25, [x21, #96]
	ldr q30, [x21, #32]
	zip2.2d v31, v23, v0
	zip1.2d v9, v30, v29
	zip2.2d v29, v30, v29
	ldr q0, [x21, #48]
	zip1.2d v12, v0, v25
	zip2.2d v27, v0, v25
	fsub.2d v30, v17, v6
	ldr q0, [sp, #384]
	fsub.2d v3, v26, v0
	str q3, [sp, #128]
	fmul.2d v17, v30, v30
	fmul.2d v23, v3, v3
	fadd.2d v23, v17, v23
	fsub.2d v17, v16, v6
	fsub.2d v3, v20, v0
	str q3, [sp, #96]
	fmul.2d v20, v17, v17
	fmul.2d v25, v3, v3
	fadd.2d v25, v20, v25
	fsub.2d v20, v19, v6
	fsub.2d v3, v28, v0
	str q3, [sp, #80]
	fmul.2d v26, v20, v20
	fmul.2d v28, v3, v3
	fadd.2d v14, v26, v28
	fsub.2d v10, v22, v6
	fsub.2d v26, v31, v0
	fmul.2d v22, v10, v10
	fmul.2d v28, v26, v26
	fadd.2d v8, v22, v28
	fsub.2d v11, v24, v6
	fsub.2d v13, v9, v0
	fmul.2d v22, v11, v11
	fmul.2d v24, v13, v13
	fadd.2d v9, v22, v24
	fsub.2d v21, v21, v6
	fsub.2d v15, v29, v0
	fmul.2d v22, v21, v21
	fmul.2d v24, v15, v15
	fadd.2d v31, v22, v24
	fsub.2d v28, v2, v6
	fsub.2d v22, v12, v0
	fmul.2d v2, v28, v28
	fmul.2d v24, v22, v22
	fadd.2d v12, v2, v24
	fsub.2d v19, v1, v6
	fsub.2d v29, v27, v0
	fmul.2d v2, v19, v19
	fmul.2d v24, v29, v29
	fadd.2d v24, v2, v24
	ldp q0, q2, [x22, #64]
	ldp q27, q7, [x22]
	zip1.2d v3, v27, v0
	zip2.2d v27, v27, v0
	zip1.2d v4, v7, v2
	zip2.2d v7, v7, v2
	ldp q0, q2, [x22, #96]
	ldp q18, q6, [x22, #32]
	zip1.2d v5, v18, v0
	zip2.2d v18, v18, v0
	zip1.2d v16, v6, v2
	zip2.2d v6, v6, v2
	ldr q0, [sp, #48]
	fadd.2d v2, v0, v23
	ldr q1, [sp, #368]
	fmul.2d v3, v3, v1[0]
	fsqrt.2d v23, v2
	fmul.2d v23, v2, v23
	fdiv.2d v3, v3, v23
	fcmeq.2d v2, v2, #0.0
	bic.16b v2, v3, v2
	fadd.2d v3, v0, v25
	fmul.2d v23, v27, v1[0]
	fsqrt.2d v25, v3
	fmul.2d v25, v3, v25
	fdiv.2d v23, v23, v25
	fcmeq.2d v3, v3, #0.0
	bic.16b v25, v23, v3
	fadd.2d v3, v0, v14
	fmul.2d v4, v4, v1[0]
	fsqrt.2d v23, v3
	fmul.2d v23, v3, v23
	fdiv.2d v4, v4, v23
	fcmeq.2d v3, v3, #0.0
	bic.16b v14, v4, v3
	fmul.2d v3, v7, v1[0]
	fadd.2d v4, v0, v8
	fsqrt.2d v7, v4
	fmul.2d v7, v4, v7
	fdiv.2d v3, v3, v7
	fcmeq.2d v4, v4, #0.0
	bic.16b v23, v3, v4
	fadd.2d v3, v0, v9
	fmul.2d v4, v5, v1[0]
	fsqrt.2d v5, v3
	fmul.2d v5, v3, v5
	fdiv.2d v4, v4, v5
	fcmeq.2d v3, v3, #0.0
	bic.16b v3, v4, v3
	fadd.2d v4, v0, v31
	fmul.2d v5, v18, v1[0]
	fsqrt.2d v7, v4
	fmul.2d v7, v4, v7
	fdiv.2d v5, v5, v7
	fadd.2d v7, v0, v12
	fmul.2d v16, v16, v1[0]
	fsqrt.2d v18, v7
	fmul.2d v18, v7, v18
	fdiv.2d v16, v16, v18
	fcmeq.2d v4, v4, #0.0
	bic.16b v4, v5, v4
	fcmeq.2d v5, v7, #0.0
	bic.16b v5, v16, v5
	fadd.2d v0, v0, v24
	fmul.2d v6, v6, v1[0]
	fsqrt.2d v7, v0
	fmul.2d v7, v0, v7
	fdiv.2d v6, v6, v7
	fcmeq.2d v0, v0, #0.0
	bic.16b v6, v6, v0
	fmul.2d v16, v30, v2
	ldr q0, [sp, #128]
	fmul.2d v0, v0, v2
	stp q16, q0, [sp, #112]
	fmul.2d v8, v17, v25
	ldp q0, q1, [sp, #80]
	fmul.2d v12, v1, v25
	fmul.2d v9, v20, v14
	fmul.2d v14, v0, v14
	fmul.2d v10, v10, v23
	fmul.2d v30, v26, v23
	fmul.2d v11, v11, v3
	fmul.2d v13, v13, v3
	fmul.2d v31, v21, v4
	fmul.2d v17, v15, v4
	fmul.2d v15, v28, v5
	fmul.2d v20, v22, v5
	fmul.2d v26, v19, v6
	fmul.2d v19, v29, v6
	ldp q0, q1, [x24, #64]
	ldp q5, q2, [x24]
	zip1.2d v3, v5, v0
	zip2.2d v4, v5, v0
	zip1.2d v5, v2, v1
	zip2.2d v6, v2, v1
	ldp q0, q1, [x24, #96]
	ldr q2, [x24, #32]
	zip1.2d v7, v2, v0
	zip2.2d v18, v2, v0
	ldr q2, [x24, #48]
	zip1.2d v23, v2, v1
	zip2.2d v27, v2, v1
	ldp q0, q1, [x23, #48]
	ldp q2, q21, [x23]
	zip1.2d v25, v2, v1
	zip2.2d v1, v2, v1
	ldp q2, q22, [x23, #80]
	zip1.2d v29, v21, v2
	zip2.2d v21, v21, v2
	ldr q24, [x23, #32]
	zip1.2d v2, v24, v22
	zip2.2d v22, v24, v22
	ldr q28, [x23, #112]
	zip1.2d v24, v0, v28
	zip2.2d v28, v0, v28
	fmul.2d v0, v16, v25
	fsub.2d v0, v3, v0
	fmul.2d v3, v8, v1
	fsub.2d v3, v4, v3
	fmul.2d v4, v9, v29
	fsub.2d v4, v5, v4
	fmul.2d v5, v10, v21
	fsub.2d v5, v6, v5
	fmul.2d v6, v11, v2
	fsub.2d v6, v7, v6
	fmul.2d v7, v31, v22
	fsub.2d v7, v18, v7
	fmul.2d v18, v15, v24
	fsub.2d v18, v23, v18
	fmul.2d v23, v26, v28
	fsub.2d v23, v27, v23
	zip1.2d v27, v4, v5
	zip2.2d v4, v4, v5
	zip1.2d v5, v0, v3
	zip2.2d v0, v0, v3
	zip1.2d v3, v18, v23
	zip2.2d v18, v18, v23
	zip1.2d v23, v6, v7
	zip2.2d v6, v6, v7
	stp q6, q18, [x24, #96]
	stp q0, q4, [x24, #64]
	stp q23, q3, [x24, #32]
	stp q5, q27, [x24]
	ldp q23, q0, [x25, #48]
	ldp q3, q5, [x25]
	zip1.2d v4, v3, v0
	zip2.2d v0, v3, v0
	ldr q3, [x25, #80]
	zip1.2d v6, v5, v3
	zip2.2d v3, v5, v3
	ldr q5, [x25, #96]
	ldr q7, [x25, #32]
	zip1.2d v18, v7, v5
	zip2.2d v5, v7, v5
	ldr q7, [x25, #112]
	zip1.2d v27, v23, v7
	zip2.2d v7, v23, v7
	ldr q16, [sp, #128]
	fmul.2d v23, v16, v25
	fsub.2d v4, v4, v23
	fmul.2d v1, v12, v1
	fsub.2d v0, v0, v1
	fmul.2d v1, v14, v29
	fsub.2d v1, v6, v1
	fmul.2d v6, v30, v21
	fsub.2d v3, v3, v6
	fmul.2d v2, v13, v2
	fsub.2d v2, v18, v2
	fmul.2d v6, v17, v22
	fsub.2d v5, v5, v6
	fmul.2d v6, v20, v24
	fsub.2d v6, v27, v6
	fmul.2d v18, v19, v28
	fsub.2d v7, v7, v18
	zip1.2d v18, v1, v3
	zip2.2d v1, v1, v3
	zip1.2d v3, v4, v0
	zip2.2d v0, v4, v0
	zip1.2d v4, v6, v7
	zip2.2d v6, v6, v7
	zip1.2d v7, v2, v5
	zip2.2d v2, v2, v5
	stp q2, q6, [x25, #96]
	ldr q6, [sp, #64]
	stp q0, q1, [x25, #64]
	stp q7, q4, [x25, #32]
	stp q3, q18, [x25], #128
	ldr q0, [sp, #272]
	fadd d0, d0, d19
	mov d1, v19[1]
	fadd d29, d0, d1
	ldr q0, [sp, #416]
	fadd d0, d0, d20
	mov d1, v20[1]
	fadd d2, d0, d1
	ldr q0, [sp, #400]
	fadd d0, d0, d17
	mov d1, v17[1]
	fadd d17, d0, d1
	ldr q0, [sp, #144]
	fadd d0, d0, d13
	mov d1, v13[1]
	fadd d3, d0, d1
	ldr q0, [sp, #304]
	fadd d0, d0, d30
	mov d1, v30[1]
	fadd d24, d0, d1
	ldr q0, [sp, #224]
	fadd d0, d0, d14
	mov d1, v14[1]
	fadd d13, d0, d1
	ldr q0, [sp, #160]
	fadd d0, d0, d12
	mov d1, v12[1]
	fadd d18, d0, d1
	ldr q0, [sp, #192]
	fadd d0, d0, d26
	mov d1, v26[1]
	fadd d4, d0, d1
	ldr q0, [sp, #176]
	fadd d0, d0, d15
	mov d1, v15[1]
	fadd d5, d0, d1
	ldr q0, [sp, #336]
	fadd d0, d0, d31
	mov d1, v31[1]
	fadd d19, d0, d1
	ldr q0, [sp, #320]
	fadd d0, d0, d11
	mov d1, v11[1]
	fadd d21, d0, d1
	ldr q0, [sp, #352]
	fadd d0, d0, d10
	mov d1, v10[1]
	fadd d20, d0, d1
	ldr q0, [sp, #256]
	fadd d0, d0, d9
	mov d1, v9[1]
	fadd d27, d0, d1
	ldr q0, [sp, #288]
	fadd d0, d0, d8
	mov d1, v8[1]
	fadd d28, d0, d1
	ldr q0, [sp, #240]
	ldr q1, [sp, #112]
	fadd d0, d0, d1
	mov d1, v1[1]
	fadd d11, d0, d1
	ldr q0, [sp, #208]
	fadd d0, d0, d16
	mov d1, v16[1]
	fadd d12, d0, d1
	add x24, x24, #128
	add x23, x23, #128
	add x22, x22, #128
	add x21, x21, #128
	add x20, x20, #128
	subs x26, x26, #2
	b.ne LBB72_5
	mov.d v2[1], v5[0]
	mov.d v29[1], v4[0]
	cmp x17, x19
	mov.16b v30, v2
	mov.16b v15, v3
	ldr q22, [sp, #384]
	ldr q2, [sp, #16]
	b.eq LBB72_9
LBB72_7:
	ext.16b v4, v2, v2, #8
	mov d0, v6[1]
	mov d1, v22[1]
	ldr q2, [sp, #32]
	dup.2d v3, v2[0]
	stp q3, q4, [sp, #336]
	sub x17, x17, x19
	lsl x19, x19, #6
	add x20, x8, #32
	mov.16b v3, v6
	mov.d v3[1], v0[0]
	str q3, [sp, #320]
	mov.16b v3, v6
	mov.d v3[1], v0[0]
	add x21, x9, #32
	mov.d v6[1], v0[0]
	mov.16b v0, v22
	mov.d v0[1], v1[0]
	stp q0, q3, [sp, #288]
	add x22, x11, #32
	mov.16b v0, v22
	mov.d v0[1], v1[0]
	str q0, [sp, #272]
	mov.d v22[1], v1[0]
	mov.16b v0, v2
	mov.d v0[1], v2[0]
	str q0, [sp, #256]
	mov.16b v0, v2
	mov.d v0[1], v2[0]
	str q0, [sp, #240]
	mov.16b v0, v2
	mov.d v0[1], v2[0]
	str q0, [sp, #224]
	mov x23, x6
	mov x24, x4
	mov x25, x2
	str q22, [sp, #384]
LBB72_8:
	stp q17, q30, [sp, #400]
	add x15, x25, x19
	add x14, x24, x19
	add x30, x23, x19
	add x28, x22, x19
	add x27, x21, x19
	add x26, x20, x19
	ldp q0, q1, [x15]
	ldp q2, q3, [x15, #32]
	ldp q4, q5, [sp, #304]
	fsub.2d v2, v2, v5
	fsub.2d v1, v1, v4
	ldp q4, q5, [x14]
	fsub.2d v0, v0, v6
	mov.16b v30, v6
	ldp q6, q7, [x14, #32]
	ldp q23, q16, [sp, #272]
	fsub.2d v6, v6, v16
	fsub.2d v5, v5, v23
	fsub.2d v4, v4, v22
	mov.16b v31, v24
	fmul.2d v16, v0, v0
	fmul.2d v17, v1, v1
	mov.16b v9, v18
	fmul.2d v18, v2, v2
	mov.16b v10, v19
	fmul.2d v19, v4, v4
	mov.16b v26, v20
	fmul.2d v20, v5, v5
	mov.16b v8, v21
	fmul.2d v21, v6, v6
	fadd.2d v18, v18, v21
	fadd.2d v17, v17, v20
	fadd.2d v16, v16, v19
	ldp q21, q19, [sp, #240]
	fadd.2d v16, v19, v16
	ldp q20, q19, [x30]
	fadd.2d v17, v21, v17
	ldr q14, [sp, #368]
	fmul.2d v20, v20, v14[0]
	fmul.2d v19, v19, v14[0]
	ldp q21, q22, [x30, #32]
	fmul.2d v21, v21, v14[0]
	ldr q23, [sp, #224]
	fadd.2d v18, v23, v18
	fsqrt.2d v23, v18
	fsqrt.2d v24, v17
	fsqrt.2d v25, v16
	fmul.2d v25, v16, v25
	fmul.2d v24, v17, v24
	fmul.2d v23, v18, v23
	fdiv.2d v21, v21, v23
	fdiv.2d v19, v19, v24
	fdiv.2d v20, v20, v25
	fcmeq.2d v16, v16, #0.0
	fcmeq.2d v17, v17, #0.0
	bic.16b v20, v20, v16
	bic.16b v16, v19, v17
	fcmeq.2d v17, v18, #0.0
	bic.16b v17, v21, v17
	fmul.2d v19, v2, v17
	fmul.2d v21, v1, v16
	fmul.2d v2, v0, v20
	fmul.2d v0, v6, v17
	zip2.2d v1, v7, v3
	zip1.2d v3, v7, v3
	ldr q6, [sp, #352]
	fsub.2d v3, v3, v6
	fsub.2d v1, v1, v6
	fmul.2d v16, v5, v16
	fmul.2d v5, v1, v1
	fmul.2d v6, v3, v3
	faddp.2d v5, v6, v5
	ldr q6, [sp, #336]
	fadd.2d v5, v6, v5
	fmul.2d v6, v22, v14[0]
	fmul.2d v20, v4, v20
	fsqrt.2d v4, v5
	fmul.2d v4, v5, v4
	fdiv.2d v4, v6, v4
	fcmeq.2d v5, v5, #0.0
	bic.16b v4, v4, v5
	fmul.2d v1, v1, v4[1]
	fmul.2d v17, v3, v4[0]
	ldp q3, q4, [x27, #-32]
	ldp q5, q6, [x28, #-32]
	fmul.2d v7, v2, v5
	fsub.2d v3, v3, v7
	fmul.2d v7, v21, v6
	ldp q18, q22, [x28]
	fmul.2d v23, v19, v18
	fsub.2d v4, v4, v7
	ldp q7, q24, [x27]
	zip2.2d v25, v17, v1
	fmul.2d v25, v25, v22
	fmul.2d v5, v20, v5
	fsub.2d v7, v7, v23
	mov.16b v14, v29
	mov.16b v29, v27
	mov.16b v27, v11
	ldp q23, q11, [x26, #-32]
	fsub.2d v5, v23, v5
	fmul.2d v6, v16, v6
	fmul.2d v18, v0, v18
	fsub.2d v6, v11, v6
	ldp q23, q11, [x26]
	fsub.2d v18, v23, v18
	zip1.2d v23, v17, v1
	fmul.2d v22, v23, v22
	fsub.2d v23, v24, v25
	fsub.2d v22, v11, v22
	mov.16b v11, v27
	mov.16b v27, v29
	mov.d v11[1], v28[0]
	fadd.2d v11, v2, v11
	stp q3, q4, [x27, #-32]
	mov.d v27[1], v26[0]
	fadd.2d v27, v21, v27
	mov.16b v21, v8
	mov.d v21[1], v10[0]
	stp q7, q23, [x27]
	fadd.2d v21, v19, v21
	mov.d v12[1], v9[0]
	fadd.2d v12, v20, v12
	stp q5, q6, [x26, #-32]
	mov.16b v6, v30
	ldp q2, q30, [sp, #400]
	mov.d v13[1], v31[0]
	fadd.2d v13, v16, v13
	mov.d v15[1], v2[0]
	stp q18, q22, [x26]
	mov d28, v11[1]
	fadd.2d v15, v0, v15
	mov d20, v27[1]
	fadd.2d v30, v17, v30
	mov d19, v21[1]
	mov d18, v12[1]
	fadd.2d v29, v1, v14
	mov d24, v13[1]
	add x25, x25, #64
	add x20, x20, #64
	ldr q22, [sp, #384]
	add x24, x24, #64
	mov d17, v15[1]
	add x21, x21, #64
	add x23, x23, #64
	add x22, x22, #64
	subs x17, x17, #1
	b.ne LBB72_8
LBB72_9:
	and x14, x3, #0x7
	and x15, x5, #0x7
	cmp x15, x14
	csel x14, x15, x14, lo
	and x15, x7, #0x7
	cmp x15, x14
	csel x14, x15, x14, lo
	cmp x16, x14
	csel x14, x16, x14, lo
	and x15, x12, #0x7
	and x16, x10, #0x7
	cmp x16, x15
	csel x15, x16, x15, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	mov d23, v30[1]
	cbz x14, LBB72_20
	and x15, x3, #0xffffffffffffff8
	and x16, x5, #0xffffffffffffff8
	and x17, x7, #0xffffffffffffff8
	and x3, x13, #0xffffffffffffff8
	and x5, x12, #0x7fffffffffffff8
	and x7, x10, #0x7fffffffffffff8
	add x10, x2, x15, lsl #3
	add x12, x4, x16, lsl #3
	add x13, x6, x17, lsl #3
	add x11, x11, x3, lsl #3
	add x9, x9, x5, lsl #3
	add x8, x8, x7, lsl #3
	ldp d25, d26, [x1]
	ldr d7, [x1, #16]
	ldr d0, [x10]
	ldr d1, [x12]
	ldr d2, [x13]
	ldr d3, [x11]
	fsub d4, d0, d25
	fsub d1, d1, d26
	fmul d0, d4, d4
	fmul d5, d1, d1
	fadd d0, d0, d5
	ldr q22, [sp, #32]
	fadd d0, d22, d0
	fmul d2, d2, d7
	fsqrt d5, d0
	fmul d5, d0, d5
	fdiv d2, d2, d5
	fcmp d0, #0.0
	movi.2d v0, #0000000000000000
	fcsel d2, d0, d2, eq
	fmul d4, d4, d2
	fmul d1, d1, d2
	fmul d2, d3, d4
	ldr d5, [x9]
	fsub d2, d5, d2
	str d2, [x9]
	fmul d2, d3, d1
	ldr d3, [x8]
	fsub d2, d3, d2
	str d2, [x8]
	fadd d2, d11, d4
	mov.d v3[1], v28[0]
	fadd d1, d12, d1
	mov.d v12[1], v18[0]
	mov.16b v11, v3
	mov.d v11[0], v2[0]
	mov.d v12[0], v1[0]
	cmp x14, #1
	b.ne LBB72_12
	mov d28, v11[1]
	mov d18, v12[1]
	b LBB72_20
LBB72_12:
	ldr d1, [x10, #8]
	ldr d2, [x12, #8]
	ldr d3, [x13, #8]
	ldr d4, [x11, #8]
	fsub d1, d1, d25
	fsub d2, d2, d26
	fmul d5, d1, d1
	fmul d6, d2, d2
	fadd d5, d5, d6
	fadd d5, d22, d5
	fmul d3, d3, d7
	fsqrt d6, d5
	fmul d6, d5, d6
	fdiv d3, d3, d6
	fcmp d5, #0.0
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
	fadd d1, d28, d1
	mov.d v11[1], v1[0]
	fadd d0, d18, d0
	mov d28, v11[1]
	mov.d v12[1], v0[0]
	mov d18, v12[1]
	cmp x14, #2
	b.eq LBB72_20
	ldr d0, [x10, #16]
	ldr d1, [x12, #16]
	ldr d2, [x13, #16]
	ldr d3, [x11, #16]
	fsub d4, d0, d25
	fsub d1, d1, d26
	fmul d0, d4, d4
	fmul d5, d1, d1
	fadd d0, d0, d5
	fadd d0, d22, d0
	fmul d2, d2, d7
	fsqrt d5, d0
	fmul d5, d0, d5
	fdiv d2, d2, d5
	fcmp d0, #0.0
	movi.2d v0, #0000000000000000
	fcsel d2, d0, d2, eq
	fmul d4, d4, d2
	fmul d1, d1, d2
	fmul d2, d3, d4
	ldr d5, [x9, #16]
	fsub d2, d5, d2
	str d2, [x9, #16]
	fmul d2, d3, d1
	ldr d3, [x8, #16]
	fsub d2, d3, d2
	str d2, [x8, #16]
	fadd d2, d27, d4
	mov.d v27[1], v20[0]
	mov.d v27[0], v2[0]
	fadd d1, d13, d1
	mov.d v13[1], v24[0]
	mov.d v13[0], v1[0]
	cmp x14, #3
	b.ne LBB72_15
	mov d20, v27[1]
	mov d24, v13[1]
	b LBB72_20
LBB72_15:
	ldr d1, [x10, #24]
	ldr d2, [x12, #24]
	ldr d3, [x13, #24]
	ldr d4, [x11, #24]
	fsub d1, d1, d25
	fsub d2, d2, d26
	fmul d5, d1, d1
	fmul d6, d2, d2
	fadd d5, d5, d6
	fadd d5, d22, d5
	fmul d3, d3, d7
	fsqrt d6, d5
	fmul d6, d5, d6
	fdiv d3, d3, d6
	fcmp d5, #0.0
	fcsel d0, d0, d3, eq
	fmul d1, d1, d0
	fmul d0, d2, d0
	fmul d2, d4, d1
	ldr d3, [x9, #24]
	fsub d2, d3, d2
	str d2, [x9, #24]
	fmul d2, d4, d0
	ldr d3, [x8, #24]
	fsub d2, d3, d2
	str d2, [x8, #24]
	fadd d1, d20, d1
	mov.d v27[1], v1[0]
	fadd d0, d24, d0
	mov d20, v27[1]
	mov.d v13[1], v0[0]
	mov d24, v13[1]
	cmp x14, #4
	b.eq LBB72_20
	ldr d0, [x10, #32]
	ldr d1, [x12, #32]
	ldr d2, [x13, #32]
	ldr d3, [x11, #32]
	fsub d4, d0, d25
	fsub d1, d1, d26
	fmul d0, d4, d4
	fmul d5, d1, d1
	fadd d0, d0, d5
	fadd d0, d22, d0
	fmul d2, d2, d7
	fsqrt d5, d0
	fmul d5, d0, d5
	fdiv d2, d2, d5
	fcmp d0, #0.0
	movi.2d v0, #0000000000000000
	fcsel d2, d0, d2, eq
	fmul d4, d4, d2
	fmul d1, d1, d2
	fmul d2, d3, d4
	ldr d5, [x9, #32]
	fsub d2, d5, d2
	str d2, [x9, #32]
	fmul d2, d3, d1
	ldr d3, [x8, #32]
	fsub d2, d3, d2
	str d2, [x8, #32]
	fadd d21, d21, d4
	fadd d15, d15, d1
	cmp x14, #5
	b.ne LBB72_18
	mov.d v0[1], v19[0]
	mov.d v0[0], v21[0]
	mov.d v1[1], v17[0]
	mov d19, v0[1]
	mov.d v1[0], v15[0]
	mov d17, v1[1]
	mov.16b v21, v0
	mov.16b v15, v1
	b LBB72_20
LBB72_18:
	ldr d1, [x10, #40]
	ldr d2, [x12, #40]
	ldr d3, [x13, #40]
	ldr d4, [x11, #40]
	fsub d1, d1, d25
	fsub d2, d2, d26
	fmul d5, d1, d1
	fmul d6, d2, d2
	fadd d5, d5, d6
	fadd d5, d22, d5
	fmul d3, d3, d7
	fsqrt d6, d5
	fmul d6, d5, d6
	fdiv d3, d3, d6
	fcmp d5, #0.0
	fcsel d0, d0, d3, eq
	fmul d1, d1, d0
	fmul d0, d2, d0
	fmul d2, d4, d1
	ldr d3, [x9, #40]
	fsub d2, d3, d2
	str d2, [x9, #40]
	fmul d2, d4, d0
	ldr d3, [x8, #40]
	fsub d2, d3, d2
	str d2, [x8, #40]
	fadd d19, d19, d1
	fadd d17, d17, d0
	cmp x14, #6
	b.eq LBB72_20
	ldr d0, [x10, #48]
	ldr d1, [x12, #48]
	ldr d2, [x13, #48]
	ldr d3, [x11, #48]
	fsub d0, d0, d25
	fsub d1, d1, d26
	fmul d4, d0, d0
	fmul d5, d1, d1
	fadd d4, d4, d5
	fadd d4, d22, d4
	fmul d2, d2, d7
	fsqrt d5, d4
	fmul d5, d4, d5
	fdiv d2, d2, d5
	fcmp d4, #0.0
	movi.2d v4, #0000000000000000
	fcsel d2, d4, d2, eq
	fmul d0, d0, d2
	fmul d1, d1, d2
	fmul d2, d3, d0
	ldr d4, [x9, #48]
	fsub d2, d4, d2
	str d2, [x9, #48]
	fmul d2, d3, d1
	ldr d3, [x8, #48]
	fsub d2, d3, d2
	str d2, [x8, #48]
	fadd d23, d23, d0
	fadd d30, d30, d1
LBB72_20:
	mov.d v11[1], v28[0]
	mov.d v27[1], v20[0]
	stp q11, q27, [x0]
	mov.d v21[1], v19[0]
	str q21, [x0, #32]
	add x8, x0, #56
	st1.d { v29 }[1], [x8]
	str d23, [x0, #48]
	mov.d v12[1], v18[0]
	mov.d v13[1], v24[0]
	stp q12, q13, [x0, #64]
	mov.d v15[1], v17[0]
	str q15, [x0, #96]
	stp d30, d29, [x0, #112]
	add sp, sp, #432
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
