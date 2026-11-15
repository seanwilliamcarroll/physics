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
	mov qword ptr [rsp + 96], rdi
	test r13, r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 208], rbp
	mov qword ptr [rsp + 8], r13
	je .LBB146_2
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB146_94
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB146_92
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_17
	mov rsi, rbx
	mov rbp, qword ptr [rsp]
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
	mov qword ptr [rsp + 72], rcx
	test rcx, rcx
	je .LBB146_4
	mov r13, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 64], rax
	add r13, 8
	xor ebx, ebx
	jmp .LBB146_30
	.p2align	4
.LBB146_41:
	mov rax, qword ptr [rsp + 192]
	movsd xmm0, qword ptr [rsp]
	movsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 200], r14
	add r13, 16
	cmp qword ptr [rsp + 72], rbx
	je .LBB146_5
.LBB146_30:
	movsd xmm0, qword ptr [r13 - 8]
	movsd qword ptr [rsp + 16], xmm0
	movsd xmm0, qword ptr [r13]
	movsd qword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 64]
	movsd xmm0, qword ptr [rax + 8*rbx]
	movsd qword ptr [rsp], xmm0
	cmp rbx, qword ptr [rsp + 112]
	mov rax, rbp
	jne .LBB146_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB146_33:
	mov rbp, rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 128], rbx
	mov r12, qword ptr [rsp + 152]
	cmp r12, qword ptr [rsp + 136]
	jne .LBB146_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_35:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 104], rax
	movsd xmm0, qword ptr [rsp + 40]
	movsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 152], r12
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 16], xmm1
	ucomisd xmm0, xmm2
	jne .LBB146_36
	jp .LBB146_36
	mov r15, qword ptr [rsp + 176]
	cmp r15, qword ptr [rsp + 160]
	je .LBB146_38
	jmp .LBB146_39
	.p2align	4
.LBB146_36:
	movsd xmm0, qword ptr [rip + .LCPI146_0]
	divsd xmm0, qword ptr [rsp]
	movsd qword ptr [rsp + 16], xmm0
	mov r15, qword ptr [rsp + 176]
	cmp r15, qword ptr [rsp + 160]
	jne .LBB146_39
.LBB146_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 40], rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 176], r15
	mov r14, qword ptr [rsp + 200]
	cmp r14, qword ptr [rsp + 184]
	jne .LBB146_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_41
.LBB146_4:
	mov qword ptr [rsp + 40], r13
	mov qword ptr [rsp + 104], r15
	xor r15d, r15d
	xor r12d, r12d
	xor ebx, ebx
	xor r14d, r14d
.LBB146_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 60
	je .LBB146_42
	xor edi, edi
.LBB146_45:
	mov rsi, qword ptr [rsp + 8]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_42:
	mov rdx, qword ptr [rsp + 96]
	movsd xmm0, qword ptr [rdx]
	movsd qword ptr [rsp + 264], xmm0
	movsd xmm0, qword ptr [rdx + 8]
	movsd qword ptr [rsp + 256], xmm0
	mov edx, 8
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 56], rdx
	test rcx, rcx
	mov rbp, qword ptr [rsp + 32]
	mov qword ptr [rsp + 232], rax
	je .LBB146_49
	mov esi, 1
	mov r13, qword ptr [rsp + 8]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB146_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB146_68
	mov rax, qword ptr [rsp + 232]
.LBB146_49:
	mov r11, qword ptr [rsp + 120]
	mov qword ptr [rsp + 240], rax
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 72], rax
	mov rsi, qword ptr [rsp + 104]
	mov qword ptr [rsp + 248], r11
	jmp .LBB146_50
	.p2align	4
.LBB146_71:
	xorpd xmm0, xmm0
	xorpd xmm1, xmm1
	mov r8, qword ptr [rsp + 32]
	mov r11, qword ptr [rsp + 64]
	mov rax, qword ptr [rsp]
	mov rbx, qword ptr [rsp + 80]
