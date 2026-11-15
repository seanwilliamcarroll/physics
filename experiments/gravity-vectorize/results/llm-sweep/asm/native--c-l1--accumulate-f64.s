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
	mov r15, qword ptr [rsi + 16]
	mov r12, rcx
	movabs rcx, 9223372036854775801
	lea rbp, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	mov qword ptr [rsp + 64], rdi
	mov qword ptr [rsp + 16], r15
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 208], r12
	mov qword ptr [rsp + 24], rbp
	test rbp, rbp
	je .LBB146_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rbx, rsi
	call r14
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB146_94
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB146_9
	mov rdi, rbp
	mov r12, rax
	call r14
	mov rsi, rbp
	test rax, rax
	je .LBB146_92
	mov rdi, rsi
	mov rbp, rax
	call r14
	test rax, rax
	je .LBB146_17
	mov rcx, qword ptr [rsp]
	mov rsi, rbx
	jmp .LBB146_3
.LBB146_2:
	mov ebp, 8
	mov ecx, 8
	mov r12d, 8
	mov eax, 8
.LBB146_3:
	mov rdx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 112], r15
	mov qword ptr [rsp + 120], rcx
	mov qword ptr [rsp + 136], r15
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 160], r15
	mov qword ptr [rsp + 168], rbp
	mov qword ptr [rsp + 184], r15
	mov qword ptr [rsp + 192], rax
	mov r13, rcx
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 200], 0
	cmp rdx, r15
	cmovae rdx, r15
	mov qword ptr [rsp + 80], rdx
	test rdx, rdx
	je .LBB146_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	xor ebp, ebp
	add r15, 8
	mov qword ptr [rsp + 72], rax
	jmp .LBB146_30
	.p2align	4
.LBB146_41:
	vmovsd xmm0, qword ptr [rsp]
	mov rax, qword ptr [rsp + 192]
	add r15, 16
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 200], r14
	cmp qword ptr [rsp + 80], rbp
	je .LBB146_5
.LBB146_30:
	vmovsd xmm0, qword ptr [r15 - 8]
	vmovsd qword ptr [rsp + 8], xmm0
	vmovsd xmm0, qword ptr [r15]
	vmovsd qword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 72]
	vmovsd xmm0, qword ptr [rax + 8*rbp]
	vmovsd qword ptr [rsp], xmm0
	cmp rbp, qword ptr [rsp + 112]
	jne .LBB146_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov r13, qword ptr [rsp + 120]
.LBB146_33:
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [r13 + 8*rbp], xmm0
	inc rbp
	mov r12, qword ptr [rsp + 152]
	mov qword ptr [rsp + 128], rbp
	cmp r12, qword ptr [rsp + 136]
	jne .LBB146_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_35:
	mov rax, qword ptr [rsp + 144]
	vxorpd xmm2, xmm2, xmm2
	vxorpd xmm1, xmm1, xmm1
	mov qword ptr [rsp + 104], rax
	vmovsd xmm0, qword ptr [rsp + 32]
	vmovsd xmm3, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm1
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	vucomisd xmm3, xmm2
	mov qword ptr [rsp + 152], r12
	jne .LBB146_36
	jp .LBB146_36
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	je .LBB146_38
	jmp .LBB146_39
	.p2align	4
.LBB146_36:
	vmovsd xmm0, qword ptr [rip + .LCPI146_0]
	vdivsd xmm0, xmm0, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm0
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	jne .LBB146_39
.LBB146_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 96], rax
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov r14, qword ptr [rsp + 200]
	mov qword ptr [rsp + 176], rbx
	cmp r14, qword ptr [rsp + 184]
	jne .LBB146_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_41
.LBB146_4:
	mov qword ptr [rsp + 96], rbp
	mov qword ptr [rsp + 104], r12
	xor ebx, ebx
	xor r12d, r12d
	xor ebp, ebp
	xor r14d, r14d
.LBB146_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 60
	je .LBB146_42
	xor edi, edi
