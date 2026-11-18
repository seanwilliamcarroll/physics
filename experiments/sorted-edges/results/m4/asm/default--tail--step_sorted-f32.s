<swarm::flock::Flock>::step_sorted:
Lfunc_begin1929:
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
	sub sp, sp, #400
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
	b LBB1929_2
LBB1929_1:
	ldr x8, [x19, #104]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #112]
LBB1929_2:
	cmp x25, x22
	b.eq LBB1929_5
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_2
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB1929_6
	b LBB1929_8
LBB1929_5:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB1929_8
LBB1929_6:
	ldr x8, [x19, #96]
	cmp x20, x8
	b.ne LBB1929_1
	add x0, x19, #96
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB1929_1
LBB1929_8:
	mov x20, #0
	ldp x23, x24, [x19, #32]
	mov x25, x21
	str xzr, [x19, #136]
	b LBB1929_10
LBB1929_9:
	ldr x8, [x19, #128]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #136]
LBB1929_10:
	cmp x25, x22
	b.eq LBB1929_13
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_10
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB1929_14
	b LBB1929_16
LBB1929_13:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB1929_16
LBB1929_14:
	ldr x8, [x19, #120]
	cmp x20, x8
	b.ne LBB1929_9
	add x0, x19, #120
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB1929_9
LBB1929_16:
	mov x20, #0
	ldp x23, x24, [x19, #56]
	mov x25, x21
	str xzr, [x19, #160]
	b LBB1929_18
LBB1929_17:
	ldr x8, [x19, #152]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #160]
LBB1929_18:
	cmp x25, x22
	b.eq LBB1929_21
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_18
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB1929_22
	b LBB1929_24
LBB1929_21:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB1929_24
LBB1929_22:
	ldr x8, [x19, #144]
	cmp x20, x8
	b.ne LBB1929_17
	add x0, x19, #144
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB1929_17
LBB1929_24:
	mov x20, #0
	ldp x23, x24, [x19, #80]
	str xzr, [x19, #184]
	b LBB1929_26
LBB1929_25:
	ldr x8, [x19, #176]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #184]
LBB1929_26:
	cmp x21, x22
	b.eq LBB1929_29
	ldr w8, [x21], #4
	cmp x24, x8
	b.ls LBB1929_26
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB1929_30
	b LBB1929_32
LBB1929_29:
	mov w8, #0
	mov x21, x22
	cmp w8, #1
	b.ne LBB1929_32
LBB1929_30:
	ldr x8, [x19, #168]
	cmp x20, x8
	b.ne LBB1929_25
	add x0, x19, #168
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB1929_25
LBB1929_32:
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
	cbz x13, LBB1929_84
	mov x20, #0
	ldr s0, [x19, #320]
	fmul s0, s0, s0
	fmul s1, s9, s9
	cmp x9, x8
	csel x8, x9, x8, lo
	str q1, [sp, #96]
	dup.4s v16, v1[0]
	cmp x10, x8
	csel x8, x10, x8, lo
	str q0, [sp, #160]
	dup.4s v0, v0[0]
	cmp x11, x8
	csel x8, x11, x8, lo
	stp x8, x13, [sp, #40]
	mov w27, #4
	fmov.4s v6, #1.00000000
	str q16, [sp, #192]
	str q0, [sp, #240]
	b LBB1929_36
LBB1929_34:
	ldr x13, [sp, #48]
	ldr q16, [sp, #192]
	ldr q0, [sp, #240]
	fmov.4s v6, #1.00000000
LBB1929_35:
	add x20, x20, #1
	cmp x20, x13
	b.eq LBB1929_84
LBB1929_36:
	ldr x8, [x19, #16]
	cmp x20, x8
	b.hs LBB1929_35
	ldr x9, [x19, #40]
	cmp x20, x9
	b.hs LBB1929_35
	ldr x10, [x19, #64]
	ldr x11, [x19, #88]
	cmp x20, x10
	ccmp x20, x11, #2, lo
	b.hs LBB1929_35
	ldr x12, [x19, #8]
	ldr s5, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s7, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s2, [x15, x20, lsl #2]
	ldr s3, [x14, x20, lsl #2]
	stp s5, s7, [x29, #-232]
	stp s2, s3, [x29, #-224]
	stp xzr, xzr, [x29, #-216]
	stur wzr, [x29, #-192]
	stur xzr, [x29, #-200]
	ldr s2, [x19, #280]
	fmul s3, s5, s2
	movi.2d v1, #0000000000000000
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d4, s3
	fcvtzu x17, d4
	ldp x16, x0, [x19, #264]
	str x16, [sp, #232]
	subs x16, x16, #1
	csel x16, xzr, x16, lo
	cmp x16, x17
	csel x17, x16, x17, lo
	movi.2s v4, #90, lsl #24
	fcmp s3, s4
	csel x17, x17, xzr, lt
	fmul s2, s7, s2
	fmaxnm s2, s2, s1
	frintm s2, s2
	fcvt d3, s2
	fcvtzu x1, d3
	subs x0, x0, #1
	csel x2, xzr, x0, lo
	cmp x2, x1
	csel x0, x2, x1, lo
	fcmp s2, s4
	csel x1, x0, xzr, lt
	subs x0, x17, #1
	csel x4, xzr, x0, lo
	subs x0, x1, #1
	csel x0, xzr, x0, lo
	add x3, x1, #1
	cmp x2, x3
	csinc x1, x2, x1, lo
	stp x1, x4, [sp, #216]
	cmp x0, x1
	b.hi LBB1929_82
	add x1, x17, #1
	cmp x16, x1
	csinc x16, x16, x17, lo
	cmp x10, x11
	csel x17, x10, x11, lo
	add x16, x16, #1
	str x16, [sp, #208]
	cmp x9, x17
	csel x16, x9, x17, lo
	str x16, [sp, #184]
	ldp x16, x4, [x19, #200]
	str x16, [sp, #152]
	mov.16b v1, v5
	mov.s v1[1], v7[0]
	stp q7, q1, [sp, #112]
	dup.4s v3, v7[0]
	str q5, [sp, #80]
	dup.4s v5, v5[0]
	movi d29, #0000000000000000
	movi.2d v28, #0000000000000000
	movi d30, #0000000000000000
	movi d31, #0000000000000000
LBB1929_41:
	ldp x1, x16, [sp, #224]
	mul x16, x16, x0
	ldr x17, [sp, #208]
	add x17, x17, x16
	add x16, x16, x1
	cmp x16, x4
	ccmp x17, x4, #2, lo
	b.lo LBB1929_43
	mov x3, #0
	mov x16, #0
	b LBB1929_44
LBB1929_43:
	ldr x1, [sp, #152]
	ldr w16, [x1, x16, lsl #2]
	ldr w3, [x1, x17, lsl #2]
LBB1929_44:
	stp q31, q30, [sp, #256]
	stur q29, [x29, #-256]
	stur s28, [x29, #-236]
	cmp x3, x11
	cset w17, hi
	cmp x3, x16
	csinc w17, w17, wzr, hs
	cmp x3, x10
	cset w1, hi
	cmp x3, x16
	csinc w1, w1, wzr, hs
	cmp x3, x9
	cset w2, hi
	cmp x3, x16
	csinc w2, w2, wzr, hs
	cmp x3, x8
	cset w5, hi
	subs x21, x3, x16
	csinc w5, w5, wzr, hs
	lsl x16, x16, #2
	add x7, x12, x16
	cmp w5, #0
	csel x6, xzr, x21, ne
	csel x7, x27, x7, ne
	add x5, x13, x16
	cmp w2, #0
	csel x30, xzr, x21, ne
	csel x26, x27, x5, ne
	lsr x2, x30, #3
	add x5, x15, x16
	cmp w1, #0
	csel x23, xzr, x21, ne
	csel x24, x27, x5, ne
	lsr x1, x23, #3
	add x16, x14, x16
	cmp w17, #0
	csel x25, xzr, x21, ne
	csel x28, x27, x16, ne
	lsr x16, x25, #3
	lsr x17, x6, #3
	cmp x2, x17
	csel x17, x2, x17, lo
	cmp x1, x17
	csel x17, x1, x17, lo
	cmp x16, x17
	movi.2d v17, #0000000000000000
	csel x21, x16, x17, lo
	cbz x21, LBB1929_48
	add x22, x7, #16
	movi.2d v19, #0000000000000000
	add x2, x28, #16
	movi.2d v18, #0000000000000000
	add x5, x26, #16
	movi.2d v20, #0000000000000000
	add x17, x24, #16
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
LBB1929_46:
	ldp q31, q8, [x22, #-16]
	fsub.4s v9, v5, v31
	ldp q12, q13, [x5, #-16]
	fsub.4s v14, v3, v12
	fmul.4s v15, v9, v9
	fmul.4s v10, v14, v14
	fadd.4s v10, v15, v10
	fcmgt.4s v15, v0, v10
	and.16b v15, v15, v6
	fcmge.4s v11, v10, v0
	fcmgt.4s v1, v16, v10
	fcmgt.4s v10, v10, #0.0
	mvn.16b v10, v10
	orn.16b v10, v10, v11
	orn.16b v1, v10, v1
	bic.16b v1, v6, v1
	fmul.4s v9, v9, v15
	fadd.4s v20, v20, v9
	fmul.4s v9, v14, v15
	fadd.4s v19, v19, v9
	fmul.4s v31, v31, v1
	fadd.4s v30, v30, v31
	fmul.4s v31, v12, v1
	fadd.4s v29, v31, v29
	ldp q31, q9, [x17, #-16]
	fmul.4s v31, v31, v1
	fadd.4s v26, v31, v26
	ldp q31, q10, [x2, #-16]
	fmul.4s v31, v31, v1
	fadd.4s v25, v31, v25
	fadd.4s v22, v1, v22
	fsub.4s v1, v5, v8
	fsub.4s v31, v3, v13
	fmul.4s v11, v1, v1
	fmul.4s v12, v31, v31
	fadd.4s v11, v11, v12
	fcmgt.4s v12, v0, v11
	and.16b v12, v12, v6
	fcmge.4s v14, v11, v0
	fcmgt.4s v15, v16, v11
	fcmgt.4s v11, v11, #0.0
	mvn.16b v11, v11
	orn.16b v11, v11, v14
	orn.16b v11, v11, v15
	bic.16b v11, v6, v11
	fmul.4s v1, v1, v12
	fadd.4s v18, v18, v1
	fmul.4s v1, v31, v12
	fadd.4s v17, v17, v1
	fmul.4s v1, v8, v11
	fadd.4s v28, v28, v1
	fmul.4s v1, v13, v11
	fadd.4s v27, v1, v27
	fmul.4s v1, v9, v11
	fadd.4s v24, v1, v24
	fmul.4s v1, v10, v11
	fadd.4s v23, v1, v23
	add x22, x22, #32
	fadd.4s v21, v11, v21
	add x2, x2, #32
	add x5, x5, #32
	add x17, x17, #32
	subs x21, x21, #1
	b.ne LBB1929_46
	subs x16, x3, #8
	csel x1, xzr, x16, lo
	and x21, x6, #0x7
	cbnz x21, LBB1929_49
	b LBB1929_50
LBB1929_48:
	movi.2d v19, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v20, #0000000000000000
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
	subs x16, x3, #8
	csel x1, xzr, x16, lo
	and x21, x6, #0x7
	cbz x21, LBB1929_50
LBB1929_49:
	add x16, x1, #8
	ldr x17, [sp, #184]
	cmp x16, x17
	ccmp x16, x8, #2, ls
	b.ls LBB1929_51
LBB1929_50:
	mov w22, #1
	b LBB1929_52
LBB1929_51:
	mov w22, #0
	add x16, x12, x1, lsl #2
	lsl x2, x1, #2
	add x5, x13, x2
	sub x17, x3, x21
	sub x17, x17, x1
	dup.2d v31, x17
	add x17, x15, x2
	add x2, x14, x2
	mov x27, x9
	mov x9, x15
	mov x15, x14
	mov x14, x13
	mov x13, x12
	mov x12, x11
	mov x11, x10
Lloh16142:
	adrp x10, lCPI1929_0@PAGE
Lloh16143:
	ldr q1, [x10, lCPI1929_0@PAGEOFF]
	cmhi.2d v1, v1, v31
Lloh16144:
	adrp x10, lCPI1929_1@PAGE
Lloh16145:
	ldr q8, [x10, lCPI1929_1@PAGEOFF]
	cmhi.2d v8, v8, v31
	uzp1.4s v1, v8, v1
	sub x1, x3, x1
	dup.2d v12, x1
Lloh16146:
	adrp x10, lCPI1929_2@PAGE
Lloh16147:
	ldr q8, [x10, lCPI1929_2@PAGEOFF]
	cmhi.2d v8, v12, v8
Lloh16148:
	adrp x10, lCPI1929_3@PAGE
Lloh16149:
	ldr q9, [x10, lCPI1929_3@PAGEOFF]
	cmhi.2d v9, v12, v9
	uzp1.4s v8, v9, v8
	and.16b v13, v1, v8
	xtn.4h v9, v13
	ldp q15, q14, [x16]
	fsub.4s v1, v5, v14
	fmul.4s v10, v1, v1
	ldp q8, q11, [x5]
	fsub.4s v0, v3, v11
	fmul.4s v2, v0, v0
	fadd.4s v2, v10, v2
	fmov.4s v7, #1.00000000
	ldr q6, [sp, #240]
	fcmge.4s v10, v2, v6
	bic.16b v10, v13, v10
	fcmgt.4s v4, v16, v2
	mvn.16b v4, v4
	fcmgt.4s v16, v2, #0.0
	orn.16b v4, v4, v16
	orr.16b v4, v10, v4
	xtn.4h v4, v4
	bic.8b v4, v9, v4
	ushll.4s v4, v4, #0
	shl.4s v4, v4, #31
	cmlt.4s v4, v4, #0
	and.16b v4, v4, v7
	ldp q9, q16, [x2]
	fmul.4s v16, v16, v4
	fadd.4s v23, v16, v23
	ldp q10, q16, [x17]
	fmul.4s v16, v16, v4
	fadd.4s v24, v16, v24
	fmul.4s v16, v11, v4
	fadd.4s v27, v16, v27
	fadd.4s v21, v4, v21
	fmul.4s v4, v14, v4
	fadd.4s v28, v4, v28
	fcmgt.4s v2, v6, v2
	and.16b v2, v13, v2
	shl.4s v2, v2, #31
	cmlt.4s v2, v2, #0
	and.16b v2, v2, v7
	fmul.4s v0, v0, v2
	fadd.4s v17, v0, v17
	fmul.4s v0, v1, v2
	fadd.4s v18, v0, v18
Lloh16150:
	adrp x10, lCPI1929_4@PAGE
Lloh16151:
	ldr q0, [x10, lCPI1929_4@PAGEOFF]
	cmhi.2d v0, v0, v31
Lloh16152:
	adrp x10, lCPI1929_5@PAGE
Lloh16153:
	ldr q1, [x10, lCPI1929_5@PAGEOFF]
	cmhi.2d v1, v1, v31
	uzp1.4s v0, v1, v0
Lloh16154:
	adrp x10, lCPI1929_6@PAGE
Lloh16155:
	ldr q1, [x10, lCPI1929_6@PAGEOFF]
	cmhi.2d v1, v12, v1
Lloh16156:
	adrp x10, lCPI1929_7@PAGE
Lloh16157:
	ldr q2, [x10, lCPI1929_7@PAGEOFF]
	mov x10, x11
	mov x11, x12
	mov x12, x13
	mov x13, x14
	mov x14, x15
	mov x15, x9
	mov x9, x27
	mov w27, #4
	cmhi.2d v2, v12, v2
	uzp1.4s v1, v2, v1
	and.16b v0, v0, v1
	xtn.4h v1, v0
	fsub.4s v2, v5, v15
	fmul.4s v4, v2, v2
	fsub.4s v16, v3, v8
	fmul.4s v31, v16, v16
	fadd.4s v4, v4, v31
	fcmge.4s v31, v4, v6
	bic.16b v31, v0, v31
	ldr q11, [sp, #192]
	fcmgt.4s v11, v11, v4
	mvn.16b v11, v11
	fcmgt.4s v12, v4, #0.0
	orn.16b v11, v11, v12
	orr.16b v31, v31, v11
	xtn.4h v31, v31
	bic.8b v1, v1, v31
	ushll.4s v1, v1, #0
	shl.4s v1, v1, #31
	cmlt.4s v1, v1, #0
	and.16b v1, v1, v7
	ldr q7, [sp, #112]
	fadd.4s v22, v1, v22
	fmul.4s v31, v9, v1
	fadd.4s v25, v31, v25
	fmul.4s v31, v10, v1
	fadd.4s v26, v31, v26
	fmul.4s v31, v8, v1
	fadd.4s v29, v31, v29
	fmul.4s v1, v15, v1
	fadd.4s v30, v1, v30
	fcmgt.4s v1, v6, v4
	fmov.4s v6, #1.00000000
	and.16b v0, v0, v1
	shl.4s v0, v0, #31
	cmlt.4s v0, v0, #0
	and.16b v0, v0, v6
	fmul.4s v1, v16, v0
	ldr q16, [sp, #192]
	fadd.4s v19, v1, v19
	fmul.4s v0, v2, v0
	fadd.4s v20, v0, v20
LBB1929_52:
	ldr q31, [sp, #256]
	faddp.2s v0, v30, v29
	mov d1, v29[1]
	mov d2, v30[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	zip1.2s v1, v28, v27
	fadd.2s v0, v0, v1
	zip2.2s v1, v28, v27
	fadd.2s v0, v0, v1
	mov d1, v27[1]
	mov d2, v28[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	ldur q29, [x29, #-256]
	fadd.2s v29, v29, v0
	faddp.2s v0, v26, v25
	mov d1, v25[1]
	mov d2, v26[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	zip1.2s v1, v24, v23
	fadd.2s v0, v0, v1
	zip2.2s v1, v24, v23
	fadd.2s v0, v0, v1
	mov d1, v23[1]
	mov d2, v24[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	ldr q30, [sp, #272]
	fadd.2s v30, v30, v0
	dup.4s v0, v22[1]
	fadd.4s v0, v22, v0
	dup.4s v1, v22[2]
	fadd.4s v0, v0, v1
	dup.4s v1, v22[3]
	fadd.4s v0, v0, v1
	fadd.4s v0, v0, v21
	dup.4s v1, v21[1]
	dup.4s v2, v21[2]
	fadd.4s v0, v0, v1
	fadd.4s v0, v0, v2
	dup.4s v1, v21[3]
	fadd.4s v0, v0, v1
	ldur s28, [x29, #-236]
	fadd s28, s28, s0
	faddp.2s v0, v20, v19
	mov d1, v19[1]
	mov d2, v20[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	zip1.2s v1, v18, v17
	fadd.2s v0, v0, v1
	zip2.2s v1, v18, v17
	fadd.2s v0, v0, v1
	mov d1, v17[1]
	mov d2, v18[1]
	zip1.2s v4, v2, v1
	fadd.2s v0, v0, v4
	zip2.2s v1, v2, v1
	fadd.2s v0, v0, v1
	fadd.2s v31, v31, v0
	tbz w22, #0, LBB1929_66
	and x16, x30, #0x7
	and x17, x23, #0x7
	and x1, x25, #0x7
	cmp x16, x21
	csel x16, x16, x21, lo
	cmp x17, x16
	csel x16, x17, x16, lo
	cmp x1, x16
	csel x21, x1, x16, lo
	cbz x21, LBB1929_66
	and x16, x6, #0xfffffff8
	add x22, x7, x16, lsl #2
	and x16, x30, #0xfffffff8
	add x26, x26, x16, lsl #2
	and x16, x23, #0xfffffff8
	add x6, x24, x16, lsl #2
	and x16, x25, #0xfffffff8
	add x7, x28, x16, lsl #2
	ldr s18, [x22]
	ld1.s { v18 }[1], [x26]
	ldr q0, [sp, #128]
	fsub.2s v19, v0, v18
	fmul.2s v0, v19, v19
	faddp.2s s17, v0
	ldr q0, [sp, #160]
	fcmp s17, s0
	b.pl LBB1929_56
	fadd.2s v31, v31, v19
	cmp x21, #1
	b.ne LBB1929_57
	b LBB1929_66
LBB1929_56:
	ldr s0, [x6]
	ldr s1, [x7]
	fcmp s17, #0.0
	fadd.2s v2, v29, v18
	mov.s v0[1], v1[0]
	fadd.2s v0, v30, v0
	fmov s1, #1.00000000
	fadd s1, s28, s1
	fcsel s1, s1, s28, gt
	fcsel d0, d0, d30, gt
	fcsel d2, d2, d29, gt
	ldr q4, [sp, #96]
	fcmp s17, s4
	fcsel s28, s28, s1, pl
	fcsel d30, d30, d0, pl
	fcsel d29, d29, d2, pl
	cmp x21, #1
	b.eq LBB1929_66
LBB1929_57:
	add x16, x26, #4
	ldr s18, [x22, #4]
	ld1.s { v18 }[1], [x16]
	ldr q0, [sp, #128]
	fsub.2s v19, v0, v18
	fmul.2s v0, v19, v19
	faddp.2s s17, v0
	ldr q0, [sp, #160]
	fcmp s17, s0
	b.pl LBB1929_59
	fadd.2s v31, v31, v19
	cmp x21, #2
	b.ne LBB1929_60
	b LBB1929_66
LBB1929_59:
	ldr s0, [x6, #4]
	ldr s1, [x7, #4]
	fcmp s17, #0.0
	fadd.2s v2, v29, v18
	mov.s v0[1], v1[0]
	fadd.2s v0, v30, v0
	fmov s1, #1.00000000
	fadd s1, s28, s1
	fcsel s1, s28, s1, le
	fcsel d0, d30, d0, le
	fcsel d2, d29, d2, le
	ldr q4, [sp, #96]
	fcmp s17, s4
	fcsel s28, s28, s1, pl
	fcsel d30, d30, d0, pl
	fcsel d29, d29, d2, pl
	cmp x21, #2
	b.eq LBB1929_66
LBB1929_60:
	ldr s19, [x22, #8]
	ldr s20, [x26, #8]
	ldr q0, [sp, #80]
	fsub s21, s0, s19
	fsub s17, s7, s20
	fmul s0, s21, s21
	fmul s1, s17, s17
	fadd s18, s0, s1
	ldr q0, [sp, #160]
	fcmp s18, s0
	b.pl LBB1929_64
	fadd s18, s31, s21
	mov s0, v31[1]
	fadd s17, s0, s17
	mov s21, v30[1]
	mov s22, v29[1]
	mov.16b v19, v30
	mov.16b v20, v29
	cmp x21, #3
	b.eq LBB1929_65
LBB1929_62:
	mov.16b v1, v7
	ldr s7, [x22, #12]
	ldr s16, [x26, #12]
	ldr q0, [sp, #80]
	fsub s23, s0, s7
	fsub s24, s1, s16
	fmul s0, s23, s23
	fmul s1, s24, s24
	fadd s6, s0, s1
	ldr q0, [sp, #160]
	fcmp s6, s0
	b.pl LBB1929_67
	fadd s18, s18, s23
	fadd s17, s17, s24
	cmp x21, #4
	b.ne LBB1929_68
	b LBB1929_73
LBB1929_64:
	ldr s0, [x6, #8]
	ldr s1, [x7, #8]
	mov s17, v31[1]
	mov s2, v30[1]
	mov s4, v29[1]
	fcmp s18, #0.0
	fadd s16, s29, s19
	fadd s19, s4, s20
	fadd s0, s30, s0
	fadd s1, s2, s1
	fmov s6, #1.00000000
	fadd s20, s28, s6
	fmov.4s v6, #1.00000000
	fcsel s20, s28, s20, le
	fcsel s1, s2, s1, le
	fcsel s0, s30, s0, le
	fcsel s22, s4, s19, le
	fcsel s16, s29, s16, le
	ldr q19, [sp, #96]
	fcmp s18, s19
	fcsel s28, s28, s20, pl
	fcsel s21, s2, s1, pl
	fcsel s19, s30, s0, pl
	fcsel s22, s4, s22, pl
	fcsel s20, s29, s16, pl
	ldr q16, [sp, #192]
	mov.16b v18, v31
	cmp x21, #3
	b.ne LBB1929_62
LBB1929_65:
	mov.s v20[1], v22[0]
	mov.s v19[1], v21[0]
	mov.s v18[1], v17[0]
	mov.16b v29, v20
	mov.16b v30, v19
	mov.16b v31, v18
LBB1929_66:
	ldr q0, [sp, #240]
	ldr x16, [sp, #216]
	cmp x0, x16
	add x0, x0, #1
	b.ne LBB1929_41
	b LBB1929_81
LBB1929_67:
	ldr s0, [x6, #12]
	ldr s1, [x7, #12]
	fcmp s6, #0.0
	fadd s2, s20, s7
	fadd s4, s22, s16
	fadd s0, s19, s0
	fadd s1, s21, s1
	fmov s7, #1.00000000
	fadd s7, s28, s7
	fcsel s7, s28, s7, le
	fcsel s1, s21, s1, le
	fcsel s0, s19, s0, le
	fcsel s4, s22, s4, le
	fcsel s2, s20, s2, le
	ldr q16, [sp, #96]
	fcmp s6, s16
	fcsel s28, s28, s7, pl
	fcsel s21, s21, s1, pl
	fcsel s19, s19, s0, pl
	fcsel s22, s22, s4, pl
	fcsel s20, s20, s2, pl
	cmp x21, #4
	b.eq LBB1929_73
LBB1929_68:
	ldr s7, [x22, #16]
	ldr s16, [x26, #16]
	ldr q0, [sp, #80]
	fsub s23, s0, s7
	ldr q0, [sp, #112]
	fsub s24, s0, s16
	fmul s0, s23, s23
	fmul s1, s24, s24
	fadd s6, s0, s1
	ldr q0, [sp, #160]
	fcmp s6, s0
	b.pl LBB1929_72
	fadd s18, s18, s23
	fadd s17, s17, s24
	cmp x21, #5
	b.eq LBB1929_73
LBB1929_70:
	ldr s7, [x22, #20]
	ldr s16, [x26, #20]
	ldr q0, [sp, #80]
	fsub s23, s0, s7
	ldr q0, [sp, #112]
	fsub s24, s0, s16
	fmul s0, s23, s23
	fmul s1, s24, s24
	fadd s6, s0, s1
	ldr q0, [sp, #160]
	fcmp s6, s0
	b.pl LBB1929_74
	fadd s18, s18, s23
	fadd s17, s17, s24
	b LBB1929_75
LBB1929_72:
	ldr s0, [x6, #16]
	ldr s1, [x7, #16]
	fcmp s6, #0.0
	fadd s2, s20, s7
	fadd s4, s22, s16
	fadd s0, s19, s0
	fadd s1, s21, s1
	fmov s7, #1.00000000
	fadd s7, s28, s7
	fcsel s7, s28, s7, le
	fcsel s1, s21, s1, le
	fcsel s0, s19, s0, le
	fcsel s4, s22, s4, le
	fcsel s2, s20, s2, le
	ldr q16, [sp, #96]
	fcmp s6, s16
	fcsel s28, s28, s7, pl
	fcsel s21, s21, s1, pl
	fcsel s19, s19, s0, pl
	fcsel s22, s22, s4, pl
	fcsel s20, s20, s2, pl
	cmp x21, #5
	b.ne LBB1929_70
LBB1929_73:
	mov.s v20[1], v22[0]
	mov.s v19[1], v21[0]
	mov.s v18[1], v17[0]
	mov.16b v29, v20
	mov.16b v30, v19
	mov.16b v31, v18
	ldr q16, [sp, #192]
	ldr q0, [sp, #240]
	fmov.4s v6, #1.00000000
	ldr q7, [sp, #112]
	ldr x16, [sp, #216]
	cmp x0, x16
	add x0, x0, #1
	b.ne LBB1929_41
	b LBB1929_81
LBB1929_74:
	ldr s0, [x6, #20]
	ldr s1, [x7, #20]
	fcmp s6, #0.0
	fadd s2, s20, s7
	fadd s4, s22, s16
	fadd s0, s19, s0
	fadd s1, s21, s1
	fmov s7, #1.00000000
	fadd s7, s28, s7
	fcsel s7, s28, s7, le
	fcsel s1, s21, s1, le
	fcsel s0, s19, s0, le
	fcsel s4, s22, s4, le
	fcsel s2, s20, s2, le
	ldr q16, [sp, #96]
	fcmp s6, s16
	fcsel s28, s28, s7, pl
	fcsel s21, s21, s1, pl
	fcsel s19, s19, s0, pl
	fcsel s22, s22, s4, pl
	fcsel s20, s20, s2, pl
LBB1929_75:
	mov.16b v29, v20
	mov.s v29[1], v22[0]
	mov.16b v30, v19
	mov.s v30[1], v21[0]
	mov.16b v31, v18
	mov.s v31[1], v17[0]
	cmp x21, #6
	ldr q16, [sp, #192]
	fmov.4s v6, #1.00000000
	ldr q7, [sp, #112]
	b.eq LBB1929_66
	ldr s23, [x22, #24]
	ldr s24, [x26, #24]
	ldr q0, [sp, #80]
	fsub s25, s0, s23
	fsub s26, s7, s24
	fmul s0, s25, s25
	fmul s1, s26, s26
	fadd s27, s0, s1
	ldr q0, [sp, #160]
	fcmp s27, s0
	b.pl LBB1929_78
	fadd s31, s18, s25
	fadd s0, s17, s26
	mov.s v31[1], v0[0]
	ldr q0, [sp, #240]
	ldr x16, [sp, #216]
	cmp x0, x16
	add x0, x0, #1
	b.ne LBB1929_41
	b LBB1929_81
LBB1929_78:
	ldr q0, [sp, #96]
	fcmp s27, s0
	b.pl LBB1929_66
	fcmp s27, #0.0
	b.le LBB1929_66
	ldr s0, [x6, #24]
	ldr s1, [x7, #24]
	fadd s29, s20, s23
	fadd s2, s22, s24
	fadd s30, s19, s0
	fadd s0, s21, s1
	fmov s1, #1.00000000
	fadd s28, s28, s1
	mov.s v29[1], v2[0]
	mov.s v30[1], v0[0]
	ldr q0, [sp, #240]
	ldr x16, [sp, #216]
	cmp x0, x16
	add x0, x0, #1
	b.ne LBB1929_41
LBB1929_81:
	stp d29, d30, [x29, #-216]
	stur s28, [x29, #-200]
	stur d31, [x29, #-196]
LBB1929_82:
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
	b.hs LBB1929_34
	ldp s0, s1, [x29, #-184]
	ldp x8, x9, [sp, #24]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	ldp s0, s1, [x29, #-176]
	ldp x8, x9, [sp, #8]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	b LBB1929_34
LBB1929_84:
	add sp, sp, #400
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
	.loh AdrpLdr	Lloh16156, Lloh16157
	.loh AdrpAdrp	Lloh16154, Lloh16156
	.loh AdrpLdr	Lloh16154, Lloh16155
	.loh AdrpAdrp	Lloh16152, Lloh16154
	.loh AdrpLdr	Lloh16152, Lloh16153
	.loh AdrpAdrp	Lloh16150, Lloh16152
	.loh AdrpLdr	Lloh16150, Lloh16151
	.loh AdrpAdrp	Lloh16148, Lloh16150
	.loh AdrpLdr	Lloh16148, Lloh16149
	.loh AdrpAdrp	Lloh16146, Lloh16148
	.loh AdrpLdr	Lloh16146, Lloh16147
	.loh AdrpAdrp	Lloh16144, Lloh16146
	.loh AdrpLdr	Lloh16144, Lloh16145
	.loh AdrpAdrp	Lloh16142, Lloh16144
	.loh AdrpLdr	Lloh16142, Lloh16143
