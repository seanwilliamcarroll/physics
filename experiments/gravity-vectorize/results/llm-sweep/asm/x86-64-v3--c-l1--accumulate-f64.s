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
	sub rsp, 424
	.cfi_def_cfa_offset 480
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbp, rcx
	mov r14, qword ptr [rsi + 16]
	lea r13, [8*r14]
	mov rax, r14
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp r13, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	mov qword ptr [rsp + 40], rdi
	test r13, r13
	mov qword ptr [rsp + 32], r14
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 208], rbp
	mov qword ptr [rsp + 16], r13
	je .LBB146_2
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB146_95
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB146_93
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_17
	mov rsi, rbx
	mov rbp, qword ptr [rsp + 8]
	jmp .LBB146_3
.LBB146_2:
	mov r13d, 8
	mov ebp, 8
	mov r15d, 8
	mov eax, 8
.LBB146_3:
	mov qword ptr [rsp + 112], r14
	mov qword ptr [rsp + 120], rbp
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r14
	mov qword ptr [rsp + 144], r15
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 160], r14
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 184], r14
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 200], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 88], rcx
	test rcx, rcx
	je .LBB146_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 80], rax
	add r15, 8
	xor r13d, r13d
	jmp .LBB146_30
	.p2align	4
.LBB146_41:
	mov rax, qword ptr [rsp + 192]
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 200], r14
	add r15, 16
	cmp qword ptr [rsp + 88], r13
	je .LBB146_5
.LBB146_30:
	vmovsd xmm0, qword ptr [r15 - 8]
	vmovsd qword ptr [rsp + 24], xmm0
	vmovsd xmm0, qword ptr [r15]
	vmovsd qword ptr [rsp + 56], xmm0
	mov rax, qword ptr [rsp + 80]
	vmovsd xmm0, qword ptr [rax + 8*r13]
	vmovsd qword ptr [rsp + 8], xmm0
	cmp r13, qword ptr [rsp + 112]
	mov rax, rbp
	jne .LBB146_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB146_33:
	mov rbp, rax
	vmovsd xmm0, qword ptr [rsp + 24]
	vmovsd qword ptr [rax + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 128], r13
	mov r12, qword ptr [rsp + 152]
	cmp r12, qword ptr [rsp + 136]
	jne .LBB146_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_35:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 104], rax
	vmovsd xmm0, qword ptr [rsp + 56]
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 152], r12
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp + 8]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 24], xmm1
	vucomisd xmm0, xmm2
	jne .LBB146_36
	jp .LBB146_36
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	je .LBB146_38
	jmp .LBB146_39
	.p2align	4
.LBB146_36:
	vmovsd xmm0, qword ptr [rip + .LCPI146_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp + 24], xmm0
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	jne .LBB146_39
.LBB146_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 56], rax
	vmovsd xmm0, qword ptr [rsp + 24]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 176], rbx
	mov r14, qword ptr [rsp + 200]
	cmp r14, qword ptr [rsp + 184]
	jne .LBB146_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_41
.LBB146_4:
	mov qword ptr [rsp + 56], r13
	mov qword ptr [rsp + 104], r15
	xor ebx, ebx
	xor r12d, r12d
	xor r13d, r13d
	xor r14d, r14d
.LBB146_5:
	mov rcx, qword ptr [rsp + 32]
	mov rdx, rcx
	shr rdx, 60
	je .LBB146_42
	xor edi, edi
.LBB146_45:
	mov rsi, qword ptr [rsp + 16]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_42:
	mov rdx, qword ptr [rsp + 40]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd qword ptr [rsp + 272], xmm0
	vmovsd xmm0, qword ptr [rdx + 8]
	vmovsd qword ptr [rsp + 264], xmm0
	mov edx, 8
	mov qword ptr [rsp + 64], rdx
	mov qword ptr [rsp + 72], rdx
	test rcx, rcx
	mov rbp, qword ptr [rsp + 48]
	mov qword ptr [rsp + 232], rax
	je .LBB146_49
	mov esi, 1
	mov r15, qword ptr [rsp + 16]
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 64], rax
	test rax, rax
	je .LBB146_44
	mov esi, 1
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 72], rax
	test rax, rax
	je .LBB146_68
	mov rax, qword ptr [rsp + 232]
.LBB146_49:
	mov r8, qword ptr [rsp + 120]
	mov qword ptr [rsp + 240], rax
	mov rax, qword ptr [rsp + 56]
	mov qword ptr [rsp + 24], rax
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 88], rax
	mov qword ptr [rsp + 256], r8
	mov rax, r8
	jmp .LBB146_50
	.p2align	4
.LBB146_71:
	vxorpd xmm0, xmm0, xmm0
	vxorpd xmm1, xmm1, xmm1
	mov r8, qword ptr [rsp + 48]
	mov rbx, qword ptr [rsp + 80]
	mov rbp, qword ptr [rsp + 16]
	mov r9, qword ptr [rsp + 96]
	mov r10, qword ptr [rsp + 40]
	mov r11, qword ptr [rsp + 248]
