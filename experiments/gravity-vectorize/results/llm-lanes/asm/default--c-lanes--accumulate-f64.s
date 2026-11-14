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
	mov r14, rcx
	mov r12, qword ptr [rsi + 16]
	lea rbx, [8*r12]
	mov rax, r12
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB146_1
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	test rbx, rbx
	mov qword ptr [rsp + 24], r12
	mov qword ptr [rsp + 72], rdi
	je .LBB146_2
	mov qword ptr [rsp + 16], rsi
	mov r13, rdx
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB146_101
	mov r15, r12
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_9
	mov r12, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_99
	mov rbp, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_17
	mov rdx, r13
	mov r13, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB146_3
.LBB146_2:
	mov r15, r12
	mov ebp, 8
	mov r13d, 8
	mov r12d, 8
	mov eax, 8
.LBB146_3:
	mov qword ptr [rsp + 80], rbx
	mov qword ptr [rsp + 232], rdx
	mov qword ptr [rsp + 240], r14
	mov qword ptr [rsp + 120], r15
	mov qword ptr [rsp + 128], r13
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r15
	mov qword ptr [rsp + 152], r12
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r15
	mov qword ptr [rsp + 176], rbp
	mov qword ptr [rsp + 184], 0
	mov qword ptr [rsp + 192], r15
	mov qword ptr [rsp + 200], rax
	mov qword ptr [rsp + 208], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r15
	cmovae rcx, r15
	mov qword ptr [rsp + 96], rcx
	test rcx, rcx
	je .LBB146_4
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 88], rax
	add rbp, 8
	xor r15d, r15d
	jmp .LBB146_30
	.p2align	4
.LBB146_41:
	mov rax, qword ptr [rsp + 200]
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 208], r14
	add rbp, 16
	cmp qword ptr [rsp + 96], r15
	je .LBB146_5
.LBB146_30:
	movsd xmm0, qword ptr [rbp - 8]
	movsd qword ptr [rsp + 16], xmm0
	movsd xmm0, qword ptr [rbp]
	movsd qword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 88]
	movsd xmm0, qword ptr [rax + 8*r15]
	movsd qword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 120]
	mov rax, r13
	jne .LBB146_33
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 128]
.LBB146_33:
	mov r13, rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 136], r15
	mov rax, qword ptr [rsp + 160]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB146_35
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_35:
	mov r12, qword ptr [rsp + 152]
	mov rax, rbx
	movsd xmm0, qword ptr [rsp + 32]
	movsd qword ptr [r12 + 8*rbx], xmm0
	inc rax
	mov rbx, rax
	mov qword ptr [rsp + 160], rax
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp + 8]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 16], xmm1
	ucomisd xmm0, xmm2
	jne .LBB146_36
	jp .LBB146_36
	mov rax, qword ptr [rsp + 184]
	mov r14, rax
	cmp rax, qword ptr [rsp + 168]
	je .LBB146_38
	jmp .LBB146_39
	.p2align	4
.LBB146_36:
	movsd xmm0, qword ptr [rip + .LCPI146_0]
	divsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rsp + 16], xmm0
	mov rax, qword ptr [rsp + 184]
	mov r14, rax
	cmp rax, qword ptr [rsp + 168]
	jne .LBB146_39
.LBB146_38:
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_39:
	mov rax, qword ptr [rsp + 176]
	mov qword ptr [rsp + 112], rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 184], r14
	mov r14, qword ptr [rsp + 208]
	cmp r14, qword ptr [rsp + 192]
	jne .LBB146_41
	lea rdi, [rsp + 192]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_41
.LBB146_4:
	mov qword ptr [rsp + 112], rbp
	mov qword ptr [rsp + 16], 0
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
.LBB146_5:
	mov rdx, qword ptr [rsp + 24]
	mov rcx, rdx
	shr rcx, 60
	je .LBB146_42
	xor edi, edi
