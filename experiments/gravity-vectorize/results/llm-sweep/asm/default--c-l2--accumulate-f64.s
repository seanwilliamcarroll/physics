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
	mov r12, rcx
	mov r14, qword ptr [rsi + 16]
	lea r13, [8*r14]
	mov rax, r14
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
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 64], rdx
	mov qword ptr [rsp + 208], r12
	mov qword ptr [rsp + 56], r13
	mov qword ptr [rsp + 48], rdi
	je .LBB148_2
	mov qword ptr [rsp + 16], rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_97
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_9
	mov rbp, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_95
	mov rbx, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_17
	mov rsi, qword ptr [rsp + 16]
	mov r13, qword ptr [rsp + 8]
	jmp .LBB148_3
.LBB148_2:
	mov ebx, 8
	mov r13d, 8
	mov ebp, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 112], r14
	mov qword ptr [rsp + 120], r13
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r14
	mov qword ptr [rsp + 144], rbp
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 160], r14
	mov qword ptr [rsp + 168], rbx
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 184], r14
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 200], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 32], rcx
	test rcx, rcx
	je .LBB148_4
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 104], rax
	add rbp, 8
	xor r12d, r12d
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	mov rax, qword ptr [rsp + 192]
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 200], rbx
	add rbp, 16
	cmp qword ptr [rsp + 32], r12
	je .LBB148_5
.LBB148_30:
	movsd xmm0, qword ptr [rbp - 8]
	movsd qword ptr [rsp + 16], xmm0
	movsd xmm0, qword ptr [rbp]
	movsd qword ptr [rsp + 80], xmm0
	mov rax, qword ptr [rsp + 104]
	movsd xmm0, qword ptr [rax + 8*r12]
	movsd qword ptr [rsp + 8], xmm0
	cmp r12, qword ptr [rsp + 112]
	mov rax, r13
	jne .LBB148_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB148_33:
	mov r13, rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 128], r12
	mov r15, qword ptr [rsp + 152]
	cmp r15, qword ptr [rsp + 136]
	jne .LBB148_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 72], rax
	movsd xmm0, qword ptr [rsp + 80]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 152], r15
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp + 8]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 16], xmm1
	ucomisd xmm0, xmm2
	jne .LBB148_36
	jp .LBB148_36
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	movsd xmm0, qword ptr [rip + .LCPI148_0]
	divsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rsp + 16], xmm0
	mov r14, qword ptr [rsp + 176]
	cmp r14, qword ptr [rsp + 160]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 80], rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 176], r14
	mov rbx, qword ptr [rsp + 200]
	cmp rbx, qword ptr [rsp + 184]
	jne .LBB148_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 80], rbx
	mov qword ptr [rsp + 72], rbp
	xor r14d, r14d
	xor r15d, r15d
	xor r12d, r12d
	xor ebx, ebx
.LBB148_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 60
	je .LBB148_42
	xor edi, edi
.LBB148_45:
	mov rsi, qword ptr [rsp + 56]
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rdx, qword ptr [rsp + 48]
	movsd xmm0, qword ptr [rdx]
	movsd qword ptr [rsp + 320], xmm0
	movsd xmm0, qword ptr [rdx + 8]
	movsd qword ptr [rsp + 312], xmm0
	mov edx, 8
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 32], rdx
	test rcx, rcx
	mov r13, qword ptr [rsp + 64]
	mov qword ptr [rsp + 232], rax
	je .LBB148_49
	mov esi, 1
	mov rbp, qword ptr [rsp + 56]
	mov rdi, rbp
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB148_44
	mov esi, 1
	mov rdi, rbp
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB148_69
	mov rax, qword ptr [rsp + 232]
.LBB148_49:
	mov rdx, qword ptr [rsp + 120]
	mov qword ptr [rsp + 48], rax
	mov r9, qword ptr [rsp + 72]
	jmp .LBB148_50
	.p2align	4
