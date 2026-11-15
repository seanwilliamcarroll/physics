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
	mov rbp, qword ptr [rsi + 16]
	lea r13, [8*rbp]
	mov rax, rbp
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
	mov qword ptr [rsp + 32], rbp
	mov qword ptr [rsp + 240], rdi
	je .LBB148_2
	mov qword ptr [rsp + 16], rsi
	mov r14, rdx
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_101
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_99
	mov r12, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_17
	mov rdx, r14
	mov rcx, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 16]
	jmp .LBB148_3
.LBB148_2:
	mov r12d, 8
	mov ecx, 8
	mov r15d, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 24], r13
	mov qword ptr [rsp + 272], rdx
	mov qword ptr [rsp + 280], rbx
	mov qword ptr [rsp + 144], rbp
	mov qword ptr [rsp + 152], rcx
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], rbp
	mov qword ptr [rsp + 176], r15
	mov qword ptr [rsp + 184], 0
	mov qword ptr [rsp + 192], rbp
	mov qword ptr [rsp + 200], r12
	mov qword ptr [rsp + 208], 0
	mov qword ptr [rsp + 216], rbp
	mov qword ptr [rsp + 224], rax
	mov qword ptr [rsp + 232], 0
	mov r14, qword ptr [rsi + 64]
	cmp r14, rbp
	cmovae r14, rbp
	test r14, r14
	je .LBB148_4
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 40], rax
	add r12, 8
	xor ebx, ebx
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	mov qword ptr [rsp + 16], rbx
	mov rax, qword ptr [rsp + 224]
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 232], r15
	add r12, 16
	mov rbx, r13
	cmp r14, r13
	mov rcx, rbp
	je .LBB148_5
.LBB148_30:
	movsd xmm0, qword ptr [r12 - 8]
	movsd qword ptr [rsp + 16], xmm0
	movsd xmm0, qword ptr [r12]
	movsd qword ptr [rsp + 112], xmm0
	mov rax, qword ptr [rsp + 40]
	movsd xmm0, qword ptr [rax + 8*rbx]
	movsd qword ptr [rsp + 8], xmm0
	cmp rbx, qword ptr [rsp + 144]
	jne .LBB148_33
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rcx, qword ptr [rsp + 152]
.LBB148_33:
	mov rbp, rcx
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rcx + 8*rbx], xmm0
	inc rbx
	mov r13, rbx
	mov qword ptr [rsp + 160], rbx
	mov rax, qword ptr [rsp + 184]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 168]
	jne .LBB148_35
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	mov rax, qword ptr [rsp + 176]
	mov qword ptr [rsp + 136], rax
	movsd xmm0, qword ptr [rsp + 112]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 112], rbx
	mov qword ptr [rsp + 184], rbx
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp + 8]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 16], xmm1
	ucomisd xmm0, xmm2
	jne .LBB148_36
	jp .LBB148_36
	mov rbx, qword ptr [rsp + 208]
	cmp rbx, qword ptr [rsp + 192]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	movsd xmm0, qword ptr [rip + .LCPI148_0]
	divsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rsp + 16], xmm0
	mov rbx, qword ptr [rsp + 208]
	cmp rbx, qword ptr [rsp + 192]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 192]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	mov rax, qword ptr [rsp + 200]
	mov qword ptr [rsp + 128], rax
	movsd xmm0, qword ptr [rsp + 16]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 208], rbx
	mov r15, qword ptr [rsp + 232]
	cmp r15, qword ptr [rsp + 216]
	jne .LBB148_41
	lea rdi, [rsp + 216]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 128], r12
	mov qword ptr [rsp + 136], r15
	mov qword ptr [rsp + 16], 0
	mov qword ptr [rsp + 112], 0
	xor ebx, ebx
	xor r15d, r15d
.LBB148_5:
	mov rdx, qword ptr [rsp + 32]
	mov rcx, rdx
	shr rcx, 60
	je .LBB148_42
	xor edi, edi
	mov r12, qword ptr [rsp + 24]
