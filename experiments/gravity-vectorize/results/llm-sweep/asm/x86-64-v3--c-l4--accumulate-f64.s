<engine::force::PairwiseGravity<f64> as engine::force::Force<f64>>::accumulate:
	.cfi_startproc
	.cfi_personality 155, DW.ref.rust_eh_personality
	.cfi_lsda 27, .Lexception48
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
	mov rbx, rcx
	mov r15, qword ptr [rsi + 16]
	lea r13, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp r13, rcx
	setb cl
	test al, cl
	jne .LBB148_1
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	test r13, r13
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 248], rdx
	mov qword ptr [rsp + 48], rdi
	je .LBB148_2
	mov qword ptr [rsp], rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_99
	mov rbp, rax
	mov r14, r15
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_97
	mov r12, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_17
	mov rsi, qword ptr [rsp]
	jmp .LBB148_3
.LBB148_2:
	mov r14, r15
	mov r12d, 8
	mov ebp, 8
	mov r15d, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 56], r13
	mov qword ptr [rsp + 240], rbx
	mov rcx, r14
	mov qword ptr [rsp + 80], r14
	mov qword ptr [rsp + 88], rbp
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 104], r14
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], 0
	mov qword ptr [rsp + 128], r14
	mov qword ptr [rsp + 136], r12
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 152], r14
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 168], 0
	mov r14, qword ptr [rsi + 64]
	cmp r14, rcx
	cmovae r14, rcx
	test r14, r14
	je .LBB148_4
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 24], rax
	add r12, 8
	xor ebx, ebx
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	mov rax, qword ptr [rsp + 160]
	vmovsd xmm0, qword ptr [rsp]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 168], r15
	add r12, 16
	cmp r14, rbx
	je .LBB148_5
.LBB148_30:
	vmovsd xmm0, qword ptr [r12 - 8]
	vmovsd qword ptr [rsp + 8], xmm0
	vmovsd xmm0, qword ptr [r12]
	vmovsd qword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 24]
	vmovsd xmm0, qword ptr [rax + 8*rbx]
	vmovsd qword ptr [rsp], xmm0
	cmp rbx, qword ptr [rsp + 80]
	jne .LBB148_33
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rbp, qword ptr [rsp + 88]
.LBB148_33:
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rbp + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 96], rbx
	mov rax, qword ptr [rsp + 120]
	mov r15, rax
	cmp rax, qword ptr [rsp + 104]
	jne .LBB148_35
	lea rdi, [rsp + 104]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	mov rax, qword ptr [rsp + 112]
	mov r13, rax
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 32], r15
	mov qword ptr [rsp + 120], r15
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 8], xmm1
	vucomisd xmm0, xmm2
	jne .LBB148_36
	jp .LBB148_36
	mov rax, qword ptr [rsp + 144]
	mov r15, rax
	cmp rax, qword ptr [rsp + 128]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	vmovsd xmm0, qword ptr [rip + .LCPI148_0]
	vdivsd xmm0, xmm0, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm0
	mov rax, qword ptr [rsp + 144]
	mov r15, rax
	cmp rax, qword ptr [rsp + 128]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	mov rax, qword ptr [rsp + 136]
	mov qword ptr [rsp + 72], rax
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 8], r15
	mov qword ptr [rsp + 144], r15
	mov r15, qword ptr [rsp + 168]
	cmp r15, qword ptr [rsp + 152]
	jne .LBB148_41
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 72], r12
	mov r13, r15
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 32], 0
	xor ebx, ebx
	xor r15d, r15d
.LBB148_5:
	mov rdx, qword ptr [rsp + 16]
	mov rcx, rdx
	shr rcx, 60
	je .LBB148_42
	xor edi, edi
.LBB148_45:
	mov rsi, qword ptr [rsp + 56]
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rcx, qword ptr [rsp + 48]
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [rsp + 272], xmm0
	vmovsd xmm0, qword ptr [rcx + 8]
	vmovsd qword ptr [rsp + 264], xmm0
	mov ecx, 8
	mov qword ptr [rsp + 40], rcx
	mov qword ptr [rsp + 24], rcx
	test rdx, rdx
	mov r12, r13
	je .LBB148_49
	mov r14, rax
	mov esi, 1
	mov r13, qword ptr [rsp + 56]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB148_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB148_69
	mov rax, r14
.LBB148_49:
	mov rcx, qword ptr [rsp + 88]
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 256], rax
	mov qword ptr [rsp + 48], rax
	jmp .LBB148_50
	.p2align	4