.LBB148_91:
	mov esi, 2
	lea rdi, [rsp + 240]
	call engine::force::tree_sum::<f64>
	movapd xmm1, xmmword ptr [rsp + 208]
	unpcklpd xmm1, xmm1
	movapd xmm2, xmmword ptr [rsp + 80]
	unpcklpd xmm2, xmm0
	mulpd xmm2, xmm1
	movupd xmm0, xmmword ptr [r13]
	addpd xmm0, xmm2
	movupd xmmword ptr [r13], xmm0
	mov r10, qword ptr [rsp + 344]
	mov r14, r10
	mov r11, qword ptr [rsp + 336]
	mov qword ptr [rsp + 80], r11
	mov rax, qword ptr [rsp + 328]
	mov r15, rax
	mov rdi, qword ptr [rsp + 72]
	mov r9, rdi
	mov r12, rbp
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	mov rsi, qword ptr [rsp + 104]
	mov qword ptr [rsp + 208], rsi
	mov r8, qword ptr [rsp + 56]
	mov r13, r8
.LBB148_50:
	mov qword ptr [rsp + 64], r13
	lea rbp, [r13 + 16]
	mov r13, qword ptr [rsp + 208]
	sub r13, 1
	cmovae rsi, r13
	mov qword ptr [rsp + 104], rsi
	mov qword ptr [rsp + 352], rbp
	cmovae r8, rbp
	mov qword ptr [rsp + 56], r8
	mov rsi, qword ptr [rsp + 8]
	mov rbp, rdx
	lea r8, [rdx + 8]
	mov rdx, r12
	sub rdx, 1
	cmovb rdx, rsi
	mov qword ptr [rsp + 8], rdx
	cmovb r8, rcx
	mov qword ptr [rsp + 16], r8
	mov rdx, r9
	lea rsi, [r9 + 8]
	mov rcx, r15
	sub rcx, 1
	cmovae rax, rcx
	cmovae rdi, rsi
	mov qword ptr [rsp + 72], rdi
	mov rdi, r14
	sub rdi, 1
	cmovae r10, rdi
	mov r8, qword ptr [rsp + 80]
	mov r9, r8
	lea r8, [r8 + 8]
	cmovae r11, r8
	test rbx, rbx
	je .LBB148_58
	cmp qword ptr [rsp + 208], 0
	je .LBB148_58
	test r12, r12
	je .LBB148_58
	test rbp, rbp
	je .LBB148_58
	test r15, r15
	je .LBB148_58
	test rdx, rdx
	je .LBB148_58
	test r14, r14
	je .LBB148_58
	test r9, r9
	je .LBB148_58
	mov qword ptr [rsp + 328], rax
	mov qword ptr [rsp + 336], r11
	mov qword ptr [rsp + 344], r10
	dec rbx
	movsd xmm0, qword ptr [rbp]
	movsd xmm1, qword ptr [rdx]
	mov rax, qword ptr [rsp + 48]
	movsd xmm2, qword ptr [rax]
	movaps xmmword ptr [rsp + 208], xmm2
	add rax, 8
	movsd xmm2, qword ptr [r9]
	mulsd xmm2, qword ptr [rsp + 320]
	movsd qword ptr [rsp + 360], xmm0
	movsd qword ptr [rsp + 368], xmm1
	movsd qword ptr [rsp + 376], xmm2
	movsd xmm0, qword ptr [rsp + 312]
	movsd qword ptr [rsp + 384], xmm0
	mov r9, qword ptr [rsp + 16]
	mov qword ptr [rsp + 240], r9
	mov rbp, qword ptr [rsp + 8]
	mov qword ptr [rsp + 248], rbp
	mov qword ptr [rsp + 256], rsi
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 272], r8
	mov qword ptr [rsp + 280], rdi
	mov qword ptr [rsp + 48], rax
	mov qword ptr [rsp + 288], rax
	mov qword ptr [rsp + 296], rbx
	mov r15, qword ptr [rsp + 40]
	mov qword ptr [rsp + 392], r15
	mov r14, qword ptr [rsp + 24]
	mov qword ptr [rsp + 400], r14
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 408], rax
	mov qword ptr [rsp + 416], r14
	lea rdi, [rsp + 360]
	lea rsi, [rsp + 240]
	mov rdx, qword ptr [rsp + 352]
	mov rcx, r13
	lea r8, [rsp + 392]
	call engine::force::pass_one::<f64>
	cmp r13, r14
	mov rax, r15
	mov ecx, 8
	cmova rax, rcx
	mov r14, r13
	mov ecx, 0
	cmova r14, rcx
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 240], xmm0
	lea r15, [8*r14]
	movabs rcx, 4611686018427387888
	and r15, rcx
	je .LBB148_72
	lea rdx, [r15 - 16]
	mov esi, edx
	shr esi, 4
	inc esi
	mov rcx, rax
	and esi, 3
	je .LBB148_75
	.p2align	4