.LBB146_45:
	mov rsi, qword ptr [rsp + 80]
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_42:
	mov rcx, qword ptr [rsp + 72]
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rsp + 272], xmm0
	movsd xmm0, qword ptr [rcx + 8]
	movsd qword ptr [rsp + 264], xmm0
	mov ecx, 8
	mov qword ptr [rsp + 56], rcx
	mov qword ptr [rsp + 104], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 112]
	mov qword ptr [rsp + 216], rax
	je .LBB146_49
	mov esi, 1
	mov r13, qword ptr [rsp + 80]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB146_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 104], rax
	test rax, rax
	je .LBB146_68
	mov rax, qword ptr [rsp + 216]
.LBB146_49:
	mov qword ptr [rsp + 32], r14
	mov rcx, qword ptr [rsp + 128]
	mov qword ptr [rsp + 224], rax
	mov qword ptr [rsp + 96], rbp
	mov qword ptr [rsp + 256], r12
	mov qword ptr [rsp + 88], r12
	mov qword ptr [rsp + 248], rcx
	mov qword ptr [rsp + 8], rcx
	mov r9, rbx
	jmp .LBB146_50
	.p2align	4
.LBB146_83:
	movapd xmm4, xmm6
.LBB146_84:
	mov rax, qword ptr [rsp + 64]
	movapd xmm6, xmmword ptr [rsp + 32]
	mov qword ptr [rsp + 32], r14
	addsd xmm2, xmm1
	unpckhpd xmm1, xmm1
	addsd xmm0, xmm1
	addsd xmm0, xmm2
	addsd xmm5, xmm4
	unpckhpd xmm4, xmm4
	addsd xmm3, xmm4
	addsd xmm3, xmm5
	unpcklpd xmm0, xmm3
	unpcklpd xmm6, xmm6
	mulpd xmm6, xmm0
	movupd xmm0, xmmword ptr [rax]
	addpd xmm0, xmm6
	movupd xmmword ptr [rax], xmm0
.LBB146_50:
	mov rbx, qword ptr [rsp + 232]
	mov r10, qword ptr [rsp + 240]
	mov rbp, r10
	mov rdi, qword ptr [rsp + 8]
	mov rcx, rdi
	mov qword ptr [rsp + 80], r15
	mov rsi, qword ptr [rsp + 88]
	mov r14, rsi
	mov r11, r9
	mov rax, qword ptr [rsp + 96]
	mov rdx, rax
	mov r8, r15
	mov qword ptr [rsp + 64], rbx
	lea r13, [rbx + 16]
	mov r12, r10
	sub r12, 1
	cmovae r10, r12
	mov qword ptr [rsp + 240], r10
	mov qword ptr [rsp + 280], r13
	cmovae rbx, r13
	mov qword ptr [rsp + 232], rbx
	lea r10, [rdi + 8]
	sub r15, 1
	cmovb r15, r8
	mov qword ptr [rsp + 288], r15
	cmovb r10, rdi
	mov qword ptr [rsp + 8], r10
	mov rbx, qword ptr [rsp + 16]
	mov r15, rbx
	lea r8, [rsi + 8]
	mov rdi, r9
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 72], r9
	cmovae rsi, r8
	mov qword ptr [rsp + 88], rsi
	mov r10, rbx
	sub r10, 1
	cmovae rbx, r10
	mov qword ptr [rsp + 16], rbx
	lea r13, [rax + 8]
	cmovae rax, r13
	mov qword ptr [rsp + 96], rax
	cmp qword ptr [rsp + 32], 0
	je .LBB146_58
	test rbp, rbp
	je .LBB146_58
	cmp qword ptr [rsp + 80], 0
	je .LBB146_58
	test rcx, rcx
	je .LBB146_58
	test r11, r11
	je .LBB146_58
	test r14, r14
	je .LBB146_58
	test r15, r15
	je .LBB146_58
	test rdx, rdx
	je .LBB146_58
	mov rax, qword ptr [rsp + 32]
	dec rax
	movsd xmm0, qword ptr [rcx]
	movsd xmm1, qword ptr [r14]
	mov r14, rax
	mov rcx, qword ptr [rsp + 224]
	movsd xmm2, qword ptr [rcx]
	movaps xmmword ptr [rsp + 32], xmm2
	add rcx, 8
	movsd xmm2, qword ptr [rdx]
	mulsd xmm2, qword ptr [rsp + 272]
	movsd qword ptr [rsp + 296], xmm0
	movsd qword ptr [rsp + 304], xmm1
	movsd qword ptr [rsp + 312], xmm2
	movsd xmm0, qword ptr [rsp + 264]
	movsd qword ptr [rsp + 320], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 360], rax
	mov r15, qword ptr [rsp + 288]
	mov qword ptr [rsp + 368], r15
	mov qword ptr [rsp + 376], r8
	mov qword ptr [rsp + 384], rdi
	mov qword ptr [rsp + 392], r13
	mov qword ptr [rsp + 400], r10
	mov qword ptr [rsp + 224], rcx
	mov qword ptr [rsp + 408], rcx
	mov qword ptr [rsp + 416], r14
	mov r13, qword ptr [rsp + 56]
	mov qword ptr [rsp + 328], r13
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 336], rbx
	mov rbp, qword ptr [rsp + 104]
	mov qword ptr [rsp + 344], rbp
	mov qword ptr [rsp + 352], rbx
	lea rdi, [rsp + 296]
	lea rsi, [rsp + 360]
	mov rdx, qword ptr [rsp + 280]
	mov rcx, r12
	lea r8, [rsp + 328]
	call engine::force::pass_one::<f64>
	cmp r12, rbx
	mov rsi, r13
	mov r8d, 8
	cmova rsi, r8
	mov rax, r12
	mov ecx, 0
	cmova rax, rcx
	lea rcx, [8*rax]
	movabs rdx, 4611686018427387872
	and rcx, rdx
	je .LBB146_71
	lea rdi, [rcx - 32]
	xorpd xmm2, xmm2
	mov rdx, rsi
	xorpd xmm3, xmm3
	test dil, 32
	mov r9, qword ptr [rsp + 72]
	jne .LBB146_87
	movupd xmm1, xmmword ptr [rsi + 8]
	addpd xmm1, xmm2
	movsd xmm0, qword ptr [rsi + 24]
	movhpd xmm0, qword ptr [rsi]
	addpd xmm0, xmm2
	lea rdx, [rsi + 32]
	movapd xmm2, xmm1
	movapd xmm3, xmm0
