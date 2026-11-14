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
	sub rsp, 280
	.cfi_def_cfa_offset 336
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	mov r8, qword ptr [rsi + 16]
	lea rbp, [4*r8]
	mov rax, r8
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
	mov qword ptr [rsp + 56], r14
	mov qword ptr [rsp + 40], rdi
	je .LBB149_2
	mov qword ptr [rsp + 16], r8
	mov r15, rdx
	mov rbx, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_87
	mov qword ptr [rsp + 8], rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_20
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_85
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_28
	mov rsi, rbx
	mov rdx, r15
	mov rcx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	jmp .LBB149_3
.LBB149_2:
	mov r13d, 4
	mov ecx, 4
	mov r12d, 4
	mov eax, 4
.LBB149_3:
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 72], r8
	mov r14, rcx
	mov qword ptr [rsp + 80], rcx
	mov qword ptr [rsp + 88], 0
	mov qword ptr [rsp + 96], r8
	mov qword ptr [rsp + 104], r12
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r8
	mov qword ptr [rsp + 128], r13
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 152], r8
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 168], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB149_4
	mov qword ptr [rsp + 16], r8
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 64], rax
	xor ebx, ebx
	jmp .LBB149_41
	.p2align	4
.LBB149_52:
	mov rax, qword ptr [rsp + 160]
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 168], rbp
	cmp qword ptr [rsp + 16], rbx
	je .LBB149_5
.LBB149_41:
	movss xmm0, dword ptr [r15 + 8*rbx]
	movss dword ptr [rsp], xmm0
	movss xmm0, dword ptr [r15 + 8*rbx + 4]
	movss dword ptr [rsp + 24], xmm0
	mov rax, qword ptr [rsp + 64]
	movss xmm0, dword ptr [rax + 4*rbx]
	movss dword ptr [rsp + 8], xmm0
	cmp rbx, qword ptr [rsp + 72]
	mov rax, r14
	jne .LBB149_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 72]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 80]
.LBB149_44:
	mov r14, rax
	movss xmm0, dword ptr [rsp]
	movss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 88], rbx
	mov r13, qword ptr [rsp + 112]
	cmp r13, qword ptr [rsp + 96]
	jne .LBB149_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_46:
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 200], rax
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 112], r13
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp + 8]
	xorps xmm1, xmm1
	movss dword ptr [rsp], xmm1
	ucomiss xmm0, xmm2
	jne .LBB149_47
	jp .LBB149_47
	mov r12, qword ptr [rsp + 136]
	cmp r12, qword ptr [rsp + 120]
	je .LBB149_49
	jmp .LBB149_50
	.p2align	4
.LBB149_47:
	movss xmm0, dword ptr [rip + .LCPI149_0]
	divss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rsp], xmm0
	mov r12, qword ptr [rsp + 136]
	cmp r12, qword ptr [rsp + 120]
	jne .LBB149_50
.LBB149_49:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_50:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 24], rax
	movss xmm0, dword ptr [rsp]
	movss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 136], r12
	mov rbp, qword ptr [rsp + 168]
	cmp rbp, qword ptr [rsp + 152]
	jne .LBB149_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_52
.LBB149_4:
	mov qword ptr [rsp + 24], r13
	mov qword ptr [rsp + 200], r12
	xor r13d, r13d
	xor r12d, r12d
	xor ebp, ebp
	xor ebx, ebx
.LBB149_5:
	mov qword ptr [rsp + 192], rax
	mov r14, qword ptr [rsp + 56]
	lea rdi, [4*r14]
	test r14, r14
	mov qword ptr [rsp + 48], rdi
	je .LBB149_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_63
	cmp r14, 8
	mov r15, qword ptr [rsp + 32]
	ja .LBB149_61
	xor edx, edx
	jmp .LBB149_56
.LBB149_6:
	mov eax, 4
	mov qword ptr [rsp], rax
	mov r11d, 4
	jmp .LBB149_7
.LBB149_61:
	mov edx, r14d
	and edx, 7
	mov ecx, 8
	cmovne rcx, rdx
	mov rdx, r14
	sub rdx, rcx
	xor ecx, ecx
	.p2align	4
.LBB149_62:
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
	jne .LBB149_62
	.p2align	4
.LBB149_56:
	movss xmm0, dword ptr [r15 + 8*rdx]
	movss dword ptr [rax + 4*rdx], xmm0
	inc rdx
	cmp r14, rdx
	jne .LBB149_56
	mov qword ptr [rsp], rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [4*r14]
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_67
	mov r11, rax
	cmp r14, 8
	ja .LBB149_65
	xor eax, eax
	jmp .LBB149_60
.LBB149_65:
	mov eax, r14d
	and eax, 7
	mov ecx, 8
	cmovne rcx, rax
	mov rax, r14
	sub rax, rcx
	xor ecx, ecx
	.p2align	4
.LBB149_66:
	movups xmm0, xmmword ptr [r15 + 8*rcx + 4]
	movups xmm1, xmmword ptr [r15 + 8*rcx + 20]
	shufps xmm0, xmm1, 136
	movups xmm1, xmmword ptr [r15 + 8*rcx + 36]
	movups xmm2, xmmword ptr [r15 + 8*rcx + 52]
	shufps xmm1, xmm2, 136
	movups xmmword ptr [r11 + 4*rcx], xmm0
	movups xmmword ptr [r11 + 4*rcx + 16], xmm1
	add rcx, 8
	cmp rax, rcx
	jne .LBB149_66
	.p2align	4
.LBB149_60:
	movss xmm0, dword ptr [r15 + 8*rax + 4]
	movss dword ptr [r11 + 4*rax], xmm0
	inc rax
	cmp r14, rax
	jne .LBB149_60
