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
	sub rsp, 376
	.cfi_def_cfa_offset 432
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	movabs rax, 4611686018427387888
	mov r15, qword ptr [rsi + 16]
	lea rbx, [4*r15]
	add rax, 15
	cmp r15, rax
	setbe al
	movabs rcx, 9223372036854775805
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB147_2
	call alloc::raw_vec::capacity_overflow
.LBB147_2:
	test rbx, rbx
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 48], rdi
	je .LBB147_8
	mov qword ptr [rsp + 8], rsi
	mov r13, rdx
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB147_79
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_80
	mov r12, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_81
	mov rbp, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_82
	mov rdx, r13
	mov r13, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB147_9
.LBB147_8:
	mov ebp, 4
	mov r13d, 4
	mov r12d, 4
	mov eax, 4
.LBB147_9:
	mov qword ptr [rsp + 192], rbx
	mov qword ptr [rsp + 224], rdx
	mov qword ptr [rsp + 232], r14
	mov qword ptr [rsp + 96], r15
	mov qword ptr [rsp + 104], r13
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r15
	mov qword ptr [rsp + 128], r12
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r15
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r15
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r15
	cmovae rcx, r15
	mov qword ptr [rsp + 64], rcx
	test rcx, rcx
	je .LBB147_23
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 56], rax
	xor r15d, r15d
	jmp .LBB147_12
	.p2align	4
.LBB147_11:
	mov rax, qword ptr [rsp + 176]
	movss xmm0, dword ptr [rsp]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp qword ptr [rsp + 64], r15
	je .LBB147_24
.LBB147_12:
	movss xmm0, dword ptr [rbp + 8*r15]
	movss dword ptr [rsp + 8], xmm0
	movss xmm0, dword ptr [rbp + 8*r15 + 4]
	movss dword ptr [rsp + 24], xmm0
	mov rax, qword ptr [rsp + 56]
	movss xmm0, dword ptr [rax + 4*r15]
	movss dword ptr [rsp], xmm0
	cmp r15, qword ptr [rsp + 96]
	mov rax, r13
	jne .LBB147_15
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB147_15:
	mov r13, rax
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 112], r15
	mov rax, qword ptr [rsp + 136]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB147_17
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_17:
	mov r12, qword ptr [rsp + 128]
	mov rax, rbx
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [r12 + 4*rbx], xmm0
	inc rax
	mov rbx, rax
	mov qword ptr [rsp + 136], rax
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 8], xmm1
	ucomiss xmm0, xmm2
	jne .LBB147_19
	jp .LBB147_19
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	je .LBB147_20
	jmp .LBB147_21
	.p2align	4
.LBB147_19:
	movss xmm0, dword ptr [rip + .LCPI147_0]
	divss xmm0, dword ptr [rsp]
	movss dword ptr [rsp + 8], xmm0
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB147_21
.LBB147_20:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_21:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 80], rax
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 8], r14
	mov qword ptr [rsp + 160], r14
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB147_11
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_11
.LBB147_23:
	mov qword ptr [rsp + 80], rbp
	mov qword ptr [rsp + 8], 0
	xor r14d, r14d
	xor ebx, ebx
	xor r15d, r15d
.LBB147_24:
	mov rdx, qword ptr [rsp + 16]
	mov rcx, rdx
	shr rcx, 61
	je .LBB147_27
	xor edi, edi
.LBB147_26:
	mov rsi, qword ptr [rsp + 192]
	call alloc::raw_vec::handle_error
	jmp .LBB147_85
.LBB147_27:
	mov rcx, qword ptr [rsp + 48]
	movss xmm0, dword ptr [rcx]
	movss dword ptr [rsp + 92], xmm0
	movss xmm0, dword ptr [rcx + 4]
	movss dword ptr [rsp + 88], xmm0
	mov ecx, 4
	mov qword ptr [rsp + 32], rcx
	mov qword ptr [rsp + 72], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 80]
	mov qword ptr [rsp + 208], rax
	je .LBB147_31
	mov esi, 1
	mov r13, qword ptr [rsp + 192]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB147_83
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 72], rax
	test rax, rax
	je .LBB147_84
	mov rax, qword ptr [rsp + 208]
