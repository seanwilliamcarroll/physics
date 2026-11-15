<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
Lfunc_begin151:
	.cfi_startproc
	.cfi_personality 155, _rust_eh_personality
	.cfi_lsda 16, Lexception49
	stp d13, d12, [sp, #-144]!
	.cfi_def_cfa_offset 144
	stp d11, d10, [sp, #16]
	stp d9, d8, [sp, #32]
	stp x28, x27, [sp, #48]
	stp x26, x25, [sp, #64]
	stp x24, x23, [sp, #80]
	stp x22, x21, [sp, #96]
	stp x20, x19, [sp, #112]
	stp x29, x30, [sp, #128]
	add x29, sp, #128
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
	.cfi_remember_state
	sub sp, sp, #752
	ldr x20, [x1, #16]
	lsl x26, x20, #3
	lsr x8, x20, #61
	mov x9, #-7
	movk x9, #32767, lsl #48
	cmp x26, x9
	ccmp x8, #0, #0, lo
	b.eq LBB151_2
	bl alloc::raw_vec::capacity_overflow
LBB151_2:
	mov x28, x3
	mov x22, x2
	str x0, [sp, #56]
	cbz x26, LBB151_8
	mov x19, x1
	mov x0, x26
	bl _malloc
	cbz x0, LBB151_63
	mov x24, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB151_64
	mov x23, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB151_65
	mov x25, x0
	mov x0, x26
	bl _malloc
	cbz x0, LBB151_66
	mov x21, x0
	mov x1, x19
	b LBB151_9
LBB151_8:
	mov w25, #8
	mov w24, #8
	mov w23, #8
	mov w21, #8
LBB151_9:
	stp x20, x24, [sp, #128]
	stp xzr, x20, [sp, #144]
	stp x23, xzr, [sp, #160]
	stp x20, x25, [sp, #176]
	stp xzr, x20, [sp, #192]
	stp x21, xzr, [sp, #208]
	ldr x8, [x1, #64]
	cmp x8, x20
	csel x19, x8, x20, lo
	str x22, [sp, #64]
	cbz x19, LBB151_25
	str x28, [sp, #104]
	mov x28, #0
	ldr x8, [x1, #8]
	ldr x27, [x1, #56]
	add x22, x8, #8
	fmov d8, #1.00000000
	movi.2d v9, #0000000000000000
	b LBB151_12
LBB151_11:
	add x22, x22, #16
	ldr x21, [sp, #208]
	str d10, [x21, x26, lsl #3]
	add x26, x26, #1
	str x26, [sp, #216]
	mov x28, x23
	cmp x19, x23
	b.eq LBB151_21
LBB151_12:
	ldp d12, d11, [x22, #-8]
	ldr d10, [x27, x28, lsl #3]
	ldr x8, [sp, #128]
	cmp x28, x8
	b.ne LBB151_15
	add x0, sp, #128
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	ldr x24, [sp, #136]
LBB151_15:
	add x23, x28, #1
	str d12, [x24, x28, lsl #3]
	str x23, [sp, #144]
	ldr x20, [sp, #168]
	ldr x8, [sp, #152]
	cmp x20, x8
	b.ne LBB151_17
	add x0, sp, #152
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB151_17:
	ldr x8, [sp, #160]
	str x8, [sp, #120]
	str d11, [x8, x20, lsl #3]
	add x20, x20, #1
	str x20, [sp, #168]
	fdiv d0, d8, d10
	fcmp d10, #0.0
	fcsel d11, d9, d0, eq
	ldr x21, [sp, #192]
	ldr x8, [sp, #176]
	cmp x21, x8
	b.ne LBB151_19
	add x0, sp, #176
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
LBB151_19:
	ldr x8, [sp, #184]
	str x8, [sp, #112]
	str d11, [x8, x21, lsl #3]
	add x25, x21, #1
	str x25, [sp, #192]
	ldr x26, [sp, #216]
	ldr x8, [sp, #200]
	cmp x26, x8
	b.ne LBB151_11
	add x0, sp, #200
	bl <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	b LBB151_11
LBB151_21:
	ldr x28, [sp, #104]
	ldr x22, [sp, #64]
	lsl x24, x28, #3
	str x24, [sp, #96]
	cbz x28, LBB151_26
LBB151_22:
	mov x0, x24
	bl _malloc
	cbz x0, LBB151_67
	mov x19, x0
	cmp x28, #8
	b.hi LBB151_27
	mov x8, #0
	b LBB151_29
LBB151_25:
	stp x25, x23, [sp, #112]
	mov x20, #0
	mov x25, #0
	mov x26, #0
	mov x23, #0
	lsl x24, x28, #3
	str x24, [sp, #96]
	cbnz x28, LBB151_22
LBB151_26:
	mov w8, #8
	str x8, [sp, #104]
	mov w0, #8
	cbnz x23, LBB151_39
	b LBB151_45
LBB151_27:
	ands x8, x28, #0x7
	mov w9, #8
	csel x8, x9, x8, eq
	sub x8, x28, x8
	add x9, x22, #64
	add x10, x19, #32
	mov x11, x8
LBB151_28:
	sub x12, x9, #48
	ldur q0, [x9, #-64]
	ld1.d { v0 }[1], [x12]
	sub x12, x9, #16
	ldur q1, [x9, #-32]
	ld1.d { v1 }[1], [x12]
	add x12, x9, #16
	ldr q2, [x9]
	ld1.d { v2 }[1], [x12]
	add x12, x9, #48
	ldr q3, [x9, #32]
	ld1.d { v3 }[1], [x12]
	stp q0, q1, [x10, #-32]
	stp q2, q3, [x10], #64
	add x9, x9, #128
	subs x11, x11, #8
	b.ne LBB151_28
LBB151_29:
	add x9, x22, x8, lsl #4
LBB151_30:
	ldr d0, [x9], #16
	str d0, [x19, x8, lsl #3]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB151_30
	mov x0, x24
	bl _malloc
	cbz x0, LBB151_68
	cmp x28, #8
	b.hi LBB151_34
	mov x8, #0
	b LBB151_36
LBB151_34:
	ands x8, x28, #0x7
	mov w9, #8
	csel x8, x9, x8, eq
	sub x8, x28, x8
	add x9, x22, #72
	add x10, x0, #32
	mov x11, x8
LBB151_35:
	sub x12, x9, #48
	ldur q0, [x9, #-64]
	ld1.d { v0 }[1], [x12]
	sub x12, x9, #16
	ldur q1, [x9, #-32]
	ld1.d { v1 }[1], [x12]
	add x12, x9, #16
	ldr q2, [x9]
	ld1.d { v2 }[1], [x12]
	add x12, x9, #48
	ldr q3, [x9, #32]
	ld1.d { v3 }[1], [x12]
	stp q0, q1, [x10, #-32]
	stp q2, q3, [x10], #64
	add x9, x9, #128
	subs x11, x11, #8
	b.ne LBB151_35
LBB151_36:
	add x9, x22, x8, lsl #4
	add x9, x9, #8
LBB151_37:
	ldr d0, [x9], #16
	str d0, [x0, x8, lsl #3]
	add x8, x8, #1
	cmp x28, x8
	b.ne LBB151_37
	str x19, [sp, #104]
	cbz x23, LBB151_45
LBB151_39:
	mov x24, #0
	mov x8, #0
	ldr x9, [sp, #136]
	stp x9, x0, [sp, #80]
	add x27, sp, #352
	ldr x9, [sp, #56]
	ldp d9, d8, [x9]
	str x20, [sp, #72]
LBB151_40:
	add x9, x20, x8
	cbz x9, LBB151_45
	add x10, x25, x8
	cbz x10, LBB151_45
	add x10, x26, x8
	cbz x10, LBB151_45
	ldr x10, [sp, #96]
	cmp x10, x24
	b.eq LBB151_45
	ldr x10, [sp, #80]
	add x10, x10, x24
	add x11, x23, x8
	sub x3, x11, #1
	ldr x11, [sp, #120]
	add x4, x11, x24
	ldr d0, [x4], #8
	sub x5, x9, #1
	ldr d1, [x10]
	sub x19, x8, #1
	ldp x13, x9, [sp, #104]
	add x6, x9, x24
	add x9, x21, x24
	ldr d10, [x9], #8
	ldr d2, [x6], #8
	add x11, x26, x8
	sub x11, x11, #1
	add x8, x28, x8
	sub x8, x8, #1
	add x12, x0, x24
	add x12, x12, #8
	add x22, x0, x24
	add x20, x13, x24
	add x13, x20, #8
	fmul d2, d2, d9
	str d1, [sp, #608]
	str d0, [sp, #616]
	str d2, [sp, #624]
	stp x12, x8, [sp, #32]
	add x0, sp, #352
	add x1, sp, #608
	add x2, x10, #8
	stp x13, x8, [sp, #16]
	add x7, x19, x25
	stp x9, x11, [sp]
	mov.16b v0, v8
	bl engine::force::sweep::<f64>
	ldp q0, q1, [sp, #416]
	stp q0, q1, [sp, #672]
	ldp q0, q1, [sp, #448]
	stp q0, q1, [sp, #704]
	ldp q0, q1, [sp, #352]
	stp q0, q1, [sp, #608]
	ldp q0, q1, [sp, #384]
	stp q0, q1, [sp, #640]
	ldp q0, q1, [x27, #192]
	stp q0, q1, [sp, #288]
	ldp q0, q1, [x27, #224]
	stp q0, q1, [sp, #320]
	ldp q0, q1, [x27, #128]
	stp q0, q1, [sp, #224]
	ldp q0, q1, [x27, #160]
	stp q0, q1, [sp, #256]
	add x0, sp, #608
	mov w1, #16
	bl engine::force::tree_sum::<f64>
	ldr d1, [x20]
	fmul d0, d10, d0
	fadd d0, d0, d1
	str d0, [x20]
	ldr x20, [sp, #72]
	ldp q0, q1, [sp, #288]
	stp q0, q1, [sp, #416]
	ldp q0, q1, [sp, #320]
	stp q0, q1, [sp, #448]
	ldp q0, q1, [sp, #224]
	stp q0, q1, [sp, #352]
	ldp q0, q1, [sp, #256]
	stp q0, q1, [sp, #384]
	add x0, sp, #352
	mov w1, #16
	bl engine::force::tree_sum::<f64>
	ldr x0, [sp, #88]
	fmul d0, d10, d0
	ldr d1, [x22]
	fadd d0, d0, d1
	str d0, [x22]
	add x24, x24, #8
	mov x8, x19
	cmn x23, x19
	b.ne LBB151_40
LBB151_45:
	cbz x28, LBB151_54
	cmp x28, #4
	b.hs LBB151_48
	mov x8, #0
	ldr x14, [sp, #64]
	ldr x19, [sp, #104]
	b LBB151_51
LBB151_48:
	and x8, x28, #0x7fffffffffffffc
	add x9, x0, #16
	ldr x19, [sp, #104]
	add x10, x19, #16
	ldr x14, [sp, #64]
	add x11, x14, #32
	and x12, x28, #0x7fffffffffffffc
LBB151_49:
	sub x13, x11, #32
	ldp q0, q2, [x10, #-16]
	ldp q1, q3, [x9, #-16]
	st2.2d { v0, v1 }, [x13]
	st2.2d { v2, v3 }, [x11]
	add x9, x9, #32
	add x10, x10, #32
	add x11, x11, #64
	subs x12, x12, #4
	b.ne LBB151_49
	cmp x28, x8
	b.eq LBB151_53
LBB151_51:
	lsl x10, x8, #3
	add x9, x0, x10
	add x10, x19, x10
	add x11, x14, x8, lsl #4
	add x11, x11, #8
	sub x8, x28, x8
LBB151_52:
	ldr d0, [x10], #8
	ldr d1, [x9], #8
	stp d0, d1, [x11, #-8]
	add x11, x11, #16
	subs x8, x8, #1
	b.ne LBB151_52
LBB151_53:
	bl _free
	mov x0, x19
	bl _free
LBB151_54:
	ldr x8, [sp, #200]
	cbz x8, LBB151_56
	mov x0, x21
	bl _free
LBB151_56:
	ldr x8, [sp, #176]
	cbz x8, LBB151_58
	ldr x0, [sp, #184]
	bl _free
LBB151_58:
	ldr x8, [sp, #152]
	cbz x8, LBB151_60
	ldr x0, [sp, #160]
	bl _free
LBB151_60:
	ldr x8, [sp, #128]
	cbz x8, LBB151_62
	ldr x0, [sp, #136]
	bl _free
LBB151_62:
	add sp, sp, #752
	.cfi_def_cfa wsp, 144
	ldp x29, x30, [sp, #128]
	ldp x20, x19, [sp, #112]
	ldp x22, x21, [sp, #96]
	ldp x24, x23, [sp, #80]
	ldp x26, x25, [sp, #64]
	ldp x28, x27, [sp, #48]
	ldp d9, d8, [sp, #32]
	ldp d11, d10, [sp, #16]
	ldp d13, d12, [sp], #144
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
LBB151_63:
	.cfi_restore_state
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
LBB151_64:
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB151_69
LBB151_65:
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB151_69
LBB151_66:
	mov w0, #8
	mov x1, x26
	bl alloc::raw_vec::handle_error
	b LBB151_69
LBB151_67:
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
	b LBB151_69
LBB151_68:
	mov x20, x19
	mov w0, #8
	mov x1, x24
	bl alloc::raw_vec::handle_error
LBB151_69:
	brk #0x1
	mov x19, x0
	mov x0, x20
	bl _free
	b LBB151_79
	b LBB151_78
	mov x19, x0
	cbz x20, LBB151_88
	mov x0, x25
	bl _free
	b LBB151_75
	mov x19, x0
	cbz x20, LBB151_88
LBB151_75:
	mov x0, x23
	bl _free
	b LBB151_87
	mov x19, x0
	cbnz x20, LBB151_87
	b LBB151_88
LBB151_78:
	mov x19, x0
LBB151_79:
	ldr x8, [sp, #200]
	cbnz x8, LBB151_83
	ldr x8, [sp, #176]
	cbnz x8, LBB151_84
LBB151_81:
	ldr x8, [sp, #152]
	cbnz x8, LBB151_85
LBB151_82:
	ldr x8, [sp, #128]
	cbnz x8, LBB151_86
	b LBB151_88
LBB151_83:
	ldr x0, [sp, #208]
	bl _free
	ldr x8, [sp, #176]
	cbz x8, LBB151_81
LBB151_84:
	ldr x0, [sp, #184]
	bl _free
	ldr x8, [sp, #152]
	cbz x8, LBB151_82
LBB151_85:
	ldr x0, [sp, #160]
	bl _free
	ldr x8, [sp, #128]
	cbz x8, LBB151_88
LBB151_86:
	ldr x24, [sp, #136]
LBB151_87:
	mov x0, x24
	bl _free
LBB151_88:
	mov x0, x19
	bl __Unwind_Resume
