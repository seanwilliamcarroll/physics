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
	sub sp, sp, #352
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
	mov s8, v3[1]
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
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #112]
LBB1929_2:
	cmp x25, x22
	b.eq LBB1929_5
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_2
	ldr s10, [x23, x8, lsl #2]
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
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #136]
LBB1929_10:
	cmp x25, x22
	b.eq LBB1929_13
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_10
	ldr s10, [x23, x8, lsl #2]
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
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #160]
LBB1929_18:
	cmp x25, x22
	b.eq LBB1929_21
	ldr w8, [x25], #4
	cmp x24, x8
	b.ls LBB1929_18
	ldr s10, [x23, x8, lsl #2]
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
	str s10, [x8, x20, lsl #2]
	add x20, x20, #1
	str x20, [x19, #184]
LBB1929_26:
	cmp x21, x22
	b.eq LBB1929_29
	ldr w8, [x21], #4
	cmp x24, x8
	b.ls LBB1929_26
	ldr s10, [x23, x8, lsl #2]
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
	cbz x13, LBB1929_93
	mov x20, #0
	cmp x9, x8
	csel x8, x9, x8, lo
	ldr s0, [x19, #320]
	fmul s0, s0, s0
	fmul s1, s9, s9
	cmp x10, x8
	csel x8, x10, x8, lo
	str q1, [sp, #80]
	dup.4s v1, v1[0]
	str q0, [sp, #224]
	dup.4s v0, v0[0]
	cmp x11, x8
	csel x8, x11, x8, lo
	stp x8, x13, [sp, #48]
	movi.2s v9, #90, lsl #24
	mov w27, #4
	str s8, [sp, #12]
	stp q0, q1, [sp, #96]
	b LBB1929_36
LBB1929_34:
	ldr x13, [sp, #56]
LBB1929_35:
	add x20, x20, #1
	cmp x20, x13
	b.eq LBB1929_93
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
	ldr s4, [x12, x20, lsl #2]
	ldr x13, [x19, #32]
	ldr s5, [x13, x20, lsl #2]
	ldr x14, [x19, #80]
	ldr x15, [x19, #56]
	ldr s0, [x15, x20, lsl #2]
	ldr s1, [x14, x20, lsl #2]
	stp s4, s5, [x29, #-232]
	stp s0, s1, [x29, #-224]
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
	fcmp s2, s9
	fmul s1, s5, s1
	fmaxnm s1, s1, s0
	frintm s1, s1
	fcvt d2, s1
	fcvtzu x3, d2
	csel x2, x0, xzr, lt
	subs x0, x1, #1
	csel x0, xzr, x0, lo
	cmp x0, x3
	csel x1, x0, x3, lo
	fcmp s1, s9
	csel x3, x1, xzr, lt
	subs x1, x2, #1
	csel x1, xzr, x1, lo
	str x1, [sp, #216]
	subs x1, x3, #1
	csel x1, xzr, x1, lo
	add x4, x3, #1
	cmp x0, x4
	csinc x0, x0, x3, lo
	movi d25, #0000000000000000
	movi d19, #0000000000000000
	movi d2, #0000000000000000
	cmp x1, x0
	b.hi LBB1929_91
	dup.4s v25, v5[0]
	dup.4s v26, v4[0]
	movi.2d v0, #0000000000000000
	str q0, [sp, #240]
	add x3, x2, #1
	movi.2d v6, #0000000000000000
	cmp x17, x3
	movi.2d v0, #0000000000000000
	csinc x17, x17, x2, lo
	movi.2d v1, #0000000000000000
	add x17, x17, #1
	str x17, [sp, #208]
	movi.2d v17, #0000000000000000
	movi.2d v7, #0000000000000000
	ldp x4, x3, [x19, #200]
	movi.2d v18, #0000000000000000
	movi.2d v20, #0000000000000000
	movi.2d v23, #0000000000000000
	movi.2d v22, #0000000000000000
	movi.2d v24, #0000000000000000
	movi.2d v29, #0000000000000000
	movi.2d v31, #0000000000000000
	movi.2d v30, #0000000000000000
	movi.2d v11, #0000000000000000
	movi.2d v3, #0000000000000000
	movi.2d v2, #0000000000000000
	str q2, [sp, #192]
	movi.2d v2, #0000000000000000
	str q2, [sp, #160]
	movi.2d v2, #0000000000000000
	str q2, [sp, #176]
	movi.2d v2, #0000000000000000
	str q2, [sp, #144]
	movi.2d v2, #0000000000000000
	str q2, [sp, #128]
	b LBB1929_43
LBB1929_41:
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
LBB1929_42:
	cmp x1, x0
	add x1, x1, #1
	b.eq LBB1929_90
LBB1929_43:
	mul x17, x16, x1
	ldp x2, x5, [sp, #208]
	add x2, x2, x17
	add x17, x17, x5
	cmp x17, x3
	ccmp x2, x3, #2, lo
	b.lo LBB1929_45
	mov x2, #0
	mov x17, #0
	b LBB1929_46
LBB1929_45:
	ldr w17, [x4, x17, lsl #2]
	ldr w2, [x4, x2, lsl #2]
LBB1929_46:
	cmp x2, x11
	cset w5, hi
	cmp x2, x17
	csinc w7, w5, wzr, hs
	cmp x2, x10
	cset w5, hi
	cmp x2, x17
	csinc w22, w5, wzr, hs
	cmp x2, x9
	cset w5, hi
	cmp x2, x17
	csinc w21, w5, wzr, hs
	cmp x2, x8
	cset w5, hi
	subs x2, x2, x17
	csinc w5, w5, wzr, hs
	lsl x17, x17, #2
	add x6, x12, x17
	cmp w5, #0
	csel x5, xzr, x2, ne
	csel x6, x27, x6, ne
	add x23, x13, x17
	cmp w21, #0
	csel x30, xzr, x2, ne
	csel x21, x27, x23, ne
	lsr x28, x30, #3
	add x24, x15, x17
	cmp w22, #0
	csel x23, xzr, x2, ne
	csel x26, x27, x24, ne
	lsr x22, x23, #3
	add x17, x14, x17
	cmp w7, #0
	csel x24, xzr, x2, ne
	csel x25, x27, x17, ne
	lsr x17, x24, #3
	lsr x2, x5, #3
	cmp x28, x2
	csel x2, x28, x2, lo
	cmp x22, x2
	csel x2, x22, x2, lo
	cmp x17, x2
	csel x7, x17, x2, lo
	cbz x7, LBB1929_49
	add x28, x6, #16
	add x22, x25, #16
	add x17, x21, #16
	add x2, x26, #16
	ldp q28, q19, [sp, #96]
	fmov.4s v2, #1.00000000
LBB1929_48:
	ldp q8, q12, [x28, #-16]
	fsub.4s v13, v26, v8
	ldp q14, q15, [x17, #-16]
	fsub.4s v9, v25, v14
	fmul.4s v10, v13, v13
	fmul.4s v21, v9, v9
	fadd.4s v21, v10, v21
	fcmgt.4s v10, v28, v21
	and.16b v10, v10, v2
	fcmge.4s v27, v21, v28
	fcmgt.4s v16, v19, v21
	fcmgt.4s v21, v21, #0.0
	mvn.16b v21, v21
	orn.16b v21, v21, v27
	orn.16b v16, v21, v16
	bic.16b v16, v2, v16
	fmul.4s v21, v13, v10
	fadd.4s v17, v17, v21
	fmul.4s v21, v9, v10
	fadd.4s v1, v1, v21
	fmul.4s v21, v8, v16
	fadd.4s v11, v11, v21
	fmul.4s v21, v14, v16
	fadd.4s v31, v21, v31
	ldp q21, q27, [x2, #-16]
	fmul.4s v21, v21, v16
	fadd.4s v24, v21, v24
	ldp q21, q8, [x22, #-16]
	fmul.4s v21, v21, v16
	fadd.4s v23, v21, v23
	fadd.4s v18, v16, v18
	fsub.4s v16, v26, v12
	fsub.4s v21, v25, v15
	fmul.4s v9, v16, v16
	fmul.4s v10, v21, v21
	fadd.4s v9, v9, v10
	fcmgt.4s v10, v28, v9
	and.16b v10, v10, v2
	fcmge.4s v13, v9, v28
	fcmgt.4s v14, v19, v9
	fcmgt.4s v9, v9, #0.0
	mvn.16b v9, v9
	orn.16b v9, v9, v13
	orn.16b v9, v9, v14
	bic.16b v9, v2, v9
	fmul.4s v16, v16, v10
	fadd.4s v6, v6, v16
	fmul.4s v16, v21, v10
	fadd.4s v0, v0, v16
	fmul.4s v16, v12, v9
	fadd.4s v30, v30, v16
	fmul.4s v16, v15, v9
	fadd.4s v29, v16, v29
	fmul.4s v16, v27, v9
	fadd.4s v22, v16, v22
	fmul.4s v16, v8, v9
	fadd.4s v20, v16, v20
	add x28, x28, #32
	fadd.4s v7, v9, v7
	add x22, x22, #32
	add x17, x17, #32
	add x2, x2, #32
	subs x7, x7, #1
	b.ne LBB1929_48
LBB1929_49:
	and x17, x30, #0x7
	and x2, x23, #0x7
	and x7, x24, #0x7
	and x22, x5, #0x7
	cmp x17, x22
	csel x17, x17, x22, lo
	cmp x2, x17
	csel x17, x2, x17, lo
	cmp x7, x17
	csel x7, x7, x17, lo
	cbz x7, LBB1929_42
	and x17, x5, #0xfffffff8
	add x28, x6, x17, lsl #2
	and x17, x30, #0xfffffff8
	add x30, x21, x17, lsl #2
	and x17, x23, #0xfffffff8
	add x5, x26, x17, lsl #2
	and x17, x24, #0xfffffff8
	add x6, x25, x17, lsl #2
	ldr s12, [x28]
	ldr s13, [x30]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_52
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_55
LBB1929_52:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_55
	fcmp s8, #0.0
	b.le LBB1929_55
	ldr s16, [x5]
	ldr s21, [x6]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_55:
	cmp x7, #1
	b.eq LBB1929_42
	ldr s12, [x28, #4]
	ldr s13, [x30, #4]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_58
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_61
LBB1929_58:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_61
	fcmp s8, #0.0
	b.le LBB1929_61
	ldr s16, [x5, #4]
	ldr s21, [x6, #4]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_61:
	cmp x7, #2
	b.eq LBB1929_42
	ldr s12, [x28, #8]
	ldr s13, [x30, #8]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_64
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_67
LBB1929_64:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_67
	fcmp s8, #0.0
	b.le LBB1929_67
	ldr s16, [x5, #8]
	ldr s21, [x6, #8]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_67:
	cmp x7, #3
	b.eq LBB1929_42
	ldr s12, [x28, #12]
	ldr s13, [x30, #12]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_70
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_73
LBB1929_70:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_73
	fcmp s8, #0.0
	b.le LBB1929_73
	ldr s16, [x5, #12]
	ldr s21, [x6, #12]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_73:
	cmp x7, #4
	b.eq LBB1929_42
	ldr s12, [x28, #16]
	ldr s13, [x30, #16]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_76
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_79
LBB1929_76:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_79
	fcmp s8, #0.0
	b.le LBB1929_79
	ldr s16, [x5, #16]
	ldr s21, [x6, #16]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_79:
	cmp x7, #5
	b.eq LBB1929_42
	ldr s12, [x28, #20]
	ldr s13, [x30, #20]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.pl LBB1929_82
	ldr q2, [sp, #240]
	fadd s2, s2, s14
	str q2, [sp, #240]
	fadd s3, s3, s15
	b LBB1929_85
LBB1929_82:
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_85
	fcmp s8, #0.0
	b.le LBB1929_85
	ldr s16, [x5, #20]
	ldr s21, [x6, #20]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
LBB1929_85:
	cmp x7, #6
	b.eq LBB1929_42
	ldr s12, [x28, #24]
	ldr s13, [x30, #24]
	fsub s14, s4, s12
	fsub s15, s5, s13
	fmul s16, s14, s14
	fmul s21, s15, s15
	fadd s8, s16, s21
	ldr q16, [sp, #224]
	fcmp s8, s16
	b.mi LBB1929_41
	ldr q16, [sp, #80]
	fcmp s8, s16
	b.pl LBB1929_42
	fcmp s8, #0.0
	b.le LBB1929_42
	ldr s16, [x5, #24]
	ldr s21, [x6, #24]
	ldr q2, [sp, #128]
	fadd s2, s2, s12
	str q2, [sp, #128]
	ldr q2, [sp, #144]
	fadd s2, s2, s13
	str q2, [sp, #144]
	ldr q2, [sp, #176]
	fadd s2, s2, s16
	str q2, [sp, #176]
	ldr q2, [sp, #160]
	fadd s2, s2, s21
	str q2, [sp, #160]
	fmov s16, #1.00000000
	ldr q2, [sp, #192]
	fadd s2, s2, s16
	str q2, [sp, #192]
	b LBB1929_42
LBB1929_90:
	faddp.2s v4, v11, v31
	mov d5, v31[1]
	mov d16, v11[1]
	zip1.2s v21, v16, v5
	fadd.2s v4, v4, v21
	zip2.2s v5, v16, v5
	fadd.2s v4, v4, v5
	zip1.2s v5, v30, v29
	fadd.2s v4, v4, v5
	zip2.2s v5, v30, v29
	fadd.2s v4, v4, v5
	mov d5, v29[1]
	mov d16, v30[1]
	zip1.2s v21, v16, v5
	fadd.2s v4, v4, v21
	zip2.2s v5, v16, v5
	fadd.2s v4, v4, v5
	ldp q5, q2, [sp, #128]
	mov.s v5[1], v2[0]
	fadd.2s v25, v5, v4
	faddp.2s v4, v24, v23
	mov d5, v23[1]
	mov d16, v24[1]
	zip1.2s v21, v16, v5
	fadd.2s v4, v4, v21
	zip2.2s v5, v16, v5
	fadd.2s v4, v4, v5
	zip1.2s v5, v22, v20
	fadd.2s v4, v4, v5
	zip2.2s v5, v22, v20
	fadd.2s v4, v4, v5
	mov d5, v20[1]
	mov d16, v22[1]
	zip1.2s v20, v16, v5
	fadd.2s v4, v4, v20
	zip2.2s v5, v16, v5
	ldp q16, q2, [sp, #160]
	mov.s v2[1], v16[0]
	fadd.2s v4, v4, v5
	fadd.2s v19, v2, v4
	faddp.2s v4, v18, v17
	mov d5, v17[1]
	mov d16, v18[1]
	zip1.2s v17, v16, v5
	fadd.2s v4, v4, v17
	zip2.2s v5, v16, v5
	fadd.2s v4, v4, v5
	zip1.2s v5, v7, v6
	fadd.2s v4, v4, v5
	zip2.2s v5, v7, v6
	fadd.2s v4, v4, v5
	mov d5, v6[1]
	mov d6, v7[1]
	zip1.2s v7, v6, v5
	fadd.2s v4, v4, v7
	zip2.2s v5, v6, v5
	fadd.2s v4, v4, v5
	ldr q2, [sp, #240]
	ldr q5, [sp, #192]
	mov.s v5[1], v2[0]
	fadd.2s v2, v5, v4
	dup.4s v4, v1[1]
	fadd.4s v4, v1, v4
	dup.4s v5, v1[2]
	fadd.4s v4, v4, v5
	dup.4s v1, v1[3]
	fadd.4s v1, v4, v1
	fadd.4s v1, v1, v0
	dup.4s v4, v0[1]
	dup.4s v5, v0[2]
	fadd.4s v1, v1, v4
	fadd.4s v1, v1, v5
	dup.4s v0, v0[3]
	fadd.4s v0, v1, v0
	fadd s0, s3, s0
	ldr s8, [sp, #12]
	movi.2s v9, #90, lsl #24
LBB1929_91:
	stp d25, d19, [x29, #-216]
	stur d2, [x29, #-200]
	stur s0, [x29, #-192]
	sub x0, x29, #184
	add x1, x19, #316
	sub x2, x29, #168
	sub x3, x29, #232
	sub x4, x29, #216
	ldr q0, [sp, #64]
	mov.16b v1, v8
	bl swarm::rules::finish
	ldr x8, [sp, #48]
	cmp x20, x8
	b.hs LBB1929_34
	ldp s0, s1, [x29, #-184]
	ldp x8, x9, [sp, #32]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	ldp s0, s1, [x29, #-176]
	ldp x8, x9, [sp, #16]
	str s0, [x9, x20, lsl #2]
	str s1, [x8, x20, lsl #2]
	b LBB1929_34
LBB1929_93:
	add sp, sp, #352
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