.LBB146_88:
	vunpcklpd xmm0, xmm0, xmm1
	vmovddup xmm1, qword ptr [rsp + 208]
	vmulpd xmm0, xmm1, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [r8]
	vmovupd xmmword ptr [r8], xmm0
	mov rcx, rbx
	mov qword ptr [rsp + 24], rbp
	mov r12, r9
	mov qword ptr [rsp + 88], r10
	mov r13, r15
	mov rdi, qword ptr [rsp + 8]
	mov rax, rdi
	mov qword ptr [rsp + 208], r11
	mov rdx, qword ptr [rsp + 280]
	mov rsi, rbp
	mov rbp, rdx
.LBB146_50:
	mov r8, r15
	mov qword ptr [rsp + 48], rbp
	lea r15, [rbp + 16]
	mov rbp, qword ptr [rsp + 208]
	sub rbp, 1
	cmovae r11, rbp
	mov qword ptr [rsp + 248], r11
	mov qword ptr [rsp + 288], r15
	cmovae rdx, r15
	lea r11, [rax + 8]
	mov r15, r13
	sub r15, 1
	cmovb r15, r8
	cmovb r11, rdi
	mov qword ptr [rsp + 8], r11
	mov r11, qword ptr [rsp + 88]
	lea r8, [r11 + 8]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 96], r9
	cmovae r10, r8
	mov qword ptr [rsp + 40], r10
	mov r9, rbx
	sub r9, 1
	cmovae rcx, r9
	mov qword ptr [rsp + 80], rcx
	mov rcx, qword ptr [rsp + 24]
	lea r10, [rcx + 8]
	cmovae rsi, r10
	mov qword ptr [rsp + 16], rsi
	test r14, r14
	je .LBB146_58
	cmp qword ptr [rsp + 208], 0
	je .LBB146_58
	test r13, r13
	je .LBB146_58
	test rax, rax
	je .LBB146_58
	test r12, r12
	je .LBB146_58
	mov rsi, r11
	test r11, r11
	je .LBB146_58
	test rbx, rbx
	je .LBB146_58
	test rcx, rcx
	je .LBB146_58
	mov qword ptr [rsp + 280], rdx
	dec r14
	vmovsd xmm0, qword ptr [rax]
	vmovsd xmm1, qword ptr [rsi]
	mov r13, qword ptr [rsp + 240]
	vmovsd xmm2, qword ptr [r13]
	vmovaps xmmword ptr [rsp + 208], xmm2
	add r13, 8
	vmovsd xmm2, qword ptr [rsp + 272]
	vmulsd xmm2, xmm2, qword ptr [rcx]
	vmovsd qword ptr [rsp + 296], xmm0
	vmovsd qword ptr [rsp + 304], xmm1
	vmovsd qword ptr [rsp + 312], xmm2
	vmovsd xmm0, qword ptr [rsp + 264]
	vmovsd qword ptr [rsp + 320], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 360], rax
	mov qword ptr [rsp + 368], r15
	mov qword ptr [rsp + 376], r8
	mov qword ptr [rsp + 384], rdi
	mov qword ptr [rsp + 392], r10
	mov qword ptr [rsp + 400], r9
	mov qword ptr [rsp + 408], r13
	mov qword ptr [rsp + 416], r14
	mov r12, qword ptr [rsp + 64]
	mov qword ptr [rsp + 328], r12
	mov rbx, qword ptr [rsp + 32]
	mov qword ptr [rsp + 336], rbx
	mov rax, qword ptr [rsp + 72]
	mov qword ptr [rsp + 344], rax
	mov qword ptr [rsp + 352], rbx
	lea rdi, [rsp + 296]
	lea rsi, [rsp + 360]
	mov rdx, qword ptr [rsp + 288]
	mov rcx, rbp
	lea r8, [rsp + 328]
	call engine::force::pass_one::<f64>
	cmp rbp, rbx
	mov rdi, r12
	mov eax, 8
	cmova rdi, rax
	mov r8, rbp
	mov eax, 0
	cmova r8, rax
	test r8, r8
	mov qword ptr [rsp + 240], r13
	je .LBB146_71
	lea rax, [8*r8]
	lea rcx, [rax - 8]
	mov rsi, rcx
	shr rsi, 3
	inc rsi
	mov rdx, rsi
	and rdx, 7
	mov r11, qword ptr [rsp + 248]
	je .LBB146_73
	lea r10d, [8*rdx]
	vxorpd xmm0, xmm0, xmm0
	mov r9, rdi
	.p2align	4
.LBB146_75:
	vaddsd xmm0, xmm0, qword ptr [r9]
	add r9, 8
	add r10, -8
	jne .LBB146_75
	cmp rcx, 56
	jae .LBB146_77
	jmp .LBB146_79
	.p2align	4