.LBB148_93:
	mov esi, 4
	lea rdi, [rsp + 176]
	vzeroupper
	call engine::force::tree_sum::<f64>
	vmovddup xmm1, qword ptr [rsp + 368]
	vmovapd xmm2, xmmword ptr [rsp + 352]
	vunpcklpd xmm0, xmm2, xmm0
	vmulpd xmm0, xmm1, xmm0
	mov rax, qword ptr [rsp + 280]
	vaddpd xmm0, xmm0, xmmword ptr [rax]
	vmovupd xmmword ptr [rax], xmm0
	mov r12, qword ptr [rsp + 56]
.LBB148_50:
	mov r14, qword ptr [rsp + 248]
	mov r9, qword ptr [rsp + 240]
	mov r11, r9
	mov rsi, qword ptr [rsp]
	mov rax, rsi
	mov rdx, rbx
	mov rcx, r12
	mov r10, qword ptr [rsp + 32]
	mov r8, r10
	mov rdi, rbx
	mov qword ptr [rsp + 280], r14
	lea r13, [r14 + 16]
	mov rbp, r9
	sub rbp, 1
	cmovae r9, rbp
	mov qword ptr [rsp + 240], r9
	mov qword ptr [rsp + 64], r13
	cmovae r14, r13
	mov qword ptr [rsp + 248], r14
	lea r9, [rsi + 8]
	sub rbx, 1
	cmovb rbx, rdi
	cmovb r9, rsi
	mov qword ptr [rsp], r9
	lea rdi, [r12 + 8]
	mov rsi, r10
	sub rsi, 1
	cmovae r10, rsi
	mov qword ptr [rsp + 32], r10
	cmovae r12, rdi
	mov qword ptr [rsp + 56], r12
	mov r12, qword ptr [rsp + 72]
	mov r10, r12
	mov r14, qword ptr [rsp + 8]
	mov r13, r14
	mov r9, r14
	sub r9, 1
	cmovae r14, r9
	mov qword ptr [rsp + 8], r14
	lea r14, [r12 + 8]
	cmovae r12, r14
	mov qword ptr [rsp + 72], r12
	test r15, r15
	je .LBB148_58
	test r11, r11
	je .LBB148_58
	test rdx, rdx
	je .LBB148_58
	test rax, rax
	je .LBB148_58
	test r8, r8
	je .LBB148_58
	test rcx, rcx
	je .LBB148_58
	test r13, r13
	je .LBB148_58
	test r10, r10
	je .LBB148_58
	dec r15
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rcx]
	mov rcx, qword ptr [rsp + 48]
	vmovsd xmm2, qword ptr [rcx]
	vmovaps xmmword ptr [rsp + 368], xmm2
	add rcx, 8
	vmovsd xmm2, qword ptr [rsp + 272]
	vmulsd xmm2, xmm2, qword ptr [r10]
	vmovsd qword ptr [rsp + 288], xmm0
	vmovsd qword ptr [rsp + 296], xmm1
	vmovsd qword ptr [rsp + 304], xmm2
	vmovsd xmm0, qword ptr [rsp + 264]
	vmovsd qword ptr [rsp + 312], xmm0
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], rbx
	mov qword ptr [rsp + 192], rdi
	mov qword ptr [rsp + 200], rsi
	mov qword ptr [rsp + 208], r14
	mov qword ptr [rsp + 216], r9
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 224], rcx
	mov qword ptr [rsp + 232], r15
	mov r14, qword ptr [rsp + 40]
	mov qword ptr [rsp + 320], r14
	mov r13, qword ptr [rsp + 16]
	mov qword ptr [rsp + 328], r13
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rsp + 336], rax
	mov qword ptr [rsp + 344], r13
	lea rdi, [rsp + 288]
	lea rsi, [rsp + 176]
	mov rdx, qword ptr [rsp + 64]
	mov rcx, rbp
	lea r8, [rsp + 320]
	call engine::force::pass_one::<f64>
	cmp rbp, r13
	mov rax, r14
	mov ecx, 8
	cmova rax, rcx
	mov r12, rbp
	mov ecx, 0
	cmova r12, rcx
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 176], ymm0
	lea r14, [8*r12]
	movabs rcx, 4611686018427387872
	and r14, rcx
	je .LBB148_78
	lea rdx, [r14 - 32]
	mov esi, edx
	shr esi, 5
	inc esi
	mov rcx, rax
	and esi, 3
	je .LBB148_74
	.p2align	4
