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
	sub sp, sp, #416
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
	mov s10, v3[1]
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
	b LBB2066_4
LBB2066_1:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_8
LBB2066_2:
	ldr x8, [x19, #96]
	cmp x20, x8
	b.eq LBB2066_7
LBB2066_3:
	ldr x8, [x19, #104]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #112]
LBB2066_4:
	cmp x25, x22
	b.eq LBB2066_1
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_4
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_2
	b LBB2066_8
LBB2066_7:
	add x0, x19, #96
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_3
LBB2066_8:
	mov x20, #0
	ldp x23, x24, [x19, #32]
	mov x25, x21
	str xzr, [x19, #136]
	b LBB2066_12
LBB2066_9:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_16
LBB2066_10:
	ldr x8, [x19, #120]
	cmp x20, x8
	b.eq LBB2066_15
LBB2066_11:
	ldr x8, [x19, #128]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #136]
LBB2066_12:
	cmp x25, x22
	b.eq LBB2066_9
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_12
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_10
	b LBB2066_16
LBB2066_15:
	add x0, x19, #120
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_11
LBB2066_16:
	mov x20, #0
	ldp x23, x24, [x19, #56]
	mov x25, x21
	str xzr, [x19, #160]
	b LBB2066_20
LBB2066_17:
	mov w8, #0
	mov x25, x22
	cmp w8, #1
	b.ne LBB2066_24
LBB2066_18:
	ldr x8, [x19, #144]
	cmp x20, x8
	b.eq LBB2066_23
LBB2066_19:
	ldr x8, [x19, #152]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #160]
LBB2066_20:
	cmp x25, x22
	b.eq LBB2066_17
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB2066_20
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_18
	b LBB2066_24
LBB2066_23:
	add x0, x19, #144
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_19
LBB2066_24:
	mov x20, #0
	ldp x23, x24, [x19, #80]
	str xzr, [x19, #184]
	b LBB2066_28
LBB2066_25:
	mov w8, #0
	mov x21, x22
	cmp w8, #1
	b.ne LBB2066_32
LBB2066_26:
	ldr x8, [x19, #168]
	cmp x20, x8
	b.eq LBB2066_31
LBB2066_27:
	ldr x8, [x19, #176]
	str s8, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #184]
LBB2066_28:
	cmp x21, x22
	b.eq LBB2066_25
	ldr w8, [x21], #4
	cmp x24, x8
	b.ls LBB2066_28
	ldr s8, [x23, x8, lsl #2]
	mov w8, #1
	cmp w8, #1
	b.eq LBB2066_26
	b LBB2066_32
LBB2066_31:
	add x0, x19, #168
	mov x1, x20
	mov w2, #1
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	b LBB2066_27
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
	ldr s0, [x19, #320]
	fmul s0, s0, s0
	fmul s1, s9, s9
	cmp x9, x8
	csel x8, x9, x8, lo
	cmp x10, x8
	csel x8, x10, x8, lo
	stp q1, q0, [sp, #96]
	dup.4s v16, v1[0]
	dup.4s v27, v0[0]
	cmp x11, x8
	csel x8, x11, x8, lo
	str x8, [sp, #48]
	mov w27, #4
	movi.2s v8, #90, lsl #24
	fmov.4s v22, #1.00000000
	stur q16, [x29, #-256]
	str q27, [sp, #288]
	str s10, [sp, #12]
	str x13, [sp, #56]
	b LBB2066_36
LBB2066_34:
	ldr x13, [sp, #56]
	ldur q16, [x29, #-256]
	ldr q27, [sp, #288]
	fmov.4s v22, #1.00000000
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
	ldr s2, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s3, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s0, [x15, x20, lsl #2]
	ldr s1, [x14, x20, lsl #2]
	stp s2, s3, [x29, #-232]
	stp s0, s1, [x29, #-224]
	ldr s1, [x19, #280]
	str q2, [sp, #144]
	fmul s2, s2, s1
	movi.2d v0, #0000000000000000
	fmaxnm s2, s2, s0
	fcvt d4, s2
	fcvtzu x0, d4
	ldp x16, x1, [x19, #264]
	subs x17, x16, #1
	csel x17, xzr, x17, lo
	cmp x17, x0
	csel x0, x17, x0, lo
	fcmp s2, s8
	fmul s1, s3, s1
	fmaxnm s1, s1, s0
	fcvt d2, s1
	fcvtzu x3, d2
	csel x2, x0, xzr, lt
	subs x0, x1, #1
	csel x0, xzr, x0, lo
	cmp x0, x3
	csel x1, x0, x3, lo
	fcmp s1, s8
	csel x3, x1, xzr, lt
	subs x1, x2, #1
	csel x1, xzr, x1, lo
	str x1, [sp, #168]
	subs x1, x3, #1
	csel x1, xzr, x1, lo
	add x4, x3, #1
	cmp x0, x4
	csinc x0, x0, x3, lo
	movi d25, #0000000000000000
	movi d19, #0000000000000000
	movi d2, #0000000000000000
	cmp x1, x0
	b.hi LBB2066_92
	str q3, [sp, #128]
	dup.4s v25, v3[0]
	ldr q0, [sp, #144]
	dup.4s v26, v0[0]
	movi.2d v0, #0000000000000000
	str q0, [sp, #256]
	add x3, x2, #1
	movi.2d v6, #0000000000000000
	cmp x17, x3
	movi.2d v0, #0000000000000000
	csinc x17, x17, x2, lo
	movi.2d v1, #0000000000000000
	movi.2d v17, #0000000000000000
	cmp x10, x11
	csel x2, x10, x11, lo
	movi.2d v7, #0000000000000000
	add x17, x17, #1
	str x17, [sp, #160]
	movi.2d v18, #0000000000000000
	movi.2d v19, #0000000000000000
	cmp x9, x2
	csel x17, x9, x2, lo
	str x17, [sp, #88]
	movi.2d v23, #0000000000000000
	movi.2d v21, #0000000000000000
	ldp x17, x4, [x19, #200]
	str x17, [sp, #80]
	movi.2d v24, #0000000000000000
	movi.2d v29, #0000000000000000
	movi.2d v31, #0000000000000000
	movi.2d v30, #0000000000000000
	movi.2d v11, #0000000000000000
	movi.2d v2, #0000000000000000
	str s2, [sp, #284]
	movi.2d v2, #0000000000000000
	str q2, [sp, #240]
	movi.2d v2, #0000000000000000
	str q2, [sp, #208]
	movi.2d v2, #0000000000000000
	str q2, [sp, #224]
	movi.2d v2, #0000000000000000
	str q2, [sp, #192]
	movi.2d v2, #0000000000000000
	str q2, [sp, #176]
	b LBB2066_43
LBB2066_41:
	add x5, x12, x26, lsl #2
	lsl x7, x26, #2
	add x3, x13, x7
	add x17, x15, x7
	sub x2, x6, x2
	sub x2, x2, x26
	dup.2d v12, x2
	add x2, x14, x7
Lloh15245:
	adrp x7, lCPI2066_0@PAGE
Lloh15246:
	ldr q2, [x7, lCPI2066_0@PAGEOFF]
	cmhi.2d v2, v2, v12
Lloh15247:
	adrp x7, lCPI2066_1@PAGE
Lloh15248:
	ldr q3, [x7, lCPI2066_1@PAGEOFF]
	cmhi.2d v3, v3, v12
	uzp1.4s v2, v3, v2
	sub x6, x6, x26
	dup.2d v13, x6
Lloh15249:
	adrp x6, lCPI2066_2@PAGE
Lloh15250:
	ldr q3, [x6, lCPI2066_2@PAGEOFF]
	cmhi.2d v3, v13, v3
Lloh15251:
	adrp x6, lCPI2066_3@PAGE
Lloh15252:
	ldr q5, [x6, lCPI2066_3@PAGEOFF]
	cmhi.2d v5, v13, v5
	uzp1.4s v3, v5, v3
	and.16b v14, v2, v3
	xtn.4h v10, v14
	ldp q9, q15, [x5]
	fsub.4s v2, v26, v15
	fmul.4s v3, v2, v2
	ldp q8, q5, [x3]
	fsub.4s v4, v25, v5
	fmul.4s v22, v4, v4
	fadd.4s v3, v3, v22
	fcmge.4s v22, v3, v27
	bic.16b v22, v14, v22
	ldur q16, [x29, #-256]
	fcmgt.4s v16, v16, v3
	mvn.16b v16, v16
	fcmgt.4s v27, v3, #0.0
	orn.16b v16, v16, v27
	orr.16b v16, v22, v16
	xtn.4h v16, v16
	bic.8b v16, v10, v16
	ushll.4s v16, v16, #0
	shl.4s v16, v16, #31
	cmlt.4s v16, v16, #0
	fmov.4s v22, #1.00000000
	and.16b v16, v16, v22
	ldp q27, q22, [x2]
	fmul.4s v22, v22, v16
	fadd.4s v19, v22, v19
	ldp q10, q22, [x17]
	fmul.4s v22, v22, v16
	fadd.4s v21, v22, v21
	fmul.4s v5, v5, v16
	fadd.4s v29, v5, v29
	fadd.4s v7, v16, v7
	fmul.4s v5, v15, v16
	fadd.4s v30, v5, v30
	ldr q5, [sp, #288]
	fcmgt.4s v3, v5, v3
	and.16b v3, v14, v3
	shl.4s v3, v3, #31
	cmlt.4s v3, v3, #0
	fmov.4s v5, #1.00000000
	and.16b v3, v3, v5
	fmul.4s v4, v4, v3
	fadd.4s v0, v4, v0
	fmul.4s v2, v2, v3
	fadd.4s v6, v2, v6
Lloh15253:
	adrp x17, lCPI2066_4@PAGE
Lloh15254:
	ldr q2, [x17, lCPI2066_4@PAGEOFF]
	cmhi.2d v2, v2, v12
Lloh15255:
	adrp x17, lCPI2066_5@PAGE
Lloh15256:
	ldr q3, [x17, lCPI2066_5@PAGEOFF]
	cmhi.2d v3, v3, v12
	uzp1.4s v2, v3, v2
Lloh15257:
	adrp x17, lCPI2066_6@PAGE
Lloh15258:
	ldr q3, [x17, lCPI2066_6@PAGEOFF]
	cmhi.2d v3, v13, v3
Lloh15259:
	adrp x17, lCPI2066_7@PAGE
Lloh15260:
	ldr q4, [x17, lCPI2066_7@PAGEOFF]
	cmhi.2d v4, v13, v4
	uzp1.4s v3, v4, v3
	and.16b v2, v2, v3
	xtn.4h v3, v2
	fsub.4s v4, v26, v9
	fmul.4s v5, v4, v4
	fsub.4s v16, v25, v8
	fmul.4s v22, v16, v16
	fadd.4s v5, v5, v22
	ldr q22, [sp, #288]
	fcmge.4s v22, v5, v22
	bic.16b v22, v2, v22
	ldur q12, [x29, #-256]
	fcmgt.4s v12, v12, v5
	mvn.16b v12, v12
	fcmgt.4s v13, v5, #0.0
	orn.16b v12, v12, v13
	orr.16b v22, v22, v12
	xtn.4h v22, v22
	bic.8b v3, v3, v22
	ushll.4s v3, v3, #0
	shl.4s v3, v3, #31
	cmlt.4s v3, v3, #0
	fmov.4s v22, #1.00000000
	and.16b v3, v3, v22
	fadd.4s v18, v3, v18
	fmul.4s v22, v27, v3
	ldr q27, [sp, #288]
	fadd.4s v23, v22, v23
	fmul.4s v22, v10, v3
	fadd.4s v24, v22, v24
	fmul.4s v22, v8, v3
	fadd.4s v31, v22, v31
	fmov.4s v22, #1.00000000
	fmul.4s v3, v9, v3
	fadd.4s v11, v3, v11
	fcmgt.4s v3, v27, v5
	and.16b v2, v2, v3
	shl.4s v2, v2, #31
	cmlt.4s v2, v2, #0
	and.16b v2, v2, v22
	fmul.4s v3, v16, v2
	ldur q16, [x29, #-256]
	fadd.4s v1, v3, v1
	fmul.4s v2, v4, v2
	fadd.4s v17, v2, v17
LBB2066_42:
	cmp x1, x0
	add x1, x1, #1
	b.eq LBB2066_91
LBB2066_43:
	mul x17, x16, x1
	ldp x2, x3, [sp, #160]
	add x2, x2, x17
	add x17, x17, x3
	cmp x17, x4
	ccmp x2, x4, #2, lo
	b.lo LBB2066_45
	mov x6, #0
	mov x17, #0
	b LBB2066_46
LBB2066_45:
	ldr x3, [sp, #80]
	ldr w17, [x3, x17, lsl #2]
	ldr w6, [x3, x2, lsl #2]
LBB2066_46:
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
	csel x23, x27, x21, ne
	add x21, x13, x17
	cmp w5, #0
	csel x24, xzr, x22, ne
	csel x25, x27, x21, ne
	lsr x5, x24, #3
	add x21, x15, x17
	cmp w3, #0
	csel x28, xzr, x22, ne
	csel x21, x27, x21, ne
	lsr x26, x28, #3
	add x17, x14, x17
	cmp w2, #0
	csel x22, xzr, x22, ne
	csel x3, x27, x17, ne
	lsr x17, x22, #3
	lsr x2, x7, #3
	cmp x5, x2
	csel x2, x5, x2, lo
	cmp x26, x2
	csel x2, x26, x2, lo
	cmp x17, x2
	csel x26, x17, x2, lo
	cbz x26, LBB2066_49
	add x30, x23, #16
	add x17, x3, #16
	add x2, x25, #16
	add x5, x21, #16
LBB2066_48:
	ldp q8, q9, [x30, #-16]
	fsub.4s v10, v26, v8
	ldp q12, q13, [x2, #-16]
	fsub.4s v14, v25, v12
	fmul.4s v15, v10, v10
	fmul.4s v3, v14, v14
	fadd.4s v3, v15, v3
	fcmgt.4s v15, v27, v3
	and.16b v15, v15, v22
	fcmge.4s v5, v3, v27
	fcmgt.4s v2, v16, v3
	fcmgt.4s v3, v3, #0.0
	mvn.16b v3, v3
	orn.16b v3, v3, v5
	orn.16b v2, v3, v2
	bic.16b v2, v22, v2
	fmul.4s v3, v10, v15
	fadd.4s v17, v17, v3
	fmul.4s v3, v14, v15
	fadd.4s v1, v1, v3
	fmul.4s v3, v8, v2
	fadd.4s v11, v11, v3
	fmul.4s v3, v12, v2
	fadd.4s v31, v3, v31
	ldp q3, q5, [x5, #-16]
	fmul.4s v3, v3, v2
	fadd.4s v24, v3, v24
	ldp q3, q8, [x17, #-16]
	fmul.4s v3, v3, v2
	fadd.4s v23, v3, v23
	fadd.4s v18, v2, v18
	fsub.4s v2, v26, v9
	fsub.4s v3, v25, v13
	fmul.4s v10, v2, v2
	fmul.4s v12, v3, v3
	fadd.4s v10, v10, v12
	fcmgt.4s v12, v27, v10
	and.16b v12, v12, v22
	fcmge.4s v14, v10, v27
	fcmgt.4s v15, v16, v10
	fcmgt.4s v10, v10, #0.0
	mvn.16b v10, v10
	orn.16b v10, v10, v14
	orn.16b v10, v10, v15
	bic.16b v10, v22, v10
	fmul.4s v2, v2, v12
	fadd.4s v6, v6, v2
	fmul.4s v2, v3, v12
	fadd.4s v0, v0, v2
	fmul.4s v2, v9, v10
	fadd.4s v30, v30, v2
	fmul.4s v2, v13, v10
	fadd.4s v29, v2, v29
	fmul.4s v2, v5, v10
	fadd.4s v21, v2, v21
	fmul.4s v2, v8, v10
	fadd.4s v19, v2, v19
	add x30, x30, #32
	fadd.4s v7, v10, v7
	add x17, x17, #32
	add x2, x2, #32
	add x5, x5, #32
	subs x26, x26, #1
	b.ne LBB2066_48
LBB2066_49:
	subs x17, x6, #8
	csel x26, xzr, x17, lo
	and x2, x7, #0x7
	cbz x2, LBB2066_51
	add x17, x26, #8
	ldr x5, [sp, #88]
	cmp x17, x5
	ccmp x17, x8, #2, ls
	b.ls LBB2066_41
LBB2066_51:
	and x17, x24, #0x7
	and x5, x28, #0x7
	and x6, x22, #0x7
	cmp x17, x2
	csel x17, x17, x2, lo
	cmp x5, x17
	csel x17, x5, x17, lo
	cmp x6, x17
	csel x30, x6, x17, lo
	cbz x30, LBB2066_42
	and x17, x7, #0xfffffff8
	add x26, x23, x17, lsl #2
	and x17, x24, #0xfffffff8
	add x23, x25, x17, lsl #2
	and x17, x28, #0xfffffff8
	add x6, x21, x17, lsl #2
	and x17, x22, #0xfffffff8
	add x7, x3, x17, lsl #2
	ldr s2, [x26]
	ldr s3, [x23]
	ldr s4, [x6]
	ldr s5, [x7]
	ldp q20, q16, [sp, #128]
	fsub s16, s16, s2
	fsub s22, s20, s3
	fmul s27, s16, s16
	fmul s8, s22, s22
	fadd s27, s27, s8
	ldp q13, q20, [sp, #240]
	fadd s16, s20, s16
	ldr s10, [sp, #284]
	fadd s22, s10, s22
	fcmp s27, #0.0
	ldp q28, q12, [sp, #176]
	fadd s2, s28, s2
	fadd s3, s12, s3
	ldp q15, q14, [sp, #208]
	fadd s4, s14, s4
	fadd s5, s15, s5
	fmov s8, #1.00000000
	fadd s8, s13, s8
	fcsel s8, s8, s13, gt
	fcsel s5, s5, s15, gt
	fcsel s4, s4, s14, gt
	fcsel s3, s3, s12, gt
	fcsel s2, s2, s28, gt
	ldr q9, [sp, #96]
	.p2align	6, , 4
	fcmp s27, s9
	fcsel s8, s13, s8, pl
	fcsel s5, s15, s5, pl
	fcsel s4, s14, s4, pl
	fcsel s3, s12, s3, pl
	fcsel s2, s28, s2, pl
	ldr q9, [sp, #112]
	fcmp s27, s9
	ldr q27, [sp, #112]
	fcsel s10, s22, s10, mi
	str s10, [sp, #284]
	fcsel s20, s16, s20, mi
	fcsel s13, s13, s8, mi
	stp q13, q20, [sp, #240]
	fcsel s15, s15, s5, mi
	fcsel s14, s14, s4, mi
	stp q15, q14, [sp, #208]
	fcsel s12, s12, s3, mi
	fcsel s28, s28, s2, mi
	stp q28, q12, [sp, #176]
	cmp x30, #1
	b.ne LBB2066_55
	ldur q16, [x29, #-256]
	ldr q27, [sp, #288]
	fmov.4s v22, #1.00000000
	b LBB2066_42
LBB2066_55:
	ldr s8, [x26, #4]
	ldr s9, [x23, #4]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	ldur q16, [x29, #-256]
	fmov.4s v22, #1.00000000
	b.pl LBB2066_57
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	b LBB2066_60
LBB2066_57:
	ldr q2, [sp, #96]
	fcmp s13, s2
	b.pl LBB2066_60
	fcmp s13, #0.0
	b.le LBB2066_60
	ldr s2, [x6, #4]
	ldr s3, [x7, #4]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
LBB2066_60:
	cmp x30, #2
	b.eq LBB2066_85
	ldr s8, [x26, #8]
	ldr s9, [x23, #8]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	b.pl LBB2066_63
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	b LBB2066_66
LBB2066_63:
	ldr q2, [sp, #96]
	fcmp s13, s2
	b.pl LBB2066_66
	fcmp s13, #0.0
	b.le LBB2066_66
	ldr s2, [x6, #8]
	ldr s3, [x7, #8]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
LBB2066_66:
	cmp x30, #3
	b.eq LBB2066_85
	ldr s8, [x26, #12]
	ldr s9, [x23, #12]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	b.pl LBB2066_69
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	b LBB2066_72
LBB2066_69:
	ldr q2, [sp, #96]
	fcmp s13, s2
	b.pl LBB2066_72
	fcmp s13, #0.0
	b.le LBB2066_72
	ldr s2, [x6, #12]
	ldr s3, [x7, #12]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
LBB2066_72:
	cmp x30, #4
	b.eq LBB2066_85
	ldr s8, [x26, #16]
	ldr s9, [x23, #16]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	b.pl LBB2066_75
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	b LBB2066_78
LBB2066_75:
	ldr q2, [sp, #96]
	fcmp s13, s2
	b.pl LBB2066_78
	fcmp s13, #0.0
	b.le LBB2066_78
	ldr s2, [x6, #16]
	ldr s3, [x7, #16]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
LBB2066_78:
	cmp x30, #5
	b.eq LBB2066_85
	ldr s8, [x26, #20]
	ldr s9, [x23, #20]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	b.pl LBB2066_81
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	b LBB2066_84
LBB2066_81:
	ldr q2, [sp, #96]
	fcmp s13, s2
	b.pl LBB2066_84
	fcmp s13, #0.0
	b.le LBB2066_84
	ldr s2, [x6, #20]
	ldr s3, [x7, #20]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
LBB2066_84:
	cmp x30, #6
	b.ne LBB2066_86
LBB2066_85:
	ldr q27, [sp, #288]
	b LBB2066_42
LBB2066_86:
	ldr s8, [x26, #24]
	ldr s9, [x23, #24]
	ldp q2, q3, [sp, #128]
	fsub s10, s3, s8
	fsub s12, s2, s9
	fmul s2, s10, s10
	fmul s3, s12, s12
	fadd s13, s2, s3
	fcmp s13, s27
	b.pl LBB2066_88
	ldr q2, [sp, #256]
	fadd s2, s2, s10
	str q2, [sp, #256]
	ldr s2, [sp, #284]
	fadd s2, s2, s12
	str s2, [sp, #284]
	ldr q27, [sp, #288]
	b LBB2066_42
LBB2066_88:
	ldr q2, [sp, #96]
	fcmp s13, s2
	ldr q27, [sp, #288]
	b.pl LBB2066_42
	fcmp s13, #0.0
	b.le LBB2066_42
	ldr s2, [x6, #24]
	ldr s3, [x7, #24]
	ldr q4, [sp, #176]
	fadd s4, s4, s8
	str q4, [sp, #176]
	ldr q4, [sp, #192]
	fadd s4, s4, s9
	str q4, [sp, #192]
	ldr q4, [sp, #224]
	fadd s4, s4, s2
	ldr q2, [sp, #208]
	fadd s2, s2, s3
	stp q2, q4, [sp, #208]
	fmov s2, #1.00000000
	ldr q3, [sp, #240]
	fadd s3, s3, s2
	str q3, [sp, #240]
	b LBB2066_42
LBB2066_91:
	faddp.2s v2, v11, v31
	mov d3, v31[1]
	mov d4, v11[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	fadd.2s v2, v2, v3
	zip1.2s v3, v30, v29
	fadd.2s v2, v2, v3
	zip2.2s v3, v30, v29
	fadd.2s v2, v2, v3
	mov d3, v29[1]
	mov d4, v30[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	fadd.2s v2, v2, v3
	ldp q4, q3, [sp, #176]
	mov.s v4[1], v3[0]
	fadd.2s v25, v4, v2
	faddp.2s v2, v24, v23
	mov d3, v23[1]
	mov d4, v24[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	fadd.2s v2, v2, v3
	zip1.2s v3, v21, v19
	fadd.2s v2, v2, v3
	zip2.2s v3, v21, v19
	fadd.2s v2, v2, v3
	mov d3, v19[1]
	mov d4, v21[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	ldp q5, q4, [sp, #208]
	mov.s v4[1], v5[0]
	fadd.2s v2, v2, v3
	fadd.2s v19, v4, v2
	faddp.2s v2, v18, v17
	mov d3, v17[1]
	mov d4, v18[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	fadd.2s v2, v2, v3
	zip1.2s v3, v7, v6
	fadd.2s v2, v2, v3
	zip2.2s v3, v7, v6
	fadd.2s v2, v2, v3
	mov d3, v6[1]
	mov d4, v7[1]
	zip1.2s v5, v4, v3
	fadd.2s v2, v2, v5
	zip2.2s v3, v4, v3
	fadd.2s v2, v2, v3
	ldp q3, q4, [sp, #240]
	mov.s v3[1], v4[0]
	fadd.2s v2, v3, v2
	dup.4s v3, v1[1]
	fadd.4s v3, v1, v3
	dup.4s v4, v1[2]
	fadd.4s v3, v3, v4
	dup.4s v1, v1[3]
	fadd.4s v1, v3, v1
	fadd.4s v1, v1, v0
	dup.4s v3, v0[1]
	dup.4s v4, v0[2]
	fadd.4s v1, v1, v3
	fadd.4s v1, v1, v4
	dup.4s v0, v0[3]
	fadd.4s v0, v1, v0
	ldr s1, [sp, #284]
	fadd s0, s1, s0
	ldr s10, [sp, #12]
	movi.2s v8, #90, lsl #24
LBB2066_92:
	stp d25, d19, [x29, #-216]
	stur d2, [x29, #-200]
	stur s0, [x29, #-192]
	sub x0, x29, #184
	add x1, x19, #316
	sub x2, x29, #168
	sub x3, x29, #232
	sub x4, x29, #216
	ldr q0, [sp, #64]
	mov.16b v1, v10
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
	add sp, sp, #416
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
	.loh AdrpLdr	Lloh15259, Lloh15260
	.loh AdrpAdrp	Lloh15257, Lloh15259
	.loh AdrpLdr	Lloh15257, Lloh15258
	.loh AdrpAdrp	Lloh15255, Lloh15257
	.loh AdrpLdr	Lloh15255, Lloh15256
	.loh AdrpAdrp	Lloh15253, Lloh15255
	.loh AdrpLdr	Lloh15253, Lloh15254
	.loh AdrpLdr	Lloh15251, Lloh15252
	.loh AdrpAdrp	Lloh15249, Lloh15251
	.loh AdrpLdr	Lloh15249, Lloh15250
	.loh AdrpLdr	Lloh15247, Lloh15248
	.loh AdrpAdrp	Lloh15245, Lloh15247
	.loh AdrpLdr	Lloh15245, Lloh15246