.LBB146_45:
	mov rsi, qword ptr [rsp + 24]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_42:
	mov rdx, qword ptr [rsp + 64]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd xmm1, qword ptr [rdx + 8]
	mov edx, 8
	vmovsd qword ptr [rsp + 256], xmm0
	vmovsd qword ptr [rsp + 248], xmm1
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 56], rdx
	mov r13, qword ptr [rsp + 40]
	mov qword ptr [rsp + 232], rax
	test rcx, rcx
	je .LBB146_49
	mov r15, qword ptr [rsp + 24]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB146_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB146_68
	mov rax, qword ptr [rsp + 232]
.LBB146_49:
	mov qword ptr [rsp + 64], rax
	mov r10, qword ptr [rsp + 120]
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 80], rax
	mov r15, qword ptr [rsp + 104]
	mov qword ptr [rsp + 240], r10
	jmp .LBB146_50
	.p2align	4
.LBB146_71:
	mov r8, qword ptr [rsp + 40]
	mov rbx, qword ptr [rsp]
	mov r9, qword ptr [rsp + 88]
	mov r13, qword ptr [rsp + 72]
	mov r11, qword ptr [rsp + 24]
	vxorpd xmm0, xmm0, xmm0
	vxorpd xmm1, xmm1, xmm1
.LBB146_87:
	vmovddup xmm2, qword ptr [rsp + 208]
	vunpcklpd xmm0, xmm0, xmm1
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 80], rbp
	mov rdx, rbp
	mov rsi, r9
	mov r12, r9
	mov r15, r13
	mov r9, r13
	mov rbp, rax
	vmulpd xmm0, xmm2, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [r8]
	vmovupd xmmword ptr [r8], xmm0
	mov r8, qword ptr [rsp + 8]
	mov qword ptr [rsp + 208], r11
	mov rcx, qword ptr [rsp + 264]
	mov r10, r8
	mov r13, rcx
.LBB146_50:
	mov qword ptr [rsp + 40], r13
	mov rdi, r8
	mov r8, rax
	lea rax, [r13 + 16]
	mov r13, qword ptr [rsp + 208]
	sub r13, 1
	cmovae r11, r13
	cmovae rcx, rax
	mov qword ptr [rsp + 24], r11
	mov r11, rbp
	sub r11, 1
	mov qword ptr [rsp + 272], rax
	mov rax, r10
	lea r10, [r10 + 8]
	cmovb r11, r8
	cmovb r10, rdi
	mov rdi, r12
	sub rdi, 1
	lea r8, [r15 + 8]
	cmovae rsi, rdi
	cmovae r9, r8
	mov qword ptr [rsp + 32], r11
	mov qword ptr [rsp + 8], r10
	mov qword ptr [rsp + 88], rsi
	mov qword ptr [rsp + 72], r9
	mov r9, rbx
	sub r9, 1
	mov r11, qword ptr [rsp + 80]
	mov rsi, qword ptr [rsp]
	lea r10, [r11 + 8]
	cmovae rsi, r9
	cmovae rdx, r10
	mov qword ptr [rsp], rsi
	test r14, r14
	je .LBB146_58
	cmp qword ptr [rsp + 208], 0
	je .LBB146_58
	test rbp, rbp
	je .LBB146_58
	test rax, rax
	je .LBB146_58
	test r12, r12
	je .LBB146_58
	test r15, r15
	je .LBB146_58
	test rbx, rbx
	je .LBB146_58
	mov rsi, r11
	test r11, r11
	je .LBB146_58
	mov qword ptr [rsp + 264], rcx
	vmovsd xmm0, qword ptr [rax]
	mov rbp, rdx
	vmovsd xmm1, qword ptr [r15]
	dec r14
	mov rax, qword ptr [rsp + 64]
	vmovsd xmm2, qword ptr [rax]
	add rax, 8
	vmovaps xmmword ptr [rsp + 208], xmm2
	vmovsd xmm2, qword ptr [rsp + 256]
	mov rcx, qword ptr [rsp + 8]
	mov rdx, qword ptr [rsp + 32]
	vmulsd xmm2, xmm2, qword ptr [rsi]
	vmovsd qword ptr [rsp + 280], xmm0
	vmovsd xmm0, qword ptr [rsp + 248]
	mov qword ptr [rsp + 64], rax
	lea rsi, [rsp + 344]
	vmovsd qword ptr [rsp + 288], xmm1
	mov r12, qword ptr [rsp + 48]
	mov rbx, qword ptr [rsp + 16]
	mov qword ptr [rsp + 344], rcx
	mov qword ptr [rsp + 352], rdx
	mov rcx, qword ptr [rsp + 56]
	mov rdx, qword ptr [rsp + 272]
	mov qword ptr [rsp + 360], r8
	mov qword ptr [rsp + 368], rdi
	lea rdi, [rsp + 280]
	lea r8, [rsp + 312]
	mov qword ptr [rsp + 376], r10
	mov qword ptr [rsp + 384], r9
	mov qword ptr [rsp + 392], rax
	mov qword ptr [rsp + 400], r14
	mov qword ptr [rsp + 312], r12
	mov qword ptr [rsp + 320], rbx
	mov qword ptr [rsp + 328], rcx
	mov rcx, r13
	mov qword ptr [rsp + 336], rbx
	vmovsd qword ptr [rsp + 296], xmm2
	vmovsd qword ptr [rsp + 304], xmm0
	call engine::force::pass_one::<f64>
	cmp r13, rbx
	mov eax, 8
	mov rdi, r12
	mov r8, r13
	cmova rdi, rax
	mov eax, 0
	cmova r8, rax
	test r8, r8
	je .LBB146_71
	lea rax, [8*r8]
	mov r11, qword ptr [rsp + 24]
	lea rcx, [rax - 8]
	mov rsi, rcx
	shr rsi, 3
	inc rsi
	mov rdx, rsi
	and rdx, 7
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
	mov rdi, qword ptr [rsp + 56]
	cmp r13, rbx
	mov r13, qword ptr [rsp + 72]
	mov r8d, 8
	cmova rdi, r8
	test sil, 7
	je .LBB146_80
	mov r8, qword ptr [rsp + 40]
	mov r9, qword ptr [rsp + 88]
	shl edx, 3
	vxorpd xmm1, xmm1, xmm1
	mov rsi, rdi
	.p2align	4
