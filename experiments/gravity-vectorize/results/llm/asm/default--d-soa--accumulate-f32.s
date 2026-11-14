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
	sub rsp, 264
	.cfi_def_cfa_offset 320
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r9, qword ptr [rsi + 16]
	lea rbx, [4*r9]
	mov rax, r9
	shr rax, 62
	sete al
	movabs r8, 9223372036854775805
	cmp rbx, r8
	setb r8b
	test al, r8b
	jne .LBB147_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	test rbx, rbx
	mov qword ptr [rsp + 56], rcx
	je .LBB147_2
	mov qword ptr [rsp + 16], r9
	mov rbp, rdi
	mov r15, rdx
	mov r14, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB147_86
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_20
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_84
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_28
	mov rsi, r14
	mov rdx, r15
	mov rdi, rbp
	mov r14, qword ptr [rsp + 8]
	mov r9, qword ptr [rsp + 16]
	jmp .LBB147_3
.LBB147_2:
	mov r13d, 4
	mov r14d, 4
	mov r12d, 4
	mov eax, 4
.LBB147_3:
	mov qword ptr [rsp + 64], rdi
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 88], r9
	mov qword ptr [rsp + 96], r14
	mov qword ptr [rsp + 104], 0
	mov qword ptr [rsp + 120], r9
	mov qword ptr [rsp + 128], r12
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r9
	mov qword ptr [rsp + 152], r13
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r9
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r9
	cmovb r9, rcx
	test r9, r9
	je .LBB147_4
	mov qword ptr [rsp + 16], r9
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor r12d, r12d
	jmp .LBB147_41
	.p2align	4
.LBB147_52:
	mov rax, qword ptr [rsp + 176]
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 184], rbp
	cmp qword ptr [rsp + 16], r12
	je .LBB147_5
.LBB147_41:
	movss xmm0, dword ptr [r15 + 8*r12]
	movss dword ptr [rsp + 24], xmm0
	movss xmm0, dword ptr [r15 + 8*r12 + 4]
	movss dword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 72]
	movss xmm0, dword ptr [rax + 4*r12]
	movss dword ptr [rsp + 8], xmm0
	cmp r12, qword ptr [rsp + 88]
	jne .LBB147_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 88]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov r14, qword ptr [rsp + 96]
.LBB147_44:
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [r14 + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 104], r12
	mov rbx, qword ptr [rsp + 136]
	cmp rbx, qword ptr [rsp + 120]
	jne .LBB147_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_46:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	movss xmm0, dword ptr [rsp + 32]
	movss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 136], rbx
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp + 8]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 24], xmm1
	ucomiss xmm0, xmm2
	jne .LBB147_47
	jp .LBB147_47
	mov r13, qword ptr [rsp + 160]
	cmp r13, qword ptr [rsp + 144]
	je .LBB147_49
	jmp .LBB147_50
	.p2align	4
.LBB147_47:
	movss xmm0, dword ptr [rip + .LCPI147_0]
	divss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rsp + 24], xmm0
	mov r13, qword ptr [rsp + 160]
	cmp r13, qword ptr [rsp + 144]
	jne .LBB147_50
.LBB147_49:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_50:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 32], rax
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 160], r13
	mov rbp, qword ptr [rsp + 184]
	cmp rbp, qword ptr [rsp + 168]
	jne .LBB147_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_52
.LBB147_4:
	mov qword ptr [rsp + 32], r13
	mov qword ptr [rsp + 80], r12
	xor ebx, ebx
	xor r13d, r13d
	xor ebp, ebp
	xor r12d, r12d
.LBB147_5:
	mov qword ptr [rsp + 192], rax
	mov r14, qword ptr [rsp + 56]
	lea rdi, [4*r14]
	test r14, r14
	mov qword ptr [rsp + 48], rdi
	je .LBB147_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_63
	cmp r14, 8
	mov r15, qword ptr [rsp + 40]
	ja .LBB147_61
	xor edx, edx
	jmp .LBB147_56
.LBB147_6:
	mov r11d, 4
	mov r8d, 4
	jmp .LBB147_7
.LBB147_61:
	mov edx, r14d
	and edx, 7
	mov ecx, 8
	cmovne rcx, rdx
	mov rdx, r14
	sub rdx, rcx
	xor ecx, ecx
	.p2align	4
