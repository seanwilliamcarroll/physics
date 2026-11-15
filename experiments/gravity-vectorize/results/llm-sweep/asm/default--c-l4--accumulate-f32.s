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
	sub rsp, 408
	.cfi_def_cfa_offset 464
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rcx
	movabs rax, 4611686018427387888
	mov r12, qword ptr [rsi + 16]
	lea rbx, [4*r12]
	add rax, 15
	cmp r12, rax
	setbe al
	movabs rcx, 9223372036854775805
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB149_1
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	test rbx, rbx
	mov qword ptr [rsp + 24], r12
	mov qword ptr [rsp + 32], rdi
	je .LBB149_2
	mov qword ptr [rsp + 16], rsi
	mov r15, rdx
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB149_99
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_9
	mov r13, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_97
	mov rbp, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_17
	mov rdx, r15
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB149_3
.LBB149_2:
	mov ebp, 4
	mov ecx, 4
	mov r13d, 4
	mov eax, 4
.LBB149_3:
	mov qword ptr [rsp + 40], rbx
	mov qword ptr [rsp + 272], rdx
	mov qword ptr [rsp + 280], r14
	mov rdx, r12
	mov qword ptr [rsp + 96], r12
	mov qword ptr [rsp + 104], rcx
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r12
	mov qword ptr [rsp + 128], r13
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r12
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov r12, qword ptr [rsi + 64]
	cmp r12, rdx
	cmovae r12, rdx
	test r12, r12
	je .LBB149_4
	mov rbp, rcx
	mov r13, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 64], rax
	xor r15d, r15d
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	mov rax, qword ptr [rsp + 176]
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp r12, r15
	je .LBB149_5
.LBB149_30:
	movss xmm0, dword ptr [r13 + 8*r15]
	movss dword ptr [rsp + 16], xmm0
	movss xmm0, dword ptr [r13 + 8*r15 + 4]
	movss dword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 64]
	movss xmm0, dword ptr [rax + 4*r15]
	movss dword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 96]
	mov rax, rbp
	jne .LBB149_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB149_33:
	mov rbp, rax
	movss xmm0, dword ptr [rsp + 16]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 112], r15
	mov rax, qword ptr [rsp + 136]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB149_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	mov rcx, rbx
	movss xmm0, dword ptr [rsp + 48]
	movss dword ptr [rax + 4*rbx], xmm0
	inc rcx
	mov rbx, rcx
	mov qword ptr [rsp + 136], rcx
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp + 8]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 16], xmm1
	ucomiss xmm0, xmm2
	jne .LBB149_36
	jp .LBB149_36
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	movss xmm0, dword ptr [rip + .LCPI149_0]
	divss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rsp + 16], xmm0
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 48], rax
	movss xmm0, dword ptr [rsp + 16]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 160], r14
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB149_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 48], rbp
	mov qword ptr [rsp + 80], r13
	mov qword ptr [rsp + 16], 0
	xor r14d, r14d
	xor ebx, ebx
	xor r15d, r15d
.LBB149_5:
	mov rdx, qword ptr [rsp + 24]
	mov rcx, rdx
	shr rcx, 61
	je .LBB149_42
	xor edi, edi
.LBB149_45:
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_42:
	mov rcx, qword ptr [rsp + 32]
	movss xmm0, dword ptr [rcx]
	movss dword ptr [rsp + 92], xmm0
	movss xmm0, dword ptr [rcx + 4]
	movss dword ptr [rsp + 88], xmm0
	mov ecx, 4
	mov qword ptr [rsp + 56], rcx
	mov qword ptr [rsp + 32], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 80]
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 256], rax
	je .LBB149_49
	mov esi, 1
	mov r13, qword ptr [rsp + 40]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB149_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB149_69
	mov rax, qword ptr [rsp + 256]
.LBB149_49:
	mov rcx, qword ptr [rsp + 104]
	mov qword ptr [rsp + 264], rax
	mov qword ptr [rsp + 64], r12
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 344], rcx
	mov qword ptr [rsp + 8], rcx
	mov r12, rbx
	jmp .LBB149_50
	.p2align	4