.LBB148_45:
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rcx, qword ptr [rsp + 240]
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rsp + 320], xmm0
	movsd xmm0, qword ptr [rcx + 8]
	movsd qword ptr [rsp + 312], xmm0
	mov ecx, 8
	mov qword ptr [rsp + 120], rcx
	mov qword ptr [rsp + 40], rcx
	test rdx, rdx
	mov r12, qword ptr [rsp + 24]
	je .LBB148_49
	mov r14, rax
	mov esi, 1
	mov rdi, r12
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 120], rax
	test rax, rax
	je .LBB148_44
	mov esi, 1
	mov rdi, r12
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB148_69
	mov rax, r14
.LBB148_49:
	mov qword ptr [rsp + 24], r15
	mov rcx, qword ptr [rsp + 152]
	mov qword ptr [rsp + 8], rcx
	mov qword ptr [rsp + 304], rax
	mov qword ptr [rsp + 264], rax
	jmp .LBB148_50
	.p2align	4
.LBB148_95:
	mov qword ptr [rsp + 24], r15
	mov esi, 8
	lea rdi, [rsp + 48]
	call engine::force::tree_sum::<f64>
	movapd xmm1, xmmword ptr [rsp + 240]
	unpcklpd xmm1, xmm1
	movapd xmm2, xmmword ptr [rsp + 288]
	unpcklpd xmm2, xmm0
	mulpd xmm2, xmm1
	mov rax, qword ptr [rsp + 328]
	movupd xmm0, xmmword ptr [rax]
	addpd xmm0, xmm2
	movupd xmmword ptr [rax], xmm0
.LBB148_50:
	mov r14, qword ptr [rsp + 272]
	mov r10, qword ptr [rsp + 280]
	mov r12, r10
	mov rdi, qword ptr [rsp + 8]
	mov rcx, rdi
	mov qword ptr [rsp + 240], rbx
	mov rsi, qword ptr [rsp + 136]
	mov r11, rsi
	mov r9, qword ptr [rsp + 112]
	mov r13, rbx
	mov rbx, r9
	mov rax, qword ptr [rsp + 128]
	mov rdx, rax
	mov r8, r13
	mov qword ptr [rsp + 328], r14
	lea r15, [r14 + 16]
	mov rbp, r10
	sub rbp, 1
	cmovae r10, rbp
	mov qword ptr [rsp + 280], r10
	mov qword ptr [rsp + 288], r15
	cmovae r14, r15
	mov qword ptr [rsp + 272], r14
	lea r10, [rdi + 8]
	sub r13, 1
	cmovb r13, r8
	mov qword ptr [rsp + 336], r13
	cmovb r10, rdi
	mov qword ptr [rsp + 8], r10
	mov r14, qword ptr [rsp + 16]
	mov r13, r14
	lea r8, [rsi + 8]
	mov rdi, r9
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 112], r9
	cmovae rsi, r8
	mov qword ptr [rsp + 136], rsi
	mov r10, r14
	sub r10, 1
	cmovae r14, r10
	mov qword ptr [rsp + 16], r14
	lea r14, [rax + 8]
	cmovae rax, r14
	mov qword ptr [rsp + 128], rax
	mov r15, qword ptr [rsp + 24]
	test r15, r15
	je .LBB148_58
	test r12, r12
	je .LBB148_58
	cmp qword ptr [rsp + 240], 0
	je .LBB148_58
	test rcx, rcx
	je .LBB148_58
	test rbx, rbx
	je .LBB148_58
	test r11, r11
	je .LBB148_58
	test r13, r13
	je .LBB148_58
	test rdx, rdx
	je .LBB148_58
	dec r15
	movsd xmm0, qword ptr [rcx]
	movsd xmm1, qword ptr [r11]
	mov rcx, qword ptr [rsp + 264]
	movsd xmm2, qword ptr [rcx]
	movaps xmmword ptr [rsp + 240], xmm2
	add rcx, 8
	movsd xmm2, qword ptr [rdx]
	mulsd xmm2, qword ptr [rsp + 320]
	movsd qword ptr [rsp + 344], xmm0
	movsd qword ptr [rsp + 352], xmm1
	movsd qword ptr [rsp + 360], xmm2
	movsd xmm0, qword ptr [rsp + 312]
	movsd qword ptr [rsp + 368], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 48], rax
	mov rbx, qword ptr [rsp + 336]
	mov qword ptr [rsp + 56], rbx
	mov qword ptr [rsp + 64], r8
	mov qword ptr [rsp + 72], rdi
	mov qword ptr [rsp + 80], r14
	mov qword ptr [rsp + 88], r10
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 96], rcx
	mov qword ptr [rsp + 104], r15
	mov r14, qword ptr [rsp + 120]
	mov qword ptr [rsp + 376], r14
	mov r13, qword ptr [rsp + 32]
	mov qword ptr [rsp + 384], r13
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 392], rax
	mov qword ptr [rsp + 400], r13
	lea rdi, [rsp + 344]
	lea rsi, [rsp + 48]
	mov rdx, qword ptr [rsp + 288]
	mov rcx, rbp
	lea r8, [rsp + 376]
	call engine::force::pass_one::<f64>
	cmp rbp, r13
	mov rax, r14
	mov ecx, 8
	cmova rax, rcx
	mov r12, rbp
	mov ecx, 0
	cmova r12, rcx
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 96], xmm0
	movapd xmmword ptr [rsp + 80], xmm0
	movapd xmmword ptr [rsp + 64], xmm0
	movapd xmmword ptr [rsp + 48], xmm0
	lea r14, [8*r12]
	movabs rcx, 4611686018427387840
	and r14, rcx
	je .LBB148_75
	lea rcx, [rax + r14]
	mov rdx, rax
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
	xorpd xmm3, xmm3
	.p2align	4
