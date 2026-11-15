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
	sub rsp, 392
	.cfi_def_cfa_offset 448
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbp, rcx
	mov r14, qword ptr [rsi + 16]
	lea r13, [4*r14]
	mov rax, r14
	shr rax, 62
	sete al
	movabs rcx, 9223372036854775805
	cmp r13, rcx
	setb cl
	test al, cl
	jne .LBB147_1
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	mov qword ptr [rsp + 104], rdi
	test r13, r13
	mov qword ptr [rsp + 32], r14
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 224], rbp
	mov qword ptr [rsp + 16], r13
	je .LBB147_2
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB147_94
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB147_92
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_17
	mov rsi, rbx
	mov rbp, qword ptr [rsp + 8]
	jmp .LBB147_3
.LBB147_2:
	mov r13d, 4
	mov ebp, 4
	mov r15d, 4
	mov eax, 4
.LBB147_3:
	mov qword ptr [rsp + 128], r14
	mov qword ptr [rsp + 136], rbp
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 152], r14
	mov qword ptr [rsp + 160], r15
	mov qword ptr [rsp + 168], 0
	mov qword ptr [rsp + 176], r14
	mov qword ptr [rsp + 184], r13
	mov qword ptr [rsp + 192], 0
	mov qword ptr [rsp + 200], r14
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 216], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 80], rcx
	test rcx, rcx
	je .LBB147_4
	mov r13, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor r14d, r14d
	jmp .LBB147_30
	.p2align	4
.LBB147_41:
	mov rax, qword ptr [rsp + 208]
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 216], rbx
	cmp qword ptr [rsp + 80], r14
	je .LBB147_5
.LBB147_30:
	movss xmm0, dword ptr [r13 + 8*r14]
	movss dword ptr [rsp + 24], xmm0
	movss xmm0, dword ptr [r13 + 8*r14 + 4]
	movss dword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 72]
	movss xmm0, dword ptr [rax + 4*r14]
	movss dword ptr [rsp + 8], xmm0
	cmp r14, qword ptr [rsp + 128]
	mov rax, rbp
	jne .LBB147_33
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 136]
.LBB147_33:
	mov rbp, rax
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 144], r14
	mov r12, qword ptr [rsp + 168]
	cmp r12, qword ptr [rsp + 152]
	jne .LBB147_35
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_35:
	mov rax, qword ptr [rsp + 160]
	mov qword ptr [rsp + 112], rax
	movss xmm0, dword ptr [rsp + 48]
	movss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 168], r12
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp + 8]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 24], xmm1
	ucomiss xmm0, xmm2
	jne .LBB147_36
	jp .LBB147_36
	mov r15, qword ptr [rsp + 192]
	cmp r15, qword ptr [rsp + 176]
	je .LBB147_38
	jmp .LBB147_39
	.p2align	4
.LBB147_36:
	movss xmm0, dword ptr [rip + .LCPI147_0]
	divss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rsp + 24], xmm0
	mov r15, qword ptr [rsp + 192]
	cmp r15, qword ptr [rsp + 176]
	jne .LBB147_39
.LBB147_38:
	lea rdi, [rsp + 176]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_39:
	mov rax, qword ptr [rsp + 184]
	mov qword ptr [rsp + 48], rax
	movss xmm0, dword ptr [rsp + 24]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 192], r15
	mov rbx, qword ptr [rsp + 216]
	cmp rbx, qword ptr [rsp + 200]
	jne .LBB147_41
	lea rdi, [rsp + 200]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_41
.LBB147_4:
	mov qword ptr [rsp + 48], r13
	mov qword ptr [rsp + 112], r15
	xor r15d, r15d
	xor ebx, ebx
	xor r12d, r12d
	xor r14d, r14d
.LBB147_5:
	mov rcx, qword ptr [rsp + 32]
	mov rdx, rcx
	shr rdx, 61
	je .LBB147_42
	xor edi, edi
.LBB147_45:
	mov rsi, qword ptr [rsp + 16]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_42:
	mov rdx, qword ptr [rsp + 104]
	movss xmm0, dword ptr [rdx]
	movss dword ptr [rsp + 124], xmm0
	movss xmm0, dword ptr [rdx + 4]
	movss dword ptr [rsp + 120], xmm0
	mov edx, 4
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 64], rdx
	test rcx, rcx
	mov rbp, qword ptr [rsp + 40]
	mov qword ptr [rsp + 248], rax
	je .LBB147_49
	mov esi, 1
	mov r13, qword ptr [rsp + 16]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB147_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 64], rax
	test rax, rax
	je .LBB147_68
	mov rax, qword ptr [rsp + 248]
.LBB147_49:
	mov r11, qword ptr [rsp + 136]
	mov qword ptr [rsp + 256], rax
	mov rax, qword ptr [rsp + 48]
	mov qword ptr [rsp + 80], rax
	mov rsi, qword ptr [rsp + 112]
	mov qword ptr [rsp + 280], r11
	jmp .LBB147_50
	.p2align	4