.LBB149_93:
	mov esi, 4
	lea rdi, [rsp + 192]
	call engine::force::tree_sum::<f32>
	movaps xmm1, xmmword ptr [rsp + 320]
	unpcklps xmm1, xmm1
	movaps xmm2, xmmword ptr [rsp + 304]
	unpcklps xmm2, xmm0
	mulps xmm2, xmm1
	mov rax, qword ptr [rsp + 360]
	movsd xmm0, qword ptr [rax]
	addps xmm0, xmm2
	movlps qword ptr [rax], xmm0
	mov r12, qword ptr [rsp + 368]
.LBB149_50:
	mov rbx, qword ptr [rsp + 272]
	mov r10, qword ptr [rsp + 280]
	mov r13, r10
	mov rdi, qword ptr [rsp + 8]
	mov rcx, rdi
	mov qword ptr [rsp + 320], r15
	mov rsi, qword ptr [rsp + 40]
	mov r8, rsi
	mov r9, r12
	mov rax, qword ptr [rsp + 64]
	mov qword ptr [rsp + 72], rax
	mov r11, r15
	mov qword ptr [rsp + 360], rbx
	lea rdx, [rbx + 8]
	mov rbp, r10
	sub rbp, 1
	cmovae r10, rbp
	mov qword ptr [rsp + 280], r10
	mov qword ptr [rsp + 304], rdx
	cmovae rbx, rdx
	mov rdx, qword ptr [rsp + 72]
	mov qword ptr [rsp + 272], rbx
	lea r10, [rdi + 4]
	sub r15, 1
	cmovb r15, r11
	cmovb r10, rdi
	mov qword ptr [rsp + 8], r10
	mov rbx, qword ptr [rsp + 16]
	mov r11, rbx
	lea r10, [rsi + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r12, rdi
	mov qword ptr [rsp + 368], r12
	mov qword ptr [rsp + 352], r10
	cmovae rsi, r10
	mov qword ptr [rsp + 40], rsi
	mov r10, rbx
	sub r10, 1
	cmovae rbx, r10
	mov qword ptr [rsp + 16], rbx
	lea r12, [rdx + 4]
	cmovae rax, r12
	mov qword ptr [rsp + 64], rax
	test r14, r14
	je .LBB149_58
	test r13, r13
	je .LBB149_58
	cmp qword ptr [rsp + 320], 0
	je .LBB149_58
	test rcx, rcx
	je .LBB149_58
	test r9, r9
	je .LBB149_58
	test r8, r8
	je .LBB149_58
	test r11, r11
	je .LBB149_58
	test rdx, rdx
	je .LBB149_58
	dec r14
	movss xmm0, dword ptr [rcx]
	movss xmm1, dword ptr [r8]
	mov rcx, qword ptr [rsp + 264]
	movss xmm2, dword ptr [rcx]
	movaps xmmword ptr [rsp + 320], xmm2
	add rcx, 4
	movss xmm2, dword ptr [rdx]
	mulss xmm2, dword ptr [rsp + 92]
	movss dword ptr [rsp + 288], xmm0
	movss dword ptr [rsp + 292], xmm1
	movss dword ptr [rsp + 296], xmm2
	movss xmm0, dword ptr [rsp + 88]
	movss dword ptr [rsp + 300], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 200], r15
	mov rax, qword ptr [rsp + 352]
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 216], rdi
	mov qword ptr [rsp + 224], r12
	mov qword ptr [rsp + 232], r10
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 240], rcx
	mov qword ptr [rsp + 248], r14
	mov r12, qword ptr [rsp + 56]
	mov qword ptr [rsp + 376], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 384], rbx
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 392], rax
	mov qword ptr [rsp + 400], rbx
	lea rdi, [rsp + 288]
	lea rsi, [rsp + 192]
	mov rdx, qword ptr [rsp + 304]
	mov rcx, rbp
	lea r8, [rsp + 376]
	call engine::force::pass_one::<f32>
	cmp rbp, rbx
	mov rax, r12
	mov ecx, 4
	cmova rax, rcx
	mov r13, rbp
	mov ecx, 0
	cmova r13, rcx
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 192], xmm0
	lea r12, [4*r13]
	movabs rcx, 4611686018427387888
	and r12, rcx
	je .LBB149_78
	lea rdx, [r12 - 16]
	xorps xmm1, xmm1
	mov rcx, rax
	test dl, 16
	jne .LBB149_74
	movups xmm0, xmmword ptr [rax]
	addps xmm0, xmm1
	lea rcx, [rax + 16]
	movaps xmm1, xmm0