.LBB146_87:
	test rdi, rdi
	je .LBB146_72
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB146_89:
	movupd xmm0, xmmword ptr [rdx + 8]
	addpd xmm2, xmm0
	movupd xmm0, xmmword ptr [rdx + 24]
	movupd xmm1, xmmword ptr [rdx + 40]
	addpd xmm1, xmm2
	movapd xmm2, xmm0
	movhpd xmm2, qword ptr [rdx]
	addpd xmm3, xmm2
	movlpd xmm0, qword ptr [rdx + 56]
	addpd xmm0, xmm3
	add rdx, 64
	movapd xmm2, xmm1
	movapd xmm3, xmm0
	cmp rdx, rdi
	jne .LBB146_89
	jmp .LBB146_72
	.p2align	4
.LBB146_71:
	xorpd xmm1, xmm1
	xorpd xmm0, xmm0
	mov r9, qword ptr [rsp + 72]
.LBB146_72:
	mov rdx, rax
	movabs rdi, 576460752303423484
	and rdx, rdi
	movapd xmm2, xmm0
	unpckhpd xmm2, xmm0
	and eax, 3
	je .LBB146_77
	addsd xmm2, qword ptr [rsi + 8*rdx]
	cmp eax, 1
	je .LBB146_77
	movapd xmm3, xmm1
	addsd xmm3, qword ptr [rsi + 8*rdx + 8]
	cmp eax, 2
	je .LBB146_76
	unpckhpd xmm1, xmm1
	addsd xmm1, qword ptr [rsi + 8*rdx + 16]
	unpcklpd xmm3, xmm1
.LBB146_76:
	movapd xmm1, xmm3
