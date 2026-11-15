<engine::force::PairwiseGravity<f32> as engine::force::Force<f32>>::accumulate:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception49
	push rbp
	.cfi_def_cfa_offset 16
	push r15
	.cfi_def_cfa_offset 24
	push r14
	.cfi_def_cfa_offset 32
	push r13
	.cfi_def_cfa_offset 40
	push r12
	.cfi_def_cfa_offset 48
	push rbx
	.cfi_def_cfa_offset 56
	sub rsp, 248
	.cfi_def_cfa_offset 304
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rcx
	mov r14, rdx
	mov rdx, qword ptr [rsi + 16]
	lea rbp, [4*rdx]
	mov rax, rdx
	shr rax, 62
	sete al
	movabs rcx, 9223372036854775805
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB149_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	test rbp, rbp
	mov qword ptr [rsp + 56], r13
	mov qword ptr [rsp + 40], rdi
	je .LBB149_2
	mov qword ptr [rsp + 8], rdx
	mov rbx, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB149_104
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_20
	mov r15, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_102
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_28
	mov rsi, rbx
	mov rcx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 8]
	jmp .LBB149_3
.LBB149_2:
	mov r12d, 4
	mov ecx, 4
	mov r15d, 4
	mov eax, 4
.LBB149_3:
	mov qword ptr [rsp + 72], rdx
	mov r13, rcx
	mov qword ptr [rsp + 80], rcx
	mov qword ptr [rsp + 88], 0
	mov qword ptr [rsp + 96], rdx
	mov qword ptr [rsp + 104], r15
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], rdx
	mov qword ptr [rsp + 128], r12
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 152], rdx
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 168], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, rdx
	cmovb rdx, rcx
	test rdx, rdx
	je .LBB149_4
	mov qword ptr [rsp + 8], rdx
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 64], rax
	xor ebx, ebx
	jmp .LBB149_41
	.p2align	4
.LBB149_52:
	mov rax, qword ptr [rsp + 160]
	vmovss xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 168], rbp
	cmp qword ptr [rsp + 8], rbx
	je .LBB149_5
.LBB149_41:
	vmovss xmm0, dword ptr [r12 + 8*rbx]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r12 + 8*rbx + 4]
	vmovss dword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 64]
	vmovss xmm0, dword ptr [rax + 4*rbx]
	vmovss dword ptr [rsp + 24], xmm0
	cmp rbx, qword ptr [rsp + 72]
	mov rax, r13
	jne .LBB149_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 72]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 80]
.LBB149_44:
	mov r13, rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 88], rbx
	mov rax, qword ptr [rsp + 112]
	mov r15, rax
	cmp rax, qword ptr [rsp + 96]
	jne .LBB149_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_46:
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 208], rax
	vmovss xmm0, dword ptr [rsp + 32]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 32], r15
	mov qword ptr [rsp + 112], r15
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp + 24]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 16], xmm1
	vucomiss xmm0, xmm2
	jne .LBB149_47
	jp .LBB149_47
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	je .LBB149_49
	jmp .LBB149_50
	.p2align	4
.LBB149_47:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rsp + 16], xmm0
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	jne .LBB149_50
.LBB149_49:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_50:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 200], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 136], r15
	mov rbp, qword ptr [rsp + 168]
	cmp rbp, qword ptr [rsp + 152]
	jne .LBB149_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_52
.LBB149_4:
	mov qword ptr [rsp + 200], r12
	mov qword ptr [rsp + 208], r15
	mov qword ptr [rsp + 32], 0
	xor r15d, r15d
	xor ebp, ebp
	xor ebx, ebx
.LBB149_5:
	mov qword ptr [rsp + 192], rax
	mov r13, qword ptr [rsp + 56]
	lea rdi, [4*r13]
	test r13, r13
	mov qword ptr [rsp + 48], rdi
	je .LBB149_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_69
	mov r12, rax
	cmp r13, 5
	jae .LBB149_62
	xor eax, eax
	jmp .LBB149_56
.LBB149_6:
	mov eax, 4
	mov qword ptr [rsp + 16], rax
	mov r11d, 4
	test rbx, rbx
	jne .LBB149_8
	jmp .LBB149_14
.LBB149_62:
	cmp r13, 33
	jae .LBB149_64
	xor eax, eax
	jmp .LBB149_67
.LBB149_64:
	mov eax, r13d
	and eax, 31
	mov ecx, 32
	cmovne rcx, rax
	mov rax, r13
	sub rax, rcx
	xor edx, edx
	.p2align	4