.LBB148_74:
	movupd xmm1, xmmword ptr [rcx]
	addpd xmm0, xmm1
	add rcx, 16
	dec rsi
	jne .LBB148_74
.LBB148_75:
	cmp rdx, 48
	jb .LBB148_78
	lea rdx, [rax + r15]
	.p2align	4
.LBB148_77:
	movupd xmm1, xmmword ptr [rcx]
	addpd xmm0, xmm1
	movupd xmm1, xmmword ptr [rcx + 16]
	addpd xmm1, xmm0
	movupd xmm2, xmmword ptr [rcx + 32]
	addpd xmm2, xmm1
	movupd xmm0, xmmword ptr [rcx + 48]
	addpd xmm0, xmm2
	add rcx, 64
	cmp rcx, rdx
	jne .LBB148_77
.LBB148_78:
	movapd xmmword ptr [rsp + 240], xmm0
	jmp .LBB148_79
	.p2align	4
.LBB148_72:
	xorpd xmm0, xmm0
.LBB148_79:
	mov r12, r14
	movabs rcx, 576460752303423486
	and r12, rcx
	test r14b, 1
	je .LBB148_81
	addsd xmm0, qword ptr [rax + 8*r12]
	movsd qword ptr [rsp + 240], xmm0
.LBB148_81:
	mov esi, 2
	lea rdi, [rsp + 240]
	call engine::force::tree_sum::<f64>
	cmp r13, qword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 32]
	mov ecx, 8
	cmova rax, rcx
	movapd xmmword ptr [rsp + 80], xmm0
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 240], xmm0
	test r15, r15
	je .LBB148_82
	lea rdx, [r15 - 16]
	mov esi, edx
	shr esi, 4
	inc esi
	and esi, 3
	mov r13, qword ptr [rsp + 64]
	mov rcx, rax
	je .LBB148_85
	.p2align	4
.LBB148_84:
	movupd xmm1, xmmword ptr [rcx]
	addpd xmm0, xmm1
	add rcx, 16
	dec rsi
	jne .LBB148_84
.LBB148_85:
	cmp rdx, 48
	jb .LBB148_88
	add r15, rax
	.p2align	4
.LBB148_87:
	movupd xmm1, xmmword ptr [rcx]
	addpd xmm0, xmm1
	movupd xmm1, xmmword ptr [rcx + 16]
	addpd xmm1, xmm0
	movupd xmm2, xmmword ptr [rcx + 32]
	addpd xmm2, xmm1
	movupd xmm0, xmmword ptr [rcx + 48]
	addpd xmm0, xmm2
	add rcx, 64
	cmp rcx, r15
	jne .LBB148_87
.LBB148_88:
	movapd xmmword ptr [rsp + 240], xmm0
	test r14b, 1
	je .LBB148_91
	jmp .LBB148_90
	.p2align	4
.LBB148_82:
	xorpd xmm0, xmm0
	mov r13, qword ptr [rsp + 64]
	test r14b, 1
	je .LBB148_91
.LBB148_90:
	addsd xmm0, qword ptr [rax + 8*r12]
	movsd qword ptr [rsp + 240], xmm0
	jmp .LBB148_91
.LBB148_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 40]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 184], 0
	je .LBB148_62
	mov rdi, qword ptr [rsp + 232]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 168]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 144]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 120]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_68:
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
.LBB148_97:
	.cfi_def_cfa_offset 480
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_95:
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
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 40]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_20
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB148_94
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB148_11
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rax, qword ptr [rsp + 8]
	je .LBB148_94
.LBB148_11:
	mov rbx, rax
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB148_94
	jmp .LBB148_93
	jmp .LBB148_19
.LBB148_19:
	mov r14, rax
.LBB148_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB148_27
.LBB148_94:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 192]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 160], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 168]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 136], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 144]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB148_94
.LBB148_27:
	mov rdi, qword ptr [rsp + 120]
.LBB148_93:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
