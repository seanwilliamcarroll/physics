engine::force::sweep::<f32>:
Lfunc_begin73:
	.cfi_startproc
	sub sp, sp, #336
	.cfi_def_cfa_offset 336
	stp d15, d14, [sp, #176]
	stp d13, d12, [sp, #192]
	stp d11, d10, [sp, #208]
	stp d9, d8, [sp, #224]
	stp x28, x27, [sp, #240]
	stp x26, x25, [sp, #256]
	stp x24, x23, [sp, #272]
	stp x22, x21, [sp, #288]
	stp x20, x19, [sp, #304]
	stp x29, x30, [sp, #320]
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
	ldp x8, x9, [sp, #368]
	ldp x10, x12, [sp, #352]
	ldp x11, x13, [sp, #336]
	movi.2d v1, #0000000000000000
	str q1, [sp, #96]
	stur q1, [sp, #84]
	stur q1, [sp, #68]
	stur q1, [sp, #52]
	and x14, x5, #0xf
	lsr x17, x5, #4
	and x15, x7, #0xf
	lsr x19, x7, #4
	and x16, x13, #0xf
	lsr x20, x13, #4
	lsr x21, x3, #4
	cmp x17, x21
	csel x17, x17, x21, lo
	stur q1, [sp, #116]
	stur q1, [sp, #132]
	cmp x19, x17
	csel x17, x19, x17, lo
	cmp x20, x17
	csel x17, x20, x17, lo
	stur q1, [sp, #148]
	str q1, [sp, #160]
	lsr x19, x12, #4
	lsr x20, x9, #4
	cmp x20, x19
	csel x19, x20, x19, lo
	cmp x19, x17
	csel x19, x19, x17, lo
	cbz x19, LBB73_4
	mov x17, #0
	ldr d2, [x1]
	mov.16b v5, v2
	mov.d v2[1], v2[0]
	stp q0, q2, [sp, #16]
	dup.4s v3, v5[0]
	dup.4s v4, v0[0]
	dup.4s v6, v5[1]
	movi d5, #0000000000000000
	movi.2d v16, #0000000000000000
	ldr s22, [x1, #8]
	lsl x19, x19, #6
	add x20, x8, #32
	add x21, x10, #32
	add x22, x11, #32
	movi.2d v20, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v17, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v19, #0000000000000000
	movi d7, #0000000000000000
LBB73_2:
	add x28, x2, x17
	add x27, x4, x17
	add x23, x27, #60
	ldr s31, [x28, #60]
	ld1.s { v31 }[1], [x23]
	add x26, x6, x17
	add x23, x2, x17
	ld1.s { v31 }[2], [x23], #4
	add x25, x22, x17
	add x24, x21, x17
	ldr q23, [x23]
	add x30, x4, x17
	ld1.s { v31 }[3], [x30], #4
	add x23, x20, x17
	fsub.4s v30, v23, v3
	ldr q23, [x30]
	fsub.4s v29, v23, v6
	fmul.4s v23, v30, v30
	fmul.4s v24, v29, v29
	ldur q25, [x26, #4]
	fmul.4s v8, v25, v22[0]
	ldur q25, [x28, #20]
	fsub.4s v25, v25, v3
	ldur q26, [x27, #20]
	fadd.4s v23, v23, v24
	fsub.4s v26, v26, v6
	fmul.4s v24, v25, v25
	fmul.4s v27, v26, v26
	fadd.4s v24, v24, v27
	fadd.4s v24, v4, v24
	fadd.4s v27, v4, v23
	ldur q23, [x26, #20]
	fmul.4s v23, v23, v22[0]
	fsqrt.4s v28, v24
	fmul.4s v28, v24, v28
	fcmeq.4s v24, v24, #0.0
	fdiv.4s v23, v23, v28
	ldur q28, [x28, #36]
	fsub.4s v28, v28, v3
	ldur q9, [x27, #36]
	fsub.4s v9, v9, v6
	fmul.4s v10, v28, v28
	bic.16b v11, v23, v24
	fmul.4s v23, v9, v9
	fadd.4s v23, v10, v23
	fadd.4s v23, v4, v23
	ldur q24, [x26, #36]
	fmul.4s v24, v24, v22[0]
	fsqrt.4s v10, v27
	fsqrt.4s v12, v23
	fmul.4s v12, v23, v12
	fdiv.4s v24, v24, v12
	fcmeq.4s v23, v23, #0.0
	bic.16b v12, v24, v23
	fcmeq.4s v13, v27, #0.0
	ldur d23, [x28, #52]
	fsub.2s v14, v23, v3
	ldur d23, [x27, #52]
	fsub.2s v15, v23, v6
	fmul.2s v24, v14, v14
	fmul.4s v23, v25, v11
	fmul.2s v25, v15, v15
	fadd.2s v24, v24, v25
	fadd.2s v25, v4, v24
	ldur d24, [x26, #52]
	fmul.2s v2, v24, v22[0]
	fmul.4s v24, v28, v12
	fsqrt.2s v28, v25
	fmul.2s v28, v25, v28
	fdiv.2s v2, v2, v28
	fcmeq.2s v25, v25, #0.0
	bic.8b v2, v2, v25
	fmul.4s v10, v27, v10
	fmul.2s v28, v14, v2
	fmul.4s v25, v26, v11
	fmul.4s v26, v9, v12
	fmul.2s v27, v15, v2
	ldr q0, [sp, #32]
	fsub.4s v2, v31, v0
	fdiv.4s v31, v8, v10
	fmul.4s v8, v2, v2
	mov d9, v8[1]
	faddp.2s v8, v8, v9
	fadd.2s v8, v4, v8
	ldr s9, [x26, #60]
	bic.16b v10, v31, v13
	ld1.s { v9 }[1], [x26]
	fmul.2s v9, v9, v22[0]
	fsqrt.2s v31, v8
	fmul.2s v11, v8, v31
	fmul.4s v31, v30, v10
	fdiv.2s v30, v9, v11
	fcmeq.2s v8, v8, #0.0
	bic.8b v30, v30, v8
	zip1.4s v30, v30, v30
	fmul.4s v30, v2, v30
	fmul.4s v29, v29, v10
	ldp q2, q11, [x24, #-32]
	uzp1.4s v8, v30, v30
	ext.16b v8, v8, v31, #12
	ldp q9, q10, [x25, #-32]
	fmul.4s v8, v8, v9
	ext.16b v12, v31, v23, #12
	fmul.4s v12, v12, v10
	ext.16b v14, v23, v24, #12
	fsub.4s v2, v2, v8
	ldp q13, q8, [x25]
	fmul.4s v14, v14, v13
	ldp q15, q0, [x24]
	fsub.4s v14, v15, v14
	fsub.4s v11, v11, v12
	ext.16b v12, v24, v28, #12
	mov.s v12[3], v30[0]
	fmul.4s v12, v12, v8
	ext.16b v15, v30, v29, #12
	fsub.4s v0, v0, v12
	fmul.4s v9, v15, v9
	ext.16b v12, v29, v25, #12
	fmul.4s v10, v12, v10
	ldp q12, q15, [x23, #-32]
	fsub.4s v9, v12, v9
	fsub.4s v10, v15, v10
	ext.16b v12, v25, v26, #12
	fmul.4s v12, v12, v13
	stp q2, q11, [x24, #-32]
	ldp q13, q2, [x23]
	ext.16b v11, v26, v27, #12
	mov.s v11[3], v30[1]
	stp q14, q0, [x24]
	fsub.4s v0, v13, v12
	fmul.4s v8, v11, v8
	fsub.4s v2, v2, v8
	fadd.4s v16, v31, v16
	stp q9, q10, [x23, #-32]
	fadd.4s v20, v23, v20
	fadd.4s v21, v24, v21
	fadd.2s v5, v28, v5
	fadd.4s v17, v29, v17
	stp q0, q2, [x23]
	fadd.4s v18, v25, v18
	fadd.4s v19, v26, v19
	fadd.2s v7, v27, v7
	fadd.4s v1, v30, v1
	add x17, x17, #64
	cmp x19, x17
	b.ne LBB73_2
	add x17, sp, #112
	stur q16, [sp, #52]
	add x17, x17, #60
	stur q20, [sp, #68]
	stur q21, [sp, #84]
	stur d5, [sp, #100]
	str s1, [sp, #108]
	stur q17, [sp, #116]
	stur q18, [sp, #132]
	stur q19, [sp, #148]
	mov s3, v1[2]
	stur d7, [sp, #164]
	mov s2, v1[3]
	st1.s { v1 }[1], [x17]
	ldr q0, [sp, #16]
	b LBB73_5
LBB73_4:
	movi.2d v2, #0000000000000000
	movi.2d v3, #0000000000000000
LBB73_5:
	str s3, [sp, #48]
	str s2, [sp, #112]
	and x17, x3, #0xf
	cmp x14, x17
	csel x14, x14, x17, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	cmp x16, x14
	csel x14, x16, x14, lo
	and x15, x12, #0xf
	and x16, x9, #0xf
	cmp x16, x15
	csel x15, x16, x15, lo
	cmp x15, x14
	csel x14, x15, x14, lo
	cbz x14, LBB73_8
	and x15, x3, #0x1ffffffffffffff0
	add x15, x2, x15, lsl #2
	and x16, x5, #0x1ffffffffffffff0
	and x17, x7, #0x1ffffffffffffff0
	add x16, x4, x16, lsl #2
	and x13, x13, #0x1ffffffffffffff0
	and x12, x12, #0xffffffffffffff0
	and x2, x9, #0xffffffffffffff0
	add x9, x6, x17, lsl #2
	add x11, x11, x13, lsl #2
	add x10, x10, x12, lsl #2
	ldp s1, s2, [x1]
	ldr s3, [x1, #8]
	add x12, sp, #112
	add x13, sp, #48
	movi.2d v4, #0000000000000000
	add x8, x8, x2, lsl #2
LBB73_7:
	ldr s6, [x15], #4
	ldr s5, [x16], #4
	fsub s17, s6, s1
	fsub s5, s5, s2
	fmul s6, s17, s17
	fmul s7, s5, s5
	fadd s6, s6, s7
	fadd s6, s0, s6
	ldr s7, [x9], #4
	fmul s7, s7, s3
	fsqrt s16, s6
	fmul s16, s6, s16
	fdiv s7, s7, s16
	ldr s16, [x11], #4
	fcmp s6, #0.0
	fcsel s6, s4, s7, eq
	fmul s17, s17, s6
	fmul s5, s5, s6
	ldr s6, [x10]
	fmul s7, s16, s17
	fsub s6, s6, s7
	fmul s7, s16, s5
	ldr s16, [x8]
	fsub s7, s16, s7
	str s6, [x10], #4
	ldr s6, [x13]
	fadd s6, s6, s17
	str s6, [x13], #4
	str s7, [x8], #4
	ldr s6, [x12]
	fadd s5, s6, s5
	str s5, [x12], #4
	subs x14, x14, #1
	b.ne LBB73_7
LBB73_8:
	ldp q0, q1, [sp, #48]
	stp q0, q1, [x0]
	ldp q0, q1, [sp, #80]
	stp q0, q1, [x0, #32]
	ldp q0, q1, [sp, #112]
	stp q0, q1, [x0, #64]
	ldp q0, q1, [sp, #144]
	stp q0, q1, [x0, #96]
	ldp x29, x30, [sp, #320]
	ldp x20, x19, [sp, #304]
	ldp x22, x21, [sp, #288]
	ldp x24, x23, [sp, #272]
	ldp x26, x25, [sp, #256]
	ldp x28, x27, [sp, #240]
	ldp d9, d8, [sp, #224]
	ldp d11, d10, [sp, #208]
	ldp d13, d12, [sp, #192]
	ldp d15, d14, [sp, #176]
	add sp, sp, #336
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