.LBB147_71:
	xorps xmm0, xmm0
	xorps xmm1, xmm1
	mov r8, qword ptr [rsp + 40]
	mov r11, qword ptr [rsp + 72]
	mov rax, qword ptr [rsp + 8]
	mov r14, qword ptr [rsp + 88]
.LBB147_87:
	mov r10, qword ptr [rsp + 16]
	mov r9, qword ptr [rsp + 96]
	unpcklps xmm0, xmm1
	movaps xmm1, xmmword ptr [rsp + 224]
	unpcklps xmm1, xmm1
	mulps xmm1, xmm0
	movsd xmm0, qword ptr [r8]
	addps xmm0, xmm1
	movlps qword ptr [r8], xmm0
	mov rdx, r11
	mov r15, r11
	mov qword ptr [rsp + 80], rax
	mov r12, r14
	mov rsi, r10
	mov rcx, r14
	mov r14, r13
	mov rdi, qword ptr [rsp + 24]
	mov r11, rdi
	mov r8, qword ptr [rsp + 104]
	mov qword ptr [rsp + 224], r8
	mov rbp, r9
.LBB147_50:
	mov qword ptr [rsp + 40], rbp
	lea rax, [rbp + 8]
	mov rbp, qword ptr [rsp + 224]
	sub rbp, 1
	cmovae r8, rbp
	mov qword ptr [rsp + 104], r8
	mov qword ptr [rsp + 288], rax
	cmovae r9, rax
	mov qword ptr [rsp + 96], r9
	mov r8, r13
	lea r9, [r11 + 4]
	mov r13, r14
	sub r13, 1
	cmovb r13, r8
	cmovb r9, rdi
	mov qword ptr [rsp + 24], r9
	lea r8, [rsi + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae rcx, rdi
	mov qword ptr [rsp + 88], rcx
	cmovae r10, r8
	mov qword ptr [rsp + 16], r10
	mov r9, r15
	sub r9, 1
	cmovae rdx, r9
	mov qword ptr [rsp + 72], rdx
	mov rax, qword ptr [rsp + 80]
	lea r10, [rax + 4]
	mov rcx, qword ptr [rsp + 8]
	cmovae rcx, r10
	mov qword ptr [rsp + 8], rcx
	test rbx, rbx
	je .LBB147_58
	cmp qword ptr [rsp + 224], 0
	je .LBB147_58
	test r14, r14
	je .LBB147_58
	test r11, r11
	je .LBB147_58
	test r12, r12
	je .LBB147_58
	test rsi, rsi
	je .LBB147_58
	test r15, r15
	je .LBB147_58
	mov rcx, rax
	test rax, rax
	je .LBB147_58
	dec rbx
	movss xmm0, dword ptr [r11]
	movss xmm1, dword ptr [rsi]
	mov r12, qword ptr [rsp + 256]
	movss xmm2, dword ptr [r12]
	movaps xmmword ptr [rsp + 224], xmm2
	add r12, 4
	movss xmm2, dword ptr [rcx]
	mulss xmm2, dword ptr [rsp + 124]
	movss dword ptr [rsp + 264], xmm0
	movss dword ptr [rsp + 268], xmm1
	movss dword ptr [rsp + 272], xmm2
	movss xmm0, dword ptr [rsp + 120]
	movss dword ptr [rsp + 276], xmm0
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rsp + 328], rax
	mov qword ptr [rsp + 336], r13
	mov qword ptr [rsp + 344], r8
	mov qword ptr [rsp + 352], rdi
	mov qword ptr [rsp + 360], r10
	mov qword ptr [rsp + 368], r9
	mov qword ptr [rsp + 376], r12
	mov qword ptr [rsp + 384], rbx
	mov r15, qword ptr [rsp + 56]
	mov qword ptr [rsp + 296], r15
	mov r14, qword ptr [rsp + 32]
	mov qword ptr [rsp + 304], r14
	mov rax, qword ptr [rsp + 64]
	mov qword ptr [rsp + 312], rax
	mov qword ptr [rsp + 320], r14
	lea rdi, [rsp + 264]
	lea rsi, [rsp + 328]
	mov rdx, qword ptr [rsp + 288]
	mov rcx, rbp
	lea r8, [rsp + 296]
	call engine::force::pass_one::<f32>
	cmp rbp, r14
	mov r8, r15
	mov eax, 4
	cmova r8, rax
	mov r9, rbp
	mov eax, 0
	cmova r9, rax
	test r9, r9
	mov qword ptr [rsp + 256], r12
	je .LBB147_71
	lea rax, [4*r9]
	lea rcx, [rax - 4]
	mov rsi, rcx
	shr rsi, 2
	inc rsi
	mov rdx, rsi
	and rdx, 7
	je .LBB147_73
	lea r10d, [4*rdx]
	xorps xmm0, xmm0
	mov rdi, r8
	.p2align	4