.LBB146_87:
	mov r10, qword ptr [rsp + 8]
	mov r9, qword ptr [rsp + 88]
	unpcklpd xmm0, xmm1
	movapd xmm1, xmmword ptr [rsp + 208]
	unpcklpd xmm1, xmm1
	mulpd xmm1, xmm0
	movupd xmm0, xmmword ptr [r8]
	addpd xmm0, xmm1
	movupd xmmword ptr [r8], xmm0
	mov rdx, r11
	mov r15, r11
	mov qword ptr [rsp + 72], rax
	mov r12, rbx
	mov rsi, r10
	mov rcx, rbx
	mov rbx, r13
	mov rdi, qword ptr [rsp + 16]
	mov r11, rdi
	mov r8, qword ptr [rsp + 96]
	mov qword ptr [rsp + 208], r8
	mov rbp, r9
.LBB146_50:
	mov qword ptr [rsp + 32], rbp
	lea rax, [rbp + 16]
	mov rbp, qword ptr [rsp + 208]
	sub rbp, 1
	cmovae r8, rbp
	mov qword ptr [rsp + 96], r8
	mov qword ptr [rsp + 272], rax
	cmovae r9, rax
	mov qword ptr [rsp + 88], r9
	mov r8, r13
	lea r9, [r11 + 8]
	mov r13, rbx
	sub r13, 1
	cmovb r13, r8
	cmovb r9, rdi
	mov qword ptr [rsp + 16], r9
	lea r8, [rsi + 8]
	mov rdi, r12
	sub rdi, 1
	cmovae rcx, rdi
	mov qword ptr [rsp + 80], rcx
	cmovae r10, r8
	mov qword ptr [rsp + 8], r10
	mov r9, r15
	sub r9, 1
	cmovae rdx, r9
	mov qword ptr [rsp + 64], rdx
	mov rax, qword ptr [rsp + 72]
	lea r10, [rax + 8]
	mov rcx, qword ptr [rsp]
	cmovae rcx, r10
	mov qword ptr [rsp], rcx
	test r14, r14
	je .LBB146_58
	cmp qword ptr [rsp + 208], 0
	je .LBB146_58
	test rbx, rbx
	je .LBB146_58
	test r11, r11
	je .LBB146_58
	test r12, r12
	je .LBB146_58
	test rsi, rsi
	je .LBB146_58
	test r15, r15
	je .LBB146_58
	mov rcx, rax
	test rax, rax
	je .LBB146_58
	dec r14
	movsd xmm0, qword ptr [r11]
	movsd xmm1, qword ptr [rsi]
	mov r12, qword ptr [rsp + 240]
	movsd xmm2, qword ptr [r12]
	movaps xmmword ptr [rsp + 208], xmm2
	add r12, 8
	movsd xmm2, qword ptr [rcx]
	mulsd xmm2, qword ptr [rsp + 264]
	movsd qword ptr [rsp + 280], xmm0
	movsd qword ptr [rsp + 288], xmm1
	movsd qword ptr [rsp + 296], xmm2
	movsd xmm0, qword ptr [rsp + 256]
	movsd qword ptr [rsp + 304], xmm0
	mov rax, qword ptr [rsp + 16]
	mov qword ptr [rsp + 344], rax
	mov qword ptr [rsp + 352], r13
	mov qword ptr [rsp + 360], r8
	mov qword ptr [rsp + 368], rdi
	mov qword ptr [rsp + 376], r10
	mov qword ptr [rsp + 384], r9
	mov qword ptr [rsp + 392], r12
	mov qword ptr [rsp + 400], r14
	mov r15, qword ptr [rsp + 48]
	mov qword ptr [rsp + 312], r15
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 320], rbx
	mov rax, qword ptr [rsp + 56]
	mov qword ptr [rsp + 328], rax
	mov qword ptr [rsp + 336], rbx
	lea rdi, [rsp + 280]
	lea rsi, [rsp + 344]
	mov rdx, qword ptr [rsp + 272]
	mov rcx, rbp
	lea r8, [rsp + 312]
	call engine::force::pass_one::<f64>
	cmp rbp, rbx
	mov r8, r15
	mov eax, 8
	cmova r8, rax
	mov r9, rbp
	mov eax, 0
	cmova r9, rax
	test r9, r9
	mov qword ptr [rsp + 240], r12
	je .LBB146_71
	lea rax, [8*r9]
	lea rcx, [rax - 8]
	mov rsi, rcx
	shr rsi, 3
	inc rsi
	mov rdx, rsi
	and rdx, 7
	je .LBB146_73
	lea r10d, [8*rdx]
	xorpd xmm0, xmm0
	mov rdi, r8
	.p2align	4