.LBB146_77:
	cmp r12, rbx
	mov rsi, rbp
	cmova rsi, r8
	test rcx, rcx
	je .LBB146_78
	lea r8, [rcx - 32]
	xorpd xmm5, xmm5
	mov rdi, rsi
	xorpd xmm6, xmm6
	test r8b, 32
	jne .LBB146_92
	movupd xmm4, xmmword ptr [rsi + 8]
	addpd xmm4, xmm5
	movsd xmm3, qword ptr [rsi + 24]
	movhpd xmm3, qword ptr [rsi]
	addpd xmm3, xmm5
	lea rdi, [rsi + 32]
	movapd xmm5, xmm4
	movapd xmm6, xmm3
.LBB146_92:
	test r8, r8
	je .LBB146_79
	add rcx, rsi
	.p2align	4
.LBB146_94:
	movupd xmm3, xmmword ptr [rdi + 8]
	addpd xmm5, xmm3
	movupd xmm3, xmmword ptr [rdi + 24]
	movupd xmm4, xmmword ptr [rdi + 40]
	addpd xmm4, xmm5
	movapd xmm5, xmm3
	movhpd xmm5, qword ptr [rdi]
	addpd xmm6, xmm5
	movlpd xmm3, qword ptr [rdi + 56]
	addpd xmm3, xmm6
	add rdi, 64
	movapd xmm5, xmm4
	movapd xmm6, xmm3
	cmp rdi, rcx
	jne .LBB146_94
.LBB146_79:
	movapd xmm5, xmm3
	unpckhpd xmm5, xmm3
	test rax, rax
	jne .LBB146_80
	jmp .LBB146_84
	.p2align	4
.LBB146_78:
	xorpd xmm4, xmm4
	xorpd xmm3, xmm3
	movapd xmm5, xmm3
	unpckhpd xmm5, xmm3
	test rax, rax
	je .LBB146_84
.LBB146_80:
	addsd xmm5, qword ptr [rsi + 8*rdx]
	cmp eax, 1
	je .LBB146_84
	movapd xmm6, xmm4
	addsd xmm6, qword ptr [rsi + 8*rdx + 8]
	cmp eax, 2
	je .LBB146_83
	unpckhpd xmm4, xmm4
	addsd xmm4, qword ptr [rsi + 8*rdx + 16]
	unpcklpd xmm6, xmm4
	jmp .LBB146_83
.LBB146_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB146_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 104]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB146_60:
	cmp qword ptr [rsp + 192], 0
	mov rbx, qword ptr [rsp + 256]
	mov r14, qword ptr [rsp + 112]
	je .LBB146_62
	mov rdi, qword ptr [rsp + 216]
	call qword ptr [rip + free@GOTPCREL]
.LBB146_62:
	cmp qword ptr [rsp + 168], 0
	je .LBB146_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB146_64:
	cmp qword ptr [rsp + 144], 0
	je .LBB146_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB146_66:
	cmp qword ptr [rsp + 120], 0
	je .LBB146_95
	mov rdi, qword ptr [rsp + 248]
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
.LBB146_95:
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
.LBB146_101:
	.cfi_def_cfa_offset 480
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB146_9:
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_99:
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_46
.LBB146_17:
	mov edi, 8
	mov rsi, rbx
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
	mov rbx, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_20
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB146_98
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r13, qword ptr [rsp + 8]
	jmp .LBB146_11
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r13, qword ptr [rsp + 8]
	je .LBB146_98
.LBB146_11:
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB146_98
	jmp .LBB146_97
	jmp .LBB146_19
.LBB146_19:
	mov rbx, rax
.LBB146_20:
	cmp qword ptr [rsp + 192], 0
	jne .LBB146_21
	cmp qword ptr [rsp + 168], 0
	jne .LBB146_23
.LBB146_24:
	cmp qword ptr [rsp + 144], 0
	jne .LBB146_25
.LBB146_26:
	cmp qword ptr [rsp + 120], 0
	jne .LBB146_27
.LBB146_98:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB146_21:
	mov rdi, qword ptr [rsp + 200]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 168], 0
	je .LBB146_24
.LBB146_23:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB146_26
.LBB146_25:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB146_98
.LBB146_27:
	mov rdi, qword ptr [rsp + 128]
.LBB146_97:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