.LBB147_31:
	mov qword ptr [rsp + 24], r14
	mov rcx, qword ptr [rsp + 104]
	mov qword ptr [rsp + 216], rax
	mov qword ptr [rsp + 64], rbp
	mov qword ptr [rsp + 264], r12
	mov qword ptr [rsp + 56], r12
	mov qword ptr [rsp + 256], rcx
	mov qword ptr [rsp], rcx
	mov r13, rbx
	jmp .LBB147_34
	.p2align	4
.LBB147_32:
	movaps xmm5, xmm3
.LBB147_33:
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 24], r14
	movaps xmm6, xmm1
	shufps xmm6, xmm1, 85
	addss xmm6, xmm1
	shufps xmm0, xmm0, 85
	addss xmm0, xmm2
	addss xmm0, xmm6
	movaps xmm1, xmm4
	shufps xmm1, xmm4, 85
	addss xmm1, xmm4
	shufps xmm3, xmm3, 85
	addss xmm3, xmm5
	addss xmm3, xmm1
	unpcklps xmm0, xmm3
	movaps xmm1, xmmword ptr [rsp + 192]
	unpcklps xmm1, xmm1
	mulps xmm1, xmm0
	movsd xmm0, qword ptr [rax]
	addps xmm0, xmm1
	movlps qword ptr [rax], xmm0
.LBB147_34:
	mov rbx, qword ptr [rsp + 224]
	mov r10, qword ptr [rsp + 232]
	mov rbp, r10
	mov rdi, qword ptr [rsp]
	mov rcx, rdi
	mov qword ptr [rsp + 192], r15
	mov rsi, qword ptr [rsp + 56]
	mov rdx, rsi
	mov r9, r13
	mov rax, qword ptr [rsp + 64]
	mov r11, rax
	mov r8, r15
	mov qword ptr [rsp + 40], rbx
	lea r14, [rbx + 8]
	mov r12, r10
	sub r12, 1
	cmovae r10, r12
	mov qword ptr [rsp + 232], r10
	mov qword ptr [rsp + 272], r14
	cmovae rbx, r14
	mov qword ptr [rsp + 224], rbx
	lea r10, [rdi + 4]
	sub r15, 1
	cmovb r15, r8
	cmovb r10, rdi
	mov qword ptr [rsp], r10
	mov rbx, qword ptr [rsp + 8]
	mov r14, rbx
	lea r8, [rsi + 4]
	mov rdi, r13
	sub rdi, 1
	cmovae r13, rdi
	mov qword ptr [rsp + 48], r13
	cmovae rsi, r8
	mov qword ptr [rsp + 56], rsi
	mov r10, rbx
	sub r10, 1
	cmovae rbx, r10
	mov qword ptr [rsp + 8], rbx
	lea r13, [rax + 4]
	cmovae rax, r13
	mov qword ptr [rsp + 64], rax
	cmp qword ptr [rsp + 24], 0
	je .LBB147_68
	test rbp, rbp
	je .LBB147_68
	cmp qword ptr [rsp + 192], 0
	je .LBB147_68
	test rcx, rcx
	je .LBB147_68
	test r9, r9
	je .LBB147_68
	test rdx, rdx
	je .LBB147_68
	test r14, r14
	je .LBB147_68
	test r11, r11
	je .LBB147_68
	mov r14, qword ptr [rsp + 24]
	dec r14
	movss xmm0, dword ptr [rcx]
	movss xmm1, dword ptr [rdx]
	mov rcx, qword ptr [rsp + 216]
	movss xmm2, dword ptr [rcx]
	movaps xmmword ptr [rsp + 192], xmm2
	add rcx, 4
	movss xmm2, dword ptr [r11]
	mulss xmm2, dword ptr [rsp + 92]
	movss dword ptr [rsp + 240], xmm0
	movss dword ptr [rsp + 244], xmm1
	movss dword ptr [rsp + 248], xmm2
	movss xmm0, dword ptr [rsp + 88]
	movss dword ptr [rsp + 252], xmm0
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 312], rax
	mov qword ptr [rsp + 320], r15
	mov qword ptr [rsp + 328], r8
	mov qword ptr [rsp + 336], rdi
	mov qword ptr [rsp + 344], r13
	mov qword ptr [rsp + 352], r10
	mov qword ptr [rsp + 216], rcx
	mov qword ptr [rsp + 360], rcx
	mov qword ptr [rsp + 368], r14
	mov r13, qword ptr [rsp + 32]
	mov qword ptr [rsp + 280], r13
	mov rbx, qword ptr [rsp + 16]
	mov qword ptr [rsp + 288], rbx
	mov rbp, qword ptr [rsp + 72]
	mov qword ptr [rsp + 296], rbp
	mov qword ptr [rsp + 304], rbx
	lea rdi, [rsp + 240]
	lea rsi, [rsp + 312]
	mov rdx, qword ptr [rsp + 272]
	mov rcx, r12
	lea r8, [rsp + 280]
	call engine::force::pass_one::<f32>
	cmp r12, rbx
	mov rsi, r13
	mov r8d, 4
	cmova rsi, r8
	mov rax, r12
	mov ecx, 0
	cmova rax, rcx
	lea rcx, [4*rax]
	movabs rdx, 4611686018427387888
	and rcx, rdx
	je .LBB147_48
	lea rdi, [rcx - 16]
	xorps xmm2, xmm2
	mov rdx, rsi
	xorps xmm3, xmm3
	test dil, 16
	mov r13, qword ptr [rsp + 48]
	jne .LBB147_45
	movsd xmm1, qword ptr [rsi]
	movsd xmm0, qword ptr [rsi + 8]
	addps xmm1, xmm2
	addps xmm0, xmm2
	lea rdx, [rsi + 16]
	movaps xmm2, xmm1
	movaps xmm3, xmm0