.LBB149_65:
	vmovups ymm0, ymmword ptr [r14 + 8*rdx]
	vmovups ymm1, ymmword ptr [r14 + 8*rdx + 64]
	vmovups ymm2, ymmword ptr [r14 + 8*rdx + 128]
	vmovups ymm3, ymmword ptr [r14 + 8*rdx + 192]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rdx + 32], 136
	vpermpd ymm0, ymm0, 216
	vshufps ymm1, ymm1, ymmword ptr [r14 + 8*rdx + 96], 136
	vpermpd ymm1, ymm1, 216
	vshufps ymm2, ymm2, ymmword ptr [r14 + 8*rdx + 160], 136
	vshufps ymm3, ymm3, ymmword ptr [r14 + 8*rdx + 224], 136
	vpermpd ymm2, ymm2, 216
	vpermpd ymm3, ymm3, 216
	vmovups ymmword ptr [r12 + 4*rdx], ymm0
	vmovups ymmword ptr [r12 + 4*rdx + 32], ymm1
	vmovups ymmword ptr [r12 + 4*rdx + 64], ymm2
	vmovups ymmword ptr [r12 + 4*rdx + 96], ymm3
	add rdx, 32
	cmp rax, rdx
	jne .LBB149_65
	cmp ecx, 4
	jbe .LBB149_56
.LBB149_67:
	mov rcx, rax
	mov eax, r13d
	and eax, 3
	mov edx, 4
	cmovne rdx, rax
	mov rax, r13
	sub rax, rdx
	.p2align	4
.LBB149_68:
	vmovups xmm0, xmmword ptr [r14 + 8*rcx]
	vshufps xmm0, xmm0, xmmword ptr [r14 + 8*rcx + 16], 136
	vmovups xmmword ptr [r12 + 4*rcx], xmm0
	add rcx, 4
	cmp rax, rcx
	jne .LBB149_68
	.p2align	4
.LBB149_56:
	vmovss xmm0, dword ptr [r14 + 8*rax]
	vmovss dword ptr [r12 + 4*rax], xmm0
	inc rax
	cmp r13, rax
	jne .LBB149_56
	.cfi_escape 0x2e, 0x00
	lea rdi, [4*r13]
	vzeroupper
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_78
	mov r11, rax
	cmp r13, 5
	jae .LBB149_71
	xor eax, eax
	jmp .LBB149_60
.LBB149_71:
	cmp r13, 33
	jae .LBB149_73
	xor eax, eax
	jmp .LBB149_76
.LBB149_73:
	mov eax, r13d
	and eax, 31
	mov ecx, 32
	cmovne rcx, rax
	mov rax, r13
	sub rax, rcx
	xor edx, edx
	.p2align	4
.LBB149_74:
	vmovups ymm0, ymmword ptr [r14 + 8*rdx + 4]
	vmovups ymm1, ymmword ptr [r14 + 8*rdx + 68]
	vmovups ymm2, ymmword ptr [r14 + 8*rdx + 132]
	vmovups ymm3, ymmword ptr [r14 + 8*rdx + 196]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rdx + 36], 136
	vpermpd ymm0, ymm0, 216
	vshufps ymm1, ymm1, ymmword ptr [r14 + 8*rdx + 100], 136
	vpermpd ymm1, ymm1, 216
	vshufps ymm2, ymm2, ymmword ptr [r14 + 8*rdx + 164], 136
	vshufps ymm3, ymm3, ymmword ptr [r14 + 8*rdx + 228], 136
	vpermpd ymm2, ymm2, 216
	vpermpd ymm3, ymm3, 216
	vmovups ymmword ptr [r11 + 4*rdx], ymm0
	vmovups ymmword ptr [r11 + 4*rdx + 32], ymm1
	vmovups ymmword ptr [r11 + 4*rdx + 64], ymm2
	vmovups ymmword ptr [r11 + 4*rdx + 96], ymm3
	add rdx, 32
	cmp rax, rdx
	jne .LBB149_74
	cmp ecx, 4
	jbe .LBB149_60
.LBB149_76:
	mov rcx, rax
	mov eax, r13d
	and eax, 3
	mov edx, 4
	cmovne rdx, rax
	mov rax, r13
	sub rax, rdx
	.p2align	4
