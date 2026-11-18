<swarm::flock::Flock>::step_grid:
Lfunc_begin2066:
	.cfi_startproc
	sub sp, sp, #368
	.cfi_def_cfa_offset 368
	stp d15, d14, [sp, #208]
	stp d13, d12, [sp, #224]
	stp d11, d10, [sp, #240]
	stp d9, d8, [sp, #256]
	stp x28, x27, [sp, #272]
	stp x26, x25, [sp, #288]
	stp x24, x23, [sp, #304]
	stp x22, x21, [sp, #320]
	stp x20, x19, [sp, #336]
	stp x29, x30, [sp, #352]
	add x29, sp, #352
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
	str x8, [sp, #152]
	ldr w8, [x0, #312]
	str w8, [sp, #160]
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
	fmul.s s1, s1, v3[1]
	fmaxnm s0, s0, s1
	mov w9, #8192
	movk w9, #16256, lsl #16
	fmov s1, w9
	fmul s0, s0, s1
	fmov s9, #1.00000000
	fdiv s0, s9, s0
	str s0, [x0, #280]
	str q3, [sp, #96]
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
	str x19, [sp, #112]
	ldr x20, [x19, #16]
	cbz x20, LBB2066_35
	mov x21, #0
	ldr x11, [sp, #112]
	ldr x22, [x11, #8]
	ldr q0, [sp, #96]
	mov s8, v0[1]
	ldp x24, x8, [x11, #80]
	ldp x4, x9, [x11, #56]
	cmp x9, x8
	csel x25, x9, x8, lo
	ldp x5, x26, [x11, #32]
	ldr s10, [x11, #280]
	ldp x28, x8, [x11, #264]
	subs x9, x28, #1
	csel x9, xzr, x9, lo
	subs x8, x8, #1
	csel x8, xzr, x8, lo
	stp x8, x9, [sp, #64]
	ldr s0, [x11, #320]
	fmul s11, s0, s0
	ldr s0, [x11, #316]
	fmul s12, s0, s0
	ldp x6, x23, [x11, #248]
	ldp x9, x8, [x11, #152]
	str x9, [sp, #24]
	ldp x10, x9, [x11, #128]
	str x10, [sp, #16]
	ldr x10, [x11, #104]
	str x10, [sp, #8]
	ldr x10, [x11, #112]
	cmp x9, x10
	csel x9, x9, x10, lo
	cmp x8, x9
	csel x8, x8, x9, lo
	ldp x10, x9, [x11, #176]
	str x10, [sp]
	cmp x26, x25
	csel x10, x26, x25, lo
	cmp x9, x8
	csel x8, x9, x8, lo
	stp x8, x10, [sp, #40]
	add x7, x6, #4
	movi.2s v13, #90, lsl #24
	movi.2d v14, #0000000000000000
	ldp x19, x27, [x11, #200]
	stp x5, x4, [sp, #80]
	str x6, [sp, #56]
	str x7, [sp, #32]
	b LBB2066_4
LBB2066_2:
	ldp x5, x4, [sp, #80]
	ldp x10, x6, [sp, #48]
	ldr x7, [sp, #32]
LBB2066_3:
	add x21, x21, #1
	cmp x21, x20
	b.eq LBB2066_35
LBB2066_4:
	cmp x21, x10
	b.hs LBB2066_3
	mov w17, #0
	mov x15, #0
	ldr s1, [x22, x21, lsl #2]
	ldr s2, [x5, x21, lsl #2]
	ldr s3, [x4, x21, lsl #2]
	ldr s4, [x24, x21, lsl #2]
	stp s1, s2, [sp, #120]
	fmul s0, s1, s10
	frintm s5, s0
	movi.2d v0, #0000000000000000
	fmaxnm s5, s5, s0
	fcvt d6, s5
	fcvtzu x8, d6
	stp s3, s4, [sp, #128]
	ldp x13, x12, [sp, #64]
	cmp x12, x8
	csel x8, x12, x8, lo
	fcmp s5, s13
	csel x9, x8, xzr, lt
	fmul s3, s2, s10
	frintm s3, s3
	fmaxnm s3, s3, s0
	fcvt d4, s3
	fcvtzu x8, d4
	cmp x13, x8
	csel x8, x13, x8, lo
	fcmp s3, s13
	csel x11, x8, xzr, lt
	subs x8, x9, #1
	csel x8, xzr, x8, lo
	add x10, x9, #1
	cmp x12, x10
	csinc x12, x12, x9, lo
	subs x9, x11, #1
	csel x10, xzr, x9, lo
	add x9, x11, #1
	cmp x13, x9
	csinc x9, x13, x11, lo
	stp xzr, xzr, [sp, #168]
	str wzr, [sp, #192]
	str xzr, [sp, #184]
	add x11, x12, #1
	mul x13, x28, x9
	add x12, x13, x11
	add x13, x13, x8
	cmp x13, x27
	ccmp x12, x27, #2, lo
	cset w14, lo
	movi.2d v6, #0000000000000000
	movi.2d v4, #0000000000000000
	movi.2d v3, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v7, #0000000000000000
	movi.2d v16, #0000000000000000
	cbz x15, LBB2066_10
LBB2066_6:
	cmp x15, x16
	b.eq LBB2066_10
LBB2066_7:
	ldr w0, [x15], #4
	cmp x25, x0
	ccmp x21, x0, #4, hi
	ccmp x26, x0, #0, ne
	ccmp x20, x0, #0, hi
	b.ls LBB2066_6
	ldr s17, [x22, x0, lsl #2]
	ldr s18, [x24, x0, lsl #2]
	ldr s19, [x5, x0, lsl #2]
	ldr s20, [x4, x0, lsl #2]
	fsub s21, s1, s17
	fsub s22, s2, s19
	fmul s23, s21, s21
	fmul s24, s22, s22
	fadd s23, s23, s24
	fcmp s23, s12
	fccmp s23, s11, #8, mi
	cset w0, ge
	fcmp s23, #0.0
	cset w1, gt
	.p2align	6, , 4
	fcmp s23, s11
	fcsel s23, s9, s14, mi
	tst w1, w0
	fcsel s24, s9, s14, ne
	fmul s21, s21, s23
	fadd s4, s4, s21
	fmul s21, s22, s23
	fadd s6, s6, s21
	stp s4, s6, [sp, #188]
	fmul s17, s17, s24
	fadd s0, s0, s17
	fmul s17, s19, s24
	fadd s16, s16, s17
	stp s0, s16, [sp, #168]
	fmul s17, s20, s24
	fadd s7, s7, s17
	fmul s17, s18, s24
	fadd s5, s5, s17
	stp s7, s5, [sp, #176]
	fadd s3, s3, s24
	str s3, [sp, #184]
	cbnz x15, LBB2066_6
LBB2066_10:
	cbz w17, LBB2066_13
	b LBB2066_33
LBB2066_11:
	ldr s17, [x22, x0, lsl #2]
	ldr s18, [x24, x0, lsl #2]
	ldr s19, [x5, x0, lsl #2]
	ldr s20, [x4, x0, lsl #2]
	fsub s21, s1, s17
	fsub s22, s2, s19
	fmul s23, s21, s21
	fmul s24, s22, s22
	fadd s23, s23, s24
	fcmp s23, s12
	fccmp s23, s11, #8, mi
	cset w17, ge
	fcmp s23, #0.0
	cset w0, gt
	.p2align	6, , 4
	fcmp s23, s11
	fcsel s23, s9, s14, mi
	tst w0, w17
	fcsel s24, s9, s14, ne
	fmul s21, s21, s23
	fadd s4, s4, s21
	fmul s21, s22, s23
	fadd s6, s6, s21
	fmul s17, s17, s24
	fadd s0, s0, s17
	fmul s17, s19, s24
	fadd s16, s16, s17
	fmul s17, s20, s24
	fadd s7, s7, s17
	fmul s17, s18, s24
	fadd s5, s5, s17
	fadd s3, s3, s24
	cmp x15, x16
	b.ne LBB2066_31
LBB2066_13:
	cmp x10, x9
	b.hi LBB2066_32
	cmp x10, x9
	b.lo LBB2066_16
	b LBB2066_23
LBB2066_15:
	cmp x10, x9
	b.eq LBB2066_22
LBB2066_16:
	mul x15, x10, x28
	add x10, x10, #1
	add x16, x15, x11
	add x15, x15, x8
	cmp x15, x27
	ccmp x16, x27, #2, lo
	b.hs LBB2066_15
	ldr w15, [x19, x15, lsl #2]
	ldr w16, [x19, x16, lsl #2]
	cmp w16, w15
	ccmp x23, x16, #0, hs
	b.lo LBB2066_15
	cmp w16, w15
	b.eq LBB2066_15
	sub x16, x16, x15
	add x0, x6, x15, lsl #2
	lsl x17, x16, #2
	add x16, x0, x17
	add x15, x7, x15, lsl #2
LBB2066_20:
	ldur w0, [x15, #-4]
	cmp x25, x0
	ccmp x21, x0, #4, hi
	ccmp x26, x0, #0, ne
	ccmp x20, x0, #0, hi
	b.hi LBB2066_11
	add x15, x15, #4
	subs x17, x17, #4
	b.ne LBB2066_20
	b LBB2066_15
LBB2066_22:
	mov x10, x9
LBB2066_23:
	stp s4, s6, [sp, #188]
	stp s0, s16, [sp, #168]
	stp s7, s5, [sp, #176]
	str s3, [sp, #184]
	cbz w14, LBB2066_33
	ldr w15, [x19, x13, lsl #2]
	ldr w16, [x19, x12, lsl #2]
	cmp w16, w15
	ccmp x23, x16, #0, hs
	b.lo LBB2066_33
	cmp w16, w15
	b.eq LBB2066_33
	sub x16, x16, x15
	add x0, x6, x15, lsl #2
	lsl x17, x16, #2
	add x16, x0, x17
	add x15, x7, x15, lsl #2
LBB2066_27:
	ldur w0, [x15, #-4]
	cmp x25, x0
	ccmp x21, x0, #4, hi
	ccmp x26, x0, #0, ne
	ccmp x20, x0, #0, hi
	b.hi LBB2066_29
	add x15, x15, #4
	subs x17, x17, #4
	b.ne LBB2066_27
	b LBB2066_33
LBB2066_29:
	ldr s17, [x22, x0, lsl #2]
	ldr s18, [x24, x0, lsl #2]
	ldr s19, [x5, x0, lsl #2]
	ldr s20, [x4, x0, lsl #2]
	fsub s21, s1, s17
	fsub s22, s2, s19
	fmul s23, s21, s21
	fmul s24, s22, s22
	fadd s23, s23, s24
	fcmp s23, s12
	fccmp s23, s11, #8, mi
	cset w17, ge
	fcmp s23, #0.0
	cset w0, gt
	.p2align	6, , 4
	fcmp s23, s11
	fcsel s23, s9, s14, mi
	tst w0, w17
	fcsel s24, s9, s14, ne
	fmul s21, s21, s23
	fadd s4, s4, s21
	fmul s21, s22, s23
	fadd s6, s6, s21
	stp s4, s6, [sp, #188]
	fmul s17, s17, s24
	fadd s0, s0, s17
	fmul s17, s19, s24
	fadd s16, s16, s17
	stp s0, s16, [sp, #168]
	fmul s17, s20, s24
	fadd s7, s7, s17
	fmul s17, s18, s24
	fadd s5, s5, s17
	stp s7, s5, [sp, #176]
	fadd s3, s3, s24
	str s3, [sp, #184]
	mov w17, #1
	cmp x15, x16
	b.ne LBB2066_7
	b LBB2066_33
LBB2066_31:
	mov w17, #0
	stp s4, s6, [sp, #188]
	stp s0, s16, [sp, #168]
	stp s7, s5, [sp, #176]
	str s3, [sp, #184]
	b LBB2066_7
LBB2066_32:
	stp s4, s6, [sp, #188]
	stp s0, s16, [sp, #168]
	stp s7, s5, [sp, #176]
	str s3, [sp, #184]
LBB2066_33:
	add x0, sp, #136
	ldr x8, [sp, #112]
	add x1, x8, #316
	add x2, sp, #152
	add x3, sp, #120
	add x4, sp, #168
	ldr q0, [sp, #96]
	mov.16b v1, v8
	bl swarm::rules::finish
	ldr x8, [sp, #40]
	cmp x21, x8
	b.hs LBB2066_2
	ldp s0, s1, [sp, #136]
	ldp x9, x8, [sp, #8]
	str s0, [x9, x21, lsl #2]
	str s1, [x8, x21, lsl #2]
	ldp s0, s1, [sp, #144]
	ldr x8, [sp, #24]
	str s0, [x8, x21, lsl #2]
	ldr x8, [sp]
	str s1, [x8, x21, lsl #2]
	b LBB2066_2
LBB2066_35:
	.cfi_def_cfa wsp, 368
	ldp x29, x30, [sp, #352]
	ldp x20, x19, [sp, #336]
	ldp x22, x21, [sp, #320]
	ldp x24, x23, [sp, #304]
	ldp x26, x25, [sp, #288]
	ldp x28, x27, [sp, #272]
	ldp d9, d8, [sp, #256]
	ldp d11, d10, [sp, #240]
	ldp d13, d12, [sp, #224]
	ldp d15, d14, [sp, #208]
	add sp, sp, #368
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