.LBB147_45:
	test rdi, rdi
	je .LBB147_49
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB147_47:
	movsd xmm0, qword ptr [rdx]
	addps xmm2, xmm0
	movsd xmm0, qword ptr [rdx + 8]
	addps xmm3, xmm0
	movsd xmm1, qword ptr [rdx + 16]
	addps xmm1, xmm2
	movsd xmm0, qword ptr [rdx + 24]
	addps xmm0, xmm3
	add rdx, 32
	movaps xmm2, xmm1
	movaps xmm3, xmm0
	cmp rdx, rdi
	jne .LBB147_47
	jmp .LBB147_49
	.p2align	4
.LBB147_48:
	xorps xmm1, xmm1
	xorps xmm0, xmm0
	mov r13, qword ptr [rsp + 48]
.LBB147_49:
	mov rdx, rax
	movabs rdi, 1152921504606846972
	and rdx, rdi
	and eax, 3
	je .LBB147_52
	movaps xmm3, xmm1
	addss xmm3, dword ptr [rsi + 4*rdx]
	cmp eax, 1
	jne .LBB147_53
	movaps xmm2, xmm0
	movaps xmm1, xmm3
	jmp .LBB147_56
	.p2align	4
.LBB147_53:
	shufps xmm1, xmm1, 85
	addss xmm1, dword ptr [rsi + 4*rdx + 4]
	movlhps xmm1, xmm3
	shufps xmm1, xmm3, 226
	cmp eax, 2
	jne .LBB147_55
.LBB147_52:
	movaps xmm2, xmm0
	jmp .LBB147_56
.LBB147_55:
	movss xmm2, dword ptr [rsi + 4*rdx + 8]
	addss xmm2, xmm0
	.p2align	4