.LBB146_75:
	addsd xmm0, qword ptr [rdi]
	add rdi, 8
	add r10, -8
	jne .LBB146_75
	cmp rcx, 56
	jae .LBB146_77
	jmp .LBB146_79
	.p2align	4
.LBB146_73:
	xorpd xmm0, xmm0
	mov rdi, r8
	cmp rcx, 56
	jb .LBB146_79
.LBB146_77:
	lea r8, [r8 + 8*r9]
	.p2align	4
.LBB146_78:
	addsd xmm0, qword ptr [rdi]
	addsd xmm0, qword ptr [rdi + 8]
	addsd xmm0, qword ptr [rdi + 16]
	addsd xmm0, qword ptr [rdi + 24]
	addsd xmm0, qword ptr [rdi + 32]
	addsd xmm0, qword ptr [rdi + 40]
	addsd xmm0, qword ptr [rdi + 48]
	addsd xmm0, qword ptr [rdi + 56]
	add rdi, 64
	cmp rdi, r8
	jne .LBB146_78
.LBB146_79:
	cmp rbp, rbx
	mov rdi, qword ptr [rsp + 56]
	mov r8d, 8
	cmova rdi, r8
	test sil, 7
	mov r11, qword ptr [rsp + 64]
	je .LBB146_80
	shl edx, 3
	xorpd xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 32]
	mov rbx, qword ptr [rsp + 80]
	.p2align	4
.LBB146_82:
	addsd xmm1, qword ptr [rsi]
	add rsi, 8
	add rdx, -8
	jne .LBB146_82
	cmp rcx, 56
	jae .LBB146_85
.LBB146_84:
	mov rax, qword ptr [rsp]
	jmp .LBB146_87
	.p2align	4
.LBB146_80:
	xorpd xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 32]
	mov rbx, qword ptr [rsp + 80]
	cmp rcx, 56
	jb .LBB146_84
.LBB146_85:
	add rdi, rax
	mov rax, qword ptr [rsp]
	.p2align	4
.LBB146_86:
	addsd xmm1, qword ptr [rsi]
	addsd xmm1, qword ptr [rsi + 8]
	addsd xmm1, qword ptr [rsi + 16]
	addsd xmm1, qword ptr [rsi + 24]
	addsd xmm1, qword ptr [rsi + 32]
	addsd xmm1, qword ptr [rsi + 40]
	addsd xmm1, qword ptr [rsi + 48]
	addsd xmm1, qword ptr [rsi + 56]
	add rsi, 64
	cmp rsi, rdi
	jne .LBB146_86
	jmp .LBB146_87
.LBB146_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB146_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 56]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB146_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 104]
	mov r14, qword ptr [rsp + 40]
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
	je .LBB146_88
	mov rdi, qword ptr [rsp + 248]
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
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB146_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_92:
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_17:
	mov edi, 8
	mov rsi, qword ptr [rsp + 8]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_44:
	mov edi, 8
	jmp .LBB146_45
.LBB146_68:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB146_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 48]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_20
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB146_91
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB146_11
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rax, qword ptr [rsp]
	je .LBB146_91
.LBB146_11:
	mov rbx, rax
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp]
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
	je .LBB146_91
.LBB146_27:
	mov rdi, qword ptr [rsp + 120]
.LBB146_90:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
