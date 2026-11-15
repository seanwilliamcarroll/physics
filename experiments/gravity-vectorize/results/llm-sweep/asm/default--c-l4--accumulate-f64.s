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
	mov r13, rcx
	mov r15, qword ptr [rsi + 16]
	lea r12, [8*r15]
	mov rax, r15
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp r12, rcx
	setb cl
	test al, cl
	jne .LBB148_1
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	test r12, r12
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 16], r12
	mov qword ptr [rsp + 240], rdi
	je .LBB148_2
	mov qword ptr [rsp + 8], rsi
	mov rbx, rdx
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB148_99
	mov r14, r15
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_9
	mov r15, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_97
	mov rbp, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_17
	mov rdx, rbx
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB148_3
.LBB148_2:
	mov r14, r15
	mov ebp, 8
	mov ecx, 8
	mov r15d, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 264], rdx
	mov qword ptr [rsp + 72], r14
	mov qword ptr [rsp + 80], rcx
	mov qword ptr [rsp + 88], 0
	mov qword ptr [rsp + 96], r14
	mov qword ptr [rsp + 104], r15
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r14
	mov qword ptr [rsp + 128], rbp
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 216], r14
	mov qword ptr [rsp + 224], rax
	mov qword ptr [rsp + 232], 0
	mov r12, qword ptr [rsi + 64]
	cmp r12, r14
	cmovae r12, r14
	test r12, r12
	je .LBB148_4
	mov r14, rcx
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 32], rax
	add rbp, 8
	xor ebx, ebx
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	mov rax, qword ptr [rsp + 224]
	movsd xmm0, qword ptr [rsp]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 232], r15
	add rbp, 16
	cmp r12, rbx
	je .LBB148_5
.LBB148_30:
	movsd xmm0, qword ptr [rbp - 8]
	movsd qword ptr [rsp + 8], xmm0
	movsd xmm0, qword ptr [rbp]
	movsd qword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 32]
	movsd xmm0, qword ptr [rax + 8*rbx]
	movsd qword ptr [rsp], xmm0
	cmp rbx, qword ptr [rsp + 72]
	jne .LBB148_33
	lea rdi, [rsp + 72]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov r14, qword ptr [rsp + 80]
.LBB148_33:
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [r14 + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 88], rbx
	mov rax, qword ptr [rsp + 112]
	mov r15, rax
	cmp rax, qword ptr [rsp + 96]
	jne .LBB148_35
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 64], rax
	movsd xmm0, qword ptr [rsp + 40]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 40], r15
	mov qword ptr [rsp + 112], r15
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 8], xmm1
	ucomisd xmm0, xmm2
	jne .LBB148_36
	jp .LBB148_36
	mov rax, qword ptr [rsp + 136]
	mov r15, rax
	cmp rax, qword ptr [rsp + 120]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	movsd xmm0, qword ptr [rip + .LCPI148_0]
	divsd xmm0, qword ptr [rsp]
	movsd qword ptr [rsp + 8], xmm0
	mov rax, qword ptr [rsp + 136]
	mov r15, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 56], rax
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 8], r15
	mov qword ptr [rsp + 136], r15
	mov r15, qword ptr [rsp + 232]
	cmp r15, qword ptr [rsp + 216]
	jne .LBB148_41
	lea rdi, [rsp + 216]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 56], rbp
	mov qword ptr [rsp + 64], r15
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 40], 0
	xor ebx, ebx
	xor r15d, r15d
.LBB148_5:
	mov rdx, qword ptr [rsp + 24]
	mov rcx, rdx
	shr rcx, 60
	je .LBB148_42
	xor edi, edi
	mov r12, qword ptr [rsp + 16]
.LBB148_45:
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rcx, qword ptr [rsp + 240]
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rsp + 312], xmm0
	movsd xmm0, qword ptr [rcx + 8]
	movsd qword ptr [rsp + 304], xmm0
	mov ecx, 8
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 32], rcx
	test rdx, rdx
	mov r12, qword ptr [rsp + 16]
	je .LBB148_49
	mov r14, rax
	mov esi, 1
	mov rdi, r12
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB148_44
	mov esi, 1
	mov rdi, r12
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB148_69
	mov rax, r14
.LBB148_49:
	mov qword ptr [rsp + 16], r15
	mov rcx, qword ptr [rsp + 80]
	mov qword ptr [rsp], rcx
	mov qword ptr [rsp + 296], rax
	mov qword ptr [rsp + 256], rax
	jmp .LBB148_50
	.p2align	4
.LBB148_93:
	mov qword ptr [rsp + 16], r15
	mov esi, 4
	lea rdi, [rsp + 144]
	call engine::force::tree_sum::<f64>
	movapd xmm1, xmmword ptr [rsp + 240]
	unpcklpd xmm1, xmm1
	movapd xmm2, xmmword ptr [rsp + 272]
	unpcklpd xmm2, xmm0
	mulpd xmm2, xmm1
	mov rax, qword ptr [rsp + 320]
	movupd xmm0, xmmword ptr [rax]
	addpd xmm0, xmm2
	movupd xmmword ptr [rax], xmm0
