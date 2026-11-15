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
	movabs rax, 4611686018427387872
	mov r12, qword ptr [rsi + 16]
	lea rbx, [4*r12]
	add rax, 31
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
	je .LBB149_101
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_9
	mov r13, rax
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_99
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
	mov qword ptr [rsp + 168], r12
	mov qword ptr [rsp + 176], rcx
	mov qword ptr [rsp + 184], 0
	mov qword ptr [rsp + 192], r12
	mov qword ptr [rsp + 200], r13
	mov qword ptr [rsp + 208], 0
	mov qword ptr [rsp + 216], r12
	mov qword ptr [rsp + 224], rbp
	mov qword ptr [rsp + 232], 0
	mov qword ptr [rsp + 240], r12
	mov qword ptr [rsp + 248], rax
	mov qword ptr [rsp + 256], 0
	mov r12, qword ptr [rsi + 64]
	cmp r12, rdx
	cmovae r12, rdx
	test r12, r12
	je .LBB149_4
	mov rbp, rcx
	mov r13, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 144], rax
	xor r15d, r15d
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	mov rax, qword ptr [rsp + 248]
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 256], r14
	cmp r12, r15
	je .LBB149_5
.LBB149_30:
	movss xmm0, dword ptr [r13 + 8*r15]
	movss dword ptr [rsp + 16], xmm0
	movss xmm0, dword ptr [r13 + 8*r15 + 4]
	movss dword ptr [rsp + 56], xmm0
	mov rax, qword ptr [rsp + 144]
	movss xmm0, dword ptr [rax + 4*r15]
	movss dword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 168]
	mov rax, rbp
	jne .LBB149_33
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 176]
.LBB149_33:
	mov rbp, rax
	movss xmm0, dword ptr [rsp + 16]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 184], r15
	mov rax, qword ptr [rsp + 208]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 192]
	jne .LBB149_35
	lea rdi, [rsp + 192]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_35:
	mov rax, qword ptr [rsp + 200]
	mov qword ptr [rsp + 48], rax
	mov rcx, rbx
	movss xmm0, dword ptr [rsp + 56]
	movss dword ptr [rax + 4*rbx], xmm0
	inc rcx
	mov rbx, rcx
	mov qword ptr [rsp + 208], rcx
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp + 8]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 16], xmm1
	ucomiss xmm0, xmm2
	jne .LBB149_36
	jp .LBB149_36
	mov rax, qword ptr [rsp + 232]
	mov r14, rax
	cmp rax, qword ptr [rsp + 216]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	movss xmm0, dword ptr [rip + .LCPI149_0]
	divss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rsp + 16], xmm0
	mov rax, qword ptr [rsp + 232]
	mov r14, rax
	cmp rax, qword ptr [rsp + 216]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 216]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	mov rax, qword ptr [rsp + 224]
	mov qword ptr [rsp + 152], rax
	movss xmm0, dword ptr [rsp + 16]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 232], r14
	mov r14, qword ptr [rsp + 256]
	cmp r14, qword ptr [rsp + 240]
	jne .LBB149_41
	lea rdi, [rsp + 240]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 48], r13
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
	movss dword ptr [rsp + 164], xmm0
	movss xmm0, dword ptr [rcx + 4]
	movss dword ptr [rsp + 160], xmm0
	mov ecx, 4
	mov qword ptr [rsp + 136], rcx
	mov qword ptr [rsp + 32], rcx
	test rdx, rdx
	mov rdx, qword ptr [rsp + 48]
	mov r12, qword ptr [rsp + 152]
	je .LBB149_49
	mov qword ptr [rsp + 48], rdx
	mov r13, rax
	mov esi, 1
	mov rbp, qword ptr [rsp + 40]
	mov rdi, rbp
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 136], rax
	test rax, rax
	je .LBB149_44
	mov esi, 1
	mov rdi, rbp
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB149_69
	mov rax, r13
	mov rdx, qword ptr [rsp + 48]
.LBB149_49:
	mov qword ptr [rsp + 56], r14
	mov rcx, qword ptr [rsp + 176]
	mov qword ptr [rsp + 352], rax
	mov qword ptr [rsp + 264], rax
	mov qword ptr [rsp + 144], r12
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 344], rcx
	mov qword ptr [rsp + 8], rcx
	mov r12, rbx
	jmp .LBB149_50
	.p2align	4