.LBB148_73:
	movupd xmm4, xmmword ptr [rdx]
	addpd xmm0, xmm4
	movupd xmm4, xmmword ptr [rdx + 16]
	addpd xmm1, xmm4
	movupd xmm4, xmmword ptr [rdx + 32]
	addpd xmm2, xmm4
	movupd xmm4, xmmword ptr [rdx + 48]
	addpd xmm3, xmm4
	add rdx, 64
	cmp rdx, rcx
	jne .LBB148_73
	movapd xmmword ptr [rsp + 48], xmm0
	movapd xmmword ptr [rsp + 64], xmm1
	movapd xmmword ptr [rsp + 80], xmm2
	movapd xmmword ptr [rsp + 96], xmm3
.LBB148_75:
	mov rdx, r12
	movabs rcx, 576460752303423480
	and rdx, rcx
	and r12d, 7
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx]
	addsd xmm0, qword ptr [rsp + 48]
	movsd qword ptr [rsp + 48], xmm0
	cmp r12d, 1
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 8]
	addsd xmm0, qword ptr [rsp + 56]
	movsd qword ptr [rsp + 56], xmm0
	cmp r12d, 2
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 16]
	addsd xmm0, qword ptr [rsp + 64]
	movsd qword ptr [rsp + 64], xmm0
	cmp r12d, 3
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 24]
	addsd xmm0, qword ptr [rsp + 72]
	movsd qword ptr [rsp + 72], xmm0
	cmp r12d, 4
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 32]
	addsd xmm0, qword ptr [rsp + 80]
	movsd qword ptr [rsp + 80], xmm0
	cmp r12d, 5
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 40]
	addsd xmm0, qword ptr [rsp + 88]
	movsd qword ptr [rsp + 88], xmm0
	cmp r12d, 6
	je .LBB148_83
	movsd xmm0, qword ptr [rax + 8*rdx + 48]
	addsd xmm0, qword ptr [rsp + 96]
	movsd qword ptr [rsp + 96], xmm0
	.p2align	4
