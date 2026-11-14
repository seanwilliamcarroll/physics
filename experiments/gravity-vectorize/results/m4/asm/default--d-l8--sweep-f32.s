engine::force::sweep::<f32>:
Lfunc_begin73:
	.cfi_startproc
	stp d15, d14, [sp, #-144]!
	.cfi_def_cfa_offset 144
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	stp x28, x27, [sp, #64]
	stp x26, x25, [sp, #80]
	stp x24, x23, [sp, #96]
	stp x22, x21, [sp, #112]
	stp x20, x19, [sp, #128]
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	.cfi_offset w27, -72
	.cfi_offset w28, -80
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	.cfi_offset b14, -136
	.cfi_offset b15, -144
	sub sp, sp, #656
	.cfi_def_cfa_offset 800
	.cfi_remember_state
	ldr x10, [sp, #840]
	ldr x8, [sp, #832]
	ldr x12, [sp, #824]
	ldr x9, [sp, #816]
	ldr x11, [sp, #800]
	ldr x13, [sp, #808]
	and x14, x5, #0x7
	lsr x17, x5, #3
	and x15, x7, #0x7
	lsr x19, x7, #3
	and x16, x13, #0x7
	lsr x20, x13, #3
	lsr x21, x3, #3
	cmp x17, x21
	csel x17, x17, x21, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cmp x20, x17
	csel x17, x20, x17, lo
	lsr x19, x12, #3
	lsr x20, x10, #3
	cmp x20, x19
	csel x19, x20, x19, lo
	cmp x19, x17
	csel x17, x19, x17, lo
	cbz x17, LBB73_3
	ldr d2, [x1]
	ldr s12, [x1, #8]
	cmp x17, #4
	b.hs LBB73_4
	mov x19, #0
	movi.2d v24, #0000000000000000
	movi.2d v25, #0000000000000000
	movi.2d v26, #0000000000000000
	movi.2d v27, #0000000000000000
	b LBB73_7
LBB73_3:
	movi.2d v24, #0000000000000000
	movi.2d v25, #0000000000000000
	movi.2d v26, #0000000000000000
	movi.2d v27, #0000000000000000
	b LBB73_9
LBB73_4:
	dup.4s v3, v2[0]
	stp q2, q0, [sp]
	dup.4s v1, v2[1]
	stp q1, q3, [sp, #48]
	dup.4s v0, v0[0]
	str q0, [sp, #32]
	movi.2d v17, #0000000000000000
	and x19, x17, #0x1fffffffffffffc
	movi.2d v18, #0000000000000000
	mov x20, x2
	movi.2d v20, #0000000000000000
	mov x21, x4
	movi.2d v26, #0000000000000000
	mov x22, x6
	movi.2d v29, #0000000000000000
	mov x23, x11
	movi.2d v22, #0000000000000000
	mov x24, x9
	movi.2d v23, #0000000000000000
	mov x25, x8
	movi.2d v16, #0000000000000000
	and x26, x17, #0x1fffffffffffffc
	movi.2d v7, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v27, #0000000000000000
	movi.2d v6, #0000000000000000
	movi.2d v4, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v25, #0000000000000000
	str q12, [sp, #80]
LBB73_5:
	stp q29, q26, [sp, #400]
	stp q23, q27, [sp, #432]
	stp q18, q17, [sp, #464]
	stp q20, q22, [sp, #496]
	stp q25, q24, [sp, #528]
	stp q16, q21, [sp, #560]
	stp q7, q6, [sp, #592]
	stp q4, q5, [sp, #624]
	ldp q2, q1, [x20, #96]
	ldp q4, q3, [x20, #32]
	ldp q5, q17, [x20]
	zip1.4s v16, v5, v4
	ldp q7, q19, [x20, #64]
	zip1.4s v0, v7, v2
	trn2.4s v6, v5, v4
	mov.d v6[1], v0[1]
	ext.16b v20, v7, v0, #8
	trn1.4s v18, v7, v2
	zip2.4s v0, v5, v4
	zip2.4s v21, v7, v2
	mov.d v0[1], v18[1]
	uzp2.4s v2, v5, v4
	uzp2.4s v5, v2, v5
	zip1.4s v2, v17, v3
	zip1.4s v4, v19, v1
	trn2.4s v18, v17, v3
	ext.16b v22, v19, v4, #8
	mov.d v18[1], v4[1]
	trn1.4s v4, v19, v1
	zip2.4s v31, v17, v3
	mov.d v16[1], v20[1]
	mov.d v31[1], v4[1]
	zip2.4s v4, v19, v1
	uzp2.4s v1, v17, v3
	mov.d v5[1], v21[1]
	uzp2.4s v30, v1, v17
	ldr q3, [x21, #32]
	ldp q17, q26, [x21]
	zip1.4s v19, v17, v3
	mov.d v2[1], v22[1]
	ldp q25, q20, [x21, #80]
	ldr q21, [x21, #64]
	zip1.4s v22, v21, v20
	ext.16b v23, v21, v22, #8
	mov.d v30[1], v4[1]
	trn2.4s v24, v17, v3
	mov.d v24[1], v22[1]
	trn1.4s v4, v21, v20
	mov.d v19[1], v23[1]
	zip2.4s v22, v17, v3
	mov.d v22[1], v4[1]
	ldr q4, [x21, #112]
	zip2.4s v21, v21, v20
	uzp2.4s v3, v17, v3
	uzp2.4s v20, v3, v17
	ldr q17, [x21, #48]
	mov.d v20[1], v21[1]
	trn1.4s v21, v25, v4
	zip2.4s v3, v26, v17
	mov.d v3[1], v21[1]
	zip1.4s v23, v25, v4
	trn2.4s v21, v26, v17
	mov.d v21[1], v23[1]
	ext.16b v27, v25, v23, #8
	zip1.4s v23, v26, v17
	mov.d v23[1], v27[1]
	zip2.4s v25, v25, v4
	uzp2.4s v4, v26, v17
	uzp2.4s v4, v4, v26
	mov.d v4[1], v25[1]
	ldp q14, q11, [sp, #48]
	fsub.4s v1, v16, v11
	str q1, [sp, #368]
	fsub.4s v7, v19, v14
	fmul.4s v16, v1, v1
	fmul.4s v17, v7, v7
	fadd.4s v17, v16, v17
	fsub.4s v1, v6, v11
	stp q7, q1, [sp, #336]
	fsub.4s v7, v24, v14
	str q7, [sp, #320]
	fmul.4s v6, v1, v1
	fmul.4s v16, v7, v7
	fadd.4s v19, v6, v16
	ldr q28, [x22, #96]
	ldr q29, [x22, #64]
	ldr q8, [x22, #32]
	ldr q9, [x22]
	zip1.4s v6, v9, v8
	zip1.4s v24, v29, v28
	ext.16b v16, v29, v24, #8
	mov.d v6[1], v16[1]
	fsub.4s v0, v0, v11
	fsub.4s v1, v22, v14
	stp q1, q0, [sp, #240]
	fmul.4s v0, v0, v0
	fmul.4s v22, v1, v1
	fadd.4s v7, v0, v22
	trn2.4s v27, v9, v8
	mov.d v27[1], v24[1]
	trn1.4s v22, v29, v28
	zip2.4s v26, v9, v8
	mov.d v26[1], v22[1]
	fsub.4s v0, v5, v11
	fsub.4s v1, v20, v14
	stp q1, q0, [sp, #208]
	fmul.4s v20, v0, v0
	fmul.4s v22, v1, v1
	fadd.4s v25, v20, v22
	fsub.4s v0, v2, v11
	fsub.4s v1, v23, v14
	stp q1, q0, [sp, #288]
	fmul.4s v2, v0, v0
	fmul.4s v20, v1, v1
	fadd.4s v24, v2, v20
	zip2.4s v2, v29, v28
	uzp2.4s v20, v9, v8
	uzp2.4s v28, v20, v9
	mov.d v28[1], v2[1]
	ldr q2, [x22, #112]
	ldr q8, [x22, #80]
	ldr q9, [x22, #48]
	ldr q13, [x22, #16]
	zip1.4s v0, v13, v9
	zip1.4s v22, v8, v2
	ext.16b v20, v8, v22, #8
	mov.d v0[1], v20[1]
	fsub.4s v15, v18, v11
	fsub.4s v10, v21, v14
	fmul.4s v18, v15, v15
	fmul.4s v21, v10, v10
	fadd.4s v18, v18, v21
	trn2.4s v21, v13, v9
	mov.d v21[1], v22[1]
	trn1.4s v22, v8, v2
	zip2.4s v1, v13, v9
	mov.d v1[1], v22[1]
	fsub.4s v5, v31, v11
	fsub.4s v16, v3, v14
	stp q16, q5, [sp, #176]
	fmul.4s v3, v5, v5
	fmul.4s v31, v16, v16
	fadd.4s v31, v3, v31
	fsub.4s v3, v30, v11
	str q3, [sp, #272]
	fsub.4s v4, v4, v14
	str q4, [sp, #384]
	fmul.4s v3, v3, v3
	fmul.4s v4, v4, v4
	fadd.4s v30, v3, v4
	zip2.4s v3, v8, v2
	uzp2.4s v2, v13, v9
	uzp2.4s v2, v2, v13
	mov.d v2[1], v3[1]
	ldr q5, [sp, #32]
	fadd.4s v3, v5, v17
	fmul.4s v4, v6, v12[0]
	fsqrt.4s v6, v3
	fmul.4s v6, v3, v6
	fdiv.4s v4, v4, v6
	fmul.4s v6, v27, v12[0]
	fadd.4s v17, v5, v19
	fsqrt.4s v19, v17
	fmul.4s v19, v17, v19
	fdiv.4s v6, v6, v19
	fcmeq.4s v17, v17, #0.0
	bic.16b v6, v6, v17
	fadd.4s v7, v5, v7
	fmul.4s v17, v26, v12[0]
	fsqrt.4s v19, v7
	fmul.4s v19, v7, v19
	fdiv.4s v17, v17, v19
	fcmeq.4s v3, v3, #0.0
	bic.16b v16, v4, v3
	fcmeq.4s v3, v7, #0.0
	bic.16b v29, v17, v3
	fadd.4s v3, v5, v25
	fmul.4s v4, v28, v12[0]
	fsqrt.4s v7, v3
	fmul.4s v7, v3, v7
	fdiv.4s v4, v4, v7
	fcmeq.4s v3, v3, #0.0
	bic.16b v9, v4, v3
	fadd.4s v3, v5, v24
	fmul.4s v0, v0, v12[0]
	fsqrt.4s v4, v3
	fmul.4s v4, v3, v4
	fdiv.4s v0, v0, v4
	fadd.4s v4, v5, v18
	fmul.4s v17, v21, v12[0]
	fsqrt.4s v18, v4
	fmul.4s v18, v4, v18
	fdiv.4s v17, v17, v18
	fcmeq.4s v4, v4, #0.0
	bic.16b v26, v17, v4
	fadd.4s v17, v5, v31
	fmul.4s v1, v1, v12[0]
	fsqrt.4s v4, v17
	fmul.4s v4, v17, v4
	fdiv.4s v28, v1, v4
	ldr q1, [x24, #96]
	ldr q18, [x24, #64]
	ldr q21, [x24, #32]
	ldr q24, [x24]
	zip1.4s v27, v24, v21
	zip1.4s v25, v18, v1
	ext.16b v4, v18, v25, #8
	mov.d v27[1], v4[1]
	fcmeq.4s v4, v17, #0.0
	bic.16b v13, v28, v4
	trn2.4s v28, v24, v21
	mov.d v28[1], v25[1]
	trn1.4s v25, v18, v1
	zip2.4s v19, v24, v21
	mov.d v19[1], v25[1]
	fadd.4s v30, v5, v30
	fmul.4s v2, v2, v12[0]
	fsqrt.4s v25, v30
	fmul.4s v25, v30, v25
	fdiv.4s v2, v2, v25
	zip2.4s v1, v18, v1
	uzp2.4s v18, v24, v21
	uzp2.4s v24, v18, v24
	fcmeq.4s v3, v3, #0.0
	bic.16b v5, v0, v3
	mov.d v24[1], v1[1]
	ldr q3, [x24, #112]
	ldr q18, [x24, #80]
	ldr q21, [x24, #48]
	ldr q0, [x24, #16]
	zip1.4s v25, v0, v21
	zip1.4s v31, v18, v3
	ext.16b v1, v18, v31, #8
	mov.d v25[1], v1[1]
	fcmeq.4s v1, v30, #0.0
	bic.16b v1, v2, v1
	str q1, [sp, #96]
	trn2.4s v20, v0, v21
	mov.d v20[1], v31[1]
	ldr q1, [sp, #352]
	fmul.4s v22, v1, v6
	ldr q1, [sp, #320]
	fmul.4s v4, v1, v6
	trn1.4s v2, v18, v3
	zip2.4s v31, v0, v21
	mov.d v31[1], v2[1]
	ldr q1, [sp, #368]
	fmul.4s v8, v1, v16
	stp q22, q8, [sp, #352]
	ldr q1, [sp, #336]
	fmul.4s v1, v1, v16
	stp q1, q4, [sp, #144]
	zip2.4s v2, v18, v3
	uzp2.4s v3, v0, v21
	uzp2.4s v30, v3, v0
	mov.d v30[1], v2[1]
	ldr q1, [x23, #96]
	ldr q2, [x23, #64]
	ldr q3, [x23, #32]
	ldr q0, [x23]
	zip1.4s v23, v0, v3
	zip1.4s v6, v2, v1
	ext.16b v7, v2, v6, #8
	mov.d v23[1], v7[1]
	trn2.4s v12, v0, v3
	mov.d v12[1], v6[1]
	ldp q4, q6, [sp, #240]
	fmul.4s v17, v6, v29
	fmul.4s v7, v4, v29
	trn1.4s v6, v2, v1
	zip2.4s v11, v0, v3
	mov.d v11[1], v6[1]
	fmul.4s v16, v15, v26
	str q16, [sp, #256]
	fmul.4s v4, v10, v26
	stp q4, q7, [sp, #112]
	zip2.4s v1, v2, v1
	uzp2.4s v2, v0, v3
	uzp2.4s v14, v2, v0
	ldp q0, q2, [sp, #208]
	fmul.4s v4, v2, v9
	stp q4, q17, [sp, #320]
	fmul.4s v0, v0, v9
	str q0, [sp, #208]
	mov.d v14[1], v1[1]
	ldr q0, [x23, #112]
	ldr q1, [x23, #80]
	ldr q9, [x23, #48]
	ldr q10, [x23, #16]
	zip1.4s v29, v10, v9
	zip1.4s v3, v1, v0
	ext.16b v2, v1, v3, #8
	mov.d v29[1], v2[1]
	ldp q2, q6, [sp, #176]
	fmul.4s v7, v6, v13
	str q7, [sp, #240]
	fmul.4s v13, v2, v13
	trn2.4s v21, v10, v9
	mov.d v21[1], v3[1]
	ldp q3, q2, [sp, #288]
	fmul.4s v2, v2, v5
	str q2, [sp, #304]
	fmul.4s v15, v3, v5
	trn1.4s v5, v1, v0
	zip2.4s v26, v10, v9
	mov.d v26[1], v5[1]
	zip2.4s v0, v1, v0
	uzp2.4s v1, v10, v9
	uzp2.4s v18, v1, v10
	mov.d v18[1], v0[1]
	fmul.4s v0, v8, v23
	fsub.4s v6, v27, v0
	fmul.4s v5, v22, v12
	fsub.4s v28, v28, v5
	fmul.4s v5, v17, v11
	fsub.4s v5, v19, v5
	fmul.4s v17, v4, v14
	fsub.4s v19, v24, v17
	fmul.4s v17, v2, v29
	fsub.4s v25, v25, v17
	fmul.4s v17, v16, v21
	fsub.4s v10, v20, v17
	fmul.4s v4, v7, v26
	fsub.4s v24, v31, v4
	ldr q0, [sp, #272]
	ldr q20, [sp, #96]
	fmul.4s v9, v0, v20
	fmul.4s v4, v9, v18
	fsub.4s v27, v30, v4
	zip1.4s v4, v24, v27
	trn2.4s v0, v25, v10
	mov.d v0[1], v4[1]
	str q0, [sp, #288]
	ext.16b v17, v24, v4, #8
	zip2.4s v30, v24, v27
	trn1.4s v24, v24, v27
	zip2.4s v0, v25, v10
	mov.d v0[1], v24[1]
	str q0, [sp, #224]
	trn1.4s v31, v5, v19
	zip2.4s v27, v6, v28
	mov.d v27[1], v31[1]
	zip1.4s v4, v25, v10
	uzp2.4s v31, v25, v10
	uzp2.4s v31, v31, v25
	zip1.4s v10, v5, v19
	trn2.4s v25, v6, v28
	mov.d v25[1], v10[1]
	ext.16b v7, v5, v10, #8
	zip2.4s v24, v5, v19
	ldr q19, [x25, #96]
	ldr q2, [x25, #64]
	ldr q1, [x25, #32]
	ldr q0, [x25]
	zip1.4s v5, v0, v1
	zip1.4s v3, v2, v19
	ext.16b v10, v2, v3, #8
	mov.d v5[1], v10[1]
	zip1.4s v10, v6, v28
	uzp2.4s v28, v6, v28
	uzp2.4s v28, v28, v6
	trn2.4s v6, v0, v1
	mov.d v6[1], v3[1]
	mov.d v4[1], v17[1]
	str q4, [sp, #272]
	trn1.4s v3, v2, v19
	zip2.4s v17, v0, v1
	mov.d v17[1], v3[1]
	mov.d v10[1], v7[1]
	zip2.4s v2, v2, v19
	uzp2.4s v1, v0, v1
	uzp2.4s v16, v1, v0
	mov.d v16[1], v2[1]
	ldr q1, [x25, #112]
	ldr q2, [x25, #80]
	ldr q3, [x25, #48]
	ldr q7, [x25, #16]
	zip1.4s v19, v7, v3
	zip1.4s v0, v2, v1
	ext.16b v8, v2, v0, #8
	mov.d v19[1], v8[1]
	trn2.4s v8, v7, v3
	mov.d v8[1], v0[1]
	trn1.4s v4, v2, v1
	zip2.4s v0, v7, v3
	mov.d v0[1], v4[1]
	zip2.4s v1, v2, v1
	mov.d v31[1], v30[1]
	uzp2.4s v2, v7, v3
	uzp2.4s v2, v2, v7
	mov.d v2[1], v1[1]
	mov.d v28[1], v24[1]
	ldr q1, [sp, #384]
	fmul.4s v7, v1, v20
	ldp q30, q24, [sp, #144]
	fmul.4s v1, v30, v23
	fsub.4s v5, v5, v1
	fmul.4s v1, v24, v12
	fsub.4s v23, v6, v1
	ldp q20, q22, [sp, #112]
	fmul.4s v1, v22, v11
	fsub.4s v6, v17, v1
	fmul.4s v1, v15, v29
	fsub.4s v17, v19, v1
	fmul.4s v1, v20, v21
	fsub.4s v21, v8, v1
	fmul.4s v1, v13, v26
	fsub.4s v0, v0, v1
	fmul.4s v1, v7, v18
	fsub.4s v3, v2, v1
	zip1.4s v1, v17, v21
	zip1.4s v2, v0, v3
	ext.16b v4, v0, v2, #8
	mov.d v1[1], v4[1]
	trn2.4s v4, v17, v21
	mov.d v4[1], v2[1]
	ldr q26, [sp, #208]
	fmul.4s v2, v26, v14
	fsub.4s v16, v16, v2
	zip1.4s v2, v5, v23
	zip1.4s v18, v6, v16
	ext.16b v19, v6, v18, #8
	mov.d v2[1], v19[1]
	trn2.4s v19, v5, v23
	mov.d v19[1], v18[1]
	zip2.4s v18, v0, v3
	trn1.4s v0, v0, v3
	uzp2.4s v3, v17, v21
	uzp2.4s v3, v3, v17
	zip2.4s v21, v17, v21
	mov.d v21[1], v0[1]
	mov.d v3[1], v18[1]
	zip2.4s v0, v6, v16
	trn1.4s v16, v6, v16
	zip2.4s v6, v5, v23
	mov.d v6[1], v16[1]
	uzp2.4s v16, v5, v23
	uzp2.4s v5, v16, v5
	ldr q16, [sp, #480]
	fadd s16, s16, s7
	mov s17, v7[1]
	fadd s16, s16, s17
	mov.d v5[1], v0[1]
	mov s0, v7[2]
	fadd s0, s16, s0
	ldr q16, [sp, #464]
	fadd s16, s16, s13
	mov s17, v13[1]
	fadd s16, s16, s17
	mov s17, v13[2]
	fadd s16, s16, s17
	ldr q17, [sp, #496]
	fadd s17, s17, s20
	mov s18, v20[1]
	fadd s17, s17, s18
	mov s18, v13[3]
	fadd s18, s16, s18
	mov s16, v20[2]
	fadd s16, s17, s16
	mov s17, v20[3]
	ldr q12, [sp, #80]
	fadd s20, s16, s17
	mov s7, v7[3]
	fadd s17, s0, s7
	ldr q0, [sp, #416]
	fadd s0, s0, s15
	mov s7, v15[1]
	fadd s0, s0, s7
	mov s7, v15[2]
	fadd s0, s0, s7
	ldr q7, [sp, #400]
	mov.16b v23, v26
	fadd s7, s7, s23
	mov s16, v26[1]
	fadd s7, s7, s16
	mov s16, v26[2]
	mov.16b v29, v26
	fadd s7, s7, s16
	mov s16, v15[3]
	fadd s26, s0, s16
	ldr q0, [sp, #512]
	fadd s0, s0, s22
	mov s16, v22[1]
	fadd s0, s0, s16
	mov s16, v22[2]
	fadd s0, s0, s16
	mov s16, v22[3]
	fadd s22, s0, s16
	ldr q0, [sp, #432]
	mov.16b v23, v24
	fadd s0, s0, s23
	mov s16, v24[1]
	fadd s0, s0, s16
	mov s16, v29[3]
	fadd s29, s7, s16
	mov s7, v24[2]
	fadd s0, s0, s7
	mov s7, v24[3]
	fadd s23, s0, s7
	ldp q0, q24, [sp, #224]
	stp q27, q0, [x24, #64]
	ldr q0, [sp, #560]
	fadd s0, s0, s9
	mov s7, v9[1]
	fadd s0, s0, s7
	mov s7, v9[2]
	fadd s0, s0, s7
	mov s7, v9[3]
	fadd s16, s0, s7
	ldr q0, [sp, #592]
	fadd s0, s0, s24
	mov s7, v24[1]
	fadd s0, s0, s7
	ldr q7, [sp, #288]
	stp q25, q7, [x24, #32]
	mov s7, v24[2]
	fadd s0, s0, s7
	mov s7, v24[3]
	fadd s7, s0, s7
	stp q6, q21, [x25, #64]
	ldr q0, [sp, #576]
	ldr q21, [sp, #256]
	fadd s0, s0, s21
	mov s6, v21[1]
	fadd s0, s0, s6
	mov s6, v21[2]
	fadd s0, s0, s6
	mov s6, v21[3]
	fadd s21, s0, s6
	ldr q0, [sp, #448]
	ldr q24, [sp, #304]
	fadd s0, s0, s24
	mov s6, v24[1]
	fadd s0, s0, s6
	stp q19, q4, [x25, #32]
	mov s4, v24[2]
	fadd s0, s0, s4
	mov s4, v24[3]
	fadd s27, s0, s4
	stp q28, q31, [x24, #96]
	ldp q6, q19, [sp, #320]
	mov s0, v6[1]
	ldr q4, [sp, #608]
	fadd s4, s4, s6
	fadd s0, s4, s0
	mov s4, v6[2]
	fadd s0, s0, s4
	mov s4, v6[3]
	fadd s6, s0, s4
	mov s0, v19[1]
	ldr q4, [sp, #624]
	fadd s4, s4, s19
	fadd s0, s4, s0
	ldr q4, [sp, #272]
	stp q10, q4, [x24], #128
	mov s4, v19[2]
	fadd s0, s0, s4
	mov s4, v19[3]
	fadd s4, s0, s4
	stp q5, q3, [x25, #96]
	ldp q5, q19, [sp, #352]
	mov s0, v5[1]
	ldr q3, [sp, #640]
	fadd s3, s3, s5
	fadd s0, s3, s0
	mov s3, v5[2]
	fadd s0, s0, s3
	mov s3, v5[3]
	fadd s5, s0, s3
	mov s0, v19[1]
	ldr q3, [sp, #544]
	fadd s3, s3, s19
	fadd s0, s3, s0
	stp q2, q1, [x25], #128
	mov s1, v19[2]
	fadd s0, s0, s1
	mov s1, v19[3]
	fadd s24, s0, s1
	ldr q0, [sp, #528]
	mov.16b v2, v30
	fadd s0, s0, s2
	mov s1, v30[1]
	fadd s0, s0, s1
	mov s1, v30[2]
	fadd s0, s0, s1
	mov s1, v30[3]
	fadd s25, s0, s1
	add x23, x23, #128
	add x22, x22, #128
	add x21, x21, #128
	add x20, x20, #128
	subs x26, x26, #4
	b.ne LBB73_5
	mov.s v24[1], v5[0]
	mov.s v24[2], v4[0]
	mov.s v24[3], v6[0]
	mov.s v25[1], v23[0]
	mov.s v25[2], v22[0]
	mov.s v25[3], v29[0]
	mov.s v27[1], v21[0]
	mov.s v27[2], v7[0]
	mov.s v27[3], v16[0]
	mov.s v26[1], v20[0]
	mov.s v26[2], v18[0]
	mov.s v26[3], v17[0]
	cmp x17, x19
	ldp q2, q0, [sp]
	b.eq LBB73_9
LBB73_7:
	dup.4s v22, v2[0]
	dup.4s v1, v2[1]
	dup.4s v6, v2[0]
	dup.4s v7, v2[1]
	sub x17, x17, x19
	mov w20, #16
	orr x24, x20, x19, lsl #5
	add x19, x8, x24
	add x20, x2, x24
	dup.4s v2, v0[0]
	add x21, x9, x24
	add x22, x4, x24
	add x23, x11, x24
	add x24, x6, x24
LBB73_8:
	ldp q3, q16, [x22, #-16]
	ldp q4, q5, [x20, #-16]
	fsub.4s v4, v4, v6
	fsub.4s v3, v3, v7
	fmul.4s v17, v4, v4
	fmul.4s v18, v3, v3
	fadd.4s v17, v17, v18
	fadd.4s v17, v2, v17
	ldp q18, q19, [x24, #-16]
	fmul.4s v18, v18, v12[0]
	fsqrt.4s v20, v17
	fmul.4s v20, v17, v20
	fdiv.4s v18, v18, v20
	fcmeq.4s v17, v17, #0.0
	bic.16b v17, v18, v17
	fsub.4s v18, v5, v22
	fsub.4s v5, v5, v6
	fmul.4s v5, v5, v5
	fmul.4s v4, v4, v17
	fsub.4s v16, v16, v1
	fmul.4s v20, v16, v16
	fadd.4s v5, v5, v20
	fadd.4s v5, v2, v5
	fmul.4s v19, v19, v12[0]
	fmul.4s v3, v3, v17
	fsqrt.4s v17, v5
	fmul.4s v17, v5, v17
	fdiv.4s v17, v19, v17
	fcmeq.4s v5, v5, #0.0
	bic.16b v5, v17, v5
	fmul.4s v16, v16, v5
	fmul.4s v5, v18, v5
	ldp q17, q18, [x21, #-16]
	ldp q19, q20, [x23, #-16]
	fmul.4s v21, v4, v19
	fsub.4s v17, v17, v21
	fmul.4s v21, v5, v20
	fsub.4s v18, v18, v21
	fmul.4s v19, v3, v19
	stp q17, q18, [x21, #-16]
	ldp q17, q18, [x19, #-16]
	fsub.4s v17, v17, v19
	fmul.4s v19, v16, v20
	fsub.4s v18, v18, v19
	stp q17, q18, [x19, #-16]
	fadd.4s v24, v4, v24
	fadd.4s v25, v3, v25
	fadd.4s v27, v5, v27
	add x20, x20, #32
	add x19, x19, #32
	add x21, x21, #32
	fadd.4s v26, v16, v26
	add x22, x22, #32
	add x23, x23, #32
	add x24, x24, #32
	subs x17, x17, #1
	b.ne LBB73_8
LBB73_9:
	and x17, x3, #0x7
	cmp x14, x17
	csel x14, x14, x17, lo
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
	mov s5, v26[1]
	mov s6, v26[2]
	mov s7, v27[1]
	mov s16, v27[2]
	cbz x14, LBB73_15
	and x15, x3, #0x1ffffffffffffff8
	and x16, x5, #0x1ffffffffffffff8
	and x17, x7, #0x1ffffffffffffff8
	and x3, x13, #0x1ffffffffffffff8
	and x5, x12, #0xffffffffffffff8
	and x7, x10, #0xffffffffffffff8
	add x10, x2, x15, lsl #2
	add x12, x4, x16, lsl #2
	add x13, x6, x17, lsl #2
	add x11, x11, x3, lsl #2
	add x9, x9, x5, lsl #2
	add x8, x8, x7, lsl #2
	ldp s19, s20, [x1]
	ldr s28, [x1, #8]
	ldr s1, [x10]
	ldr s2, [x12]
	ldr s3, [x13]
	ldr s4, [x11]
	fmul s3, s3, s28
	ldr s17, [x9]
	ldr s18, [x8]
	fsub s21, s1, s19
	fmul s1, s21, s21
	fsub s2, s2, s20
	fmul s22, s2, s2
	fadd s1, s1, s22
	fadd s1, s0, s1
	fsqrt s22, s1
	fmul s22, s1, s22
	fdiv s3, s3, s22
	fcmp s1, #0.0
	movi.2d v1, #0000000000000000
	fcsel s3, s1, s3, eq
	fmul s21, s21, s3
	movi.4s v22, #128, lsl #24
	movi.4s v23, #128, lsl #24
	mov.s v23[0], v21[0]
	fmul s2, s2, s3
	mov.s v22[0], v2[0]
	fmul s3, s4, s21
	fsub s3, s17, s3
	str s3, [x9]
	fmul s2, s4, s2
	fsub s2, s18, s2
	str s2, [x8]
	fadd.4s v18, v24, v23
	fadd.4s v17, v25, v22
	cmp x14, #1
	b.eq LBB73_14
	ldr s2, [x10, #4]
	ldr s3, [x12, #4]
	ldr s4, [x13, #4]
	ldr s21, [x11, #4]
	fsub s2, s2, s19
	fsub s3, s3, s20
	fmul s22, s2, s2
	fmul s23, s3, s3
	fadd s22, s22, s23
	fadd s22, s0, s22
	fmul s4, s4, s28
	fsqrt s23, s22
	fmul s23, s22, s23
	fdiv s4, s4, s23
	fcmp s22, #0.0
	fcsel s1, s1, s4, eq
	fmul s2, s2, s1
	fmul s1, s3, s1
	fmul s3, s21, s2
	ldr s4, [x9, #4]
	fsub s3, s4, s3
	str s3, [x9, #4]
	fmul s3, s21, s1
	ldr s4, [x8, #4]
	fsub s3, s4, s3
	str s3, [x8, #4]
	mov s3, v24[1]
	fadd s2, s3, s2
	mov s3, v25[1]
	fadd s1, s3, s1
	mov.s v18[1], v2[0]
	mov.s v17[1], v1[0]
	cmp x14, #2
	b.eq LBB73_14
	ldr s1, [x10, #8]
	ldr s2, [x12, #8]
	ldr s3, [x13, #8]
	ldr s4, [x11, #8]
	fsub s21, s1, s19
	fsub s2, s2, s20
	fmul s1, s21, s21
	fmul s22, s2, s2
	fadd s1, s1, s22
	fadd s1, s0, s1
	fmul s3, s3, s28
	fsqrt s22, s1
	fmul s22, s1, s22
	fdiv s3, s3, s22
	fcmp s1, #0.0
	movi.2d v1, #0000000000000000
	fcsel s3, s1, s3, eq
	fmul s21, s21, s3
	fmul s2, s2, s3
	fmul s3, s4, s21
	ldr s22, [x9, #8]
	fsub s3, s22, s3
	str s3, [x9, #8]
	fmul s3, s4, s2
	ldr s4, [x8, #8]
	fsub s3, s4, s3
	str s3, [x8, #8]
	mov s3, v24[2]
	fadd s3, s3, s21
	mov s4, v25[2]
	fadd s2, s4, s2
	mov.s v18[2], v3[0]
	mov.s v17[2], v2[0]
	cmp x14, #3
	b.eq LBB73_14
	ldr s2, [x10, #12]
	ldr s3, [x12, #12]
	ldr s4, [x13, #12]
	ldr s21, [x11, #12]
	fsub s2, s2, s19
	fsub s3, s3, s20
	fmul s22, s2, s2
	fmul s23, s3, s3
	fadd s22, s22, s23
	fadd s22, s0, s22
	fmul s4, s4, s28
	fsqrt s23, s22
	fmul s23, s22, s23
	fdiv s4, s4, s23
	fcmp s22, #0.0
	fcsel s1, s1, s4, eq
	fmul s2, s2, s1
	fmul s1, s3, s1
	fmul s3, s21, s2
	ldr s4, [x9, #12]
	fsub s3, s4, s3
	str s3, [x9, #12]
	fmul s3, s21, s1
	ldr s4, [x8, #12]
	fsub s3, s4, s3
	str s3, [x8, #12]
	mov s3, v24[3]
	fadd s2, s3, s2
	mov s3, v25[3]
	fadd s1, s3, s1
	mov.s v18[3], v2[0]
	mov.s v17[3], v1[0]
	cmp x14, #4
	b.ne LBB73_17
LBB73_14:
	mov.16b v1, v26
	mov.16b v2, v27
	b LBB73_16
LBB73_15:
	mov.16b v1, v26
	mov.16b v2, v27
	mov.16b v18, v24
	mov.16b v17, v25
LBB73_16:
	str q18, [x0]
	stp s2, s7, [x0, #16]
	str s16, [x0, #24]
	add x8, x0, #28
	st1.s { v27 }[3], [x8]
	str q17, [x0, #32]
	stp s1, s5, [x0, #48]
	str s6, [x0, #56]
	add x8, x0, #60
	st1.s { v26 }[3], [x8]
	add sp, sp, #656
	.cfi_def_cfa_offset 144
	ldp x20, x19, [sp, #128]
	ldp x22, x21, [sp, #112]
	ldp x24, x23, [sp, #96]
	ldp x26, x25, [sp, #80]
	ldp x28, x27, [sp, #64]
	ldp d9, d8, [sp, #48]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #144
	.cfi_def_cfa_offset 0
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
LBB73_17:
	.cfi_restore_state
	ldr s1, [x10, #16]
	ldr s2, [x12, #16]
	ldr s3, [x13, #16]
	ldr s4, [x11, #16]
	fsub s1, s1, s19
	fsub s2, s2, s20
	fmul s21, s1, s1
	fmul s22, s2, s2
	fadd s21, s21, s22
	fadd s21, s0, s21
	fmul s3, s3, s28
	fsqrt s22, s21
	fmul s22, s21, s22
	fdiv s22, s3, s22
	fcmp s21, #0.0
	movi.2d v3, #0000000000000000
	fcsel s21, s3, s22, eq
	fmul s1, s1, s21
	fmul s21, s2, s21
	fmul s2, s4, s1
	ldr s22, [x9, #16]
	fsub s2, s22, s2
	str s2, [x9, #16]
	fmul s2, s4, s21
	ldr s4, [x8, #16]
	fsub s2, s4, s2
	str s2, [x8, #16]
	fadd s2, s27, s1
	fadd s1, s26, s21
	cmp x14, #5
	b.eq LBB73_16
	ldr s4, [x10, #20]
	ldr s21, [x12, #20]
	ldr s22, [x13, #20]
	ldr s23, [x11, #20]
	fsub s4, s4, s19
	fsub s21, s21, s20
	fmul s24, s4, s4
	fmul s25, s21, s21
	fadd s24, s24, s25
	fadd s24, s0, s24
	fmul s22, s22, s28
	fsqrt s25, s24
	fmul s25, s24, s25
	fdiv s22, s22, s25
	fcmp s24, #0.0
	fcsel s3, s3, s22, eq
	fmul s4, s4, s3
	fmul s3, s21, s3
	fmul s21, s23, s4
	ldr s22, [x9, #20]
	fsub s21, s22, s21
	str s21, [x9, #20]
	fmul s21, s23, s3
	ldr s22, [x8, #20]
	fsub s21, s22, s21
	str s21, [x8, #20]
	fadd s7, s7, s4
	fadd s5, s5, s3
	cmp x14, #6
	b.eq LBB73_16
	ldr s3, [x10, #24]
	ldr s4, [x12, #24]
	ldr s21, [x13, #24]
	ldr s22, [x11, #24]
	fsub s3, s3, s19
	fsub s4, s4, s20
	fmul s19, s3, s3
	fmul s20, s4, s4
	fadd s19, s19, s20
	fadd s19, s0, s19
	fmul s0, s21, s28
	fsqrt s20, s19
	fmul s20, s19, s20
	fdiv s0, s0, s20
	fcmp s19, #0.0
	movi.2d v19, #0000000000000000
	fcsel s0, s19, s0, eq
	fmul s3, s3, s0
	fmul s0, s4, s0
	fmul s4, s22, s3
	ldr s19, [x9, #24]
	fsub s4, s19, s4
	str s4, [x9, #24]
	fmul s4, s22, s0
	ldr s19, [x8, #24]
	fsub s4, s19, s4
	str s4, [x8, #24]
	fadd s16, s16, s3
	fadd s6, s6, s0
	b LBB73_16