.LBB149_95:
	mov esi, 8
	lea rdi, [rsp + 64]
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
	mov r14, rsi
	mov r9, r12
	mov rax, qword ptr [rsp + 144]
	mov rdx, rax
	mov r8, r15
	mov qword ptr [rsp + 360], rbx
	lea r11, [rbx + 8]
	mov rbp, r10
	sub rbp, 1
	cmovae r10, rbp
	mov qword ptr [rsp + 280], r10
	mov qword ptr [rsp + 304], r11
	cmovae rbx, r11
	mov qword ptr [rsp + 272], rbx
	lea r10, [rdi + 4]
	sub r15, 1
	cmovb r15, r8
	cmovb r10, rdi
	mov qword ptr [rsp + 8], r10
	mov rbx, qword ptr [rsp + 16]
	mov r11, rbx
	lea r8, [rsi + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r12, rdi
	mov qword ptr [rsp + 368], r12
	cmovae rsi, r8
	mov qword ptr [rsp + 40], rsi
	mov r10, rbx
	sub r10, 1
	cmovae rbx, r10
	mov qword ptr [rsp + 16], rbx
	lea r12, [rax + 4]
	cmovae rax, r12
	mov qword ptr [rsp + 144], rax
	cmp qword ptr [rsp + 56], 0
	je .LBB149_58
	test r13, r13
	je .LBB149_58
	cmp qword ptr [rsp + 320], 0
	je .LBB149_58
	test rcx, rcx
	je .LBB149_58
	test r9, r9
	je .LBB149_58
	test r14, r14
	je .LBB149_58
	test r11, r11
	je .LBB149_58
	test rdx, rdx
	je .LBB149_58
	mov rax, qword ptr [rsp + 56]
	dec rax
	movss xmm0, dword ptr [rcx]
	movss xmm1, dword ptr [r14]
	mov rsi, rax
	mov rcx, qword ptr [rsp + 264]
	movss xmm2, dword ptr [rcx]
	movaps xmmword ptr [rsp + 320], xmm2
	add rcx, 4
	movss xmm2, dword ptr [rdx]
	mulss xmm2, dword ptr [rsp + 164]
	movss dword ptr [rsp + 288], xmm0
	movss dword ptr [rsp + 292], xmm1
	movss dword ptr [rsp + 296], xmm2
	movss xmm0, dword ptr [rsp + 160]
	movss dword ptr [rsp + 300], xmm0
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 64], rax
	mov qword ptr [rsp + 72], r15
	mov qword ptr [rsp + 80], r8
	mov qword ptr [rsp + 88], rdi
	mov qword ptr [rsp + 96], r12
	mov qword ptr [rsp + 104], r10
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp + 112], rcx
	mov qword ptr [rsp + 56], rsi
	mov qword ptr [rsp + 120], rsi
	mov r12, qword ptr [rsp + 136]
	mov qword ptr [rsp + 376], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 384], rbx
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 392], rax
	mov qword ptr [rsp + 400], rbx
	lea rdi, [rsp + 288]
	lea rsi, [rsp + 64]
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
	movaps xmmword ptr [rsp + 80], xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	lea r12, [4*r13]
	movabs rcx, 4611686018427387872
	and r12, rcx
	je .LBB149_75
	lea rcx, [rax + r12]
	mov rdx, rax
	xorps xmm1, xmm1
	.p2align	4
.LBB149_73:
	movups xmm2, xmmword ptr [rdx]
	addps xmm0, xmm2
	movups xmm2, xmmword ptr [rdx + 16]
	addps xmm1, xmm2
	add rdx, 32
	cmp rdx, rcx
	jne .LBB149_73
	movaps xmmword ptr [rsp + 64], xmm0
	movaps xmmword ptr [rsp + 80], xmm1
.LBB149_75:
	mov r14, r13
	movabs rcx, 1152921504606846968
	and r14, rcx
	and r13d, 7
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14]
	addss xmm0, dword ptr [rsp + 64]
	movss dword ptr [rsp + 64], xmm0
	cmp r13d, 1
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 4]
	addss xmm0, dword ptr [rsp + 68]
	movss dword ptr [rsp + 68], xmm0
	cmp r13d, 2
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 8]
	addss xmm0, dword ptr [rsp + 72]
	movss dword ptr [rsp + 72], xmm0
	cmp r13d, 3
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 12]
	addss xmm0, dword ptr [rsp + 76]
	movss dword ptr [rsp + 76], xmm0
	cmp r13d, 4
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 16]
	addss xmm0, dword ptr [rsp + 80]
	movss dword ptr [rsp + 80], xmm0
	cmp r13d, 5
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 20]
	addss xmm0, dword ptr [rsp + 84]
	movss dword ptr [rsp + 84], xmm0
	cmp r13d, 6
	je .LBB149_83
	movss xmm0, dword ptr [rax + 4*r14 + 24]
	addss xmm0, dword ptr [rsp + 88]
	movss dword ptr [rsp + 88], xmm0
	.p2align	4
