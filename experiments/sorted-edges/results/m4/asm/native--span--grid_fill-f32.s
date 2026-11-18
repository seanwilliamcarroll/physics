<swarm::grid::Grid>::fill:
Lfunc_begin2049:
	.cfi_startproc
	stp x28, x27, [sp, #-96]!
	.cfi_def_cfa_offset 96
	stp x26, x25, [sp, #16]
	stp x24, x23, [sp, #32]
	stp x22, x21, [sp, #48]
	stp x20, x19, [sp, #64]
	stp x29, x30, [sp, #80]
	add x29, sp, #80
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
	.cfi_remember_state
	mov x19, x3
	mov x22, x2
	mov x20, x1
	mov x21, x0
	mov x23, #0
	ldp x8, x9, [x0, #72]
	mul x25, x9, x8
	str xzr, [x0, #16]
	adds x24, x25, #1
	b.hs LBB2049_5
	ldr x8, [x21]
	cmp x24, x8
	b.hi LBB2049_53
	mov x23, #0
	ldr x26, [x21, #8]
	add x0, x26, x23, lsl #2
	cbz x25, LBB2049_4
LBB2049_3:
	lsl x8, x24, #2
	sub x1, x8, #4
	mov x27, x4
	bl _bzero
	mov x4, x27
	add x8, x23, x24
	add x8, x26, x8, lsl #2
	sub x0, x8, #4
	add x23, x23, x25
LBB2049_4:
	str wzr, [x0]
	add x23, x23, #1
LBB2049_5:
	str x23, [x21, #16]
	cmp x4, x22
	csel x24, x4, x22, lo
	cbz x24, LBB2049_17
	mov x12, #0
	ldr s0, [x21, #88]
	ldp x8, x10, [x21, #72]
	subs x9, x8, #1
	csel x9, xzr, x9, lo
	subs x10, x10, #1
	csel x10, xzr, x10, lo
	ldr x1, [x21, #8]
	and x11, x24, #0x3
	cmp x24, #4
	b.lo LBB2049_19
	mov x12, #0
	and x13, x24, #0x1ffffffffffffffc
	add x16, x20, #8
	add x15, x19, #8
	movi.2d v1, #0000000000000000
	movi.2s v2, #90, lsl #24
	mov w14, #1
	b LBB2049_9
LBB2049_8:
	add x12, x12, #4
	mov x15, x0
	mov x16, x17
	cmp x13, x12
	b.eq LBB2049_18
LBB2049_9:
	ldur s3, [x16, #-8]
	ldur s4, [x15, #-8]
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x17, d5
	cmp x9, x17
	csel x17, x9, x17, lo
	fmul s4, s4, s0
	fmaxnm s4, s4, s1
	frintm s4, s4
	fcvt d5, s4
	fcvtzu x0, d5
	cmp x10, x0
	csel x0, x10, x0, lo
	fcmp s4, s2
	csel x0, x0, xzr, lt
	fcmp s3, s2
	csinc x17, x14, x17, ge
	madd x17, x0, x8, x17
	cmp x17, x23
	b.hs LBB2049_11
	ldr w0, [x1, x17, lsl #2]
	add w0, w0, #1
	str w0, [x1, x17, lsl #2]
LBB2049_11:
	ldur s3, [x16, #-4]
	ldur s4, [x15, #-4]
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x17, d5
	cmp x9, x17
	csel x17, x9, x17, lo
	fmul s4, s4, s0
	fmaxnm s4, s4, s1
	frintm s4, s4
	fcvt d5, s4
	fcvtzu x0, d5
	cmp x10, x0
	csel x0, x10, x0, lo
	fcmp s4, s2
	csel x0, x0, xzr, lt
	fcmp s3, s2
	csinc x17, x14, x17, ge
	madd x17, x0, x8, x17
	cmp x17, x23
	b.hs LBB2049_13
	ldr w0, [x1, x17, lsl #2]
	add w0, w0, #1
	str w0, [x1, x17, lsl #2]
LBB2049_13:
	mov x17, x16
	ldr s3, [x17], #16
	mov x0, x15
	ldr s4, [x0], #16
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x2, d5
	cmp x9, x2
	csel x2, x9, x2, lo
	fmul s4, s4, s0
	fmaxnm s4, s4, s1
	frintm s4, s4
	fcvt d5, s4
	fcvtzu x3, d5
	cmp x10, x3
	csel x3, x10, x3, lo
	fcmp s4, s2
	csel x3, x3, xzr, lt
	fcmp s3, s2
	csinc x2, x14, x2, ge
	madd x2, x3, x8, x2
	cmp x2, x23
	b.hs LBB2049_15
	ldr w3, [x1, x2, lsl #2]
	add w3, w3, #1
	str w3, [x1, x2, lsl #2]
LBB2049_15:
	ldr s3, [x16, #4]
	ldr s4, [x15, #4]
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x15, d5
	cmp x9, x15
	csel x15, x9, x15, lo
	fmul s4, s4, s0
	fmaxnm s4, s4, s1
	frintm s4, s4
	fcvt d5, s4
	fcvtzu x16, d5
	cmp x10, x16
	csel x16, x10, x16, lo
	fcmp s4, s2
	csel x16, x16, xzr, lt
	fcmp s3, s2
	csinc x15, x14, x15, ge
	madd x15, x16, x8, x15
	cmp x15, x23
	b.hs LBB2049_8
	ldr w16, [x1, x15, lsl #2]
	add w16, w16, #1
	str w16, [x1, x15, lsl #2]
	b LBB2049_8
LBB2049_17:
	ldr x1, [x21, #8]
	b LBB2049_23
LBB2049_18:
	cbz x11, LBB2049_23
LBB2049_19:
	lsl x13, x12, #2
	add x12, x19, x13
	add x13, x20, x13
	movi.2d v1, #0000000000000000
	movi.2s v2, #90, lsl #24
	mov w14, #1
	b LBB2049_21
LBB2049_20:
	subs x11, x11, #1
	b.eq LBB2049_23
LBB2049_21:
	ldr s3, [x13], #4
	ldr s4, [x12], #4
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x15, d5
	cmp x9, x15
	csel x15, x9, x15, lo
	fmul s4, s4, s0
	fmaxnm s4, s4, s1
	frintm s4, s4
	fcvt d5, s4
	fcvtzu x16, d5
	cmp x10, x16
	csel x16, x10, x16, lo
	fcmp s4, s2
	csel x16, x16, xzr, lt
	fcmp s3, s2
	csinc x15, x14, x15, ge
	madd x15, x16, x8, x15
	cmp x15, x23
	b.hs LBB2049_20
	ldr w16, [x1, x15, lsl #2]
	add w16, w16, #1
	str w16, [x1, x15, lsl #2]
	b LBB2049_20
LBB2049_23:
	cbz x23, LBB2049_32
	mov x8, #0
	mov w9, #0
	lsl x2, x23, #2
LBB2049_25:
	ldr w10, [x1, x8]
	add w9, w10, w9
	str w9, [x1, x8]
	add x8, x8, #4
	cmp x2, x8
	b.ne LBB2049_25
	mov x25, #0
	str xzr, [x21, #40]
	ldr x8, [x21, #24]
	cmp x23, x8
	b.hi LBB2049_51
LBB2049_27:
	ldr x8, [x21, #32]
	add x0, x8, x25, lsl #2
	bl _memcpy
	add x8, x25, x23
	str x8, [x21, #40]
	str xzr, [x21, #64]
	cbz x22, LBB2049_33
LBB2049_28:
	ldr x8, [x21, #48]
	cmp x22, x8
	b.hi LBB2049_52
	mov x23, #0
	ldr x25, [x21, #56]
	add x0, x25, x23, lsl #2
	cmp x22, #1
	b.eq LBB2049_31
LBB2049_30:
	lsl x8, x22, #2
	sub x1, x8, #4
	bl _bzero
	add x8, x23, x22
	add x9, x25, x8, lsl #2
	sub x0, x9, #4
	sub x23, x8, #1
LBB2049_31:
	str wzr, [x0]
	add x8, x23, #1
	str x8, [x21, #64]
	cbnz x24, LBB2049_34
	b LBB2049_50
LBB2049_32:
	mov x25, #0
	add x8, x25, x23
	str x8, [x21, #40]
	str xzr, [x21, #64]
	cbnz x22, LBB2049_28
LBB2049_33:
	mov x8, #0
	str x8, [x21, #64]
	cbz x24, LBB2049_50
LBB2049_34:
	mov x9, #0
	ldr s0, [x21, #88]
	ldp x12, x10, [x21, #72]
	subs x11, x12, #1
	csel x15, xzr, x11, lo
	subs x10, x10, #1
	csel x14, xzr, x10, lo
	ldp x10, x13, [x21, #32]
	ldr x11, [x21, #56]
	cmp x24, #1
	b.eq LBB2049_46
	mov x9, #0
	and x16, x24, #0x1ffffffffffffffe
	add x17, x19, #4
	add x0, x20, #4
	movi.2d v1, #0000000000000000
	movi.2s v2, #90, lsl #24
	b LBB2049_38
LBB2049_36:
	add w2, w2, #1
	str w2, [x10, x1, lsl #2]
LBB2049_37:
	add x9, x9, #2
	cmp x16, x9
	b.eq LBB2049_45
LBB2049_38:
	ldur s3, [x0, #-4]
	ldur s4, [x17, #-4]
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x1, d5
	cmp x15, x1
	csel x1, x15, x1, lo
	fcmp s3, s2
	csel x1, x1, xzr, lt
	fmul s3, s4, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d4, s3
	fcvtzu x2, d4
	cmp x14, x2
	csel x2, x14, x2, lo
	fcmp s3, s2
	csel x2, x2, xzr, lt
	madd x1, x2, x12, x1
	cmp x1, x13
	b.hs LBB2049_42
	ldr w2, [x10, x1, lsl #2]
	cmp x8, x2
	b.ls LBB2049_41
	str w9, [x11, x2, lsl #2]
	ldr w2, [x10, x1, lsl #2]
LBB2049_41:
	add w2, w2, #1
	str w2, [x10, x1, lsl #2]
LBB2049_42:
	ldr s3, [x0], #8
	ldr s4, [x17], #8
	fmul s3, s3, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d5, s3
	fcvtzu x1, d5
	cmp x15, x1
	csel x1, x15, x1, lo
	fcmp s3, s2
	csel x1, x1, xzr, lt
	fmul s3, s4, s0
	fmaxnm s3, s3, s1
	frintm s3, s3
	fcvt d4, s3
	fcvtzu x2, d4
	cmp x14, x2
	csel x2, x14, x2, lo
	fcmp s3, s2
	csel x2, x2, xzr, lt
	madd x1, x2, x12, x1
	cmp x1, x13
	b.hs LBB2049_37
	ldr w2, [x10, x1, lsl #2]
	cmp x8, x2
	b.ls LBB2049_36
	add x3, x9, #1
	str w3, [x11, x2, lsl #2]
	ldr w2, [x10, x1, lsl #2]
	b LBB2049_36
LBB2049_45:
	tbz w24, #0, LBB2049_50
LBB2049_46:
	ldr s1, [x20, x9, lsl #2]
	ldr s2, [x19, x9, lsl #2]
	fmul s1, s1, s0
	movi.2d v3, #0000000000000000
	fmaxnm s1, s1, s3
	frintm s1, s1
	fcvt d4, s1
	fcvtzu x16, d4
	cmp x15, x16
	csel x15, x15, x16, lo
	movi.2s v4, #90, lsl #24
	fcmp s1, s4
	csel x15, x15, xzr, lt
	fmul s0, s2, s0
	fmaxnm s0, s0, s3
	frintm s0, s0
	fcvt d1, s0
	fcvtzu x16, d1
	cmp x14, x16
	csel x14, x14, x16, lo
	fcmp s0, s4
	csel x14, x14, xzr, lt
	madd x12, x14, x12, x15
	cmp x12, x13
	b.hs LBB2049_50
	ldr w13, [x10, x12, lsl #2]
	cmp x8, x13
	b.ls LBB2049_49
	str w9, [x11, x13, lsl #2]
	ldr w13, [x10, x12, lsl #2]
LBB2049_49:
	add w8, w13, #1
	str w8, [x10, x12, lsl #2]
LBB2049_50:
	.cfi_def_cfa wsp, 96
	ldp x29, x30, [sp, #80]
	ldp x20, x19, [sp, #64]
	ldp x22, x21, [sp, #48]
	ldp x24, x23, [sp, #32]
	ldp x26, x25, [sp, #16]
	ldp x28, x27, [sp], #96
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
	ret
LBB2049_51:
	.cfi_restore_state
	add x0, x21, #24
	mov x25, x1
	mov x1, #0
	mov x26, x2
	mov x2, x23
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov x2, x26
	mov x1, x25
	ldr x25, [x21, #40]
	b LBB2049_27
LBB2049_52:
	add x0, x21, #48
	mov x1, #0
	mov x2, x22
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	ldp x25, x23, [x21, #56]
	add x0, x25, x23, lsl #2
	cmp x22, #1
	b.ne LBB2049_30
	b LBB2049_31
LBB2049_53:
	mov x0, x21
	mov x1, #0
	mov x2, x24
	mov x23, x4
	bl <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	mov x4, x23
	ldp x26, x23, [x21, #8]
	add x0, x26, x23, lsl #2
	cbnz x25, LBB2049_3
	b LBB2049_4
