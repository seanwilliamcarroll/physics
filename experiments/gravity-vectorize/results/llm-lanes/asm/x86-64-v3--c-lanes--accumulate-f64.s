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
	sub rsp, 408
	.cfi_def_cfa_offset 464
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rcx
	mov r15, qword ptr [rsi + 16]
	lea r12, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp r12, rcx
	setb cl
	test al, cl
	jne .LBB146_2
	call alloc::raw_vec::capacity_overflow
.LBB146_2:
	test r12, r12
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 32], rdi
	je .LBB146_8
	mov qword ptr [rsp + 16], rsi
	mov r14, rdx
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB146_78
	mov r13, r15
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_79
	mov r15, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_80
	mov rbp, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_81
	mov rdx, r14
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB146_9
.LBB146_8:
	mov r13, r15
	mov ebp, 8
	mov ecx, 8
	mov r15d, 8
	mov eax, 8
.LBB146_9:
	mov qword ptr [rsp + 40], r12
	mov qword ptr [rsp + 72], rbx
	mov qword ptr [rsp + 216], rdx
	mov rdx, r13
	mov qword ptr [rsp + 96], r13
	mov qword ptr [rsp + 104], rcx
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r13
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r13
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov r13, qword ptr [rsi + 64]
	cmp r13, rdx
	cmovae r13, rdx
	test r13, r13
	je .LBB146_23
	mov r12, rcx
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 80], rax
	add rbp, 8
	xor r15d, r15d
	jmp .LBB146_12
	.p2align	4
.LBB146_11:
	mov rax, qword ptr [rsp + 176]
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	add rbp, 16
	cmp r13, r15
	je .LBB146_24
.LBB146_12:
	vmovsd xmm0, qword ptr [rbp - 8]
	vmovsd qword ptr [rsp + 16], xmm0
	vmovsd xmm0, qword ptr [rbp]
	vmovsd qword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 80]
	vmovsd xmm0, qword ptr [rax + 8*r15]
	vmovsd qword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 96]
	mov rax, r12
	jne .LBB146_15
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB146_15:
	mov r12, rax
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 112], r15
	mov rax, qword ptr [rsp + 136]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB146_17
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_17:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 88], rax
	mov rcx, rbx
	vmovsd xmm0, qword ptr [rsp + 48]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rcx
	mov rbx, rcx
	mov qword ptr [rsp + 136], rcx
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp + 8]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 16], xmm1
	vucomisd xmm0, xmm2
	jne .LBB146_19
	jp .LBB146_19
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	je .LBB146_20
	jmp .LBB146_21
	.p2align	4
.LBB146_19:
	vmovsd xmm0, qword ptr [rip + .LCPI146_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp + 16], xmm0
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB146_21
.LBB146_20:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_21:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 48], rax
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 160], r14
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB146_11
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_11
.LBB146_23:
	mov qword ptr [rsp + 48], rbp
	mov qword ptr [rsp + 88], r15
	mov qword ptr [rsp + 16], 0
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
.LBB146_24:
	mov rdx, qword ptr [rsp + 24]
	mov rcx, rdx
	shr rcx, 60
	je .LBB146_27
	xor edi, edi
.LBB146_26:
	mov rsi, qword ptr [rsp + 40]
	call alloc::raw_vec::handle_error
	jmp .LBB146_84
.LBB146_27:
	mov rcx, qword ptr [rsp + 32]
	vmovsd xmm0, qword ptr [rcx]
	vmovsd qword ptr [rsp + 240], xmm0
	vmovsd xmm0, qword ptr [rcx + 8]
	vmovsd qword ptr [rsp + 232], xmm0
	mov ecx, 8
	mov qword ptr [rsp + 56], rcx
	mov qword ptr [rsp + 32], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 48]
	mov qword ptr [rsp + 192], rax
	je .LBB146_31
	mov esi, 1
	mov r13, qword ptr [rsp + 40]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB146_82
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB146_83
	mov rax, qword ptr [rsp + 192]
.LBB146_31:
	mov rcx, qword ptr [rsp + 104]
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 80], rbp
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rsp + 224], rcx
	mov qword ptr [rsp + 8], rcx
	mov r12, qword ptr [rsp + 72]
	jmp .LBB146_34
	.p2align	4
.LBB146_32:
	vmovapd xmm7, xmm5
.LBB146_33:
	mov rax, qword ptr [rsp + 64]
	vaddsd xmm4, xmm6, xmm4
	vaddsd xmm0, xmm1, xmm0
	vshufpd xmm1, xmm2, xmm2, 1
	vaddsd xmm1, xmm1, xmm3
	vaddsd xmm0, xmm1, xmm0
	vshufpd xmm1, xmm5, xmm5, 1
	vaddsd xmm1, xmm1, xmm7
	vaddsd xmm1, xmm1, xmm4
	vunpcklpd xmm0, xmm0, xmm1
	vmovddup xmm1, qword ptr [rsp + 384]
	vmulpd xmm0, xmm1, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [rax]
	vmovupd xmmword ptr [rax], xmm0
