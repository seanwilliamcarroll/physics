<swarm::flock::Flock>::step_sorted:
Lfunc_begin2066:
	.cfi_startproc
	sub sp, sp, #496
	.cfi_def_cfa_offset 496
	stp d15, d14, [sp, #336]
	stp d13, d12, [sp, #352]
	stp d11, d10, [sp, #368]
	stp d9, d8, [sp, #384]
	stp x28, x27, [sp, #400]
	stp x26, x25, [sp, #416]
	stp x24, x23, [sp, #432]
	stp x22, x21, [sp, #448]
	stp x20, x19, [sp, #464]
	stp x29, x30, [sp, #480]
	add x29, sp, #480
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
	mov x19, x0
	ldr x8, [x0, #304]
	stur x8, [x29, #-168]
	ldr w8, [x0, #312]
	stur w8, [x29, #-160]
	ldr s9, [x0, #316]
	ldp x1, x2, [x0, #8]
	ldp x3, x4, [x0, #32]
	add x8, x0, #264
	ldr d3, [x0, #288]
	mov w9, #981467136
	fmov s0, w9
	fmul s1, s0, s3
	fminnm s2, s9, s9
	fmaxnm s1, s2, s1
	mov s2, v3[1]
	str s2, [sp, #60]
	fmul.s s0, s0, v3[1]
	fmaxnm s0, s1, s0
	mov w9, #8192
	movk w9, #16256, lsl #16
	fmov s1, w9
	fmul s0, s0, s1
	fmov s1, #1.00000000
	fdiv s0, s1, s0
	str s0, [x0, #280]
	str q3, [sp, #64]
	fmul.2s v0, v3, v0[0]
	frintp.2s v0, v0
	fcvtl v1.2d, v0.2s
	fcmge.2s v2, v0, #0.0
	movi.2s v3, #90, lsl #24
	fcmgt.2s v0, v3, v0
	and.8b v0, v2, v0
	sshll.2d v0, v0, #0
	fcvtzu.2d v1, v1
	mov w9, #1
	dup.2d v2, x9
	cmhi.2d v2, v1, v2
	and.16b v1, v1, v2
	mvn.16b v2, v2
	sub.2d v1, v1, v2
	and.16b v1, v1, v0
	mvn.16b v0, v0
	sub.2d v0, v1, v0
	str q0, [x8]
	add x0, x0, #192
	bl <swarm::grid::Grid>::fill
	mov x20, #0
	ldp x21, x8, [x19, #248]
	ldp x23, x24, [x19, #8]
	str xzr, [x19, #112]
	add x22, x21, x8, lsl #2
	mov x25, x21
	b LBB2066_2
LBB2066_1:
	ldr x8, [x19, #104]
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #112]
LBB2066_2:
	cmp x25, x22
	b.eq LBB2066_5
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_2
	ldr s10, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_6
	b LBB2066_8
LBB2066_5:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_8
LBB2066_6:
	ldr x8, [x19, #96]
	cmp x20, x8
	b.ne LBB2066_1
	add x0, x19, #96
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_1
LBB2066_8:
	mov x20, #0
	ldp x23, x24, [x19, #32]
	mov x25, x21
	str xzr, [x19, #136]
	b LBB2066_10
LBB2066_9:
	ldr x8, [x19, #128]
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #136]
LBB2066_10:
	cmp x25, x22
	b.eq LBB2066_13
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_10
	ldr s10, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_14
	b LBB2066_16
LBB2066_13:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_16
LBB2066_14:
	ldr x8, [x19, #120]
	cmp x20, x8
	b.ne LBB2066_9
	add x0, x19, #120
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_9
LBB2066_16:
	mov x20, #0
	ldp x23, x24, [x19, #56]
	mov x25, x21
	str xzr, [x19, #160]
	b LBB2066_18
LBB2066_17:
	ldr x8, [x19, #152]
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #160]
LBB2066_18:
	cmp x25, x22
	b.eq LBB2066_21
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_18
	ldr s10, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_22
	b LBB2066_24
LBB2066_21:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_24
LBB2066_22:
	ldr x8, [x19, #144]
	cmp x20, x8
	b.ne LBB2066_17
	add x0, x19, #144
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_17
LBB2066_24:
	mov x20, #0
	ldp x23, x24, [x19, #80]
	str xzr, [x19, #184]
	b LBB2066_26
LBB2066_25:
	ldr x8, [x19, #176]
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #184]
LBB2066_26:
	cmp x21, x22
	b.eq LBB2066_29
	ldr w8, [x21], #4
	cmp x24, x8
	b.ls LBB2066_26
	ldr s10, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_30
	b LBB2066_32
LBB2066_29:
	mov w8, #0
	mov x21, x22
	cmp w8, #1
	b.ne LBB2066_32
LBB2066_30:
	ldr x8, [x19, #168]
	cmp x20, x8
	b.ne LBB2066_25
	add x0, x19, #168
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_25
LBB2066_32:
	ldp x9, x8, [x19, #8]
	str x9, [sp, #32]
	ldp q0, q3, [x19]
	ldp q1, q2, [x19, #96]
	ldr x13, [x19, #112]
	stp q1, q2, [x19]
	stp q0, q3, [x19, #96]
	ldp x11, x9, [x19, #32]
	ldp q0, q1, [x19, #128]
	str x11, [x19, #128]
	ldr x10, [x19, #56]
	ldur q2, [x19, #40]
	stur q2, [x19, #136]
	stp q0, q1, [x19, #32]
	stp x10, x11, [sp, #16]
	str x10, [x19, #152]
	ldr q0, [x19, #160]
	ldr q1, [x19, #64]
	ldr x10, [x19, #64]
	str q0, [x19, #64]
	str q1, [x19, #160]
	ldr x12, [x19, #176]
	ldp x14, x11, [x19, #80]
	stp x12, x20, [x19, #80]
	str x14, [sp, #8]
	stp x14, x11, [x19, #176]
	cbz x13, LBB2066_96
	mov x20, #0
	cmp x9, x8
	csel x8, x9, x8, lo
	ldr s0, [x19, #320]
	fmul s0, s0, s0
	fmul s1, s9, s9
	cmp x10, x8
	csel x8, x10, x8, lo
	str q1, [sp, #128]
	dup.4s v1, v1[0]
	str q0, [sp, #224]
	dup.4s v0, v0[0]
	cmp x11, x8
	csel x8, x11, x8, lo
	stp x8, x13, [sp, #40]
	mov w27, #4
	stp q0, q1, [sp, #144]
	b LBB2066_36
LBB2066_34:
	ldr x13, [sp, #48]
LBB2066_35:
	add x20, x20, #1
	cmp x20, x13
	b.eq LBB2066_96
LBB2066_36:
	ldr x8, [x19, #16]
	cmp x20, x8
	b.hs LBB2066_35
	ldr x9, [x19, #40]
	cmp x20, x9
	b.hs LBB2066_35
	ldr x10, [x19, #64]
	ldr x11, [x19, #88]
	cmp x20, x10
	ccmp x20, x11, #2, lo
	b.hs LBB2066_35
	ldr x12, [x19, #8]
	ldr s5, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s6, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s2, [x15, x20, lsl #2]
	ldr s3, [x14, x20, lsl #2]
	stp s5, s6, [x29, #-232]
	stp s2, s3, [x29, #-224]
	stp xzr, xzr, [x29, #-216]
	stur wzr, [x29, #-192]
	stur xzr, [x29, #-200]
	ldr s2, [x19, #280]
	fmul s3, s5, s2
	movi.2d v0, #0000000000000000
	fmaxnm s3, s3, s0
	frintm s3, s3
	fcvt d4, s3
	fcvtzu x17, d4
	ldp x16, x0, [x19, #264]
	subs x1, x16, #1
	csel x2, xzr, x1, lo
	cmp x2, x17
	csel x17, x2, x17, lo
	movi.2s v1, #90, lsl #24
	fcmp s3, s1
	csel x3, x17, xzr, lt
	fmul s2, s6, s2
	fmaxnm s2, s2, s0
	frintm s2, s2
	fcvt d3, s2
	fcvtzu x17, d3
	subs x0, x0, #1
	csel x1, xzr, x0, lo
	cmp x1, x17
	csel x17, x1, x17, lo
	fcmp s2, s1
	csel x4, x17, xzr, lt
	subs x17, x3, #1
	csel x17, xzr, x17, lo
	subs x0, x4, #1
	csel x0, xzr, x0, lo
	add x5, x4, #1
	cmp x1, x5
	csinc x1, x1, x4, lo
	cmp x0, x1
	b.hi LBB2066_94
	add x4, x3, #1
	cmp x2, x4
	csinc x2, x2, x3, lo
	add x2, x2, #1
	str x2, [sp, #200]
	ldp x2, x3, [x19, #200]
	str x2, [sp, #120]
	mov.16b v0, v5
	mov.s v0[1], v6[0]
	str q0, [sp, #176]
	stp q6, q5, [sp, #80]
	dup.4s v3, v6[0]
	dup.4s v5, v5[0]
	movi d4, #0000000000000000
	movi.2d v2, #0000000000000000
	movi d7, #0000000000000000
	movi d16, #0000000000000000
	b LBB2066_43
LBB2066_41:
	mov.s v20[1], v22[0]
	mov.s v18[1], v21[0]
	mov.s v17[1], v19[0]
	mov.16b v4, v20
	mov.16b v7, v18
	mov.16b v16, v17
LBB2066_42:
	cmp x0, x1
	add x0, x0, #1
	b.eq LBB2066_93
LBB2066_43:
	mul x2, x16, x0
	ldr x4, [sp, #200]
	add x4, x4, x2
	add x2, x2, x17
	cmp x2, x3
	ccmp x4, x3, #2, lo
	b.lo LBB2066_45
	mov x4, #0
	mov x2, #0
	b LBB2066_46
LBB2066_45:
	ldr x5, [sp, #120]
	ldr w2, [x5, x2, lsl #2]
	ldr w4, [x5, x4, lsl #2]
LBB2066_46:
	cmp x4, x11
	cset w5, hi
	cmp x4, x2
	csinc w7, w5, wzr, hs
	cmp x4, x10
	cset w5, hi
	cmp x4, x2
	csinc w22, w5, wzr, hs
	cmp x4, x9
	cset w5, hi
	cmp x4, x2
	csinc w21, w5, wzr, hs
	cmp x4, x8
	cset w5, hi
	subs x4, x4, x2
	csinc w5, w5, wzr, hs
	lsl x2, x2, #2
	add x6, x12, x2
	cmp w5, #0
	csel x5, xzr, x4, ne
	csel x6, x27, x6, ne
	add x23, x13, x2
	cmp w21, #0
	csel x30, xzr, x4, ne
	csel x21, x27, x23, ne
	lsr x28, x30, #3
	add x24, x15, x2
	cmp w22, #0
	csel x23, xzr, x4, ne
	csel x26, x27, x24, ne
	lsr x22, x23, #3
	add x2, x14, x2
	cmp w7, #0
	csel x24, xzr, x4, ne
	csel x25, x27, x2, ne
	lsr x2, x24, #3
	lsr x4, x5, #3
	cmp x28, x4
	csel x4, x28, x4, lo
	cmp x22, x4
	csel x4, x22, x4, lo
	cmp x2, x4
	csel x7, x2, x4, lo
	cbz x7, LBB2066_50
	str q4, [sp, #208]
	mov.16b v6, v2
	movi.2d v17, #0000000000000000
	add x28, x6, #16
	movi.2d v19, #0000000000000000
	add x22, x25, #16
	movi.2d v18, #0000000000000000
	add x2, x21, #16
	movi.2d v20, #0000000000000000
	add x4, x26, #16
	movi.2d v21, #0000000000000000
	movi.2d v22, #0000000000000000
	movi.2d v23, #0000000000000000
	movi.2d v25, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v26, #0000000000000000
	movi.2d v27, #0000000000000000
	movi.2d v29, #0000000000000000
	movi.2d v28, #0000000000000000
	movi.2d v30, #0000000000000000
	ldp q2, q0, [sp, #144]
	fmov.4s v4, #1.00000000
LBB2066_48:
	ldp q31, q12, [x28, #-16]
	fsub.4s v13, v5, v31
	ldp q14, q15, [x2, #-16]
	fsub.4s v8, v3, v14
	fmul.4s v9, v13, v13
	fmul.4s v10, v8, v8
	fadd.4s v9, v9, v10
	fcmgt.4s v10, v2, v9
	and.16b v10, v10, v4
	fcmge.4s v11, v9, v2
	fcmgt.4s v1, v0, v9
	fcmgt.4s v9, v9, #0.0
	mvn.16b v9, v9
	orn.16b v9, v9, v11
	orn.16b v1, v9, v1
	bic.16b v1, v4, v1
	fmul.4s v9, v13, v10
	fadd.4s v20, v20, v9
	fmul.4s v8, v8, v10
	fadd.4s v19, v19, v8
	fmul.4s v31, v31, v1
	fadd.4s v30, v30, v31
	fmul.4s v31, v14, v1
	fadd.4s v29, v31, v29
	ldp q31, q8, [x4, #-16]
	fmul.4s v31, v31, v1
	fadd.4s v26, v31, v26
	ldp q31, q9, [x22, #-16]
	fmul.4s v31, v31, v1
	fadd.4s v25, v31, v25
	fadd.4s v22, v1, v22
	fsub.4s v1, v5, v12
	fsub.4s v31, v3, v15
	fmul.4s v10, v1, v1
	fmul.4s v11, v31, v31
	fadd.4s v10, v10, v11
	fcmgt.4s v11, v2, v10
	and.16b v11, v11, v4
	fcmge.4s v13, v10, v2
	fcmgt.4s v14, v0, v10
	fcmgt.4s v10, v10, #0.0
	mvn.16b v10, v10
	orn.16b v10, v10, v13
	orn.16b v10, v10, v14
	bic.16b v10, v4, v10
	fmul.4s v1, v1, v11
	fadd.4s v18, v18, v1
	fmul.4s v1, v31, v11
	fadd.4s v17, v17, v1
	fmul.4s v1, v12, v10
	fadd.4s v28, v28, v1
	fmul.4s v1, v15, v10
	fadd.4s v27, v1, v27
	fmul.4s v1, v8, v10
	fadd.4s v24, v1, v24
	fmul.4s v1, v9, v10
	fadd.4s v23, v1, v23
	add x28, x28, #32
	fadd.4s v21, v10, v21
	add x22, x22, #32
	add x2, x2, #32
	add x4, x4, #32
	subs x7, x7, #1
	b.ne LBB2066_48
	faddp.2s v1, v30, v29
	mov d29, v29[1]
	mov d30, v30[1]
	zip1.2s v31, v30, v29
	fadd.2s v1, v1, v31
	zip2.2s v29, v30, v29
	fadd.2s v1, v1, v29
	zip1.2s v29, v28, v27
	fadd.2s v1, v1, v29
	zip2.2s v29, v28, v27
	fadd.2s v1, v1, v29
	mov d27, v27[1]
	mov d28, v28[1]
	zip1.2s v29, v28, v27
	fadd.2s v1, v1, v29
	zip2.2s v27, v28, v27
	fadd.2s v27, v1, v27
	faddp.2s v1, v26, v25
	mov d25, v25[1]
	mov d26, v26[1]
	zip1.2s v28, v26, v25
	fadd.2s v1, v1, v28
	zip2.2s v25, v26, v25
	fadd.2s v1, v1, v25
	zip1.2s v25, v24, v23
	fadd.2s v1, v1, v25
	zip2.2s v25, v24, v23
	fadd.2s v1, v1, v25
	mov d23, v23[1]
	mov d24, v24[1]
	zip1.2s v25, v24, v23
	fadd.2s v1, v1, v25
	zip2.2s v23, v24, v23
	fadd.2s v23, v1, v23
	dup.4s v1, v22[1]
	fadd.4s v1, v22, v1
	dup.4s v24, v22[2]
	fadd.4s v1, v1, v24
	dup.4s v22, v22[3]
	fadd.4s v1, v1, v22
	fadd.4s v1, v1, v21
	dup.4s v22, v21[1]
	fadd.4s v1, v1, v22
	dup.4s v22, v21[2]
	fadd.4s v1, v1, v22
	dup.4s v21, v21[3]
	fadd.4s v21, v1, v21
	faddp.2s v1, v20, v19
	mov d19, v19[1]
	mov d20, v20[1]
	zip1.2s v22, v20, v19
	fadd.2s v1, v1, v22
	zip2.2s v19, v20, v19
	fadd.2s v1, v1, v19
	zip1.2s v19, v18, v17
	fadd.2s v1, v1, v19
	zip2.2s v19, v18, v17
	fadd.2s v1, v1, v19
	mov d17, v17[1]
	mov d18, v18[1]
	zip1.2s v19, v18, v17
	fadd.2s v1, v1, v19
	zip2.2s v17, v18, v17
	fadd.2s v17, v1, v17
	mov.16b v2, v6
	ldr q4, [sp, #208]
	b LBB2066_51
LBB2066_50:
	movi d27, #0000000000000000
	movi.2d v21, #0000000000000000
	movi d23, #0000000000000000
	movi d17, #0000000000000000
LBB2066_51:
	and x2, x30, #0x7
	and x4, x23, #0x7
	and x7, x24, #0x7
	fadd.2s v4, v4, v27
	fadd.2s v7, v7, v23
	fadd s2, s2, s21
	fadd.2s v16, v16, v17
	and x22, x5, #0x7
	cmp x2, x22
	csel x2, x2, x22, lo
	cmp x4, x2
	csel x2, x4, x2, lo
	cmp x7, x2
	csel x7, x7, x2, lo
	cbz x7, LBB2066_42
	and x2, x5, #0xfffffff8
	add x28, x6, x2, lsl #2
	and x2, x30, #0xfffffff8
	add x30, x21, x2, lsl #2
	and x2, x23, #0xfffffff8
	add x5, x26, x2, lsl #2
	and x2, x24, #0xfffffff8
	add x6, x25, x2, lsl #2
	ldr s17, [x28]
	ld1.s { v17 }[1], [x30]
	ldr q0, [sp, #176]
	fsub.2s v18, v0, v17
	fmul.2s v1, v18, v18
	faddp.2s s19, v1
	ldr q1, [sp, #224]
	fcmp s19, s1
	b.pl LBB2066_54
	fadd.2s v16, v16, v18
	b LBB2066_57
LBB2066_54:
	ldr q1, [sp, #128]
	fcmp s19, s1
	b.pl LBB2066_57
	fcmp s19, #0.0
	b.le LBB2066_57
	ldr s1, [x5]
	ldr s18, [x6]
	fadd.2s v4, v4, v17
	mov.s v1[1], v18[0]
	fadd.2s v7, v7, v1
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_57:
	cmp x7, #1
	b.eq LBB2066_42
	add x2, x30, #4
	ldr s17, [x28, #4]
	ld1.s { v17 }[1], [x2]
	ldr q0, [sp, #176]
	fsub.2s v18, v0, v17
	fmul.2s v1, v18, v18
	faddp.2s s19, v1
	ldr q1, [sp, #224]
	fcmp s19, s1
	b.pl LBB2066_60
	fadd.2s v16, v16, v18
	b LBB2066_63
LBB2066_60:
	ldr q1, [sp, #128]
	fcmp s19, s1
	b.pl LBB2066_63
	fcmp s19, #0.0
	b.le LBB2066_63
	ldr s1, [x5, #4]
	ldr s18, [x6, #4]
	fadd.2s v4, v4, v17
	mov.s v1[1], v18[0]
	fadd.2s v7, v7, v1
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_63:
	cmp x7, #2
	b.eq LBB2066_42
	ldr s23, [x28, #8]
	ldr s24, [x30, #8]
	ldp q0, q1, [sp, #80]
	fsub s17, s1, s23
	fsub s18, s0, s24
	fmul s1, s17, s17
	fmul s19, s18, s18
	fadd s25, s1, s19
	ldr q1, [sp, #224]
	fcmp s25, s1
	b.pl LBB2066_66
	fadd s17, s16, s17
	mov s1, v16[1]
	fadd s19, s1, s18
	mov s21, v7[1]
	mov s22, v4[1]
	mov.16b v18, v7
	mov.16b v20, v4
	b LBB2066_69
LBB2066_66:
	mov.16b v17, v16
	mov s19, v16[1]
	mov.16b v18, v7
	mov s21, v7[1]
	mov.16b v20, v4
	mov s22, v4[1]
	ldr q1, [sp, #128]
	fcmp s25, s1
	b.pl LBB2066_69
	fcmp s25, #0.0
	b.le LBB2066_69
	ldr s1, [x5, #8]
	ldr s6, [x6, #8]
	fadd s20, s20, s23
	fadd s22, s22, s24
	fadd s18, s18, s1
	fadd s21, s21, s6
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_69:
	cmp x7, #3
	b.eq LBB2066_41
	ldr s6, [x28, #12]
	ldr s7, [x30, #12]
	ldp q0, q1, [sp, #80]
	fsub s16, s1, s6
	fsub s23, s0, s7
	fmul s1, s16, s16
	fmul s24, s23, s23
	fadd s24, s1, s24
	ldr q1, [sp, #224]
	fcmp s24, s1
	b.pl LBB2066_72
	fadd s17, s17, s16
	fadd s19, s19, s23
	b LBB2066_75
LBB2066_72:
	ldr q1, [sp, #128]
	fcmp s24, s1
	b.pl LBB2066_75
	fcmp s24, #0.0
	b.le LBB2066_75
	ldr s1, [x5, #12]
	ldr s16, [x6, #12]
	fadd s20, s20, s6
	fadd s22, s22, s7
	fadd s18, s18, s1
	fadd s21, s21, s16
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_75:
	cmp x7, #4
	b.eq LBB2066_41
	ldr s6, [x28, #16]
	ldr s7, [x30, #16]
	ldp q0, q1, [sp, #80]
	fsub s16, s1, s6
	fsub s23, s0, s7
	fmul s1, s16, s16
	fmul s24, s23, s23
	fadd s24, s1, s24
	ldr q1, [sp, #224]
	fcmp s24, s1
	b.pl LBB2066_78
	fadd s17, s17, s16
	fadd s19, s19, s23
	b LBB2066_81
LBB2066_78:
	ldr q1, [sp, #128]
	fcmp s24, s1
	b.pl LBB2066_81
	fcmp s24, #0.0
	b.le LBB2066_81
	ldr s1, [x5, #16]
	ldr s16, [x6, #16]
	fadd s20, s20, s6
	fadd s22, s22, s7
	fadd s18, s18, s1
	fadd s21, s21, s16
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_81:
	cmp x7, #5
	b.eq LBB2066_41
	ldr s6, [x28, #20]
	ldr s7, [x30, #20]
	ldp q0, q1, [sp, #80]
	fsub s16, s1, s6
	fsub s23, s0, s7
	fmul s1, s16, s16
	fmul s24, s23, s23
	fadd s24, s1, s24
	ldr q1, [sp, #224]
	fcmp s24, s1
	b.pl LBB2066_84
	fadd s17, s17, s16
	fadd s19, s19, s23
	b LBB2066_87
LBB2066_84:
	ldr q1, [sp, #128]
	fcmp s24, s1
	b.pl LBB2066_87
	fcmp s24, #0.0
	b.le LBB2066_87
	ldr s1, [x5, #20]
	ldr s16, [x6, #20]
	fadd s20, s20, s6
	fadd s22, s22, s7
	fadd s18, s18, s1
	fadd s21, s21, s16
	fmov s0, #1.00000000
	fadd s2, s2, s0
LBB2066_87:
	mov.16b v4, v20
	mov.s v4[1], v22[0]
	mov.16b v7, v18
	mov.s v7[1], v21[0]
	mov.16b v16, v17
	mov.s v16[1], v19[0]
	cmp x7, #6
	b.eq LBB2066_42
	ldr s23, [x28, #24]
	ldr s24, [x30, #24]
	ldp q0, q1, [sp, #80]
	fsub s25, s1, s23
	fsub s26, s0, s24
	fmul s1, s25, s25
	fmul s27, s26, s26
	fadd s27, s1, s27
	ldr q1, [sp, #224]
	fcmp s27, s1
	b.pl LBB2066_90
	fadd s16, s17, s25
	fadd s1, s19, s26
	mov.s v16[1], v1[0]
	b LBB2066_42
LBB2066_90:
	ldr q1, [sp, #128]
	fcmp s27, s1
	b.pl LBB2066_42
	fcmp s27, #0.0
	b.le LBB2066_42
	ldr s1, [x5, #24]
	ldr s17, [x6, #24]
	fadd s4, s20, s23
	fadd s19, s22, s24
	fadd s7, s18, s1
	fadd s1, s21, s17
	fmov s0, #1.00000000
	fadd s2, s2, s0
	mov.s v4[1], v19[0]
	mov.s v7[1], v1[0]
	b LBB2066_42
LBB2066_93:
	stp d4, d7, [x29, #-216]
	stur s2, [x29, #-200]
	stur d16, [x29, #-196]
LBB2066_94:
	sub x0, x29, #184
	add x1, x19, #316
	sub x2, x29, #168
	sub x3, x29, #232
	sub x4, x29, #216
	ldr q0, [sp, #64]
	ldr s1, [sp, #60]
	bl swarm::rules::finish
	ldr x8, [sp, #40]
	cmp x20, x8
	b.hs LBB2066_34
	ldp s0, s1, [x29, #-184]
	ldp x8, x9, [sp, #24]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	ldp s0, s1, [x29, #-176]
	ldp x8, x9, [sp, #8]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	b LBB2066_34
LBB2066_96:
	.cfi_def_cfa wsp, 496
	ldp x29, x30, [sp, #480]
	ldp x20, x19, [sp, #464]
	ldp x22, x21, [sp, #448]
	ldp x24, x23, [sp, #432]
	ldp x26, x25, [sp, #416]
	ldp x28, x27, [sp, #400]
	ldp d9, d8, [sp, #384]
	ldp d11, d10, [sp, #368]
	ldp d13, d12, [sp, #352]
	ldp d15, d14, [sp, #336]
	add sp, sp, #496
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