.LBB149_77:
	vmovups xmm0, xmmword ptr [r14 + 8*rcx + 4]
	vshufps xmm0, xmm0, xmmword ptr [r14 + 8*rcx + 20], 136
	vmovups xmmword ptr [r11 + 4*rcx], xmm0
	add rcx, 4
	cmp rax, rcx
	jne .LBB149_77
	.p2align	4
.LBB149_60:
	vmovss xmm0, dword ptr [r14 + 8*rax + 4]
	vmovss dword ptr [r11 + 4*rax], xmm0
	inc rax
	cmp r13, rax
	jne .LBB149_60
	mov qword ptr [rsp + 16], r12
	test rbx, rbx
	je .LBB149_14
.LBB149_8:
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 232], rax
	mov rax, qword ptr [rsp + 40]
	vmovss xmm0, dword ptr [rax]
	vmovss dword ptr [rsp + 148], xmm0
	vmovss xmm0, dword ptr [rax + 4]
	vmovss dword ptr [rsp + 40], xmm0
	xor r12d, r12d
	xor r13d, r13d
	mov qword ptr [rsp + 240], r11
	.p2align	4
.LBB149_9:
	mov rax, qword ptr [rsp + 32]
	add rax, r13
	je .LBB149_14
	mov rax, r15
	add rax, r13
	je .LBB149_14
	mov rax, rbp
	add rax, r13
	je .LBB149_14
	cmp qword ptr [rsp + 48], r12
	je .LBB149_14
	mov rcx, qword ptr [rsp + 232]
	lea rax, [rcx + r12]
	lea rdx, [rcx + r12]
	add rdx, 4
	lea rcx, [rbx + r13 - 1]
	mov rsi, qword ptr [rsp + 208]
	lea r8, [rsi + r12 + 4]
	mov rdi, qword ptr [rsp + 32]
	lea r9, [rdi + r13 - 1]
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rsi + r12]
	mov rsi, qword ptr [rsp + 200]
	lea rax, [rsi + r12 + 4]
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [rsp + 192]
	vmovss xmm2, dword ptr [rax + r12]
	vmovss dword ptr [rsp + 24], xmm2
	lea rax, [rax + r12 + 4]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rsp + 56]
	lea r10, [rax + r13 - 1]
	lea rax, [r11 + r12 + 4]
	mov rdi, qword ptr [rsp + 16]
	lea r11, [rdi + r12 + 4]
	vmovss xmm2, dword ptr [rsp + 148]
	vmulss xmm2, xmm2, dword ptr [rsi + r12]
	vmovss dword ptr [rsp + 220], xmm0
	vmovss dword ptr [rsp + 224], xmm1
	vmovss dword ptr [rsp + 228], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 176]
	lea rsi, [rsp + 220]
	vmovss xmm0, dword ptr [rsp + 40]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [rbp + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 104]
	.cfi_adjust_cfa_offset 8
	lea rax, [r15 + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 64]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f32>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	mov rax, qword ptr [rsp + 176]
	mov rcx, qword ptr [rsp + 184]
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 176], rax
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 176]
	call engine::force::tree_sum::<f32>
	vmulss xmm0, xmm0, dword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 16]
	vaddss xmm0, xmm0, dword ptr [rax + r12]
	vmovss dword ptr [rax + r12], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 176], rax
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 176]
	call engine::force::tree_sum::<f32>
	mov r11, qword ptr [rsp + 240]
	vmulss xmm0, xmm0, dword ptr [rsp + 24]
	vaddss xmm0, xmm0, dword ptr [r11 + r12]
	vmovss dword ptr [r11 + r12], xmm0
	dec r13
	add r12, 4
	mov rax, rbx
	add rax, r13
	jne .LBB149_9
.LBB149_14:
	mov rdi, qword ptr [rsp + 56]
	test rdi, rdi
	je .LBB149_90
	cmp rdi, 4
	jae .LBB149_80
	xor eax, eax
	mov r15, qword ptr [rsp + 16]
	jmp .LBB149_17
.LBB149_80:
	movabs rcx, 1152921504606846960
	cmp rdi, 16
	mov r15, qword ptr [rsp + 16]
	jae .LBB149_82
	xor eax, eax
	jmp .LBB149_86
.LBB149_82:
	mov rax, rdi
	and rax, rcx
	lea rdx, [rdi + rdi]
	and rdx, -32
	xor esi, esi
	.p2align	4