.LBB148_83:
	mov qword ptr [rsp + 24], rdx
	mov esi, 8
	lea rdi, [rsp + 48]
	call engine::force::tree_sum::<f64>
	movapd xmmword ptr [rsp + 288], xmm0
	cmp rbp, r13
	mov rax, qword ptr [rsp + 40]
	mov ecx, 8
	cmova rax, rcx
	xorpd xmm0, xmm0
	movapd xmmword ptr [rsp + 96], xmm0
	movapd xmmword ptr [rsp + 80], xmm0
	movapd xmmword ptr [rsp + 64], xmm0
	movapd xmmword ptr [rsp + 48], xmm0
	test r14, r14
	je .LBB148_87
	add r14, rax
	mov rcx, rax
	xorpd xmm1, xmm1
	xorpd xmm2, xmm2
	xorpd xmm3, xmm3
	.p2align	4
.LBB148_85:
	movupd xmm4, xmmword ptr [rcx]
	addpd xmm0, xmm4
	movupd xmm4, xmmword ptr [rcx + 16]
	addpd xmm1, xmm4
	movupd xmm4, xmmword ptr [rcx + 32]
	addpd xmm2, xmm4
	movupd xmm4, xmmword ptr [rcx + 48]
	addpd xmm3, xmm4
	add rcx, 64
	cmp rcx, r14
	jne .LBB148_85
	movapd xmmword ptr [rsp + 48], xmm0
	movapd xmmword ptr [rsp + 64], xmm1
	movapd xmmword ptr [rsp + 80], xmm2
	movapd xmmword ptr [rsp + 96], xmm3
.LBB148_87:
	test r12, r12
	mov rcx, qword ptr [rsp + 24]
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx]
	addsd xmm0, qword ptr [rsp + 48]
	movsd qword ptr [rsp + 48], xmm0
	cmp r12d, 1
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 8]
	addsd xmm0, qword ptr [rsp + 56]
	movsd qword ptr [rsp + 56], xmm0
	cmp r12d, 2
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 16]
	addsd xmm0, qword ptr [rsp + 64]
	movsd qword ptr [rsp + 64], xmm0
	cmp r12d, 3
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 24]
	addsd xmm0, qword ptr [rsp + 72]
	movsd qword ptr [rsp + 72], xmm0
	cmp r12d, 4
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 32]
	addsd xmm0, qword ptr [rsp + 80]
	movsd qword ptr [rsp + 80], xmm0
	cmp r12d, 5
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 40]
	addsd xmm0, qword ptr [rsp + 88]
	movsd qword ptr [rsp + 88], xmm0
	cmp r12d, 6
	je .LBB148_95
	movsd xmm0, qword ptr [rax + 8*rcx + 48]
	addsd xmm0, qword ptr [rsp + 96]
	movsd qword ptr [rsp + 96], xmm0
	jmp .LBB148_95
.LBB148_58:
	cmp qword ptr [rsp + 32], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	call rbx
	mov rdi, qword ptr [rsp + 120]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 216], 0
	je .LBB148_62
	mov rdi, qword ptr [rsp + 304]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_62:
	cmp qword ptr [rsp + 192], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 200]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_64:
	cmp qword ptr [rsp + 168], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_66:
	cmp qword ptr [rsp + 144], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 152]
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
.LBB148_101:
	.cfi_def_cfa_offset 464
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_99:
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
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 120]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_20
	mov rbx, rax
	cmp qword ptr [rsp + 32], 0
	je .LBB148_98
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	mov rbp, qword ptr [rsp + 8]
	jmp .LBB148_11
	mov rbx, rax
	cmp qword ptr [rsp + 32], 0
	mov rbp, qword ptr [rsp + 8]
	je .LBB148_98
.LBB148_11:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 32], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB148_98
	jmp .LBB148_97
	jmp .LBB148_19
.LBB148_19:
	mov rbx, rax
.LBB148_20:
	cmp qword ptr [rsp + 216], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 192], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 168], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 144], 0
	jne .LBB148_27
.LBB148_98:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 224]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 192], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 200]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 168], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB148_98
.LBB148_27:
	mov rdi, qword ptr [rsp + 152]
.LBB148_97:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
