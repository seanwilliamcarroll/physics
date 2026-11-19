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
	sub sp, sp, #464
	mov x19, x0
	ldr x8, [x0, #304]
	stur x8, [x29, #-200]
	ldr w8, [x0, #312]
	stur w8, [x29, #-192]
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
	mov s2, v3[1]
	str s2, [sp, #60]
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
	cbz x13, LBB2066_97
	mov x20, #0
	ldr s0, [x19, #316]
	ldr s1, [x19, #320]
	fmul s1, s1, s1
	fmul s0, s0, s0
	cmp x9, x8
	csel x8, x9, x8, lo
	dup.4s v30, v0[0]
	dup.4s v31, v1[0]
	cmp x10, x8
	csel x8, x10, x8, lo
	cmp x11, x8
	csel x8, x11, x8, lo
	stp x8, x13, [sp, #40]
	mov w27, #4
	fmov.4s v28, #1.00000000
	str q1, [sp, #240]
	str q0, [sp, #144]
	str q30, [sp, #176]
	str q31, [sp, #272]
	b LBB2066_36
LBB2066_34:
	ldr x13, [sp, #48]
	ldr q30, [sp, #176]
	ldr q31, [sp, #272]
	fmov.4s v28, #1.00000000
LBB2066_35:
	add x20, x20, #1
	cmp x20, x13
	b.eq LBB2066_97
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
	ldr s8, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s5, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s0, [x15, x20, lsl #2]
	ldr s1, [x14, x20, lsl #2]
	stp s8, s5, [x29, #-256]
	stp s0, s1, [x29, #-248]
	stp xzr, xzr, [x29, #-240]
	stur wzr, [x29, #-216]
	stur xzr, [x29, #-224]
	ldr s1, [x19, #280]
	fmul s2, s8, s1
	movi.2d v0, #0000000000000000
	fmaxnm s2, s2, s0
	fcvt d3, s2
	fcvtzu x0, d3
	ldp x16, x1, [x19, #264]
	subs x17, x16, #1
	csel x17, xzr, x17, lo
	cmp x17, x0
	csel x0, x17, x0, lo
	movi.2s v3, #90, lsl #24
	fcmp s2, s3
	csel x2, x0, xzr, lt
	fmul s1, s5, s1
	fmaxnm s1, s1, s0
	fcvt d2, s1
	fcvtzu x0, d2
	subs x1, x1, #1
	csel x3, xzr, x1, lo
	cmp x3, x0
	csel x0, x3, x0, lo
	fcmp s1, s3
	csel x0, x0, xzr, lt
	subs x1, x2, #1
	csel x1, xzr, x1, lo
	str x1, [sp, #264]
	subs x1, x0, #1
	csel x1, xzr, x1, lo
	add x4, x0, #1
	cmp x3, x4
	csinc x0, x3, x0, lo
	cmp x1, x0
	b.ls LBB2066_41
	movi d2, #0000000000000000
	movi.2d v4, #0000000000000000
	b LBB2066_95
LBB2066_41:
	dup.4s v25, v5[0]
	dup.4s v26, v8[0]
	movi d0, #0000000000000000
	str d0, [sp, #296]
	add x3, x2, #1
	movi.2d v0, #0000000000000000
	str s0, [sp, #344]
	cmp x17, x3
	movi.2d v2, #0000000000000000
	csinc x17, x17, x2, lo
	movi.2d v0, #0000000000000000
	movi.2d v24, #0000000000000000
	cmp x10, x11
	csel x2, x10, x11, lo
	movi.2d v6, #0000000000000000
	add x17, x17, #1
	str x17, [sp, #200]
	movi.2d v4, #0000000000000000
	movi.2d v7, #0000000000000000
	cmp x9, x2
	csel x17, x9, x2, lo
	str x17, [sp, #80]
	movi.2d v16, #0000000000000000
	movi.2d v20, #0000000000000000
	ldp x17, x4, [x19, #200]
	str x17, [sp, #88]
	movi.2d v17, #0000000000000000
	movi.2d v21, #0000000000000000
	movi.2d v18, #0000000000000000
	movi.2d v22, #0000000000000000
	movi.2d v19, #0000000000000000
	movi.2d v23, #0000000000000000
	movi.2d v1, #0000000000000000
	str s1, [sp, #340]
	str s1, [sp, #292]
	str s1, [sp, #304]
	str s1, [sp, #308]
	movi.2d v15, #0000000000000000
	str s1, [sp, #348]
	str s1, [sp, #332]
	str s1, [sp, #316]
	str s1, [sp, #312]
	movi d1, #0000000000000000
	str d1, [sp, #320]
	str q5, [sp, #160]
	stp q26, q25, [sp, #112]
	str q8, [sp, #96]
	b LBB2066_44
LBB2066_42:
	ldr q30, [sp, #176]
	ldr q31, [sp, #272]
	ldp q26, q25, [sp, #112]
	ldr q8, [sp, #96]
LBB2066_43:
	cmp x1, x0
	add x1, x1, #1
	b.eq LBB2066_94
LBB2066_44:
	mul x17, x16, x1
	ldr x2, [sp, #200]
	add x2, x2, x17
	ldr x3, [sp, #264]
	add x17, x17, x3
	cmp x17, x4
	ccmp x2, x4, #2, lo
	b.lo LBB2066_46
	mov x6, #0
	mov x17, #0
	b LBB2066_47
LBB2066_46:
	ldr x3, [sp, #88]
	ldr w17, [x3, x17, lsl #2]
	ldr w6, [x3, x2, lsl #2]
LBB2066_47:
	mov.16b v29, v8
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
	csel x3, xzr, x22, ne
	csel x22, x27, x17, ne
	lsr x17, x3, #3
	lsr x2, x7, #3
	cmp x5, x2
	csel x2, x5, x2, lo
	cmp x28, x2
	csel x2, x28, x2, lo
	cmp x17, x2
	csel x28, x17, x2, lo
	cbz x28, LBB2066_50
	add x30, x21, #16
	add x2, x22, #16
	add x5, x23, #16
	add x17, x25, #16
LBB2066_49:
	ldp q1, q3, [x30, #-16]
	fsub.4s v5, v26, v1
	ldp q10, q11, [x5, #-16]
	fsub.4s v27, v25, v10
	fmul.4s v12, v5, v5
	fmul.4s v13, v27, v27
	fadd.4s v12, v12, v13
	fcmgt.4s v13, v31, v12
	and.16b v13, v13, v28
	fcmge.4s v8, v12, v31
	fcmgt.4s v9, v30, v12
	fcmgt.4s v12, v12, #0.0
	mvn.16b v12, v12
	orn.16b v8, v12, v8
	orn.16b v8, v8, v9
	bic.16b v8, v28, v8
	fmul.4s v5, v5, v13
	fadd.4s v6, v6, v5
	fmul.4s v5, v27, v13
	fadd.4s v24, v24, v5
	fmul.4s v1, v1, v8
	fadd.4s v23, v23, v1
	fmul.4s v1, v10, v8
	fadd.4s v22, v1, v22
	ldp q1, q5, [x17, #-16]
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
	and.16b v10, v10, v28
	fcmge.4s v12, v9, v31
	fcmgt.4s v13, v30, v9
	fcmgt.4s v9, v9, #0.0
	mvn.16b v9, v9
	orn.16b v9, v9, v12
	orn.16b v9, v9, v13
	bic.16b v9, v28, v9
	fmul.4s v1, v1, v10
	fadd.4s v2, v2, v1
	fmul.4s v1, v8, v10
	fadd.4s v0, v0, v1
	fmul.4s v1, v3, v9
	fadd.4s v19, v19, v1
	fmul.4s v1, v11, v9
	fadd.4s v18, v1, v18
	fmul.4s v1, v5, v9
	fadd.4s v17, v1, v17
	fmul.4s v1, v27, v9
	fadd.4s v16, v1, v16
	add x30, x30, #32
	fadd.4s v4, v9, v4
	add x2, x2, #32
	add x5, x5, #32
	add x17, x17, #32
	subs x28, x28, #1
	b.ne LBB2066_49
LBB2066_50:
	subs x17, x6, #8
	csel x2, xzr, x17, lo
	and x17, x7, #0x7
	cbz x17, LBB2066_53
	add x5, x2, #8
	cmp x5, x8
	b.hi LBB2066_53
	ldr x28, [sp, #80]
	cmp x5, x28
	b.ls LBB2066_57
LBB2066_53:
	and x2, x26, #0x7
	and x5, x24, #0x7
	and x6, x3, #0x7
	cmp x2, x17
	csel x17, x2, x17, lo
	cmp x5, x17
	csel x17, x5, x17, lo
	cmp x6, x17
	csel x30, x6, x17, lo
	mov.16b v8, v29
	cbz x30, LBB2066_43
	and x17, x7, #0xfffffff8
	add x28, x21, x17, lsl #2
	and x17, x26, #0xfffffff8
	add x21, x23, x17, lsl #2
	and x17, x24, #0xfffffff8
	add x6, x25, x17, lsl #2
	and x17, x3, #0xfffffff8
	add x7, x22, x17, lsl #2
	ldr s25, [x28]
	ldr s1, [x21]
	ldr s26, [x6]
	ldr s27, [x7]
	fsub s30, s8, s25
	ldr q3, [sp, #160]
	fsub s31, s3, s1
	fmul s8, s30, s30
	fmul s9, s31, s31
	fadd s8, s8, s9
	ldr s10, [sp, #348]
	fadd s5, s10, s30
	fadd s3, s15, s31
	stp s3, s5, [sp, #232]
	fcmp s8, #0.0
	ldr s5, [sp, #312]
	fadd s25, s5, s25
	ldr s3, [sp, #316]
	fadd s30, s3, s1
	ldr s1, [sp, #332]
	fadd s31, s1, s26
	fmov.2s v9, #1.00000000
	mov.s v9[0], v27[0]
	ldr d29, [sp, #320]
	fadd.2s v27, v29, v9
	ldr s26, [sp, #292]
	fcsel s9, s31, s26, gt
	ldr s13, [sp, #304]
	fcsel s11, s30, s13, gt
	str s11, [sp, #228]
	str s15, [sp, #336]
	ldr s15, [sp, #308]
	fcsel s11, s25, s15, gt
	fcsel s31, s31, s1, gt
	str s31, [sp, #224]
	fcsel s31, s30, s3, gt
	fcsel s30, s25, s5, gt
	ldr d25, [sp, #296]
	fcsel d12, d27, d25, gt
	fcsel d27, d27, d29, gt
	str d27, [sp, #208]
	ldr q14, [sp, #144]
	fcmp s8, s14
	ldr q27, [sp, #240]
	fcsel s9, s26, s9, pl
	str s9, [sp, #220]
	ldr s9, [sp, #228]
	fcsel s14, s13, s9, pl
	fcsel s11, s15, s11, pl
	ldr s9, [sp, #224]
	fcsel s9, s1, s9, pl
	fcsel s31, s3, s31, pl
	fcsel s30, s5, s30, pl
	stp s9, s30, [sp, #224]
	fcsel d12, d25, d12, pl
	ldr d30, [sp, #208]
	fcsel d9, d29, d30, pl
	fcmp s8, s27
	ldr s8, [sp, #344]
	ldp s30, s27, [sp, #232]
	fcsel s8, s30, s8, mi
	str s8, [sp, #344]
	ldr s8, [sp, #340]
	fcsel s8, s27, s8, mi
	str s8, [sp, #340]
	ldr s8, [sp, #220]
	fcsel s26, s26, s8, mi
	str s26, [sp, #292]
	fcsel s13, s13, s14, mi
	str s13, [sp, #304]
	fcsel s15, s15, s11, mi
	str s15, [sp, #308]
	ldr s15, [sp, #336]
	fcsel s15, s30, s15, mi
	fcsel s10, s27, s10, mi
	str s10, [sp, #348]
	ldr s26, [sp, #224]
	fcsel s1, s1, s26, mi
	str s1, [sp, #332]
	fcsel s3, s3, s31, mi
	str s3, [sp, #316]
	ldr s1, [sp, #228]
	fcsel s5, s5, s1, mi
	str s5, [sp, #312]
	fcsel d25, d25, d12, mi
	str d25, [sp, #296]
	fcsel d29, d29, d9, mi
	str d29, [sp, #320]
	cmp x30, #1
	b.eq LBB2066_42
	ldr s10, [x28, #4]
	ldr s11, [x21, #4]
	ldp q8, q26, [sp, #96]
	fsub s3, s8, s10
	ldp q9, q30, [sp, #160]
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q25, [sp, #240]
	fcmp s1, s25
	ldr q31, [sp, #272]
	ldr q25, [sp, #128]
	b.pl LBB2066_59
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_62
LBB2066_57:
	fmov.4s v11, #1.00000000
	sub x3, x6, x2
	cmp x3, #8
	str s15, [sp, #336]
	b.ne LBB2066_65
Lloh15245:
	adrp x3, swarm::rules::lanes::STEPS@PAGE
Lloh15246:
	add x3, x3, swarm::rules::lanes::STEPS@PAGEOFF
	add x17, x3, x17, lsl #2
	add x17, x17, #224
	b LBB2066_66
LBB2066_59:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_62
	fcmp s1, #0.0
	b.le LBB2066_62
	ldr s1, [x6, #4]
	ldr s3, [x7, #4]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
LBB2066_62:
	cmp x30, #2
	b.eq LBB2066_43
	ldr s10, [x28, #8]
	ldr s11, [x21, #8]
	fsub s3, s8, s10
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q27, [sp, #240]
	fcmp s1, s27
	b.pl LBB2066_67
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_70
LBB2066_65:
	subs x17, x3, x17
	movi.2d v28, #0000000000000000
	fmov s9, #1.00000000
	fcsel s1, s9, s28, eq
Lloh15247:
	adrp x5, lCPI2066_0@PAGE
Lloh15248:
	ldr q3, [x5, lCPI2066_0@PAGEOFF]
	dup.2d v5, x3
	cmhi.2d v3, v5, v3
Lloh15249:
	adrp x5, lCPI2066_1@PAGE
Lloh15250:
	ldr q27, [x5, lCPI2066_1@PAGEOFF]
	cmhi.2d v27, v5, v27
Lloh15251:
	adrp x5, lCPI2066_2@PAGE
Lloh15252:
	ldr q8, [x5, lCPI2066_2@PAGEOFF]
	cmhi.2d v5, v5, v8
	cmp x17, #8
	ccmp x3, #7, #0, lo
	fcsel s8, s9, s28, hi
	stur s1, [x29, #-184]
Lloh15253:
	adrp x3, lCPI2066_3@PAGE
Lloh15254:
	ldr q1, [x3, lCPI2066_3@PAGEOFF]
	dup.2d v9, x17
	cmhi.2d v1, v1, v9
Lloh15255:
	adrp x17, lCPI2066_4@PAGE
Lloh15256:
	ldr q10, [x17, lCPI2066_4@PAGEOFF]
	cmhi.2d v10, v10, v9
	and.16b v27, v27, v10
	and.16b v1, v3, v1
	uzp1.4s v1, v1, v27
	and.16b v1, v1, v11
	stur q1, [x29, #-180]
Lloh15257:
	adrp x17, lCPI2066_5@PAGE
Lloh15258:
	ldr q1, [x17, lCPI2066_5@PAGEOFF]
	cmhi.2d v1, v1, v9
	and.16b v1, v5, v1
	xtn.2s v1, v1
	fmov.2s v3, #1.00000000
	and.8b v1, v1, v3
	stur d1, [x29, #-164]
	stur s8, [x29, #-156]
	sub x17, x29, #184
LBB2066_66:
	add x5, x12, x2, lsl #2
	add x6, x13, x2, lsl #2
	lsl x3, x2, #2
	add x2, x15, x3
	add x3, x14, x3
	ldp q11, q10, [x5]
	fsub.4s v1, v26, v10
	fmul.4s v3, v1, v1
	ldp q27, q5, [x6]
	fsub.4s v8, v25, v5
	fmul.4s v9, v8, v8
	fadd.4s v3, v3, v9
	fcmge.4s v9, v3, v31
	fcmgt.4s v12, v30, v3
	fcmgt.4s v13, v3, #0.0
	and.16b v12, v12, v13
	and.16b v9, v9, v12
	ldp q13, q12, [x17]
	movi.2d v28, #0000000000000000
	fmul.4s v30, v12, v28
	bsl.16b v9, v12, v30
	ldp q14, q31, [x3]
	fmul.4s v31, v31, v9
	fadd.4s v16, v31, v16
	ldp q15, q31, [x2]
	fmul.4s v31, v31, v9
	fadd.4s v17, v31, v17
	fmul.4s v5, v5, v9
	fadd.4s v18, v5, v18
	fadd.4s v4, v9, v4
	fmul.4s v5, v10, v9
	fadd.4s v19, v5, v19
	ldr q5, [sp, #272]
	fcmgt.4s v3, v5, v3
	bsl.16b v3, v12, v30
	fmul.4s v5, v8, v3
	fadd.4s v0, v5, v0
	fmul.4s v1, v1, v3
	fadd.4s v2, v1, v2
	fsub.4s v1, v26, v11
	fmul.4s v3, v1, v1
	fsub.4s v5, v25, v27
	fmul.4s v30, v5, v5
	fadd.4s v3, v3, v30
	ldr q30, [sp, #176]
	fcmgt.4s v30, v30, v3
	fcmgt.4s v31, v3, #0.0
	and.16b v30, v30, v31
	ldr q31, [sp, #272]
	fcmge.4s v31, v3, v31
	and.16b v30, v31, v30
	fmul.4s v31, v13, v28
	bsl.16b v30, v13, v31
	fmul.4s v8, v14, v30
	fadd.4s v20, v8, v20
	fadd.4s v7, v30, v7
	fmul.4s v8, v15, v30
	fadd.4s v21, v8, v21
	fmul.4s v27, v27, v30
	fadd.4s v22, v27, v22
	fmul.4s v27, v11, v30
	ldr q30, [sp, #176]
	fadd.4s v23, v27, v23
	ldr q27, [sp, #272]
	fcmgt.4s v3, v27, v3
	bsl.16b v3, v13, v31
	ldr q31, [sp, #272]
	fmul.4s v5, v5, v3
	fadd.4s v24, v5, v24
	fmul.4s v1, v1, v3
	fadd.4s v6, v1, v6
	fmov.4s v28, #1.00000000
	mov.16b v8, v29
	ldr s15, [sp, #336]
	b LBB2066_43
LBB2066_67:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_70
	fcmp s1, #0.0
	b.le LBB2066_70
	ldr s1, [x6, #8]
	ldr s3, [x7, #8]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
LBB2066_70:
	cmp x30, #3
	b.eq LBB2066_43
	ldr s10, [x28, #12]
	ldr s11, [x21, #12]
	fsub s3, s8, s10
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q27, [sp, #240]
	fcmp s1, s27
	b.pl LBB2066_73
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_76
LBB2066_73:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_76
	fcmp s1, #0.0
	b.le LBB2066_76
	ldr s1, [x6, #12]
	ldr s3, [x7, #12]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
LBB2066_76:
	cmp x30, #4
	b.eq LBB2066_43
	ldr s10, [x28, #16]
	ldr s11, [x21, #16]
	fsub s3, s8, s10
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q27, [sp, #240]
	fcmp s1, s27
	b.pl LBB2066_79
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_82
LBB2066_79:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_82
	fcmp s1, #0.0
	b.le LBB2066_82
	ldr s1, [x6, #16]
	ldr s3, [x7, #16]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
LBB2066_82:
	cmp x30, #5
	b.eq LBB2066_43
	ldr s10, [x28, #20]
	ldr s11, [x21, #20]
	fsub s3, s8, s10
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q27, [sp, #240]
	fcmp s1, s27
	b.pl LBB2066_85
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_88
LBB2066_85:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_88
	fcmp s1, #0.0
	b.le LBB2066_88
	ldr s1, [x6, #20]
	ldr s3, [x7, #20]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
LBB2066_88:
	cmp x30, #6
	b.eq LBB2066_43
	ldr s10, [x28, #24]
	ldr s11, [x21, #24]
	fsub s3, s8, s10
	fsub s5, s9, s11
	fmul s1, s3, s3
	fmul s27, s5, s5
	fadd s1, s1, s27
	ldr q27, [sp, #240]
	fcmp s1, s27
	b.pl LBB2066_91
	ldr s1, [sp, #348]
	fadd s3, s1, s3
	fadd s15, s15, s5
	str s15, [sp, #344]
	str s3, [sp, #340]
	str s3, [sp, #348]
	b LBB2066_43
LBB2066_91:
	ldr q3, [sp, #144]
	fcmp s1, s3
	b.pl LBB2066_43
	fcmp s1, #0.0
	b.le LBB2066_43
	ldr s1, [x6, #24]
	ldr s3, [x7, #24]
	ldr s5, [sp, #312]
	fadd s27, s5, s10
	ldr s5, [sp, #316]
	fadd s29, s5, s11
	fmov.2s v5, #1.00000000
	mov.s v5[0], v3[0]
	ldr s3, [sp, #332]
	fadd s3, s3, s1
	ldr d1, [sp, #320]
	fadd.2s v1, v1, v5
	str s3, [sp, #292]
	str s3, [sp, #332]
	str s29, [sp, #304]
	str s29, [sp, #316]
	str s27, [sp, #308]
	str s27, [sp, #312]
	str d1, [sp, #296]
	str d1, [sp, #320]
	b LBB2066_43
LBB2066_94:
	ldr s3, [sp, #308]
	ldr s1, [sp, #304]
	stp s3, s1, [x29, #-240]
	ldr s1, [sp, #292]
	stur s1, [x29, #-232]
	ldr d1, [sp, #296]
	stur d1, [x29, #-228]
	ldr s1, [sp, #340]
	ldr s25, [sp, #344]
	stp s1, s25, [x29, #-220]
	dup.4s v1, v24[1]
	fadd.4s v1, v24, v1
	dup.4s v3, v24[2]
	fadd.4s v1, v1, v3
	dup.4s v3, v24[3]
	fadd.4s v1, v1, v3
	zip1.4s v5, v23, v22
	mov.s v5[2], v21[0]
	fadd.4s v3, v1, v0
	mov.s v5[3], v20[0]
	trn2.4s v1, v23, v22
	mov.s v1[2], v21[1]
	mov.s v1[3], v20[1]
	fadd.4s v1, v5, v1
	zip2.4s v5, v23, v22
	mov.s v5[2], v21[2]
	mov.s v5[3], v20[2]
	uzp2.4s v22, v23, v22
	uzp2.4s v22, v22, v23
	mov.s v22[2], v21[3]
	fadd.4s v1, v1, v5
	mov.s v22[3], v20[3]
	zip1.4s v5, v19, v18
	mov.s v5[2], v17[0]
	fadd.4s v1, v1, v22
	mov.s v5[3], v16[0]
	trn2.4s v20, v19, v18
	mov.s v20[2], v17[1]
	fadd.4s v1, v1, v5
	mov.s v20[3], v16[1]
	zip2.4s v5, v19, v18
	mov.s v5[2], v17[2]
	fadd.4s v1, v1, v20
	mov.s v5[3], v16[2]
	fadd.4s v1, v1, v5
	uzp2.4s v5, v19, v18
	uzp2.4s v5, v5, v19
	mov.s v5[2], v17[3]
	mov.s v5[3], v16[3]
	fadd.4s v1, v1, v5
	ldur q5, [x29, #-240]
	faddp.2s v16, v7, v6
	mov d6, v6[1]
	mov d7, v7[1]
	zip1.2s v17, v7, v6
	fadd.2s v16, v16, v17
	zip2.2s v6, v7, v6
	fadd.2s v6, v16, v6
	zip1.2s v7, v4, v2
	fadd.2s v6, v6, v7
	zip2.2s v7, v4, v2
	fadd.2s v6, v6, v7
	mov d2, v2[1]
	mov d4, v4[1]
	zip1.2s v7, v4, v2
	fadd.2s v6, v6, v7
	zip2.2s v2, v4, v2
	fadd.2s v2, v6, v2
	ldur d6, [x29, #-224]
	fadd.4s v4, v1, v5
	fadd.2s v2, v2, v6
	dup.4s v1, v0[1]
	dup.4s v5, v0[2]
	fadd.4s v1, v3, v1
	fadd.4s v1, v1, v5
	dup.4s v0, v0[3]
	fadd.4s v0, v1, v0
	fadd s0, s0, s25
LBB2066_95:
	stur q4, [x29, #-240]
	stur d2, [x29, #-224]
	stur s0, [x29, #-216]
	sub x0, x29, #184
	add x1, x19, #316
	sub x2, x29, #200
	sub x3, x29, #256
	sub x4, x29, #240
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
LBB2066_97:
	add sp, sp, #464
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
	.loh AdrpAdd	Lloh15245, Lloh15246
	.loh AdrpLdr	Lloh15257, Lloh15258
	.loh AdrpAdrp	Lloh15255, Lloh15257
	.loh AdrpLdr	Lloh15255, Lloh15256
	.loh AdrpLdr	Lloh15253, Lloh15254
	.loh AdrpLdr	Lloh15251, Lloh15252
	.loh AdrpAdrp	Lloh15249, Lloh15251
	.loh AdrpLdr	Lloh15249, Lloh15250
	.loh AdrpAdrp	Lloh15247, Lloh15249
	.loh AdrpLdr	Lloh15247, Lloh15248
