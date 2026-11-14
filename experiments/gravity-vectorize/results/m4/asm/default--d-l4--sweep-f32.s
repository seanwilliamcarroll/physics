engine::force::sweep::<f32>:
Lfunc_begin73:
	.cfi_startproc
	sub sp, sp, #304
	.cfi_def_cfa_offset 304
	stp d15, d14, [sp, #160]
	stp d13, d12, [sp, #176]
	stp d11, d10, [sp, #192]
	stp d9, d8, [sp, #208]
	stp x28, x27, [sp, #224]
	stp x26, x25, [sp, #240]
	stp x24, x23, [sp, #256]
	stp x22, x21, [sp, #272]
	stp x20, x19, [sp, #288]
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
	mov.16b v25, v0
	ldp x8, x10, [sp, #336]
	ldp x9, x12, [sp, #320]
	ldp x11, x13, [sp, #304]
	and x14, x5, #0x3
	lsr x17, x5, #2
	and x15, x7, #0x3
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
	cbz x17, LBB73_3
	ldr d0, [x1]
	ldr s20, [x1, #8]
	cmp x17, #4
	b.hs LBB73_4
	mov x19, #0
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	b LBB73_7
LBB73_3:
	movi.2d v1, #0000000000000000
	movi.2d v2, #0000000000000000
	b LBB73_9
LBB73_4:
	dup.4s v1, v0[0]
	stp q0, q25, [sp]
	dup.4s v0, v0[1]
	stp q0, q1, [sp, #48]
	and x19, x17, #0x3fffffffffffffc
	movi.2d v1, #0000000000000000
	dup.4s v0, v25[0]
	str q0, [sp, #32]
	mov x20, x2
	movi.2d v21, #0000000000000000
	mov x21, x4
	mov x22, x6
	mov x23, x11
	mov x24, x9
	mov x25, x8
	and x26, x17, #0x3fffffffffffffc
	movi.2d v2, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v7, #0000000000000000
	movi.2d v16, #0000000000000000
	movi.2d v4, #0000000000000000
	movi.2d v0, #0000000000000000
LBB73_5:
	stp q16, q7, [sp, #80]
	stp q5, q4, [sp, #112]
	str q0, [sp, #144]
	ld4.4s { v22, v23, v24, v25 }, [x20], #64
	ld4.4s { v26, v27, v28, v29 }, [x21], #64
	ld4.4s { v8, v9, v10, v11 }, [x22], #64
	ld4.4s { v12, v13, v14, v15 }, [x24]
	ldp q3, q7, [sp, #48]
	fsub.4s v0, v22, v7
	fsub.4s v5, v23, v7
	fsub.4s v6, v24, v7
	fsub.4s v4, v25, v7
	fsub.4s v24, v26, v3
	fsub.4s v30, v27, v3
	fsub.4s v31, v28, v3
	fsub.4s v29, v29, v3
	ld4.4s { v25, v26, v27, v28 }, [x23], #64
	fmul.4s v22, v0, v0
	fmul.4s v23, v24, v24
	fadd.4s v22, v22, v23
	fmul.4s v23, v8, v20[0]
	fmul.4s v3, v9, v20[0]
	fmul.4s v7, v10, v20[0]
	fmul.4s v8, v11, v20[0]
	fmul.4s v9, v5, v5
	fmul.4s v10, v30, v30
	fadd.4s v9, v9, v10
	fmul.4s v10, v6, v6
	fmul.4s v11, v31, v31
	fadd.4s v10, v10, v11
	fmul.4s v11, v4, v4
	fmul.4s v16, v29, v29
	fadd.4s v16, v11, v16
	ldr q17, [sp, #32]
	fadd.4s v22, v17, v22
	fsqrt.4s v11, v22
	fmul.4s v11, v22, v11
	fdiv.4s v23, v23, v11
	fadd.4s v9, v17, v9
	fadd.4s v10, v17, v10
	fadd.4s v16, v17, v16
	fcmeq.4s v22, v22, #0.0
	bic.16b v11, v23, v22
	fsqrt.4s v22, v9
	fmul.4s v22, v9, v22
	fdiv.4s v3, v3, v22
	fcmeq.4s v22, v9, #0.0
	bic.16b v3, v3, v22
	fsqrt.4s v22, v10
	fmul.4s v22, v10, v22
	fdiv.4s v7, v7, v22
	fcmeq.4s v22, v10, #0.0
	fsqrt.4s v23, v16
	bic.16b v7, v7, v22
	fmul.4s v22, v16, v23
	fdiv.4s v22, v8, v22
	fcmeq.4s v16, v16, #0.0
	bic.16b v16, v22, v16
	fmul.4s v22, v0, v11
	fmul.4s v23, v5, v3
	fmul.4s v0, v22, v25
	fmul.4s v5, v23, v26
	mov.16b v9, v20
	fsub.4s v17, v12, v0
	fsub.4s v18, v13, v5
	fmul.4s v8, v6, v7
	fmul.4s v0, v8, v27
	fsub.4s v19, v14, v0
	fmul.4s v0, v4, v16
	fmul.4s v4, v0, v28
	fsub.4s v20, v15, v4
	fmul.4s v24, v24, v11
	st4.4s { v17, v18, v19, v20 }, [x24], #64
	ld4.4s { v17, v18, v19, v20 }, [x25]
	fmul.4s v3, v30, v3
	fmul.4s v4, v31, v7
	fmul.4s v5, v29, v16
	fmul.4s v6, v24, v25
	fmul.4s v7, v3, v26
	fmul.4s v16, v4, v27
	fmul.4s v25, v5, v28
	fsub.4s v26, v17, v6
	fsub.4s v27, v18, v7
	fsub.4s v28, v19, v16
	fsub.4s v29, v20, v25
	mov.16b v20, v9
	st4.4s { v26, v27, v28, v29 }, [x25], #64
	mov s6, v5[1]
	fadd s1, s1, s5
	fadd s1, s1, s6
	mov s6, v5[2]
	fadd s1, s1, s6
	mov s5, v5[3]
	fadd s1, s1, s5
	mov s5, v4[1]
	fadd s6, s21, s4
	fadd s5, s6, s5
	mov s6, v4[2]
	fadd s5, s5, s6
	mov s4, v4[3]
	fadd s21, s5, s4
	mov s4, v3[1]
	fadd s2, s2, s3
	fadd s2, s2, s4
	mov s4, v3[2]
	fadd s2, s2, s4
	mov s3, v3[3]
	fadd s2, s2, s3
	mov s3, v0[1]
	ldp q5, q4, [sp, #96]
	fadd s4, s4, s0
	fadd s3, s4, s3
	mov s4, v0[2]
	fadd s3, s3, s4
	mov s4, v8[1]
	fadd s5, s5, s8
	fadd s4, s5, s4
	mov s5, v8[2]
	fadd s4, s4, s5
	mov s0, v0[3]
	fadd s5, s3, s0
	mov s0, v8[3]
	fadd s7, s4, s0
	mov s0, v23[1]
	ldr q3, [sp, #80]
	fadd s3, s3, s23
	fadd s0, s3, s0
	mov s3, v23[2]
	fadd s0, s0, s3
	mov s3, v22[1]
	ldr q4, [sp, #128]
	fadd s4, s4, s22
	fadd s3, s4, s3
	mov s4, v23[3]
	fadd s16, s0, s4
	mov s0, v22[2]
	fadd s0, s3, s0
	mov s3, v22[3]
	fadd s4, s0, s3
	ldr q0, [sp, #144]
	fadd s0, s0, s24
	mov s3, v24[1]
	fadd s0, s0, s3
	mov s3, v24[2]
	fadd s0, s0, s3
	mov s3, v24[3]
	fadd s0, s0, s3
	subs x26, x26, #4
	b.ne LBB73_5
	mov.s v2[1], v16[0]
	mov.s v2[2], v21[0]
	mov.s v2[3], v7[0]
	mov.s v1[1], v5[0]
	mov.s v1[2], v0[0]
	mov.s v1[3], v4[0]
	cmp x17, x19
	ldp q0, q25, [sp]
	b.eq LBB73_9
LBB73_7:
	mov x20, #0
	dup.4s v5, v0[0]
	dup.4s v6, v0[1]
	dup.4s v4, v0[0]
	lsl x26, x19, #4
	add x21, x8, x26
	add x22, x9, x26
	add x23, x11, x26
	dup.4s v0, v25[0]
	add x24, x6, x26
	add x25, x4, x26
	add x26, x2, x26
	sub x17, x17, x19
LBB73_8:
	lsl x19, x20, #4
	ldr q3, [x26, x19]
	ldr q7, [x25, x19]
	fsub.4s v16, v3, v5
	fsub.4s v3, v3, v4
	fsub.4s v7, v7, v6
	fmul.4s v3, v3, v3
	fmul.4s v17, v7, v7
	fadd.4s v3, v3, v17
	fadd.4s v3, v0, v3
	ldr q17, [x24, x19]
	fmul.4s v17, v17, v20[0]
	fsqrt.4s v18, v3
	fmul.4s v18, v3, v18
	fdiv.4s v17, v17, v18
	fcmeq.4s v3, v3, #0.0
	bic.16b v3, v17, v3
	fmul.4s v16, v16, v3
	fmul.4s v3, v7, v3
	zip1.4s v7, v3, v16
	trn2.4s v17, v3, v16
	ext.16b v17, v17, v7, #8
	zip2.4s v18, v3, v16
	ext.16b v7, v7, v18, #8
	ldr q18, [x22, x19]
	ldr q19, [x23, x19]
	fmul.4s v16, v16, v19
	fsub.4s v16, v18, v16
	ldr q18, [x21, x19]
	fmul.4s v3, v3, v19
	fsub.4s v3, v18, v3
	str q16, [x22, x19]
	str q3, [x21, x19]
	fadd.4s v2, v7, v2
	fadd.4s v1, v17, v1
	add x20, x20, #1
	cmp x17, x20
	b.ne LBB73_8
LBB73_9:
	and x17, x3, #0x3
	cmp x14, x17
	csel x14, x14, x17, lo
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
	mov s3, v1[2]
	mov s5, v1[3]
	mov s6, v2[1]
	mov s4, v2[2]
	mov s7, v2[3]
	cbz x14, LBB73_13
	and x15, x3, #0x1ffffffffffffffc
	and x16, x5, #0x1ffffffffffffffc
	and x17, x7, #0x1ffffffffffffffc
	and x3, x13, #0x1ffffffffffffffc
	and x5, x12, #0xffffffffffffffc
	and x7, x10, #0xffffffffffffffc
	add x10, x2, x15, lsl #2
	add x12, x4, x16, lsl #2
	add x13, x6, x17, lsl #2
	add x11, x11, x3, lsl #2
	add x9, x9, x5, lsl #2
	add x8, x8, x7, lsl #2
	ldp s17, s18, [x1]
	ldr s16, [x1, #8]
	ldr s0, [x10]
	ldr s19, [x12]
	ldr s20, [x13]
	ldr s21, [x11]
	fsub s22, s0, s17
	fsub s19, s19, s18
	fmul s0, s22, s22
	fmul s23, s19, s19
	fadd s0, s0, s23
	fadd s0, s25, s0
	fmul s20, s20, s16
	fsqrt s23, s0
	fmul s23, s0, s23
	fdiv s20, s20, s23
	fcmp s0, #0.0
	movi.2d v0, #0000000000000000
	fcsel s20, s0, s20, eq
	fmul s22, s22, s20
	fmul s19, s19, s20
	fmul s20, s21, s22
	ldr s23, [x9]
	fsub s20, s23, s20
	str s20, [x9]
	fmul s20, s21, s19
	ldr s21, [x8]
	fsub s20, s21, s20
	str s20, [x8]
	fadd s5, s5, s22
	fadd s3, s3, s19
	cmp x14, #1
	b.eq LBB73_13
	ldr s19, [x10, #4]
	ldr s20, [x12, #4]
	ldr s21, [x13, #4]
	ldr s22, [x11, #4]
	fsub s19, s19, s17
	fsub s20, s20, s18
	fmul s23, s19, s19
	fmul s24, s20, s20
	fadd s23, s23, s24
	fadd s23, s25, s23
	fmul s21, s21, s16
	fsqrt s24, s23
	fmul s24, s23, s24
	fdiv s21, s21, s24
	fcmp s23, #0.0
	fcsel s0, s0, s21, eq
	fmul s19, s19, s0
	fmul s0, s20, s0
	fmul s20, s22, s19
	ldr s21, [x9, #4]
	fsub s20, s21, s20
	str s20, [x9, #4]
	fmul s20, s22, s0
	ldr s21, [x8, #4]
	fsub s20, s21, s20
	str s20, [x8, #4]
	fadd s6, s6, s19
	fadd s2, s2, s0
	cmp x14, #2
	b.eq LBB73_13
	ldr s0, [x10, #8]
	ldr s19, [x12, #8]
	ldr s20, [x13, #8]
	ldr s21, [x11, #8]
	fsub s0, s0, s17
	fsub s17, s19, s18
	fmul s18, s0, s0
	fmul s19, s17, s17
	fadd s18, s18, s19
	fadd s18, s25, s18
	fmul s16, s20, s16
	fsqrt s19, s18
	fmul s19, s18, s19
	fdiv s16, s16, s19
	fcmp s18, #0.0
	movi.2d v18, #0000000000000000
	fcsel s16, s18, s16, eq
	fmul s0, s0, s16
	fmul s16, s17, s16
	fmul s17, s21, s0
	ldr s18, [x9, #8]
	fsub s17, s18, s17
	str s17, [x9, #8]
	fmul s17, s21, s16
	ldr s18, [x8, #8]
	fsub s17, s18, s17
	str s17, [x8, #8]
	fadd s7, s7, s0
	fadd s4, s4, s16
LBB73_13:
	stp s5, s6, [x0]
	str s7, [x0, #8]
	add x8, x0, #12
	st1.s { v1 }[1], [x8]
	stp s3, s2, [x0, #16]
	stp s4, s1, [x0, #24]
	ldp x20, x19, [sp, #288]
	ldp x22, x21, [sp, #272]
	ldp x24, x23, [sp, #256]
	ldp x26, x25, [sp, #240]
	ldp x28, x27, [sp, #224]
	ldp d9, d8, [sp, #208]
	ldp d11, d10, [sp, #192]
	ldp d13, d12, [sp, #176]
	ldp d15, d14, [sp, #160]
	add sp, sp, #304
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