.LBB149_83:
	vmovups ymm0, ymmword ptr [r15 + 2*rsi]
	vmovups ymm1, ymmword ptr [r15 + 2*rsi + 32]
	vmovups ymm2, ymmword ptr [r11 + 2*rsi]
	vmovups ymm3, ymmword ptr [r11 + 2*rsi + 32]
	vunpckhps ymm4, ymm0, ymm2
	vunpcklps ymm0, ymm0, ymm2
	vinsertf128 ymm2, ymm0, xmm4, 1
	vperm2f128 ymm0, ymm0, ymm4, 49
	vmovups ymmword ptr [r14 + 4*rsi + 32], ymm0
	vmovups ymmword ptr [r14 + 4*rsi], ymm2
	vunpckhps ymm0, ymm1, ymm3
	vunpcklps ymm1, ymm1, ymm3
	vinsertf128 ymm2, ymm1, xmm0, 1
	vperm2f128 ymm0, ymm1, ymm0, 49
	vmovups ymmword ptr [r14 + 4*rsi + 96], ymm0
	vmovups ymmword ptr [r14 + 4*rsi + 64], ymm2
	add rsi, 32
	cmp rdx, rsi
	jne .LBB149_83
	cmp rdi, rax
	je .LBB149_89
	test dil, 12
	je .LBB149_17
.LBB149_86:
	mov rdx, rax
	add rcx, 12
	mov rax, rcx
	and rax, rdi
	vmovaps ymm0, ymmword ptr [rip + .LCPI149_1]
	vmovaps ymm1, ymmword ptr [rip + .LCPI149_2]
	.p2align	4
.LBB149_87:
	vbroadcastf128 ymm2, xmmword ptr [r11 + 4*rdx]
	vpermilps ymm2, ymm2, ymm0
	vbroadcastf128 ymm3, xmmword ptr [r15 + 4*rdx]
	vpermilps ymm3, ymm3, ymm1
	vblendps ymm2, ymm3, ymm2, 170
	vmovups ymmword ptr [r14 + 8*rdx], ymm2
	add rdx, 4
	cmp rax, rdx
	jne .LBB149_87
	jmp .LBB149_88
.LBB149_104:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_20:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_70
.LBB149_102:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_70
.LBB149_28:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_70
.LBB149_69:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
	jmp .LBB149_70
.LBB149_78:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
.LBB149_70:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_31
	jmp .LBB149_30
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	je .LBB149_101
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_22
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	je .LBB149_101
.LBB149_22:
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_100
	mov rbx, rax
	cmp qword ptr [rsp + 8], 0
	jne .LBB149_100
	jmp .LBB149_101
.LBB149_30:
	mov rbx, rax
.LBB149_31:
	cmp qword ptr [rsp + 152], 0
	jne .LBB149_32
	cmp qword ptr [rsp + 120], 0
	jne .LBB149_34
.LBB149_35:
	cmp qword ptr [rsp + 96], 0
	jne .LBB149_36
.LBB149_37:
	cmp qword ptr [rsp + 72], 0
	jne .LBB149_38
	jmp .LBB149_101
.LBB149_32:
	mov rdi, qword ptr [rsp + 160]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB149_35
.LBB149_34:
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB149_37
.LBB149_36:
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 72], 0
	je .LBB149_101
.LBB149_38:
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 24], rax
.LBB149_100:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 24]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_101:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB149_17:
	vmovss xmm0, dword ptr [r15 + 4*rax]
	vmovss xmm1, dword ptr [r11 + 4*rax]
	vmovss dword ptr [r14 + 8*rax], xmm0
	vmovss dword ptr [r14 + 8*rax + 4], xmm1
	inc rax
.LBB149_88:
	cmp rdi, rax
	jne .LBB149_17
.LBB149_89:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r11
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call rbx
.LBB149_90:
	cmp qword ptr [rsp + 152], 0
	mov rdi, qword ptr [rsp + 192]
	je .LBB149_92
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_92:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_94
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_94:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_96
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_96:
	cmp qword ptr [rsp + 72], 0
	je .LBB149_98
	mov rdi, qword ptr [rsp + 80]
	.cfi_escape 0x2e, 0x00
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_98:
	add rsp, 248
	.cfi_def_cfa_offset 56
	pop rbx
	.cfi_def_cfa_offset 48
	pop r12
	.cfi_def_cfa_offset 40
	pop r13
	.cfi_def_cfa_offset 32
	pop r14
	.cfi_def_cfa_offset 24
	pop r15
	.cfi_def_cfa_offset 16
	pop rbp
	.cfi_def_cfa_offset 8
	vzeroupper
	ret