.LBB149_7:
	test rbx, rbx
	je .LBB149_14
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 208], rax
	mov rax, qword ptr [rsp + 40]
	movss xmm0, dword ptr [rax]
	movss dword ptr [rsp + 148], xmm0
	movss xmm0, dword ptr [rax + 4]
	movss dword ptr [rsp + 40], xmm0
	xor r14d, r14d
	xor r15d, r15d
	mov qword ptr [rsp + 216], r11
	.p2align	4
.LBB149_9:
	mov rax, r13
	add rax, r15
	je .LBB149_14
	mov rax, r12
	add rax, r15
	je .LBB149_14
	mov rax, rbp
	add rax, r15
	je .LBB149_14
	cmp qword ptr [rsp + 48], r14
	je .LBB149_14
	mov rcx, qword ptr [rsp + 208]
	lea rax, [rcx + r14]
	lea rdx, [rcx + r14]
	add rdx, 4
	lea rcx, [rbx + r15 - 1]
	mov rsi, qword ptr [rsp + 200]
	lea r8, [rsi + r14 + 4]
	lea r9, [r13 + r15 - 1]
	movss xmm0, dword ptr [rax]
	movss xmm1, dword ptr [rsi + r14]
	mov rsi, qword ptr [rsp + 24]
	lea rax, [rsi + r14 + 4]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 192]
	movss xmm2, dword ptr [rax + r14]
	movss dword ptr [rsp + 8], xmm2
	lea rax, [rax + r14 + 4]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rsp + 56]
	lea r10, [rax + r15 - 1]
	lea rax, [r11 + r14 + 4]
	mov rdi, qword ptr [rsp]
	lea r11, [rdi + r14 + 4]
	movss xmm2, dword ptr [rsi + r14]
	mulss xmm2, dword ptr [rsp + 148]
	movss dword ptr [rsp + 176], xmm0
	movss dword ptr [rsp + 180], xmm1
	movss dword ptr [rsp + 184], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 176]
	movss xmm0, dword ptr [rsp + 40]
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
	lea rax, [r12 + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	call engine::force::sweep::<f32>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	movups xmm0, xmmword ptr [rsp + 224]
	movaps xmmword ptr [rsp + 176], xmm0
	lea rax, [rsp + 240]
	movups xmm0, xmmword ptr [rax]
	movaps xmmword ptr [rsp + 256], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 4
	lea rdi, [rsp + 176]
	call engine::force::tree_sum::<f32>
	mulss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp]
	addss xmm0, dword ptr [rax + r14]
	movss dword ptr [rax + r14], xmm0
	movaps xmm0, xmmword ptr [rsp + 256]
	movaps xmmword ptr [rsp + 224], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 4
	lea rdi, [rsp + 224]
	call engine::force::tree_sum::<f32>
	mov r11, qword ptr [rsp + 216]
	mulss xmm0, dword ptr [rsp + 8]
	addss xmm0, dword ptr [r11 + r14]
	movss dword ptr [r11 + r14], xmm0
	dec r15
	add r14, 4
	mov rax, rbx
	add rax, r15
	jne .LBB149_9
.LBB149_14:
	mov rsi, qword ptr [rsp + 56]
	test rsi, rsi
	je .LBB149_73
	cmp rsi, 4
	jae .LBB149_69
	xor eax, eax
	mov rdi, qword ptr [rsp + 32]
	mov r14, qword ptr [rsp]
	jmp .LBB149_17
.LBB149_69:
	movabs rax, 1152921504606846972
	and rax, rsi
	lea rcx, [rsi + rsi]
	and rcx, -8
	xor edx, edx
	mov rdi, qword ptr [rsp + 32]
	mov r14, qword ptr [rsp]
	.p2align	4
.LBB149_70:
	movsd xmm0, qword ptr [r14 + 2*rdx]
	movsd xmm1, qword ptr [r14 + 2*rdx + 8]
	movsd xmm2, qword ptr [r11 + 2*rdx]
	unpcklps xmm0, xmm2
	movsd xmm2, qword ptr [r11 + 2*rdx + 8]
	unpcklps xmm1, xmm2
	movups xmmword ptr [rdi + 4*rdx], xmm0
	movups xmmword ptr [rdi + 4*rdx + 16], xmm1
	add rdx, 8
	cmp rcx, rdx
	jne .LBB149_70
	jmp .LBB149_71
.LBB149_87:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_20:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_64
.LBB149_85:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_64
.LBB149_28:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_64
.LBB149_63:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
	jmp .LBB149_64
.LBB149_67:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
.LBB149_64:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_31
	jmp .LBB149_30
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB149_84
	.cfi_escape 0x2e, 0x00
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_22
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB149_84
.LBB149_22:
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_83
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB149_83
	jmp .LBB149_84
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
	jmp .LBB149_84
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
	je .LBB149_84
.LBB149_38:
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 8], rax
.LBB149_83:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_84:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB149_17:
	movss xmm0, dword ptr [r14 + 4*rax]
	movss xmm1, dword ptr [r11 + 4*rax]
	movss dword ptr [rdi + 8*rax], xmm0
	movss dword ptr [rdi + 8*rax + 4], xmm1
	inc rax
.LBB149_71:
	cmp rsi, rax
	jne .LBB149_17
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r11
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call rbx
.LBB149_73:
	cmp qword ptr [rsp + 152], 0
	mov rdi, qword ptr [rsp + 192]
	je .LBB149_75
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB149_75:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_77
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB149_77:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_79
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB149_79:
	cmp qword ptr [rsp + 72], 0
	je .LBB149_81
	mov rdi, qword ptr [rsp + 80]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB149_81:
	add rsp, 280
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