.LBB148_50:
	mov r10, qword ptr [rsp + 264]
	mov rbp, r13
	mov rdi, qword ptr [rsp]
	mov rcx, rdi
	mov qword ptr [rsp + 240], rbx
	mov r12, qword ptr [rsp + 64]
	mov rsi, r12
	mov r9, qword ptr [rsp + 40]
	mov rdx, r9
	mov rax, qword ptr [rsp + 56]
	mov r11, rax
	mov r8, rbx
	mov qword ptr [rsp + 320], r10
	lea r15, [r10 + 16]
	mov r14, r13
	sub r14, 1
	cmovae r13, r14
	mov qword ptr [rsp + 336], r13
	mov qword ptr [rsp + 272], r15
	cmovae r10, r15
	mov qword ptr [rsp + 264], r10
	lea r10, [rdi + 8]
	sub rbx, 1
	cmovb rbx, r8
	mov qword ptr [rsp + 328], rbx
	cmovb r10, rdi
	mov qword ptr [rsp], r10
	mov r13, qword ptr [rsp + 8]
	mov rbx, r13
	lea r8, [r12 + 8]
	mov rdi, r9
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 40], r9
	cmovae r12, r8
	mov qword ptr [rsp + 64], r12
	mov r10, r13
	sub r10, 1
	cmovae r13, r10
	mov qword ptr [rsp + 8], r13
	lea r12, [rax + 8]
	cmovae rax, r12
	mov qword ptr [rsp + 56], rax
	mov r15, qword ptr [rsp + 16]
	test r15, r15
	je .LBB148_58
	test rbp, rbp
	je .LBB148_58
	cmp qword ptr [rsp + 240], 0
	je .LBB148_58
	test rcx, rcx
	je .LBB148_58
	test rdx, rdx
	je .LBB148_58
	test rsi, rsi
	je .LBB148_58
	test rbx, rbx
	je .LBB148_58
	test r11, r11
	je .LBB148_58
	dec r15
	movsd xmm0, qword ptr [rcx]
	movsd xmm1, qword ptr [rsi]
	mov rcx, qword ptr [rsp + 256]
	movsd xmm2, qword ptr [rcx]
	movaps xmmword ptr [rsp + 240], xmm2
	add rcx, 8
	movsd xmm2, qword ptr [r11]
	mulsd xmm2, qword ptr [rsp + 312]
	movsd qword ptr [rsp + 344], xmm0
	movsd qword ptr [rsp + 352], xmm1
	movsd qword ptr [rsp + 360], xmm2
	movsd xmm0, qword ptr [rsp + 304]
	movsd qword ptr [rsp + 368], xmm0
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 144], rax
	mov rbx, qword ptr [rsp + 328]
	mov qword ptr [rsp + 152], rbx
	mov qword ptr [rsp + 160], r8
	mov qword ptr [rsp + 168], rdi
	mov qword ptr [rsp + 176], r12
	mov qword ptr [rsp + 184], r10
	mov qword ptr [rsp + 256], rcx
	mov qword ptr [rsp + 192], rcx
	mov qword ptr [rsp + 200], r15
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 376], r12
	mov r13, qword ptr [rsp + 24]
	mov qword ptr [rsp + 384], r13
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 392], rax
	mov qword ptr [rsp + 400], r13
	lea rdi, [rsp + 344]
	lea rsi, [rsp + 144]
	mov rdx, qword ptr [rsp + 272]
	mov rcx, r14
	lea r8, [rsp + 376]
	call engine::force::pass_one::<f64>
	cmp r14, r13
	mov rax, r12
	mov ecx, 8
	cmova rax, rcx
	mov rbp, r14
	mov ecx, 0
	cmova rbp, rcx
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 160], xmm0
	movapd xmmword ptr [rsp + 144], xmm0
	lea r12, [8*rbp]
	movabs rcx, 4611686018427387872
	and r12, rcx
	je .LBB148_78
	lea rdx, [r12 - 32]
	xorpd xmm1, xmm1
	mov rcx, rax
	xorpd xmm3, xmm3
	test dl, 32
	jne .LBB148_74
	movupd xmm0, xmmword ptr [rax]
	movupd xmm2, xmmword ptr [rax + 16]
	addpd xmm0, xmm1
	addpd xmm2, xmm1
	lea rcx, [rax + 32]
	movapd xmm1, xmm0
	movapd xmm3, xmm2
.LBB148_74:
	test rdx, rdx
	je .LBB148_77
	lea rdx, [rax + r12]
	.p2align	4
.LBB148_76:
	movupd xmm0, xmmword ptr [rcx]
	addpd xmm1, xmm0
	movupd xmm0, xmmword ptr [rcx + 16]
	addpd xmm3, xmm0
	movupd xmm0, xmmword ptr [rcx + 32]
	addpd xmm0, xmm1
	movupd xmm2, xmmword ptr [rcx + 48]
	addpd xmm2, xmm3
	add rcx, 64
	movapd xmm1, xmm0
	movapd xmm3, xmm2
	cmp rcx, rdx
	jne .LBB148_76