.LBB147_62:
	movups xmm0, xmmword ptr [r15 + 8*rcx]
	movups xmm1, xmmword ptr [r15 + 8*rcx + 16]
	shufps xmm0, xmm1, 136
	movups xmm1, xmmword ptr [r15 + 8*rcx + 32]
	movups xmm2, xmmword ptr [r15 + 8*rcx + 48]
	shufps xmm1, xmm2, 136
	movups xmmword ptr [rax + 4*rcx], xmm0
	movups xmmword ptr [rax + 4*rcx + 16], xmm1
	add rcx, 8
	cmp rdx, rcx
	jne .LBB147_62
	.p2align	4
.LBB147_56:
	movss xmm0, dword ptr [r15 + 8*rdx]
	movss dword ptr [rax + 4*rdx], xmm0
	inc rdx
	cmp r14, rdx
	jne .LBB147_56
	mov qword ptr [rsp + 8], rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [4*r14]
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_67
	mov r8, rax
	cmp r14, 8
	mov r11, qword ptr [rsp + 8]
	ja .LBB147_65
	xor eax, eax
	jmp .LBB147_60
.LBB147_65:
	mov eax, r14d
	and eax, 7
	mov ecx, 8
	cmovne rcx, rax
	mov rax, r14
	sub rax, rcx
	xor ecx, ecx
	.p2align	4
.LBB147_66:
	movups xmm0, xmmword ptr [r15 + 8*rcx + 4]
	movups xmm1, xmmword ptr [r15 + 8*rcx + 20]
	shufps xmm0, xmm1, 136
	movups xmm1, xmmword ptr [r15 + 8*rcx + 36]
	movups xmm2, xmmword ptr [r15 + 8*rcx + 52]
	shufps xmm1, xmm2, 136
	movups xmmword ptr [r8 + 4*rcx], xmm0
	movups xmmword ptr [r8 + 4*rcx + 16], xmm1
	add rcx, 8
	cmp rax, rcx
	jne .LBB147_66
	.p2align	4
.LBB147_60:
	movss xmm0, dword ptr [r15 + 8*rax + 4]
	movss dword ptr [r8 + 4*rax], xmm0
	inc rax
	cmp r14, rax
	jne .LBB147_60
.LBB147_7:
	test r12, r12
	je .LBB147_14
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 216], rax
	mov rax, qword ptr [rsp + 64]
	movss xmm0, dword ptr [rax]
	movss dword ptr [rsp + 116], xmm0
	movss xmm0, dword ptr [rax + 4]
	movss dword ptr [rsp + 112], xmm0
	xor r14d, r14d
	xor r15d, r15d
	mov qword ptr [rsp + 8], r11
	mov qword ptr [rsp + 24], r8
	.p2align	4
.LBB147_9:
	mov rax, rbx
	add rax, r15
	je .LBB147_14
	mov rax, r13
	add rax, r15
	je .LBB147_14
	mov rax, rbp
	add rax, r15
	je .LBB147_14
	cmp qword ptr [rsp + 48], r14
	je .LBB147_14
	mov rcx, qword ptr [rsp + 216]
	lea rax, [rcx + r14]
	lea rdx, [rcx + r14]
	add rdx, 4
	lea rcx, [r12 + r15 - 1]
	mov rsi, qword ptr [rsp + 80]
	lea r8, [rsi + r14 + 4]
	lea r9, [rbx + r15 - 1]
	movss xmm0, dword ptr [rax]
	movss xmm1, dword ptr [rsi + r14]
	mov rsi, qword ptr [rsp + 32]
	lea rax, [rsi + r14 + 4]
	mov qword ptr [rsp + 72], rax
	mov rax, qword ptr [rsp + 192]
	movss xmm2, dword ptr [rax + r14]
	movss dword ptr [rsp + 16], xmm2
	lea rax, [rax + r14 + 4]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rsp + 56]
	lea r10, [rax + r15 - 1]
	mov rax, qword ptr [rsp + 24]
	lea rax, [rax + r14 + 4]
	mov rdi, qword ptr [rsp + 8]
	lea r11, [rdi + r14 + 4]
	movss xmm2, dword ptr [rsi + r14]
	mulss xmm2, dword ptr [rsp + 116]
	movss dword ptr [rsp + 204], xmm0
	movss dword ptr [rsp + 208], xmm1
	movss dword ptr [rsp + 212], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 204]
	movss xmm0, dword ptr [rsp + 112]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [rbp + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 104]
	.cfi_adjust_cfa_offset 8
	lea rax, [r13 + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 128]
	.cfi_adjust_cfa_offset 8
	call engine::force::sweep::<f32>
	mov r8, qword ptr [rsp + 88]
	mov r11, qword ptr [rsp + 72]
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	movsd xmm0, qword ptr [rsp + 228]
	movaps xmm1, xmmword ptr [rsp + 224]
	shufps xmm1, xmm1, 236
	addps xmm1, xmm0
	movaps xmm0, xmm1
	shufps xmm0, xmm1, 85
	addss xmm0, xmm1
	movss xmm3, dword ptr [rsp + 16]
	mulss xmm0, xmm3
	movsd xmm1, qword ptr [rsp + 244]
	movaps xmm2, xmmword ptr [rsp + 240]
	shufps xmm2, xmm2, 236
	addps xmm2, xmm1
	addss xmm0, dword ptr [r11 + r14]
	movss dword ptr [r11 + r14], xmm0
	movaps xmm0, xmm2
	shufps xmm0, xmm2, 85
	addss xmm0, xmm2
	mulss xmm0, xmm3
	addss xmm0, dword ptr [r8 + r14]
	movss dword ptr [r8 + r14], xmm0
	dec r15
	add r14, 4
	mov rax, r12
	add rax, r15
	jne .LBB147_9