.LBB149_83:
	mov esi, 8
	lea rdi, [rsp + 64]
	call engine::force::tree_sum::<f32>
	cmp rbp, rbx
	mov rax, qword ptr [rsp + 32]
	mov ecx, 4
	cmova rax, rcx
	movaps xmmword ptr [rsp + 304], xmm0
	xorps xmm0, xmm0
	movaps xmmword ptr [rsp + 80], xmm0
	movaps xmmword ptr [rsp + 64], xmm0
	test r12, r12
	je .LBB149_87
	add r12, rax
	mov rcx, rax
	xorps xmm1, xmm1
	.p2align	4
.LBB149_85:
	movups xmm2, xmmword ptr [rcx]
	addps xmm0, xmm2
	movups xmm2, xmmword ptr [rcx + 16]
	addps xmm1, xmm2
	add rcx, 32
	cmp rcx, r12
	jne .LBB149_85
	movaps xmmword ptr [rsp + 64], xmm0
	movaps xmmword ptr [rsp + 80], xmm1
.LBB149_87:
	test r13, r13
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14]
	addss xmm0, dword ptr [rsp + 64]
	movss dword ptr [rsp + 64], xmm0
	cmp r13d, 1
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 4]
	addss xmm0, dword ptr [rsp + 68]
	movss dword ptr [rsp + 68], xmm0
	cmp r13d, 2
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 8]
	addss xmm0, dword ptr [rsp + 72]
	movss dword ptr [rsp + 72], xmm0
	cmp r13d, 3
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 12]
	addss xmm0, dword ptr [rsp + 76]
	movss dword ptr [rsp + 76], xmm0
	cmp r13d, 4
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 16]
	addss xmm0, dword ptr [rsp + 80]
	movss dword ptr [rsp + 80], xmm0
	cmp r13d, 5
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 20]
	addss xmm0, dword ptr [rsp + 84]
	movss dword ptr [rsp + 84], xmm0
	cmp r13d, 6
	je .LBB149_95
	movss xmm0, dword ptr [rax + 4*r14 + 24]
	addss xmm0, dword ptr [rsp + 88]
	movss dword ptr [rsp + 88], xmm0
	jmp .LBB149_95
.LBB149_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 136]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 240], 0
	mov rbx, qword ptr [rsp + 48]
	mov r14, qword ptr [rsp + 152]
	je .LBB149_62
	mov rdi, qword ptr [rsp + 352]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_62:
	cmp qword ptr [rsp + 216], 0
	je .LBB149_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB149_64:
	cmp qword ptr [rsp + 192], 0
	je .LBB149_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB149_66:
	cmp qword ptr [rsp + 168], 0
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
.LBB149_101:
	.cfi_def_cfa_offset 464
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_99:
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
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 136]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_20
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB149_98
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r12, qword ptr [rsp + 8]
	jmp .LBB149_11
	mov rbx, rax
	cmp qword ptr [rsp + 24], 0
	mov r12, qword ptr [rsp + 8]
	je .LBB149_98
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
	je .LBB149_98
	jmp .LBB149_97
	jmp .LBB149_19
.LBB149_19:
	mov rbx, rax
.LBB149_20:
	cmp qword ptr [rsp + 240], 0
	jne .LBB149_21
	cmp qword ptr [rsp + 216], 0
	jne .LBB149_23
.LBB149_24:
	cmp qword ptr [rsp + 192], 0
	jne .LBB149_25
.LBB149_26:
	cmp qword ptr [rsp + 168], 0
	jne .LBB149_27
.LBB149_98:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB149_21:
	mov rdi, qword ptr [rsp + 248]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 216], 0
	je .LBB149_24
.LBB149_23:
	mov rdi, qword ptr [rsp + 224]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 192], 0
	je .LBB149_26
.LBB149_25:
	mov rdi, qword ptr [rsp + 200]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 168], 0
	je .LBB149_98
.LBB149_27:
	mov rdi, qword ptr [rsp + 176]
.LBB149_97:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