.LBB148_77:
	movapd xmmword ptr [rsp + 144], xmm0
	movapd xmmword ptr [rsp + 160], xmm2
.LBB148_78:
	mov rdx, rbp
	movabs rcx, 576460752303423484
	and rdx, rcx
	and ebp, 3
	je .LBB148_82
	movsd xmm0, qword ptr [rax + 8*rdx]
	addsd xmm0, qword ptr [rsp + 144]
	movsd qword ptr [rsp + 144], xmm0
	cmp ebp, 1
	je .LBB148_82
	movsd xmm0, qword ptr [rax + 8*rdx + 8]
	addsd xmm0, qword ptr [rsp + 152]
	movsd qword ptr [rsp + 152], xmm0
	cmp ebp, 2
	je .LBB148_82
	movsd xmm0, qword ptr [rax + 8*rdx + 16]
	addsd xmm0, qword ptr [rsp + 160]
	movsd qword ptr [rsp + 160], xmm0
	.p2align	4
.LBB148_82:
	mov qword ptr [rsp + 16], rdx
	mov esi, 4
	lea rdi, [rsp + 144]
	call engine::force::tree_sum::<f64>
	cmp r14, r13
	mov rax, qword ptr [rsp + 32]
	mov ecx, 8
	cmova rax, rcx
	movapd xmmword ptr [rsp + 272], xmm0
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 160], xmm0
	movapd xmmword ptr [rsp + 144], xmm0
	test r12, r12
	mov r13, qword ptr [rsp + 336]
	je .LBB148_89
	lea rdx, [r12 - 32]
	xorpd xmm1, xmm1
	mov rcx, rax
	xorpd xmm3, xmm3
	test dl, 32
	jne .LBB148_85
	movupd xmm0, xmmword ptr [rax]
	movupd xmm2, xmmword ptr [rax + 16]
	addpd xmm0, xmm1
	addpd xmm2, xmm1
	lea rcx, [rax + 32]
	movapd xmm1, xmm0
	movapd xmm3, xmm2
.LBB148_85:
	test rdx, rdx
	je .LBB148_88
	add r12, rax
	.p2align	4
.LBB148_87:
	movupd xmm0, xmmword ptr [rcx]
	addpd xmm1, xmm0
	movupd xmm0, xmmword ptr [rcx + 16]
	addpd xmm3, xmm0
	movupd xmm0, xmmword ptr [rcx + 32]
	addpd xmm0, xmm1
	movupd xmm2, xmmword ptr [rcx + 48]
	addpd xmm2, xmm3
	add rcx, 64
	movapd xmm1, xmm0
	movapd xmm3, xmm2
	cmp rcx, r12
	jne .LBB148_87
.LBB148_88:
	movapd xmmword ptr [rsp + 144], xmm0
	movapd xmmword ptr [rsp + 160], xmm2
.LBB148_89:
	test rbp, rbp
	mov rcx, qword ptr [rsp + 16]
	je .LBB148_93
	movsd xmm0, qword ptr [rax + 8*rcx]
	addsd xmm0, qword ptr [rsp + 144]
	movsd qword ptr [rsp + 144], xmm0
	cmp ebp, 1
	je .LBB148_93
	movsd xmm0, qword ptr [rax + 8*rcx + 8]
	addsd xmm0, qword ptr [rsp + 152]
	movsd qword ptr [rsp + 152], xmm0
	cmp ebp, 2
	je .LBB148_93
	movsd xmm0, qword ptr [rax + 8*rcx + 16]
	addsd xmm0, qword ptr [rsp + 160]
	movsd qword ptr [rsp + 160], xmm0
	jmp .LBB148_93
.LBB148_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 216], 0
	je .LBB148_62
	mov rdi, qword ptr [rsp + 296]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_62:
	cmp qword ptr [rsp + 120], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_64:
	cmp qword ptr [rsp + 96], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 104]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_66:
	cmp qword ptr [rsp + 72], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 80]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_68:
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
.LBB148_99:
	.cfi_def_cfa_offset 464
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_97:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_17:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_44:
	mov edi, 8
	jmp .LBB148_45
.LBB148_69:
	mov edi, 8
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 48]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_20
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB148_96
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r14, qword ptr [rsp]
	jmp .LBB148_11
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r14, qword ptr [rsp]
	je .LBB148_96
.LBB148_11:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp]
	je .LBB148_96
	jmp .LBB148_95
	jmp .LBB148_19
.LBB148_19:
	mov rbx, rax
.LBB148_20:
	cmp qword ptr [rsp + 216], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 120], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 96], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 72], 0
	jne .LBB148_27
.LBB148_96:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 224]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 104]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 72], 0
	je .LBB148_96
.LBB148_27:
	mov rdi, qword ptr [rsp + 80]
.LBB148_95:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