.LBB147_56:
	cmp r12, rbx
	mov rsi, rbp
	cmova rsi, r8
	test rcx, rcx
	je .LBB147_63
	lea r8, [rcx - 16]
	xorps xmm5, xmm5
	mov rdi, rsi
	xorps xmm6, xmm6
	test r8b, 16
	jne .LBB147_59
	movsd xmm4, qword ptr [rsi]
	movsd xmm3, qword ptr [rsi + 8]
	addps xmm4, xmm5
	addps xmm3, xmm5
	lea rdi, [rsi + 16]
	movaps xmm5, xmm4
	movaps xmm6, xmm3
.LBB147_59:
	test r8, r8
	je .LBB147_62
	add rcx, rsi
	.p2align	4
.LBB147_61:
	movsd xmm3, qword ptr [rdi]
	addps xmm5, xmm3
	movsd xmm3, qword ptr [rdi + 8]
	addps xmm6, xmm3
	movsd xmm4, qword ptr [rdi + 16]
	addps xmm4, xmm5
	movsd xmm3, qword ptr [rdi + 24]
	addps xmm3, xmm6
	add rdi, 32
	movaps xmm5, xmm4
	movaps xmm6, xmm3
	cmp rdi, rcx
	jne .LBB147_61
.LBB147_62:
	test rax, rax
	jne .LBB147_64
	jmp .LBB147_32
	.p2align	4
.LBB147_63:
	xorps xmm4, xmm4
	xorps xmm3, xmm3
	test rax, rax
	je .LBB147_32
.LBB147_64:
	movaps xmm6, xmm4
	addss xmm6, dword ptr [rsi + 4*rdx]
	cmp eax, 1
	jne .LBB147_66
	movaps xmm5, xmm3
	movaps xmm4, xmm6
	jmp .LBB147_33
	.p2align	4
.LBB147_66:
	shufps xmm4, xmm4, 85
	addss xmm4, dword ptr [rsi + 4*rdx + 4]
	movlhps xmm4, xmm6
	shufps xmm4, xmm6, 226
	cmp eax, 2
	je .LBB147_32
	movss xmm5, dword ptr [rsi + 4*rdx + 8]
	addss xmm5, xmm3
	jmp .LBB147_33
.LBB147_68:
	cmp qword ptr [rsp + 16], 0
	je .LBB147_70
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 72]
	call rbx
	mov rdi, qword ptr [rsp + 32]
	call rbx
.LBB147_70:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 264]
	mov r14, qword ptr [rsp + 80]
	je .LBB147_72
	mov rdi, qword ptr [rsp + 208]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_72:
	cmp qword ptr [rsp + 144], 0
	je .LBB147_74
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB147_74:
	cmp qword ptr [rsp + 120], 0
	je .LBB147_76
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB147_76:
	cmp qword ptr [rsp + 96], 0
	je .LBB147_78
	mov rdi, qword ptr [rsp + 256]
	add rsp, 376
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
.LBB147_78:
	.cfi_def_cfa_offset 432
	add rsp, 376
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
.LBB147_79:
	.cfi_def_cfa_offset 432
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB147_80:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_85
.LBB147_81:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_85
.LBB147_82:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB147_85
.LBB147_83:
	mov edi, 4
	jmp .LBB147_26
.LBB147_84:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB147_85:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 32]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_95
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_99
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r13, qword ptr [rsp]
	jmp .LBB147_90
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	mov r13, qword ptr [rsp]
	je .LBB147_99
.LBB147_90:
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	je .LBB147_99
	jmp .LBB147_104
	jmp .LBB147_94
.LBB147_94:
	mov rbx, rax
.LBB147_95:
	cmp qword ptr [rsp + 168], 0
	jne .LBB147_100
	cmp qword ptr [rsp + 144], 0
	jne .LBB147_101
.LBB147_97:
	cmp qword ptr [rsp + 120], 0
	jne .LBB147_102
.LBB147_98:
	cmp qword ptr [rsp + 96], 0
	jne .LBB147_103
.LBB147_99:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB147_100:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB147_97
.LBB147_101:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB147_98
.LBB147_102:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB147_99
.LBB147_103:
	mov rdi, qword ptr [rsp + 104]
.LBB147_104:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
