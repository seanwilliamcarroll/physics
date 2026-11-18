<swarm::flock::Flock>::step_grid:
Lfunc_begin2066:
	.cfi_startproc
	sub sp, sp, #352
	.cfi_def_cfa_offset 352
	stp d13, d12, [sp, #208]
	stp d11, d10, [sp, #224]
	stp d9, d8, [sp, #240]
	stp x28, x27, [sp, #256]
	stp x26, x25, [sp, #272]
	stp x24, x23, [sp, #288]
	stp x22, x21, [sp, #304]
	stp x20, x19, [sp, #320]
	stp x29, x30, [sp, #336]
	add x29, sp, #336
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
	str q3, [sp, #80]
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
	str x19, [sp, #96]
	ldr x20, [x19, #16]
	cbz x20, LBB2066_47
	mov x21, #0
	ldr x11, [sp, #96]
	ldr x24, [x11, #8]
	ldr q0, [sp, #80]
	mov s8, v0[1]
	ldp x9, x8, [x11, #80]
	str x9, [sp, #112]
	ldp x10, x9, [x11, #56]
	str x10, [sp, #104]
	cmp x9, x8
	csel x25, x9, x8, lo
	ldp x22, x26, [x11, #32]
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
	ldp x19, x5, [x11, #248]
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
	add x6, x19, #4
	movi.2s v13, #90, lsl #24
	ldp x23, x27, [x11, #200]
	str x5, [sp, #56]
	str x6, [sp, #32]
	b LBB2066_4
LBB2066_2:
	ldp x10, x5, [sp, #48]
	ldr x6, [sp, #32]
LBB2066_3:
	add x21, x21, #1
	cmp x21, x20
	b.eq LBB2066_47
LBB2066_4:
	cmp x21, x10
	b.hs LBB2066_3
	mov w17, #0
	mov x15, #0
	ldr s1, [x24, x21, lsl #2]
	ldr s2, [x22, x21, lsl #2]
	ldp x9, x8, [sp, #104]
	ldr s3, [x9, x21, lsl #2]
	ldr s4, [x8, x21, lsl #2]
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
	movi.2d v3, #0000000000000000
	movi.2d v4, #0000000000000000
	movi.2d v5, #0000000000000000
	movi.2d v6, #0000000000000000
	movi.2d v7, #0000000000000000
	movi.2d v16, #0000000000000000
LBB2066_6:
	cbz x15, LBB2066_11
LBB2066_7:
	cmp x15, x16
	b.eq LBB2066_11
LBB2066_8:
	ldr w0, [x15], #4
	cmp x25, x0
	ccmp x21, x0, #4, hi
	ccmp x26, x0, #0, ne
	ccmp x20, x0, #0, hi
	b.ls LBB2066_7
	ldr s18, [x24, x0, lsl #2]
	ldr s17, [x22, x0, lsl #2]
	fsub s21, s1, s18
	fsub s20, s2, s17
	fmul s19, s21, s21
	fmul s22, s20, s20
	fadd s19, s19, s22
	fcmp s19, s11
	b.pl LBB2066_41
	fadd s3, s3, s21
	fadd s0, s0, s20
	stp s3, s0, [sp, #188]
	b LBB2066_6
LBB2066_11:
	cbz w17, LBB2066_14
	b LBB2066_45
LBB2066_12:
	fadd s3, s3, s19
	fadd s0, s0, s20
LBB2066_13:
	cmp x15, x16
	b.ne LBB2066_40
LBB2066_14:
	cmp x10, x9
	b.hi LBB2066_44
	cmp x10, x9
	b.lo LBB2066_17
	b LBB2066_28
LBB2066_16:
	cmp x10, x9
	b.eq LBB2066_27
LBB2066_17:
	mul x15, x10, x28
	add x10, x10, #1
	add x16, x15, x11
	add x15, x15, x8
	cmp x15, x27
	ccmp x16, x27, #2, lo
	b.hs LBB2066_16
	ldr w15, [x23, x15, lsl #2]
	ldr w16, [x23, x16, lsl #2]
	cmp w16, w15
	ccmp x5, x16, #0, hs
	b.lo LBB2066_16
	cmp w16, w15
	b.eq LBB2066_16
	sub x16, x16, x15
	add x17, x19, x15, lsl #2
	lsl x0, x16, #2
	add x16, x17, x0
	add x15, x6, x15, lsl #2
LBB2066_21:
	ldur w17, [x15, #-4]
	cmp x25, x17
	ccmp x21, x17, #4, hi
	ccmp x26, x17, #0, ne
	ccmp x20, x17, #0, hi
	b.hi LBB2066_23
	add x15, x15, #4
	subs x0, x0, #4
	b.ne LBB2066_21
	b LBB2066_16
LBB2066_23:
	ldr s17, [x24, x17, lsl #2]
	ldr s18, [x22, x17, lsl #2]
	fsub s19, s1, s17
	fsub s20, s2, s18
	fmul s21, s19, s19
	fmul s22, s20, s20
	fadd s21, s21, s22
	fcmp s21, s11
	b.mi LBB2066_12
	fcmp s21, s12
	b.pl LBB2066_13
	fcmp s21, #0.0
	b.le LBB2066_13
	ldp x0, x1, [sp, #104]
	ldr s19, [x1, x17, lsl #2]
	ldr s20, [x0, x17, lsl #2]
	fadd s16, s16, s17
	fadd s7, s7, s18
	fadd s6, s6, s20
	fadd s5, s5, s19
	fadd s4, s4, s9
	b LBB2066_13
LBB2066_27:
	mov x10, x9
LBB2066_28:
	stp s16, s7, [sp, #168]
	stp s6, s5, [sp, #176]
	stp s4, s3, [sp, #184]
	str s0, [sp, #192]
	cbz w14, LBB2066_45
	ldr w15, [x23, x13, lsl #2]
	ldr w16, [x23, x12, lsl #2]
	cmp w16, w15
	ccmp x5, x16, #0, hs
	b.lo LBB2066_45
	cmp w16, w15
	b.eq LBB2066_45
	sub x16, x16, x15
	add x17, x19, x15, lsl #2
	lsl x0, x16, #2
	add x16, x17, x0
	add x15, x6, x15, lsl #2
LBB2066_32:
	ldur w17, [x15, #-4]
	cmp x25, x17
	ccmp x21, x17, #4, hi
	ccmp x26, x17, #0, ne
	ccmp x20, x17, #0, hi
	b.hi LBB2066_34
	add x15, x15, #4
	subs x0, x0, #4
	b.ne LBB2066_32
	b LBB2066_45
LBB2066_34:
	ldr s18, [x24, x17, lsl #2]
	ldr s17, [x22, x17, lsl #2]
	fsub s20, s1, s18
	fsub s19, s2, s17
	fmul s21, s20, s20
	fmul s22, s19, s19
	fadd s21, s21, s22
	fcmp s21, s11
	b.pl LBB2066_36
	fadd s3, s3, s20
	fadd s0, s0, s19
	stp s3, s0, [sp, #188]
	b LBB2066_39
LBB2066_36:
	fcmp s21, s12
	b.pl LBB2066_39
	fcmp s21, #0.0
	b.le LBB2066_39
	ldp x0, x1, [sp, #104]
	ldr s19, [x1, x17, lsl #2]
	ldr s20, [x0, x17, lsl #2]
	fadd s16, s16, s18
	fadd s7, s7, s17
	stp s16, s7, [sp, #168]
	fadd s6, s6, s20
	fadd s5, s5, s19
	stp s6, s5, [sp, #176]
	fadd s4, s4, s9
	str s4, [sp, #184]
LBB2066_39:
	mov w17, #1
	cmp x15, x16
	b.ne LBB2066_8
	b LBB2066_45
LBB2066_40:
	mov w17, #0
	stp s16, s7, [sp, #168]
	stp s6, s5, [sp, #176]
	stp s4, s3, [sp, #184]
	str s0, [sp, #192]
	b LBB2066_8
LBB2066_41:
	fcmp s19, s12
	b.pl LBB2066_6
	fcmp s19, #0.0
	b.le LBB2066_6
	ldp x2, x1, [sp, #104]
	ldr s19, [x1, x0, lsl #2]
	ldr s20, [x2, x0, lsl #2]
	fadd s16, s16, s18
	fadd s7, s7, s17
	stp s16, s7, [sp, #168]
	fadd s6, s6, s20
	fadd s5, s5, s19
	stp s6, s5, [sp, #176]
	fadd s4, s4, s9
	str s4, [sp, #184]
	b LBB2066_6
LBB2066_44:
	stp s16, s7, [sp, #168]
	stp s6, s5, [sp, #176]
	stp s4, s3, [sp, #184]
	str s0, [sp, #192]
LBB2066_45:
	add x0, sp, #136
	ldr x8, [sp, #96]
	add x1, x8, #316
	add x2, sp, #152
	add x3, sp, #120
	add x4, sp, #168
	ldr q0, [sp, #80]
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
LBB2066_47:
	.cfi_def_cfa wsp, 352
	ldp x29, x30, [sp, #336]
	ldp x20, x19, [sp, #320]
	ldp x22, x21, [sp, #304]
	ldp x24, x23, [sp, #288]
	ldp x26, x25, [sp, #272]
	ldp x28, x27, [sp, #256]
	ldp d9, d8, [sp, #240]
	ldp d11, d10, [sp, #224]
	ldp d13, d12, [sp, #208]
	add sp, sp, #352
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
	ret