.LBB146_73:
	vxorpd xmm0, xmm0, xmm0
	mov r9, rdi
	cmp rcx, 56
	jb .LBB146_79
.LBB146_77:
	lea rdi, [rdi + 8*r8]
	.p2align	4
.LBB146_78:
	vaddsd xmm0, xmm0, qword ptr [r9]
	vaddsd xmm0, xmm0, qword ptr [r9 + 8]
	vaddsd xmm0, xmm0, qword ptr [r9 + 16]
	vaddsd xmm0, xmm0, qword ptr [r9 + 24]
	vaddsd xmm0, xmm0, qword ptr [r9 + 32]
	vaddsd xmm0, xmm0, qword ptr [r9 + 40]
	vaddsd xmm0, xmm0, qword ptr [r9 + 48]
	vaddsd xmm0, xmm0, qword ptr [r9 + 56]
	add r9, 64
	cmp r9, rdi
	jne .LBB146_78
.LBB146_79:
	cmp rbp, rbx
	mov rdi, qword ptr [rsp + 72]
	mov r8d, 8
	cmova rdi, r8
	test sil, 7
	mov rbx, qword ptr [rsp + 80]
	je .LBB146_80
	shl edx, 3
	vxorpd xmm1, xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 48]
	mov r9, qword ptr [rsp + 96]
	.p2align	4
.LBB146_82:
	vaddsd xmm1, xmm1, qword ptr [rsi]
	add rsi, 8
	add rdx, -8
	jne .LBB146_82
	cmp rcx, 56
	jae .LBB146_85
.LBB146_84:
	mov rbp, qword ptr [rsp + 16]
	jmp .LBB146_87
	.p2align	4
.LBB146_80:
	vxorpd xmm1, xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 48]
	mov r9, qword ptr [rsp + 96]
	cmp rcx, 56
	jb .LBB146_84
.LBB146_85:
	add rdi, rax
	mov rbp, qword ptr [rsp + 16]
	.p2align	4
.LBB146_86:
	vaddsd xmm1, xmm1, qword ptr [rsi]
	vaddsd xmm1, xmm1, qword ptr [rsi + 8]
	vaddsd xmm1, xmm1, qword ptr [rsi + 16]
	vaddsd xmm1, xmm1, qword ptr [rsi + 24]
	vaddsd xmm1, xmm1, qword ptr [rsi + 32]
	vaddsd xmm1, xmm1, qword ptr [rsi + 40]
	vaddsd xmm1, xmm1, qword ptr [rsi + 48]
	vaddsd xmm1, xmm1, qword ptr [rsi + 56]
	add rsi, 64
	cmp rsi, rdi
	jne .LBB146_86
.LBB146_87:
	mov r10, qword ptr [rsp + 40]
	jmp .LBB146_88
.LBB146_58:
	cmp qword ptr [rsp + 32], 0
	je .LBB146_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 72]
	call rbx
	mov rdi, qword ptr [rsp + 64]
	call rbx
.LBB146_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 104]
	mov r14, qword ptr [rsp + 56]
	je .LBB146_62
	mov rdi, qword ptr [rsp + 232]
	call qword ptr [rip + free@GOTPCREL]
.LBB146_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB146_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB146_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB146_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB146_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB146_89
	mov rdi, qword ptr [rsp + 256]
	add rsp, 424
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
.LBB146_89:
	.cfi_def_cfa_offset 480
	add rsp, 424
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
.LBB146_95:
	.cfi_def_cfa_offset 480
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB146_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_93:
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_17:
	mov edi, 8
	mov rsi, qword ptr [rsp + 16]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_44:
	mov edi, 8
	jmp .LBB146_45
.LBB146_68:
	mov edi, 8
	mov rsi, r15
	call alloc::raw_vec::handle_error
.LBB146_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 64]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_20
	mov r14, rax
	cmp qword ptr [rsp + 32], 0
	je .LBB146_92
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB146_11
	mov r14, rax
	cmp qword ptr [rsp + 32], 0
	mov rax, qword ptr [rsp + 8]
	je .LBB146_92
.LBB146_11:
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
	je .LBB146_92
	jmp .LBB146_91
	jmp .LBB146_19
.LBB146_19:
	mov r14, rax
.LBB146_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB146_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB146_23
.LBB146_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB146_25
.LBB146_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB146_27
.LBB146_92:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB146_21:
	mov rdi, qword ptr [rsp + 192]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 160], 0
	je .LBB146_24
.LBB146_23:
	mov rdi, qword ptr [rsp + 168]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 136], 0
	je .LBB146_26
.LBB146_25:
	mov rdi, qword ptr [rsp + 144]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB146_92
.LBB146_27:
	mov rdi, qword ptr [rsp + 120]
.LBB146_91:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
