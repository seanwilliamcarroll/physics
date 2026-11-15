engine::force::sweep::<f32>:
Lfunc_begin73:
	.cfi_startproc
	stp d15, d14, [sp, #-64]!
	.cfi_def_cfa_offset 64
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	.cfi_offset b8, -8
	.cfi_offset b9, -16
	.cfi_offset b10, -24
	.cfi_offset b11, -32
	.cfi_offset b12, -40
	.cfi_offset b13, -48
	.cfi_offset b14, -56
	.cfi_offset b15, -64
	ldr x8, [sp, #80]
	ldr x9, [sp, #96]
	ldr x10, [sp, #64]
	cmp x4, x2
	csel x11, x4, x2, lo
	cmp x6, x11
	csel x11, x6, x11, lo
	cmp x10, x11
	csel x10, x10, x11, lo
	cmp x9, x8
	csel x8, x9, x8, lo
	cmp x8, x10
	csel x8, x8, x10, lo
	cbz x8, LBB73_3
	ldr x10, [sp, #88]
	ldr x9, [sp, #72]
	ldp s1, s2, [x0]
	movi.2d v3, #0000000000000000
	ldr s4, [x0, #8]
	cmp x8, #8
	b.hs LBB73_4
	mov x11, #0
	movi.2d v5, #0000000000000000
	movi.2d v6, #0000000000000000
	b LBB73_7
LBB73_3:
	mov x0, #0
	b LBB73_10
LBB73_4:
	dup.4s v7, v1[0]
	dup.4s v16, v2[0]
	and x11, x8, #0xffffffffffffff8
	add x12, x1, #16
	dup.4s v17, v0[0]
	add x13, x10, #16
	add x14, x3, #16
	add x15, x9, #16
	add x16, x5, #16
	add x17, x7, #16
	movi.2d v5, #0000000000000000
	and x0, x8, #0xffffffffffffff8
	movi.2d v6, #0000000000000000
LBB73_5:
	ldp q18, q19, [x12, #-16]
	fsub.4s v18, v18, v7
	fsub.4s v19, v19, v7
	ldp q20, q21, [x14, #-16]
	fsub.4s v20, v20, v16
	fsub.4s v21, v21, v16
	fmul.4s v22, v18, v18
	fmul.4s v23, v19, v19
	fmul.4s v24, v20, v20
	fmul.4s v25, v21, v21
	fadd.4s v22, v22, v24
	fadd.4s v23, v23, v25
	fadd.4s v22, v17, v22
	fadd.4s v23, v17, v23
	ldp q24, q25, [x16, #-16]
	fmul.4s v24, v24, v4[0]
	fmul.4s v25, v25, v4[0]
	fsqrt.4s v26, v22
	fsqrt.4s v27, v23
	fmul.4s v26, v22, v26
	fmul.4s v27, v23, v27
	fdiv.4s v24, v24, v26
	fdiv.4s v25, v25, v27
	fcmeq.4s v22, v22, #0.0
	bic.16b v22, v24, v22
	fcmeq.4s v23, v23, #0.0
	bic.16b v23, v25, v23
	fmul.4s v18, v18, v22
	mov s24, v18[3]
	mov s25, v18[2]
	mov s26, v18[1]
	fmul.4s v19, v19, v23
	mov s27, v19[3]
	mov s28, v19[2]
	mov s29, v19[1]
	fmul.4s v20, v20, v22
	mov s22, v20[3]
	mov s30, v20[2]
	mov s31, v20[1]
	fmul.4s v21, v21, v23
	mov s23, v21[3]
	mov s8, v21[2]
	mov s9, v21[1]
	ldp q10, q11, [x15, #-16]
	ldp q12, q13, [x17, #-16]
	fmul.4s v14, v12, v18
	fmul.4s v15, v13, v19
	fsub.4s v10, v10, v14
	fsub.4s v11, v11, v15
	stp q10, q11, [x15, #-16]
	ldp q10, q11, [x13, #-16]
	fmul.4s v12, v12, v20
	fmul.4s v13, v13, v21
	fsub.4s v10, v10, v12
	fsub.4s v11, v11, v13
	stp q10, q11, [x13, #-16]
	fadd s5, s5, s18
	fadd s5, s5, s26
	fadd s5, s5, s25
	fadd s5, s5, s24
	fadd s5, s5, s19
	fadd s5, s5, s29
	fadd s5, s5, s28
	fadd s5, s5, s27
	fadd s6, s6, s20
	fadd s6, s6, s31
	fadd s6, s6, s30
	fadd s6, s6, s22
	fadd s6, s6, s21
	fadd s6, s6, s9
	fadd s6, s6, s8
	add x12, x12, #32
	add x13, x13, #32
	add x14, x14, #32
	fadd s6, s6, s23
	add x15, x15, #32
	add x16, x16, #32
	add x17, x17, #32
	subs x0, x0, #8
	b.ne LBB73_5
	cmp x8, x11
	b.eq LBB73_9
LBB73_7:
	mov x12, #0
	lsl x16, x11, #2
	add x10, x10, x16
	add x9, x9, x16
	add x13, x7, x16
	add x14, x5, x16
	add x15, x3, x16
	add x16, x1, x16
	sub x8, x8, x11
LBB73_8:
	ldr s7, [x16, x12, lsl #2]
	fsub s7, s7, s1
	ldr s16, [x15, x12, lsl #2]
	fsub s16, s16, s2
	fmul s17, s7, s7
	fmul s18, s16, s16
	fadd s17, s17, s18
	fadd s17, s0, s17
	ldr s18, [x14, x12, lsl #2]
	fmul s18, s18, s4
	fsqrt s19, s17
	fmul s19, s17, s19
	fdiv s18, s18, s19
	fcmp s17, #0.0
	fcsel s17, s3, s18, eq
	fmul s7, s7, s17
	fmul s16, s16, s17
	ldr s17, [x9, x12, lsl #2]
	ldr s18, [x13, x12, lsl #2]
	fmul s19, s18, s7
	fsub s17, s17, s19
	str s17, [x9, x12, lsl #2]
	ldr s17, [x10, x12, lsl #2]
	fmul s18, s18, s16
	fsub s17, s17, s18
	str s17, [x10, x12, lsl #2]
	fadd s5, s5, s7
	fadd s6, s16, s6
	add x12, x12, #1
	cmp x8, x12
	b.ne LBB73_8
LBB73_9:
	fmov w8, s5
	fmov w9, s6
	orr x0, x8, x9, lsl #32
LBB73_10:
	ldp d9, d8, [sp, #48]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