.LBB148_73:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	add rcx, 32
	dec rsi
	jne .LBB148_73
.LBB148_74:
	cmp rdx, 96
	jb .LBB148_77
	lea rdx, [rax + r14]
	.p2align	4
.LBB148_76:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 96]
	sub rcx, -128
	cmp rcx, rdx
	jne .LBB148_76
.LBB148_77:
	vmovupd ymmword ptr [rsp + 176], ymm0
.LBB148_78:
	mov rdx, r12
	movabs rcx, 576460752303423484
	and rdx, rcx
	and r12d, 3
	je .LBB148_82
	vmovsd xmm0, qword ptr [rax + 8*rdx]
	vaddsd xmm0, xmm0, qword ptr [rsp + 176]
	vmovsd qword ptr [rsp + 176], xmm0
	cmp r12d, 1
	je .LBB148_82
	vmovsd xmm0, qword ptr [rax + 8*rdx + 8]
	vaddsd xmm0, xmm0, qword ptr [rsp + 184]
	vmovsd qword ptr [rsp + 184], xmm0
	cmp r12d, 2
	je .LBB148_82
	vmovsd xmm0, qword ptr [rax + 8*rdx + 16]
	vaddsd xmm0, xmm0, qword ptr [rsp + 192]
	vmovsd qword ptr [rsp + 192], xmm0
	.p2align	4
.LBB148_82:
	mov qword ptr [rsp + 64], rdx
	mov esi, 4
	lea rdi, [rsp + 176]
	vzeroupper
	call engine::force::tree_sum::<f64>
	cmp rbp, r13
	mov rax, qword ptr [rsp + 24]
	mov ecx, 8
	cmova rax, rcx
	vmovapd xmmword ptr [rsp + 352], xmm0
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 176], ymm0
	test r14, r14
	je .LBB148_89
	lea rdx, [r14 - 32]
	mov esi, edx
	shr esi, 5
	inc esi
	mov rcx, rax
	and esi, 3
	je .LBB148_85
	.p2align	4
.LBB148_84:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	add rcx, 32
	dec rsi
	jne .LBB148_84
.LBB148_85:
	cmp rdx, 96
	jb .LBB148_88
	add r14, rax
	.p2align	4
.LBB148_87:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 96]
	sub rcx, -128
	cmp rcx, r14
	jne .LBB148_87
.LBB148_88:
	vmovupd ymmword ptr [rsp + 176], ymm0
.LBB148_89:
	test r12, r12
	mov rcx, qword ptr [rsp + 64]
	je .LBB148_93
	vmovsd xmm0, qword ptr [rax + 8*rcx]
	vaddsd xmm0, xmm0, qword ptr [rsp + 176]
	vmovsd qword ptr [rsp + 176], xmm0
	cmp r12d, 1
	je .LBB148_93
	vmovsd xmm0, qword ptr [rax + 8*rcx + 8]
	vaddsd xmm0, xmm0, qword ptr [rsp + 184]
	vmovsd qword ptr [rsp + 184], xmm0
	cmp r12d, 2
	je .LBB148_93
	vmovsd xmm0, qword ptr [rax + 8*rcx + 16]
	vaddsd xmm0, xmm0, qword ptr [rsp + 192]
	vmovsd qword ptr [rsp + 192], xmm0
	jmp .LBB148_93
.LBB148_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 24]
	call rbx
	mov rdi, qword ptr [rsp + 40]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 152], 0
	je .LBB148_62
	mov rdi, qword ptr [rsp + 256]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_62:
	cmp qword ptr [rsp + 128], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 136]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_64:
	cmp qword ptr [rsp + 104], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 112]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_66:
	cmp qword ptr [rsp + 80], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 88]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_68:
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
.LBB148_99:
	.cfi_def_cfa_offset 448
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_97:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_17:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_44:
	mov edi, 8
	jmp .LBB148_45
.LBB148_69:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 40]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_20
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_96
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_11
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_96
.LBB148_11:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	mov rdi, rbp
	je .LBB148_96
	jmp .LBB148_95
	jmp .LBB148_19
.LBB148_19:
	mov rbx, rax
.LBB148_20:
	cmp qword ptr [rsp + 152], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 128], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 104], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 80], 0
	jne .LBB148_27
.LBB148_96:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 160]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 128], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 136]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 104], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 112]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 80], 0
	je .LBB148_96
.LBB148_27:
	mov rdi, qword ptr [rsp + 88]
.LBB148_95:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