.LBB147_75:
	addss xmm0, dword ptr [rdi]
	add rdi, 4
	add r10, -4
	jne .LBB147_75
	cmp rcx, 28
	jae .LBB147_77
	jmp .LBB147_79
	.p2align	4
.LBB147_73:
	xorps xmm0, xmm0
	mov rdi, r8
	cmp rcx, 28
	jb .LBB147_79
.LBB147_77:
	lea r8, [r8 + 4*r9]
	.p2align	4
.LBB147_78:
	addss xmm0, dword ptr [rdi]
	addss xmm0, dword ptr [rdi + 4]
	addss xmm0, dword ptr [rdi + 8]
	addss xmm0, dword ptr [rdi + 12]
	addss xmm0, dword ptr [rdi + 16]
	addss xmm0, dword ptr [rdi + 20]
	addss xmm0, dword ptr [rdi + 24]
	addss xmm0, dword ptr [rdi + 28]
	add rdi, 32
	cmp rdi, r8
	jne .LBB147_78
.LBB147_79:
	cmp rbp, r14
	mov rdi, qword ptr [rsp + 64]
	mov r8d, 4
	cmova rdi, r8
	test sil, 7
	mov r11, qword ptr [rsp + 72]
	je .LBB147_80
	shl edx, 2
	xorps xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 40]
	mov r14, qword ptr [rsp + 88]
	.p2align	4
.LBB147_82:
	addss xmm1, dword ptr [rsi]
	add rsi, 4
	add rdx, -4
	jne .LBB147_82
	cmp rcx, 28
	jae .LBB147_85
.LBB147_84:
	mov rax, qword ptr [rsp + 8]
	jmp .LBB147_87
	.p2align	4
.LBB147_80:
	xorps xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 40]
	mov r14, qword ptr [rsp + 88]
	cmp rcx, 28
	jb .LBB147_84
.LBB147_85:
	add rdi, rax
	mov rax, qword ptr [rsp + 8]
	.p2align	4
.LBB147_86:
	addss xmm1, dword ptr [rsi]
	addss xmm1, dword ptr [rsi + 4]
	addss xmm1, dword ptr [rsi + 8]
	addss xmm1, dword ptr [rsi + 12]
	addss xmm1, dword ptr [rsi + 16]
	addss xmm1, dword ptr [rsi + 20]
	addss xmm1, dword ptr [rsi + 24]
	addss xmm1, dword ptr [rsi + 28]
	add rsi, 32
	cmp rsi, rdi
	jne .LBB147_86
	jmp .LBB147_87
.LBB147_58:
	cmp qword ptr [rsp + 32], 0
	je .LBB147_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 64]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB147_60:
	cmp qword ptr [rsp + 200], 0
	mov rbx, qword ptr [rsp + 112]
	mov r14, qword ptr [rsp + 48]
	je .LBB147_62
	mov rdi, qword ptr [rsp + 248]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_62:
	cmp qword ptr [rsp + 176], 0
	je .LBB147_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB147_64:
	cmp qword ptr [rsp + 152], 0
	je .LBB147_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB147_66:
	cmp qword ptr [rsp + 128], 0
	je .LBB147_88
	mov rdi, qword ptr [rsp + 280]
	add rsp, 392
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
.LBB147_88:
	.cfi_def_cfa_offset 448
	add rsp, 392
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
.LBB147_94:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB147_9:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_92:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_17:
	mov edi, 4
	mov rsi, qword ptr [rsp + 16]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_44:
	mov edi, 4
	jmp .LBB147_45
.LBB147_68:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB147_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_20
	mov r14, rax
	cmp qword ptr [rsp + 32], 0
	je .LBB147_91
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB147_11
	mov r14, rax
	cmp qword ptr [rsp + 32], 0
	mov rax, qword ptr [rsp + 8]
	je .LBB147_91
.LBB147_11:
	mov rbx, rax
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 32], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB147_91
	jmp .LBB147_90
	jmp .LBB147_19
.LBB147_19:
	mov r14, rax
.LBB147_20:
	cmp qword ptr [rsp + 200], 0
	jne .LBB147_21
	cmp qword ptr [rsp + 176], 0
	jne .LBB147_23
.LBB147_24:
	cmp qword ptr [rsp + 152], 0
	jne .LBB147_25
.LBB147_26:
	cmp qword ptr [rsp + 128], 0
	jne .LBB147_27
.LBB147_91:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB147_21:
	mov rdi, qword ptr [rsp + 208]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 176], 0
	je .LBB147_24
.LBB147_23:
	mov rdi, qword ptr [rsp + 184]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 152], 0
	je .LBB147_26
.LBB147_25:
	mov rdi, qword ptr [rsp + 160]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 128], 0
	je .LBB147_91
.LBB147_27:
	mov rdi, qword ptr [rsp + 136]
.LBB147_90:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
