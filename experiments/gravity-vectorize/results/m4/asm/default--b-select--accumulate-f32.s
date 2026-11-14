<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
Lfunc_begin148:
	.cfi_startproc
	sub sp, sp, #192
	.cfi_def_cfa_offset 192
	stp d15, d14, [sp, #48]
	stp d13, d12, [sp, #64]
	stp d11, d10, [sp, #80]
	stp d9, d8, [sp, #96]
	stp x26, x25, [sp, #112]
	stp x24, x23, [sp, #128]
	stp x22, x21, [sp, #144]
	stp x20, x19, [sp, #160]
	stp x29, x30, [sp, #176]
	add x29, sp, #176
	.cfi_def_cfa w29, 16
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
	.cfi_offset b8, -88
	.cfi_offset b9, -96
	.cfi_offset b10, -104
	.cfi_offset b11, -112
	.cfi_offset b12, -120
	.cfi_offset b13, -128
	.cfi_offset b14, -136
	.cfi_offset b15, -144
	.cfi_remember_state
	ldr x8, [x1, #16]
	ldr x9, [x1, #64]
	cmp x9, x8
	csel x21, x9, x8, lo
	lsl x20, x21, #4
	lsr x8, x21, #60
	mov x9, #-3
	movk x9, #32767, lsl #48
	cmp x20, x9
	ccmp x8, #0, #0, lo
	b.eq LBB148_2
	bl alloc::raw_vec::capacity_overflow
LBB148_2:
	mov x19, x0
	ldr x22, [x1, #8]
	ldr x23, [x1, #56]
	cbz x20, LBB148_5
	mov x0, x20
	mov x24, x3
	mov x25, x2
	bl _malloc
	mov x2, x25
	mov x3, x24
	mov x8, x21
	cbz x0, LBB148_36
	cbnz x21, LBB148_6
	b LBB148_11
LBB148_5:
	mov x8, #0
	mov w0, #4
	cbz x21, LBB148_11
LBB148_6:
	cmp x21, #8
	b.lo LBB148_8
	add x9, x0, x20
	add x10, x22, x21, lsl #3
	add x11, x23, x21, lsl #2
	cmp x0, x10
	ccmp x22, x9, #2, lo
	cset w10, lo
	cmp x0, x11
	ccmp x23, x9, #2, lo
	csinc w9, w10, wzr, hs
	tbz w9, #0, LBB148_33
LBB148_8:
	mov x9, #0
LBB148_9:
	sub x10, x21, x9
	add x11, x0, x9, lsl #4
	add x11, x11, #8
	add x12, x23, x9, lsl #2
	add x9, x22, x9, lsl #3
	fmov s0, #1.00000000
	movi.2d v1, #0000000000000000
LBB148_10:
	ldr s2, [x12], #4
	fdiv s3, s0, s2
	fcmp s2, #0.0
	ldr d4, [x9], #8
	stur d4, [x11, #-8]
	fcsel s3, s1, s3, eq
	stp s3, s2, [x11], #16
	subs x10, x10, #1
	b.ne LBB148_10
LBB148_11:
	cbz x3, LBB148_30
	mov x9, #0
	ldp s29, s28, [x19]
	dup.4s v2, v28[0]
	sub x10, x21, #1
	add x11, x2, #72
	add x12, x0, #144
	sub x13, x3, #1
	mov x14, #2305843009213693951
	movi.2d v30, #0000000000000000
	mov x15, x21
	mov x16, x3
	mov x17, x0
	str q28, [sp, #16]
	str s29, [sp, #12]
	b LBB148_15
LBB148_13:
	ldr q28, [sp, #16]
	ldr s29, [sp, #12]
	movi.2d v30, #0000000000000000
LBB148_14:
	stp s7, s16, [x2], #8
	add x17, x17, #16
	add x9, x9, #1
	sub x10, x10, #1
	sub x13, x13, #1
	add x11, x11, #8
	add x12, x12, #16
	cbz x16, LBB148_30
LBB148_15:
	cmp x13, x10
	csel x1, x13, x10, lo
	and x4, x13, #0x1fffffffffffffff
	cmp x10, x4
	csel x6, x10, x4, lo
	mvn x4, x9
	sub x5, x9, x3
	bic x5, x14, x5
	add x4, x21, x4
	cmp x4, x5
	csel x4, x4, x5, lo
	cbz x15, LBB148_30
	sub x15, x15, #1
	sub x16, x16, #1
	ldp s7, s16, [x2]
	and x5, x16, #0x1fffffffffffffff
	cmp x15, x5
	csel x5, x15, x5, lo
	cbz x5, LBB148_14
	ldr d31, [x17]
	ldp s6, s5, [x17, #8]
	fmul s6, s6, s29
	cmp x4, #3
	b.hi LBB148_19
	mov x5, #0
	b LBB148_28
LBB148_19:
	cmp x4, #16
	b.hs LBB148_21
	mov x5, #0
	b LBB148_25
LBB148_21:
	and x19, x6, #0x1ffffffffffffff0
	and x7, x4, #0xc
	and x5, x4, #0x1ffffffffffffff0
	dup.4s v17, v31[0]
	str q31, [sp, #32]
	dup.4s v18, v31[1]
	mov x20, x12
	mov x22, x11
LBB148_22:
	sub x23, x20, #128
	ld4.4s { v8, v9, v10, v11 }, [x23]
	sub x23, x20, #64
	ld4.4s { v20, v21, v22, v23 }, [x23]
	mov x23, x20
	ld4.4s { v12, v13, v14, v15 }, [x23], #64
	fsub.4s v19, v8, v17
	fsub.4s v29, v12, v17
	fsub.4s v30, v9, v18
	fsub.4s v31, v13, v18
	fmul.4s v28, v19, v19
	fmul.4s v1, v30, v30
	fmul.4s v3, v29, v29
	ld4.4s { v24, v25, v26, v27 }, [x23]
	fmul.4s v0, v31, v31
	fadd.4s v1, v28, v1
	fadd.4s v0, v3, v0
	fadd.4s v1, v1, v2
	fmul.4s v3, v10, v6[0]
	fadd.4s v0, v0, v2
	fmul.4s v28, v14, v6[0]
	fsqrt.4s v4, v1
	fmul.4s v4, v1, v4
	fdiv.4s v3, v3, v4
	fsqrt.4s v4, v0
	fmul.4s v4, v0, v4
	fdiv.4s v4, v28, v4
	fcmeq.4s v1, v1, #0.0
	bic.16b v1, v3, v1
	fcmeq.4s v0, v0, #0.0
	bic.16b v0, v4, v0
	fmul.4s v28, v19, v1
	fmul.4s v30, v30, v1
	fmul.4s v19, v29, v0
	fmul.4s v29, v31, v0
	fmul.4s v0, v11, v28
	mov x23, x22
	fmul.4s v1, v11, v30
	ld2.4s { v3, v4 }, [x23], #32
	fmul.4s v31, v15, v19
	fmul.4s v8, v15, v29
	fsub.4s v9, v20, v17
	fsub.4s v10, v3, v31
	fsub.4s v11, v4, v8
	fsub.4s v3, v21, v18
	fmul.4s v4, v9, v9
	fmul.4s v31, v3, v3
	fadd.4s v4, v4, v31
	st2.4s { v10, v11 }, [x22]
	fadd.4s v4, v4, v2
	fmul.4s v31, v22, v6[0]
	fsqrt.4s v8, v4
	fmul.4s v8, v4, v8
	fdiv.4s v31, v31, v8
	fcmeq.4s v4, v4, #0.0
	bic.16b v4, v31, v4
	sub x24, x22, #64
	sub x25, x22, #32
	fmul.4s v31, v9, v4
	fmul.4s v3, v3, v4
	fmul.4s v4, v23, v31
	fmul.4s v20, v23, v3
	ld2.4s { v21, v22 }, [x24]
	fsub.4s v8, v21, v0
	fsub.4s v9, v22, v1
	ld2.4s { v0, v1 }, [x25]
	fsub.4s v21, v0, v4
	fsub.4s v22, v1, v20
	fsub.4s v0, v24, v17
	st2.4s { v8, v9 }, [x24]
	fsub.4s v1, v25, v18
	fmul.4s v4, v0, v0
	st2.4s { v21, v22 }, [x25]
	fmul.4s v20, v1, v1
	fadd.4s v4, v4, v20
	fadd.4s v4, v4, v2
	fmul.4s v20, v26, v6[0]
	fsqrt.4s v21, v4
	fmul.4s v21, v4, v21
	fdiv.4s v20, v20, v21
	fcmeq.4s v4, v4, #0.0
	bic.16b v4, v20, v4
	fmul.4s v0, v0, v4
	fmul.4s v1, v1, v4
	fmul.4s v4, v27, v0
	fmul.4s v20, v27, v1
	ld2.4s { v21, v22 }, [x23]
	fsub.4s v23, v21, v4
	fsub.4s v24, v22, v20
	st2.4s { v23, v24 }, [x23]
	fmul.4s v4, v30, v5[0]
	mov s20, v4[1]
	fadd s16, s16, s4
	fadd s16, s16, s20
	mov s20, v4[2]
	fadd s16, s16, s20
	mov s4, v4[3]
	fmul.4s v3, v3, v5[0]
	fadd s4, s16, s4
	mov s16, v3[1]
	fadd s4, s4, s3
	fadd s4, s4, s16
	mov s16, v3[2]
	fadd s4, s4, s16
	mov s3, v3[3]
	fmul.4s v16, v29, v5[0]
	fadd s3, s4, s3
	mov s4, v16[1]
	fadd s3, s3, s16
	fadd s3, s3, s4
	mov s4, v16[2]
	fadd s3, s3, s4
	fmul.4s v4, v28, v5[0]
	mov s16, v16[3]
	fmul.4s v1, v1, v5[0]
	fadd s3, s3, s16
	mov s16, v1[1]
	fadd s3, s3, s1
	fadd s3, s3, s16
	mov s16, v1[2]
	fadd s3, s3, s16
	mov s16, v4[1]
	fadd s7, s7, s4
	fadd s7, s7, s16
	mov s16, v4[2]
	fadd s7, s7, s16
	mov s4, v4[3]
	fmul.4s v16, v31, v5[0]
	fadd s4, s7, s4
	mov s7, v16[1]
	fadd s4, s4, s16
	fadd s4, s4, s7
	mov s7, v16[2]
	fadd s4, s4, s7
	mov s7, v16[3]
	fadd s4, s4, s7
	fmul.4s v7, v19, v5[0]
	mov s1, v1[3]
	fadd s16, s3, s1
	mov s1, v7[1]
	fadd s3, s4, s7
	fadd s1, s3, s1
	mov s3, v7[2]
	fadd s1, s1, s3
	mov s3, v7[3]
	fmul.4s v0, v0, v5[0]
	fadd s1, s1, s3
	mov s3, v0[1]
	fadd s1, s1, s0
	fadd s1, s1, s3
	mov s3, v0[2]
	fadd s1, s1, s3
	mov s0, v0[3]
	fadd s7, s1, s0
	add x22, x22, #128
	add x20, x20, #256
	subs x19, x19, #16
	b.ne LBB148_22
	cmp x4, x5
	b.eq LBB148_13
	ldp q28, q31, [sp, #16]
	ldr s29, [sp, #12]
	movi.2d v30, #0000000000000000
	cbz x7, LBB148_28
LBB148_25:
	and x6, x6, #0x1ffffffffffffffc
	sub x6, x5, x6
	lsl x7, x5, #4
	lsl x19, x5, #3
	and x5, x4, #0x1ffffffffffffffc
	dup.4s v17, v31[0]
	dup.4s v18, v31[1]
	add x7, x7, #16
	add x19, x19, #8
LBB148_26:
	add x20, x17, x7
	ld4.4s { v19, v20, v21, v22 }, [x20]
	add x20, x2, x19
	fsub.4s v0, v19, v17
	fsub.4s v1, v20, v18
	fmul.4s v3, v0, v0
	fmul.4s v4, v1, v1
	fadd.4s v3, v3, v4
	fadd.4s v3, v3, v2
	fmul.4s v4, v21, v6[0]
	fsqrt.4s v23, v3
	fmul.4s v23, v3, v23
	fdiv.4s v4, v4, v23
	fcmeq.4s v3, v3, #0.0
	bic.16b v3, v4, v3
	fmul.4s v0, v0, v3
	fmul.4s v1, v1, v3
	fmul.4s v3, v0, v5[0]
	mov s4, v3[3]
	mov s23, v3[2]
	mov s24, v3[1]
	fmul.4s v25, v1, v5[0]
	mov s26, v25[3]
	mov s27, v25[2]
	fmul.4s v0, v22, v0
	fmul.4s v1, v22, v1
	ld2.4s { v19, v20 }, [x20]
	fsub.4s v21, v19, v0
	fsub.4s v22, v20, v1
	st2.4s { v21, v22 }, [x20]
	mov s0, v25[1]
	fadd s1, s16, s25
	fadd s0, s1, s0
	fadd s0, s0, s27
	fadd s16, s0, s26
	fadd s0, s7, s3
	fadd s0, s0, s24
	fadd s0, s0, s23
	fadd s7, s0, s4
	add x7, x7, #64
	add x19, x19, #32
	adds x6, x6, #4
	b.ne LBB148_26
	cmp x4, x5
	b.eq LBB148_14
LBB148_28:
	lsl x4, x5, #4
	lsl x6, x5, #3
	add x6, x6, #8
	sub x1, x1, x5
LBB148_29:
	add x5, x17, x4
	ldp s0, s1, [x5, #24]
	fmul s0, s0, s6
	ldr d3, [x5, #16]
	fsub.2s v3, v3, v31
	fmul.2s v4, v3, v3
	faddp.2s s4, v4
	fadd s4, s4, s28
	fsqrt s17, s4
	fmul s17, s4, s17
	fdiv s0, s0, s17
	fcmp s4, #0.0
	fcsel s0, s30, s0, eq
	fmul.2s v0, v3, v0[0]
	fmul s3, s5, s0
	fmul.s s4, s5, v0[1]
	fadd s7, s7, s3
	fadd s16, s16, s4
	fmul.2s v0, v0, v1[0]
	ldr d1, [x2, x6]
	fsub.2s v0, v1, v0
	str d0, [x2, x6]
	add x4, x4, #16
	add x6, x6, #8
	subs x1, x1, #1
	b.ne LBB148_29
	b LBB148_14
LBB148_30:
	cbz x8, LBB148_32
	.cfi_def_cfa wsp, 192
	ldp x29, x30, [sp, #176]
	ldp x20, x19, [sp, #160]
	ldp x22, x21, [sp, #144]
	ldp x24, x23, [sp, #128]
	ldp x26, x25, [sp, #112]
	ldp d9, d8, [sp, #96]
	ldp d11, d10, [sp, #80]
	ldp d13, d12, [sp, #64]
	ldp d15, d14, [sp, #48]
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
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	b _free
LBB148_32:
	.cfi_restore_state
	.cfi_remember_state
	.cfi_def_cfa wsp, 192
	ldp x29, x30, [sp, #176]
	ldp x20, x19, [sp, #160]
	ldp x22, x21, [sp, #144]
	ldp x24, x23, [sp, #128]
	ldp x26, x25, [sp, #112]
	ldp d9, d8, [sp, #96]
	ldp d11, d10, [sp, #80]
	ldp d13, d12, [sp, #64]
	ldp d15, d14, [sp, #48]
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
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
	ret
LBB148_33:
	.cfi_restore_state
	and x9, x21, #0xffffffffffffffc
	fmov.4s v0, #1.00000000
	mov x10, x22
	mov x11, x23
	mov x12, x0
	and x13, x21, #0xffffffffffffffc
LBB148_34:
	ldp q2, q1, [x10], #32
	ldr q6, [x11], #16
	fdiv.4s v7, v0, v6
	fcmeq.4s v16, v6, #0.0
	bic.16b v5, v7, v16
	uzp2.4s v4, v2, v1
	uzp1.4s v3, v2, v1
	st4.4s { v3, v4, v5, v6 }, [x12], #64
	subs x13, x13, #4
	b.ne LBB148_34
	cmp x21, x9
	b.eq LBB148_11
	b LBB148_9
LBB148_36:
	mov w0, #4
	mov x1, x20
	bl alloc::raw_vec::handle_error