.LBB146_82:
	vaddsd xmm1, xmm1, qword ptr [rsi]
	add rsi, 8
	add rdx, -8
	jne .LBB146_82
	cmp rcx, 56
	jae .LBB146_85
.LBB146_84:
	mov rbx, qword ptr [rsp]
	jmp .LBB146_87
	.p2align	4
.LBB146_80:
	mov r8, qword ptr [rsp + 40]
	mov r9, qword ptr [rsp + 88]
	vxorpd xmm1, xmm1, xmm1
	mov rsi, rdi
	cmp rcx, 56
	jb .LBB146_84
.LBB146_85:
	mov rbx, qword ptr [rsp]
	add rdi, rax
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
	jmp .LBB146_87
.LBB146_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB146_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 56]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB146_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 104]
	mov r14, qword ptr [rsp + 96]
	je .LBB146_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 232]
	call rax
.LBB146_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB146_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call rax
.LBB146_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB146_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call rax
.LBB146_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB146_88
	mov rdi, qword ptr [rsp + 240]
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB146_88:
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
	ret
.LBB146_94:
	.cfi_def_cfa_offset 464
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB146_9:
	mov edi, 8
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_92:
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_17:
	mov rsi, qword ptr [rsp + 24]
	mov edi, 8
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
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 48]
	mov r14, rax
	call rbx
	jmp .LBB146_20
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	je .LBB146_91
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	mov rcx, qword ptr [rsp]
	jmp .LBB146_11
	cmp qword ptr [rsp + 16], 0
	mov rcx, qword ptr [rsp]
	mov r14, rax
	je .LBB146_91
.LBB146_11:
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	mov rbx, rcx
	call rax
	mov rdi, rbx
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	mov r14, rax
	je .LBB146_91
	jmp .LBB146_90
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
.LBB146_91:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB146_21:
	mov rdi, qword ptr [rsp + 192]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 160], 0
	je .LBB146_24
.LBB146_23:
	mov rdi, qword ptr [rsp + 168]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 136], 0
	je .LBB146_26
.LBB146_25:
	mov rdi, qword ptr [rsp + 144]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 112], 0
	je .LBB146_91
.LBB146_27:
	mov rdi, qword ptr [rsp + 120]
.LBB146_90:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