.LBB146_34:
	mov r9, qword ptr [rsp + 216]
	mov r11, r12
	mov rsi, qword ptr [rsp + 8]
	mov rax, rsi
	mov rdx, r15
	mov rcx, r10
	mov r8, rbx
	mov rdi, r15
	mov qword ptr [rsp + 64], r9
	lea r13, [r9 + 16]
	mov rbp, r12
	sub rbp, 1
	cmovae r12, rbp
	mov qword ptr [rsp + 72], r12
	mov qword ptr [rsp + 248], r13
	cmovae r9, r13
	mov qword ptr [rsp + 216], r9
	lea r9, [rsi + 8]
	sub r15, 1
	cmovb r15, rdi
	cmovb r9, rsi
	mov qword ptr [rsp + 8], r9
	lea rdi, [r10 + 8]
	mov rsi, rbx
	sub rsi, 1
	cmovae rbx, rsi
	mov qword ptr [rsp + 40], rbx
	cmovae r10, rdi
	mov qword ptr [rsp + 200], r10
	mov r12, qword ptr [rsp + 80]
	mov r10, r12
	mov r13, qword ptr [rsp + 16]
	mov rbx, r13
	mov r9, r13
	sub r9, 1
	cmovae r13, r9
	mov qword ptr [rsp + 16], r13
	lea r13, [r12 + 8]
	cmovae r12, r13
	mov qword ptr [rsp + 80], r12
	test r14, r14
	je .LBB146_67
	test r11, r11
	je .LBB146_67
	test rdx, rdx
	je .LBB146_67
	test rax, rax
	je .LBB146_67
	test r8, r8
	je .LBB146_67
	test rcx, rcx
	je .LBB146_67
	test rbx, rbx
	je .LBB146_67
	test r10, r10
	je .LBB146_67
	dec r14
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rcx]
	mov rax, qword ptr [rsp + 208]
	vmovsd xmm2, qword ptr [rax]
	vmovaps xmmword ptr [rsp + 384], xmm2
	add rax, 8
	vmovsd xmm2, qword ptr [rsp + 240]
	vmulsd xmm2, xmm2, qword ptr [r10]
	vmovsd qword ptr [rsp + 256], xmm0
	vmovsd qword ptr [rsp + 264], xmm1
	vmovsd qword ptr [rsp + 272], xmm2
	vmovsd xmm0, qword ptr [rsp + 232]
	vmovsd qword ptr [rsp + 280], xmm0
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 320], rcx
	mov qword ptr [rsp + 328], r15
	mov qword ptr [rsp + 336], rdi
	mov qword ptr [rsp + 344], rsi
	mov qword ptr [rsp + 352], r13
	mov qword ptr [rsp + 360], r9
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 368], rax
	mov qword ptr [rsp + 376], r14
	mov r12, qword ptr [rsp + 56]
	mov qword ptr [rsp + 288], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 296], rbx
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 304], rax
	mov qword ptr [rsp + 312], rbx
	lea rdi, [rsp + 256]
	lea rsi, [rsp + 320]
	mov rdx, qword ptr [rsp + 248]
	mov rcx, rbp
	lea r8, [rsp + 288]
	vzeroupper
	call engine::force::pass_one::<f64>
	cmp rbp, rbx
	mov rsi, r12
	mov eax, 8
	cmova rsi, rax
	mov rax, rbp
	mov ecx, 0
	cmova rax, rcx
	lea rcx, [8*rax]
	movabs rdx, 4611686018427387872
	and rcx, rdx
	je .LBB146_48
	lea rdi, [rcx - 32]
	mov r8d, edi
	shr r8d, 5
	inc r8d
	and r8d, 3
	mov r12, qword ptr [rsp + 72]
	mov r10, qword ptr [rsp + 200]
	vxorpd xmm0, xmm0, xmm0
	mov rdx, rsi
	je .LBB146_45
	.p2align	4
.LBB146_44:
	vaddpd ymm0, ymm0, ymmword ptr [rdx]
	add rdx, 32
	dec r8
	jne .LBB146_44
.LBB146_45:
	cmp rdi, 96
	jb .LBB146_49
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB146_47:
	vaddpd ymm0, ymm0, ymmword ptr [rdx]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 32]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 64]
	vaddpd ymm0, ymm0, ymmword ptr [rdx + 96]
	sub rdx, -128
	cmp rdx, rdi
	jne .LBB146_47
	jmp .LBB146_49
	.p2align	4
.LBB146_48:
	vxorpd xmm0, xmm0, xmm0
	mov r12, qword ptr [rsp + 72]
	mov r10, qword ptr [rsp + 200]
