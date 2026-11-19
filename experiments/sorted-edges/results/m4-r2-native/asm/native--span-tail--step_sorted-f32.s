<swarm::flock::Flock>::step_sorted:
Lfunc_begin2066:
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
	add x29, sp, #144
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
	sub sp, sp, #432
	mov x19, x0
	ldr x8, [x0, #304]
	stur x8, [x29, #-168]
	ldr w8, [x0, #312]
	stur w8, [x29, #-160]
	ldr s0, [x0, #316]
	ldp x1, x2, [x0, #8]
	ldp x3, x4, [x0, #32]
	add x8, x0, #264
	ldr d3, [x0, #288]
	mov w9, #981467136
	fmov s1, w9
	fmul s2, s1, s3
	fminnm s0, s0, s0
	fmaxnm s0, s0, s2
	mov s9, v3[1]
	fmul.s s1, s1, v3[1]
	fmaxnm s0, s0, s1
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
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #112]
LBB2066_2:
	cmp x25, x22
	b.eq LBB2066_5
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_2
	ldr s8, [x23, x8, lsl #2]
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
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #136]
LBB2066_10:
	cmp x25, x22
	b.eq LBB2066_13
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_10
	ldr s8, [x23, x8, lsl #2]
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
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #160]
LBB2066_18:
	cmp x25, x22
	b.eq LBB2066_21
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_18
	ldr s8, [x23, x8, lsl #2]
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
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #184]
LBB2066_26:
	cmp x21, x22
	b.eq LBB2066_29
	ldr w8, [x21], #4
	cmp x24, x8
	b.ls LBB2066_26
	ldr s8, [x23, x8, lsl #2]
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
	str x9, [sp, #40]
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
	stp x10, x11, [sp, #24]
	str x10, [x19, #152]
	ldr q0, [x19, #160]
	ldr q1, [x19, #64]
	ldr x10, [x19, #64]
	str q0, [x19, #64]
	str q1, [x19, #160]
	ldr x12, [x19, #176]
	ldp x14, x11, [x19, #80]
	stp x12, x20, [x19, #80]
	str x14, [sp, #16]
	stp x14, x11, [x19, #176]
	cbz x13, LBB2066_94
	mov x20, #0
	cmp x9, x8
	csel x8, x9, x8, lo
	ldr s0, [x19, #316]
	ldr s1, [x19, #320]
	fmul s1, s1, s1
	fmul s0, s0, s0
	cmp x10, x8
	csel x8, x10, x8, lo
	str q0, [sp, #160]
	dup.4s v30, v0[0]
	dup.4s v31, v1[0]
	cmp x11, x8
	csel x8, x11, x8, lo
	str x8, [sp, #48]
	movi.2s v8, #90, lsl #24
	mov w27, #4
	str q1, [sp, #80]
	stur q30, [x29, #-256]
	str q31, [sp, #304]
	str s9, [sp, #12]
	str x13, [sp, #56]
	b LBB2066_36
LBB2066_34:
	ldr x13, [sp, #56]
	ldur q30, [x29, #-256]
	ldr q31, [sp, #304]
LBB2066_35:
	add x20, x20, #1
	cmp x20, x13
	b.eq LBB2066_94
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
	ldr s4, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s5, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s0, [x15, x20, lsl #2]
	ldr s1, [x14, x20, lsl #2]
	stp s4, s5, [x29, #-240]
	stp s0, s1, [x29, #-232]
	stp xzr, xzr, [x29, #-224]
	stur wzr, [x29, #-200]
	stur xzr, [x29, #-208]
	ldr s1, [x19, #280]
	fmul s2, s4, s1
	movi.2d v0, #0000000000000000
	fmaxnm s2, s2, s0
	frintm s2, s2
	fcvt d3, s2
	fcvtzu x0, d3
	ldp x16, x1, [x19, #264]
	subs x17, x16, #1
	csel x17, xzr, x17, lo
	cmp x17, x0
	csel x0, x17, x0, lo
	fcmp s2, s8
	csel x2, x0, xzr, lt
	fmul s1, s5, s1
	fmaxnm s1, s1, s0
	frintm s1, s1
	fcvt d2, s1
	fcvtzu x0, d2
	subs x1, x1, #1
	csel x3, xzr, x1, lo
	cmp x3, x0
	csel x0, x3, x0, lo
	fcmp s1, s8
	csel x0, x0, xzr, lt
	subs x1, x2, #1
	csel x1, xzr, x1, lo
	str x1, [sp, #272]
	subs x1, x0, #1
	csel x1, xzr, x1, lo
	add x4, x0, #1
	cmp x3, x4
	csinc x0, x3, x0, lo
	cmp x1, x0
	b.ls LBB2066_41
	movi d2, #0000000000000000
	movi.2d v4, #0000000000000000
	b LBB2066_92
LBB2066_41:
	stp q5, q4, [sp, #208]
	dup.4s v25, v5[0]
	dup.4s v26, v4[0]
	movi d0, #0000000000000000
	str d0, [sp, #248]
	add x3, x2, #1
	movi.2d v0, #0000000000000000
	str s0, [sp, #300]
	cmp x17, x3
	movi.2d v2, #0000000000000000
	csinc x17, x17, x2, lo
	movi.2d v0, #0000000000000000
	movi.2d v24, #0000000000000000
	cmp x10, x11
	csel x2, x10, x11, lo
	movi.2d v6, #0000000000000000
	add x17, x17, #1
	str x17, [sp, #264]
	movi.2d v5, #0000000000000000
	movi.2d v7, #0000000000000000
	cmp x9, x2
	csel x17, x9, x2, lo
	str x17, [sp, #152]
	movi.2d v16, #0000000000000000
	movi.2d v20, #0000000000000000
	ldp x17, x4, [x19, #200]
	str x17, [sp, #120]
	movi.2d v17, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v22, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v23, #0000000000000000
	movi.2d v1, #0000000000000000
	str s1, [sp, #296]
	str s1, [sp, #244]
	str s1, [sp, #256]
	str s1, [sp, #260]
	movi.2d v29, #0000000000000000
	movi.2d v15, #0000000000000000
	str s1, [sp, #292]
	str s1, [sp, #288]
	str s1, [sp, #284]
	movi d28, #0000000000000000
	str q25, [sp, #96]
	str q26, [sp, #128]
	b LBB2066_44
LBB2066_42:
	add x5, x12, x30, lsl #2
	lsl x2, x30, #2
	add x3, x13, x2
	add x17, x15, x2
	add x2, x14, x2
	sub x6, x6, x30
	subs x7, x6, x28
	movi.2d v30, #0000000000000000
	fmov s11, #1.00000000
	fcsel s3, s11, s30, eq
	cmp x7, #2
	ccmp x6, #1, #0, lo
	fcsel s1, s11, s30, hi
	cmp x7, #3
	ccmp x6, #2, #0, lo
	fcsel s27, s11, s30, hi
	cmp x7, #4
	ccmp x6, #3, #0, lo
	fcsel s8, s11, s30, hi
	cmp x7, #5
	ccmp x6, #4, #0, lo
	fcsel s4, s11, s30, hi
	cmp x7, #6
	ccmp x6, #5, #0, lo
	fcsel s9, s11, s30, hi
	cmp x7, #7
	ccmp x6, #6, #0, lo
	fcsel s10, s11, s30, hi
	cmp x7, #8
	ccmp x6, #7, #0, lo
	fcsel s11, s11, s30, hi
	mov.s v3[1], v1[0]
	mov.s v3[2], v27[0]
	mov.s v3[3], v8[0]
	mov.s v4[1], v9[0]
	mov.s v4[2], v10[0]
	mov.s v4[3], v11[0]
	ldp q11, q10, [x5]
	fsub.4s v1, v26, v10
	fmul.4s v27, v1, v1
	ldp q9, q8, [x3]
	fsub.4s v12, v25, v8
	fmul.4s v13, v12, v12
	fadd.4s v27, v27, v13
	fcmge.4s v13, v27, v31
	ldur q30, [x29, #-256]
	fcmgt.4s v30, v30, v27
	fcmgt.4s v31, v27, #0.0
	and.16b v30, v30, v31
	and.16b v30, v13, v30
	and.16b v30, v30, v4
	ldp q13, q31, [x2]
	fmul.4s v31, v31, v30
	fadd.4s v16, v31, v16
	ldp q14, q31, [x17]
	fmul.4s v31, v31, v30
	fadd.4s v17, v31, v17
	fmul.4s v31, v8, v30
	fadd.4s v18, v31, v18
	fadd.4s v5, v30, v5
	fmul.4s v30, v10, v30
	fadd.4s v19, v30, v19
	ldr q30, [sp, #304]
	fcmgt.4s v27, v30, v27
	and.16b v4, v27, v4
	fmul.4s v27, v12, v4
	fadd.4s v0, v27, v0
	fmul.4s v1, v1, v4
	fadd.4s v2, v1, v2
	fsub.4s v1, v26, v11
	fmul.4s v4, v1, v1
	fsub.4s v27, v25, v9
	fmul.4s v30, v27, v27
	fadd.4s v4, v4, v30
	ldur q30, [x29, #-256]
	fcmgt.4s v30, v30, v4
	fcmgt.4s v31, v4, #0.0
	and.16b v30, v30, v31
	ldr q31, [sp, #304]
	fcmge.4s v31, v4, v31
	and.16b v30, v31, v30
	and.16b v30, v30, v3
	fadd.4s v7, v30, v7
	fmul.4s v31, v13, v30
	fadd.4s v20, v31, v20
	fmul.4s v31, v14, v30
	fadd.4s v21, v31, v21
	fmul.4s v31, v9, v30
	fadd.4s v22, v31, v22
	ldr q31, [sp, #304]
	fmul.4s v30, v11, v30
	fadd.4s v23, v30, v23
	ldur q30, [x29, #-256]
	fcmgt.4s v4, v31, v4
	and.16b v3, v4, v3
	fmul.4s v4, v27, v3
	fadd.4s v24, v4, v24
	fmul.4s v1, v1, v3
	fadd.4s v6, v1, v6
LBB2066_43:
	cmp x1, x0
	add x1, x1, #1
	b.eq LBB2066_91
LBB2066_44:
	mul x17, x16, x1
	ldp x2, x3, [sp, #264]
	add x2, x2, x17
	add x17, x17, x3
	cmp x17, x4
	ccmp x2, x4, #2, lo
	b.lo LBB2066_46
	mov x6, #0
	mov x17, #0
	b LBB2066_47
LBB2066_46:
	ldr x3, [sp, #120]
	ldr w17, [x3, x17, lsl #2]
	ldr w6, [x3, x2, lsl #2]
LBB2066_47:
	cmp x6, x11
	cset w2, hi
	cmp x6, x17
	csinc w2, w2, wzr, hs
	cmp x6, x10
	cset w3, hi
	cmp x6, x17
	csinc w3, w3, wzr, hs
	cmp x6, x9
	cset w5, hi
	cmp x6, x17
	csinc w5, w5, wzr, hs
	cmp x6, x8
	cset w7, hi
	subs x22, x6, x17
	csinc w7, w7, wzr, hs
	lsl x17, x17, #2
	add x21, x12, x17
	cmp w7, #0
	csel x7, xzr, x22, ne
	csel x21, x27, x21, ne
	add x23, x13, x17
	cmp w5, #0
	csel x26, xzr, x22, ne
	csel x23, x27, x23, ne
	lsr x5, x26, #3
	add x25, x15, x17
	cmp w3, #0
	csel x24, xzr, x22, ne
	csel x25, x27, x25, ne
	lsr x28, x24, #3
	add x17, x14, x17
	cmp w2, #0
	csel x22, xzr, x22, ne
	csel x3, x27, x17, ne
	lsr x17, x22, #3
	lsr x2, x7, #3
	cmp x5, x2
	csel x2, x5, x2, lo
	cmp x28, x2
	csel x2, x28, x2, lo
	cmp x17, x2
	csel x28, x17, x2, lo
	cbz x28, LBB2066_50
	add x30, x21, #16
	add x2, x3, #16
	add x5, x23, #16
	add x17, x25, #16
	fmov.4s v14, #1.00000000
LBB2066_49:
	ldp q1, q3, [x30, #-16]
	fsub.4s v4, v26, v1
	ldp q10, q11, [x5, #-16]
	fsub.4s v27, v25, v10
	fmul.4s v12, v4, v4
	fmul.4s v13, v27, v27
	fadd.4s v12, v12, v13
	fcmgt.4s v13, v31, v12
	and.16b v13, v13, v14
	fcmge.4s v8, v12, v31
	fcmgt.4s v9, v30, v12
	fcmgt.4s v12, v12, #0.0
	mvn.16b v12, v12
	orn.16b v8, v12, v8
	orn.16b v8, v8, v9
	bic.16b v8, v14, v8
	fmul.4s v4, v4, v13
	fadd.4s v6, v6, v4
	fmul.4s v4, v27, v13
	fadd.4s v24, v24, v4
	fmul.4s v1, v1, v8
	fadd.4s v23, v23, v1
	fmul.4s v1, v10, v8
	fadd.4s v22, v1, v22
	ldp q1, q4, [x17, #-16]
	fmul.4s v1, v1, v8
	fadd.4s v21, v1, v21
	ldp q1, q27, [x2, #-16]
	fmul.4s v1, v1, v8
	fadd.4s v20, v1, v20
	fadd.4s v7, v8, v7
	fsub.4s v1, v26, v3
	fsub.4s v8, v25, v11
	fmul.4s v9, v1, v1
	fmul.4s v10, v8, v8
	fadd.4s v9, v9, v10
	fcmgt.4s v10, v31, v9
	and.16b v10, v10, v14
	fcmge.4s v12, v9, v31
	fcmgt.4s v13, v30, v9
	fcmgt.4s v9, v9, #0.0
	mvn.16b v9, v9
	orn.16b v9, v9, v12
	orn.16b v9, v9, v13
	bic.16b v9, v14, v9
	fmul.4s v1, v1, v10
	fadd.4s v2, v2, v1
	fmul.4s v1, v8, v10
	fadd.4s v0, v0, v1
	fmul.4s v1, v3, v9
	fadd.4s v19, v19, v1
	fmul.4s v1, v11, v9
	fadd.4s v18, v1, v18
	fmul.4s v1, v4, v9
	fadd.4s v17, v1, v17
	fmul.4s v1, v27, v9
	fadd.4s v16, v1, v16
	add x30, x30, #32
	fadd.4s v5, v9, v5
	add x2, x2, #32
	add x5, x5, #32
	add x17, x17, #32
	subs x28, x28, #1
	b.ne LBB2066_49
LBB2066_50:
	subs x17, x6, #8
	csel x30, xzr, x17, lo
	and x28, x7, #0x7
	cbz x28, LBB2066_52
	add x17, x30, #8
	ldr x2, [sp, #152]
	cmp x17, x2
	ccmp x17, x8, #2, ls
	b.ls LBB2066_42
LBB2066_52:
	and x17, x26, #0x7
	and x2, x24, #0x7
	and x5, x22, #0x7
	cmp x17, x28
	csel x17, x17, x28, lo
	cmp x2, x17
	csel x17, x2, x17, lo
	cmp x5, x17
	csel x28, x5, x17, lo
	cbz x28, LBB2066_43
	and x17, x7, #0xfffffff8
	add x30, x21, x17, lsl #2
	and x17, x26, #0xfffffff8
	add x21, x23, x17, lsl #2
	and x17, x24, #0xfffffff8
	add x6, x25, x17, lsl #2
	and x17, x22, #0xfffffff8
	add x7, x3, x17, lsl #2
	ldr s1, [x30]
	ldr s25, [x21]
	ldr s4, [x6]
	ldr s27, [x7]
	ldr q3, [sp, #224]
	fsub s30, s3, s1
	ldr q3, [sp, #208]
	fsub s31, s3, s25
	fmul s8, s30, s30
	fmul s9, s31, s31
	fadd s8, s8, s9
	fadd s3, s15, s30
	stp s3, s15, [sp, #196]
	fadd s3, s29, s31
	str s3, [sp, #192]
	fcmp s8, #0.0
	ldr s3, [sp, #284]
	fadd s12, s3, s1
	ldr s1, [sp, #288]
	fadd s30, s1, s25
	ldr s25, [sp, #292]
	fadd s4, s25, s4
	fmov.2s v9, #1.00000000
	mov.s v9[0], v27[0]
	fadd.2s v27, v28, v9
	ldr s15, [sp, #244]
	fcsel s9, s4, s15, gt
	mov.16b v26, v28
	ldr s28, [sp, #256]
	fcsel s10, s30, s28, gt
	str s29, [sp, #204]
	ldr s29, [sp, #260]
	fcsel s11, s12, s29, gt
	fcsel s4, s4, s25, gt
	fcsel s31, s30, s1, gt
	fcsel s30, s12, s3, gt
	ldr d14, [sp, #248]
	fcsel d12, d27, d14, gt
	fcsel d27, d27, d26, gt
	ldr q13, [sp, #160]
	.p2align	6, , 4
	fcmp s8, s13
	fcsel s9, s15, s9, pl
	fcsel s10, s28, s10, pl
	fcsel s11, s29, s11, pl
	fcsel s4, s25, s4, pl
	str s4, [sp, #180]
	fcsel s31, s1, s31, pl
	fcsel s30, s3, s30, pl
	fcsel d4, d14, d12, pl
	str d4, [sp, #184]
	fcsel d27, d26, d27, pl
	ldr q12, [sp, #80]
	fcmp s8, s12
	ldr s8, [sp, #300]
	ldp s13, s4, [sp, #192]
	fcsel s8, s13, s8, mi
	str s8, [sp, #300]
	ldr s8, [sp, #296]
	fcsel s8, s4, s8, mi
	str s8, [sp, #296]
	fcsel s15, s15, s9, mi
	str s15, [sp, #244]
	fcsel s28, s28, s10, mi
	str s28, [sp, #256]
	fcsel s29, s29, s11, mi
	str s29, [sp, #260]
	ldp s15, s29, [sp, #200]
	fcsel s29, s13, s29, mi
	fcsel s15, s4, s15, mi
	ldr s4, [sp, #180]
	fcsel s25, s25, s4, mi
	str s25, [sp, #292]
	fcsel s1, s1, s31, mi
	str s1, [sp, #288]
	fcsel s3, s3, s30, mi
	str s3, [sp, #284]
	ldr d1, [sp, #184]
	fcsel d14, d14, d1, mi
	str d14, [sp, #248]
	fcsel d28, d26, d27, mi
	cmp x28, #1
	b.ne LBB2066_56
	ldur q30, [x29, #-256]
	ldr q31, [sp, #304]
	ldr q25, [sp, #96]
	ldr q26, [sp, #128]
	b LBB2066_43
LBB2066_56:
	ldr s3, [x30, #4]
	ldr s4, [x21, #4]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	ldur q30, [x29, #-256]
	ldr q31, [sp, #304]
	ldr q25, [sp, #96]
	ldr q26, [sp, #128]
	b.pl LBB2066_58
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_61
LBB2066_58:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_61
	fcmp s1, #0.0
	b.le LBB2066_61
	ldr s1, [x6, #4]
	ldr s27, [x7, #4]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
LBB2066_61:
	cmp x28, #2
	b.eq LBB2066_43
	ldr s3, [x30, #8]
	ldr s4, [x21, #8]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	b.pl LBB2066_64
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_67
LBB2066_64:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_67
	fcmp s1, #0.0
	b.le LBB2066_67
	ldr s1, [x6, #8]
	ldr s27, [x7, #8]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
LBB2066_67:
	cmp x28, #3
	b.eq LBB2066_43
	ldr s3, [x30, #12]
	ldr s4, [x21, #12]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	b.pl LBB2066_70
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_73
LBB2066_70:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_73
	fcmp s1, #0.0
	b.le LBB2066_73
	ldr s1, [x6, #12]
	ldr s27, [x7, #12]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
LBB2066_73:
	cmp x28, #4
	b.eq LBB2066_43
	ldr s3, [x30, #16]
	ldr s4, [x21, #16]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	b.pl LBB2066_76
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_79
LBB2066_76:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_79
	fcmp s1, #0.0
	b.le LBB2066_79
	ldr s1, [x6, #16]
	ldr s27, [x7, #16]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
LBB2066_79:
	cmp x28, #5
	b.eq LBB2066_43
	ldr s3, [x30, #20]
	ldr s4, [x21, #20]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	b.pl LBB2066_82
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_85
LBB2066_82:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_85
	fcmp s1, #0.0
	b.le LBB2066_85
	ldr s1, [x6, #20]
	ldr s27, [x7, #20]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
LBB2066_85:
	cmp x28, #6
	b.eq LBB2066_43
	ldr s3, [x30, #24]
	ldr s4, [x21, #24]
	ldr q1, [sp, #224]
	fsub s10, s1, s3
	ldr q1, [sp, #208]
	fsub s11, s1, s4
	fmul s1, s10, s10
	fmul s27, s11, s11
	fadd s1, s1, s27
	fcmp s1, s12
	b.pl LBB2066_88
	fadd s15, s15, s10
	fadd s29, s29, s11
	str s29, [sp, #300]
	str s15, [sp, #296]
	b LBB2066_43
LBB2066_88:
	ldr q27, [sp, #160]
	fcmp s1, s27
	b.pl LBB2066_43
	fcmp s1, #0.0
	b.le LBB2066_43
	ldr s1, [x6, #24]
	ldr s27, [x7, #24]
	mov.16b v26, v28
	ldr s28, [sp, #284]
	fadd s28, s28, s3
	ldr s3, [sp, #288]
	fadd s4, s3, s4
	fmov.2s v3, #1.00000000
	mov.s v3[0], v27[0]
	ldr s27, [sp, #292]
	fadd s27, s27, s1
	fadd.2s v1, v26, v3
	ldr q26, [sp, #128]
	str s27, [sp, #244]
	str s27, [sp, #292]
	str s4, [sp, #256]
	str s4, [sp, #288]
	str s28, [sp, #260]
	str s28, [sp, #284]
	str d1, [sp, #248]
	mov.16b v28, v1
	b LBB2066_43
LBB2066_91:
	ldr s3, [sp, #260]
	ldr s1, [sp, #256]
	stp s3, s1, [x29, #-224]
	ldr s1, [sp, #244]
	stur s1, [x29, #-216]
	ldr d1, [sp, #248]
	stur d1, [x29, #-212]
	ldr s1, [sp, #296]
	ldr s25, [sp, #300]
	stp s1, s25, [x29, #-204]
	dup.4s v1, v24[1]
	fadd.4s v1, v24, v1
	dup.4s v3, v24[2]
	fadd.4s v1, v1, v3
	dup.4s v3, v24[3]
	fadd.4s v1, v1, v3
	zip1.4s v4, v23, v22
	mov.s v4[2], v21[0]
	fadd.4s v3, v1, v0
	mov.s v4[3], v20[0]
	trn2.4s v1, v23, v22
	mov.s v1[2], v21[1]
	mov.s v1[3], v20[1]
	fadd.4s v1, v4, v1
	zip2.4s v4, v23, v22
	mov.s v4[2], v21[2]
	mov.s v4[3], v20[2]
	uzp2.4s v22, v23, v22
	uzp2.4s v22, v22, v23
	mov.s v22[2], v21[3]
	fadd.4s v1, v1, v4
	mov.s v22[3], v20[3]
	zip1.4s v4, v19, v18
	mov.s v4[2], v17[0]
	fadd.4s v1, v1, v22
	mov.s v4[3], v16[0]
	trn2.4s v20, v19, v18
	mov.s v20[2], v17[1]
	fadd.4s v1, v1, v4
	mov.s v20[3], v16[1]
	zip2.4s v4, v19, v18
	mov.s v4[2], v17[2]
	fadd.4s v1, v1, v20
	mov.s v4[3], v16[2]
	fadd.4s v1, v1, v4
	uzp2.4s v4, v19, v18
	uzp2.4s v4, v4, v19
	mov.s v4[2], v17[3]
	mov.s v4[3], v16[3]
	fadd.4s v1, v1, v4
	ldur q4, [x29, #-224]
	faddp.2s v16, v7, v6
	mov d6, v6[1]
	mov d7, v7[1]
	zip1.2s v17, v7, v6
	fadd.2s v16, v16, v17
	zip2.2s v6, v7, v6
	fadd.2s v6, v16, v6
	zip1.2s v7, v5, v2
	fadd.2s v6, v6, v7
	zip2.2s v7, v5, v2
	fadd.2s v6, v6, v7
	mov d2, v2[1]
	mov d5, v5[1]
	zip1.2s v7, v5, v2
	fadd.2s v6, v6, v7
	zip2.2s v2, v5, v2
	fadd.2s v2, v6, v2
	ldur d5, [x29, #-208]
	fadd.4s v4, v1, v4
	fadd.2s v2, v2, v5
	dup.4s v1, v0[1]
	dup.4s v5, v0[2]
	fadd.4s v1, v3, v1
	fadd.4s v1, v1, v5
	dup.4s v0, v0[3]
	fadd.4s v0, v1, v0
	fadd s0, s0, s25
	ldr s9, [sp, #12]
	movi.2s v8, #90, lsl #24
LBB2066_92:
	stur q4, [x29, #-224]
	stur d2, [x29, #-208]
	stur s0, [x29, #-200]
	sub x0, x29, #184
	add x1, x19, #316
	sub x2, x29, #168
	sub x3, x29, #240
	sub x4, x29, #224
	ldr q0, [sp, #64]
	mov.16b v1, v9
	bl swarm::rules::finish
	ldr x8, [sp, #48]
	cmp x20, x8
	b.hs LBB2066_34
	ldp s0, s1, [x29, #-184]
	ldp x8, x9, [sp, #32]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	ldp s0, s1, [x29, #-176]
	ldp x8, x9, [sp, #16]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	b LBB2066_34
LBB2066_94:
	add sp, sp, #432
	.cfi_def_cfa wsp, 160
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