.LBB147_14:
	mov rsi, qword ptr [rsp + 56]
	test rsi, rsi
	mov r14, qword ptr [rsp + 80]
	mov r15, qword ptr [rsp + 32]
	je .LBB147_73
	cmp rsi, 4
	jae .LBB147_69
	xor eax, eax
	mov rdi, qword ptr [rsp + 40]
	jmp .LBB147_17
.LBB147_69:
	movabs rax, 1152921504606846972
	and rax, rsi
	lea rcx, [rsi + rsi]
	and rcx, -8
	xor edx, edx
	mov rdi, qword ptr [rsp + 40]
	.p2align	4
.LBB147_70:
	movsd xmm0, qword ptr [r11 + 2*rdx]
	movsd xmm1, qword ptr [r11 + 2*rdx + 8]
	movsd xmm2, qword ptr [r8 + 2*rdx]
	unpcklps xmm0, xmm2
	movsd xmm2, qword ptr [r8 + 2*rdx + 8]
	unpcklps xmm1, xmm2
	movups xmmword ptr [rdi + 4*rdx], xmm0
	movups xmmword ptr [rdi + 4*rdx + 16], xmm1
	add rdx, 8
	cmp rcx, rdx
	jne .LBB147_70
	jmp .LBB147_71
.LBB147_86:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB147_20:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_64
.LBB147_84:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_64
.LBB147_28:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_64
.LBB147_63:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
	jmp .LBB147_64
.LBB147_67:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
.LBB147_64:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_31
	jmp .LBB147_30
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_83
	.cfi_escape 0x2e, 0x00
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_22
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_83
.LBB147_22:
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_82
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB147_82
	jmp .LBB147_83
.LBB147_30:
	mov rbx, rax
.LBB147_31:
	cmp qword ptr [rsp + 168], 0
	jne .LBB147_32
	cmp qword ptr [rsp + 144], 0
	jne .LBB147_34
.LBB147_35:
	cmp qword ptr [rsp + 120], 0
	jne .LBB147_36
.LBB147_37:
	cmp qword ptr [rsp + 88], 0
	jne .LBB147_38
	jmp .LBB147_83
.LBB147_32:
	mov rdi, qword ptr [rsp + 176]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB147_35
.LBB147_34:
	mov rdi, qword ptr [rsp + 152]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB147_37
.LBB147_36:
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 88], 0
	je .LBB147_83
.LBB147_38:
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 8], rax
.LBB147_82:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_83:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB147_17:
	movss xmm0, dword ptr [r11 + 4*rax]
	movss xmm1, dword ptr [r8 + 4*rax]
	movss dword ptr [rdi + 8*rax], xmm0
	movss dword ptr [rdi + 8*rax + 4], xmm1
	inc rax
.LBB147_71:
	cmp rsi, rax
	jne .LBB147_17
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r8
	mov r12, r11
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call rbx
.LBB147_73:
	cmp qword ptr [rsp + 168], 0
	mov rdi, qword ptr [rsp + 192]
	je .LBB147_75
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB147_75:
	cmp qword ptr [rsp + 144], 0
	je .LBB147_77
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
.LBB147_77:
	cmp qword ptr [rsp + 120], 0
	je .LBB147_79
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB147_79:
	cmp qword ptr [rsp + 88], 0
	je .LBB147_80
	mov rdi, qword ptr [rsp + 96]
	add rsp, 264
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB147_80:
	.cfi_def_cfa_offset 320
	add rsp, 264
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
	ret