.LBB146_49:
	mov rdx, rax
	movabs rdi, 576460752303423484
	and rdx, rdi
	vshufpd xmm1, xmm0, xmm0, 1
	vextractf128 xmm2, ymm0, 1
	and eax, 3
	je .LBB146_52
	vaddsd xmm0, xmm0, qword ptr [rsi + 8*rdx]
	cmp eax, 1
	je .LBB146_52
	vaddsd xmm1, xmm1, qword ptr [rsi + 8*rdx + 8]
	cmp eax, 2
	jne .LBB146_55
	.p2align	4
.LBB146_52:
	vmovapd xmm3, xmm2
.LBB146_56:
	cmp rbp, rbx
	mov rsi, qword ptr [rsp + 32]
	mov edi, 8
	cmova rsi, rdi
	test rcx, rcx
	je .LBB146_63
	lea r8, [rcx - 32]
	mov r9d, r8d
	shr r9d, 5
	inc r9d
	and r9d, 3
	mov rbx, qword ptr [rsp + 40]
	vxorpd xmm4, xmm4, xmm4
	mov rdi, rsi
	je .LBB146_59
	.p2align	4
.LBB146_58:
	vaddpd ymm4, ymm4, ymmword ptr [rdi]
	add rdi, 32
	dec r9
	jne .LBB146_58
.LBB146_59:
	cmp r8, 96
	jb .LBB146_62
	add rcx, rsi
	.p2align	4
.LBB146_61:
	vaddpd ymm4, ymm4, ymmword ptr [rdi]
	vaddpd ymm4, ymm4, ymmword ptr [rdi + 32]
	vaddpd ymm4, ymm4, ymmword ptr [rdi + 64]
	vaddpd ymm4, ymm4, ymmword ptr [rdi + 96]
	sub rdi, -128
	cmp rdi, rcx
	jne .LBB146_61
.LBB146_62:
	vshufpd xmm6, xmm4, xmm4, 1
	vextractf128 xmm5, ymm4, 1
	test rax, rax
	jne .LBB146_64
	jmp .LBB146_32
	.p2align	4
.LBB146_63:
	vxorpd xmm4, xmm4, xmm4
	mov rbx, qword ptr [rsp + 40]
	vshufpd xmm6, xmm4, xmm4, 1
	vextractf128 xmm5, ymm4, 1
	test rax, rax
	je .LBB146_32
.LBB146_64:
	vaddsd xmm4, xmm4, qword ptr [rsi + 8*rdx]
	cmp eax, 1
	je .LBB146_32
	vaddsd xmm6, xmm6, qword ptr [rsi + 8*rdx + 8]
	cmp eax, 2
	je .LBB146_32
	vaddsd xmm7, xmm5, qword ptr [rsi + 8*rdx + 16]
	jmp .LBB146_33
.LBB146_55:
	vaddsd xmm3, xmm2, qword ptr [rsi + 8*rdx + 16]
	jmp .LBB146_56
.LBB146_67:
	cmp qword ptr [rsp + 24], 0
	je .LBB146_69
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	vzeroupper
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB146_69:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 88]
	mov r14, qword ptr [rsp + 48]
	je .LBB146_71
	mov rdi, qword ptr [rsp + 192]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_71:
	cmp qword ptr [rsp + 144], 0
	je .LBB146_73
	mov rdi, r14
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_73:
	cmp qword ptr [rsp + 120], 0
	je .LBB146_75
	mov rdi, rbx
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB146_75:
	cmp qword ptr [rsp + 96], 0
	je .LBB146_77
	mov rdi, qword ptr [rsp + 224]
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
	vzeroupper
	jmp qword ptr [rip + free@GOTPCREL]
.LBB146_77:
	.cfi_def_cfa_offset 464
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
	vzeroupper
	ret
.LBB146_78:
	.cfi_def_cfa_offset 464
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB146_79:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB146_84
.LBB146_80:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB146_84
.LBB146_81:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB146_84
.LBB146_82:
	mov edi, 8
	jmp .LBB146_26
.LBB146_83:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB146_84:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_94
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB146_98
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r13, qword ptr [rsp + 8]
	jmp .LBB146_89
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r13, qword ptr [rsp + 8]
	je .LBB146_98
.LBB146_89:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB146_98
	jmp .LBB146_103
	jmp .LBB146_93
.LBB146_93:
	mov rbx, rax
.LBB146_94:
	cmp qword ptr [rsp + 168], 0
	jne .LBB146_99
	cmp qword ptr [rsp + 144], 0
	jne .LBB146_100
.LBB146_96:
	cmp qword ptr [rsp + 120], 0
	jne .LBB146_101
.LBB146_97:
	cmp qword ptr [rsp + 96], 0
	jne .LBB146_102
.LBB146_98:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB146_99:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB146_96
.LBB146_100:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB146_97
.LBB146_101:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB146_98
.LBB146_102:
	mov rdi, qword ptr [rsp + 104]
.LBB146_103:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