.LBB149_74:
	test rdx, rdx
	je .LBB149_77
	lea rdx, [rax + r12]
	.p2align	4
.LBB149_76:
	movups xmm0, xmmword ptr [rcx]
	addps xmm1, xmm0
	movups xmm0, xmmword ptr [rcx + 16]
	addps xmm0, xmm1
	add rcx, 32
	movaps xmm1, xmm0
	cmp rcx, rdx
	jne .LBB149_76
.LBB149_77:
	movaps xmmword ptr [rsp + 192], xmm0
.LBB149_78:
	mov rdx, r13
	movabs rcx, 1152921504606846972
	and rdx, rcx
	and r13d, 3
	je .LBB149_82
	movss xmm0, dword ptr [rax + 4*rdx]
	addss xmm0, dword ptr [rsp + 192]
	movss dword ptr [rsp + 192], xmm0
	cmp r13d, 1
	je .LBB149_82
	movss xmm0, dword ptr [rax + 4*rdx + 4]
	addss xmm0, dword ptr [rsp + 196]
	movss dword ptr [rsp + 196], xmm0
	cmp r13d, 2
	je .LBB149_82
	movss xmm0, dword ptr [rax + 4*rdx + 8]
	addss xmm0, dword ptr [rsp + 200]
	movss dword ptr [rsp + 200], xmm0
	.p2align	4
.LBB149_82:
	mov qword ptr [rsp + 72], rdx
	mov esi, 4
	lea rdi, [rsp + 192]
	call engine::force::tree_sum::<f32>
	cmp rbp, rbx
	mov rax, qword ptr [rsp + 32]
	mov ecx, 4
	cmova rax, rcx
	movaps xmmword ptr [rsp + 304], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 192], xmm0
	test r12, r12
	je .LBB149_89
	lea rdx, [r12 - 16]
	mov rcx, rax
	test dl, 16
	jne .LBB149_85
	movups xmm1, xmmword ptr [rax]
	addps xmm1, xmm0
	lea rcx, [rax + 16]
	movaps xmm0, xmm1
.LBB149_85:
	test rdx, rdx
	je .LBB149_88
	add r12, rax
	.p2align	4
.LBB149_87:
	movups xmm1, xmmword ptr [rcx]
	addps xmm0, xmm1
	movups xmm1, xmmword ptr [rcx + 16]
	addps xmm1, xmm0
	add rcx, 32
	movaps xmm0, xmm1
	cmp rcx, r12
	jne .LBB149_87
.LBB149_88:
	movaps xmmword ptr [rsp + 192], xmm1
.LBB149_89:
	test r13, r13
	mov rcx, qword ptr [rsp + 72]
	je .LBB149_93
	movss xmm0, dword ptr [rax + 4*rcx]
	addss xmm0, dword ptr [rsp + 192]
	movss dword ptr [rsp + 192], xmm0
	cmp r13d, 1
	je .LBB149_93
	movss xmm0, dword ptr [rax + 4*rcx + 4]
	addss xmm0, dword ptr [rsp + 196]
	movss dword ptr [rsp + 196], xmm0
	cmp r13d, 2
	je .LBB149_93
	movss xmm0, dword ptr [rax + 4*rcx + 8]
	addss xmm0, dword ptr [rsp + 200]
	movss dword ptr [rsp + 200], xmm0
	jmp .LBB149_93
.LBB149_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 48]
	je .LBB149_62
	mov rdi, qword ptr [rsp + 256]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB149_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB149_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB149_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_68
	mov rdi, qword ptr [rsp + 344]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_68:
	add rsp, 408
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
.LBB149_99:
	.cfi_def_cfa_offset 464
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_97:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_17:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_44:
	mov edi, 4
	jmp .LBB149_45
.LBB149_69:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB149_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_20
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB149_96
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r12, qword ptr [rsp + 8]
	jmp .LBB149_11
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r12, qword ptr [rsp + 8]
	je .LBB149_96
.LBB149_11:
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB149_96
	jmp .LBB149_95
	jmp .LBB149_19
.LBB149_19:
	mov rbx, rax
.LBB149_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB149_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB149_23
.LBB149_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB149_25
.LBB149_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB149_27
.LBB149_96:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB149_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB149_24
.LBB149_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB149_26
.LBB149_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB149_96
.LBB149_27:
	mov rdi, qword ptr [rsp + 104]
.LBB149_95:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
