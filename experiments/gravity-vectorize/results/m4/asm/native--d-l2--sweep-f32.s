engine::force::sweep::<f32>:
Lfunc_begin77:
	.cfi_startproc
	stp x26, x25, [sp, #-64]!
	.cfi_def_cfa_offset 64
	stp x24, x23, [sp, #16]
	stp x22, x21, [sp, #32]
	stp x20, x19, [sp, #48]
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	.cfi_offset w23, -40
	.cfi_offset w24, -48
	.cfi_offset w25, -56
	.cfi_offset w26, -64
	ldp x8, x11, [sp, #96]
	ldp x9, x12, [sp, #80]
	ldp x10, x13, [sp, #64]
	and x14, x5, #0x1
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
	cbz x17, LBB77_3
	ldr d2, [x1]
	ldr s3, [x1, #8]
	movi.2d v1, #0000000000000000
	mov x19, x2
	mov x20, x4
	movi.2d v4, #0000000000000000
	mov x21, x6
	mov x22, x10
	mov x23, x9
	mov x24, x8
LBB77_2:
	ldr x25, [x19], #8
	ldr x26, [x21], #8
	fmov d5, x25
	lsr x25, x26, #32
	fmov s6, w26
	fmov s7, w25
	fmul s6, s3, s6
	fmul s7, s3, s7
	ldr x25, [x22], #8
	lsr x26, x25, #32
	fmov s16, w25
	fmov s17, w26
	ldp s18, s19, [x23]
	ldp s20, s21, [x24]
	ld1.d { v5 }[1], [x20], #8
	xtn.2s v22, v1
	xtn.2s v23, v5
	shrn.2s v5, v5, #32
	fsub.2s v23, v23, v2
	fsub.2s v5, v5, v2
	fmul.2s v24, v23, v23
	faddp.2s s24, v24
	fadd s24, s0, s24
	fmul.2s v25, v5, v5
	faddp.2s s25, v25
	fadd s25, s0, s25
	fsqrt s26, s24
	fmul s26, s24, s26
	fdiv s6, s6, s26
	fsqrt s26, s25
	fmul s26, s25, s26
	fdiv s7, s7, s26
	fcmp s24, #0.0
	fcsel s6, s4, s6, eq
	fcmp s25, #0.0
	fcsel s7, s4, s7, eq
	fmul.2s v6, v23, v6[0]
	fmul.2s v5, v5, v7[0]
	fmul s7, s16, s6
	fmul s23, s17, s5
	fsub s7, s18, s7
	fsub s18, s19, s23
	fmov w25, s7
	fmov w26, s18
	orr x25, x25, x26, lsl #32
	str x25, [x23], #8
	fmul.s s7, s16, v6[1]
	fmul.s s16, s17, v5[1]
	fsub s7, s20, s7
	fsub s16, s21, s16
	fmov w25, s7
	fmov w26, s16
	orr x25, x25, x26, lsl #32
	str x25, [x24], #8
	shrn.2s v1, v1, #32
	fadd.2s v6, v6, v22
	fadd.2s v1, v5, v1
	shll.2d v1, v1, #32
	ushll.2d v5, v6, #0
	orr.16b v1, v1, v5
	subs x17, x17, #1
	b.ne LBB77_2
	b LBB77_4
LBB77_3:
	movi.2d v1, #0000000000000000
LBB77_4:
	mov s2, v1[2]
	and x17, x3, #0x1
	cmp x14, x17
	csel x14, x14, x17, lo
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
	cbz x14, LBB77_6
	and x14, x3, #0x1ffffffffffffffe
	and x15, x5, #0x1ffffffffffffffe
	and x16, x7, #0x1ffffffffffffffe
	and x13, x13, #0x1ffffffffffffffe
	and x12, x12, #0xffffffffffffffe
	and x11, x11, #0xffffffffffffffe
	ldp s3, s4, [x1]
	ldr s5, [x2, x14, lsl #2]
	ldr s6, [x4, x15, lsl #2]
	ldr s7, [x6, x16, lsl #2]
	ldr s16, [x10, x13, lsl #2]
	ldr s17, [x1, #8]
	fsub s3, s5, s3
	fsub s4, s6, s4
	fmul s5, s3, s3
	fmul s6, s4, s4
	fadd s5, s5, s6
	fadd s0, s0, s5
	fmul s5, s7, s17
	fsqrt s6, s0
	fmul s6, s0, s6
	fdiv s5, s5, s6
	fcmp s0, #0.0
	movi.2d v0, #0000000000000000
	fcsel s0, s0, s5, eq
	fmul s3, s3, s0
	fmul s4, s4, s0
	ldr s0, [x9, x12, lsl #2]
	fmul s5, s16, s3
	fsub s0, s0, s5
	str s0, [x9, x12, lsl #2]
	ldr s0, [x8, x11, lsl #2]
	fmul s5, s16, s4
	fsub s0, s0, s5
	str s0, [x8, x11, lsl #2]
	fadd s0, s3, s1
	fadd s2, s4, s2
	b LBB77_7
LBB77_6:
	mov.16b v0, v1
LBB77_7:
	str s0, [x0]
	add x8, x0, #4
	st1.s { v1 }[1], [x8]
	mov s0, v1[3]
	stp s2, s0, [x0, #8]
	ldp x20, x19, [sp, #48]
	ldp x22, x21, [sp, #32]
	ldp x24, x23, [sp, #16]
	ldp x26, x25, [sp], #64
	.cfi_def_cfa_offset 0
	.cfi_restore w19
	.cfi_restore w20
	.cfi_restore w21
	.cfi_restore w22
	.cfi_restore w23
	.cfi_restore w24
	.cfi_restore w25
	.cfi_restore w26
	ret
