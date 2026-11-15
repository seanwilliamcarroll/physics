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
	sub rsp, 392
	.cfi_def_cfa_offset 448
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbp, rcx
	mov r14, qword ptr [rsi + 16]
	lea r13, [4*r14]
	mov rax, r14
	shr rax, 62
	sete al
	movabs rcx, 9223372036854775805
	cmp r13, rcx
	setb cl
	test al, cl
	jne .LBB151_1
	call alloc::raw_vec::capacity_overflow
.LBB151_1:
	mov qword ptr [rsp + 56], rdi
	test r13, r13
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 24], r13
	je .LBB151_2
	mov r12, rdx
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB151_77
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB151_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB151_75
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB151_17
	mov rsi, rbx
	mov rdx, r12
	mov rbx, qword ptr [rsp]
	jmp .LBB151_3
.LBB151_2:
	mov r13d, 4
	mov ebx, 4
	mov r15d, 4
	mov eax, 4
.LBB151_3:
	mov qword ptr [rsp + 208], rbp
	mov qword ptr [rsp + 64], rdx
	mov qword ptr [rsp + 96], r14
	mov qword ptr [rsp + 104], rbx
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r14
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r14
	mov qword ptr [rsp + 152], r13
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r14
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 192], rcx
	test rcx, rcx
	je .LBB151_4
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor r13d, r13d
	jmp .LBB151_30
	.p2align	4
.LBB151_41:
	mov rax, qword ptr [rsp + 176]
	movss xmm0, dword ptr [rsp]
	movss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp qword ptr [rsp + 192], r13
	je .LBB151_5
.LBB151_30:
	movss xmm0, dword ptr [r12 + 8*r13]
	movss dword ptr [rsp + 8], xmm0
	movss xmm0, dword ptr [r12 + 8*r13 + 4]
	movss dword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 72]
	movss xmm0, dword ptr [rax + 4*r13]
	movss dword ptr [rsp], xmm0
	cmp r13, qword ptr [rsp + 96]
	jne .LBB151_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rbx, qword ptr [rsp + 104]
.LBB151_33:
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rbx + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 112], r13
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	jne .LBB151_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB151_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	movss xmm0, dword ptr [rsp + 32]
	movss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 136], r15
	xorps xmm2, xmm2
	movss xmm0, dword ptr [rsp]
	xorps xmm1, xmm1
	movss dword ptr [rsp + 8], xmm1
	ucomiss xmm0, xmm2
	jne .LBB151_36
	jp .LBB151_36
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	je .LBB151_38
	jmp .LBB151_39
	.p2align	4
.LBB151_36:
	movss xmm0, dword ptr [rip + .LCPI151_0]
	divss xmm0, dword ptr [rsp]
	movss dword ptr [rsp + 8], xmm0
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	jne .LBB151_39
.LBB151_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB151_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 32], rax
	movss xmm0, dword ptr [rsp + 8]
	movss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 160], rbp
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB151_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB151_41
.LBB151_4:
	mov qword ptr [rsp + 32], r13
	mov qword ptr [rsp + 80], r15
	xor r14d, r14d
	xor ebp, ebp
	xor r15d, r15d
	xor r13d, r13d
.LBB151_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 61
	je .LBB151_42
	xor edi, edi
.LBB151_45:
	mov rsi, qword ptr [rsp + 24]
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_42:
	mov rdx, qword ptr [rsp + 56]
	movss xmm0, dword ptr [rdx]
	movss dword ptr [rsp + 92], xmm0
	movss xmm0, dword ptr [rdx + 4]
	movss dword ptr [rsp + 88], xmm0
	mov edx, 4
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 48], rdx
	test rcx, rcx
	mov r12, qword ptr [rsp + 64]
	mov qword ptr [rsp + 232], rax
	je .LBB151_49
	mov esi, 1
	mov rbx, qword ptr [rsp + 24]
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB151_44
	mov esi, 1
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB151_68
	mov rax, qword ptr [rsp + 232]
.LBB151_49:
	mov r11, qword ptr [rsp + 104]
	dec r14
	add rax, 4
	mov qword ptr [rsp + 8], rax
	mov rax, qword ptr [rsp + 32]
	mov qword ptr [rsp + 192], rax
	mov rsi, qword ptr [rsp + 80]
	mov qword ptr [rsp + 256], r11
	.p2align	4
.LBB151_50:
	mov qword ptr [rsp + 64], r12
	lea rax, [r12 + 8]
	mov r12, qword ptr [rsp + 208]
	sub r12, 1
	cmovae r8, r12
	mov qword ptr [rsp + 288], r8
	mov qword ptr [rsp + 272], rax
	cmovae rdx, rax
	mov qword ptr [rsp + 280], rdx
	mov r8, rbx
	lea rdx, [r11 + 4]
	mov rbx, r13
	sub rbx, 1
	cmovb rbx, r8
	cmovb rdx, rdi
	lea r8, [rsi + 4]
	mov rdi, r15
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 24], r9
	cmovae rcx, r8
	mov qword ptr [rsp + 56], rcx
	mov r9, rbp
	sub r9, 1
	cmovae r10, r9
	mov qword ptr [rsp + 72], r10
	mov rax, qword ptr [rsp + 192]
	lea r10, [rax + 4]
	mov rcx, qword ptr [rsp]
	cmovae rcx, r10
	mov qword ptr [rsp], rcx
	cmp r14, -1
	je .LBB151_58
	cmp qword ptr [rsp + 208], 0
	je .LBB151_58
	test r13, r13
	je .LBB151_58
	test r11, r11
	je .LBB151_58
	test r15, r15
	je .LBB151_58
	test rsi, rsi
	je .LBB151_58
	test rbp, rbp
	je .LBB151_58
	test rax, rax
	je .LBB151_58
	movss xmm0, dword ptr [r11]
	movss xmm1, dword ptr [rsi]
	movss xmm2, dword ptr [rax]
	mulss xmm2, dword ptr [rsp + 92]
	mov rax, qword ptr [rsp + 8]
	movss xmm3, dword ptr [rax - 4]
	movaps xmmword ptr [rsp + 208], xmm3
	mov qword ptr [rsp + 8], rax
	movss dword ptr [rsp + 240], xmm0
	movss dword ptr [rsp + 244], xmm1
	movss dword ptr [rsp + 248], xmm2
	movss xmm0, dword ptr [rsp + 88]
	movss dword ptr [rsp + 252], xmm0
	mov qword ptr [rsp + 264], rdx
	mov qword ptr [rsp + 328], rdx
	mov qword ptr [rsp + 336], rbx
	mov qword ptr [rsp + 344], r8
	mov qword ptr [rsp + 352], rdi
	mov qword ptr [rsp + 360], r10
	mov qword ptr [rsp + 368], r9
	mov qword ptr [rsp + 376], rax
	mov qword ptr [rsp + 384], r14
	mov r13, qword ptr [rsp + 40]
	mov qword ptr [rsp + 296], r13
	mov r15, qword ptr [rsp + 16]
	mov qword ptr [rsp + 304], r15
	mov rbp, qword ptr [rsp + 48]
	mov qword ptr [rsp + 312], rbp
	mov qword ptr [rsp + 320], r15
	lea rdi, [rsp + 240]
	lea rsi, [rsp + 328]
	mov rdx, qword ptr [rsp + 272]
	mov rcx, r12
	lea r8, [rsp + 296]
	call engine::force::pass_one::<f32>
	cmp r12, r15
	mov rdi, r13
	mov eax, 4
	cmova rdi, rax
	mov ecx, 0
	cmova r12, rcx
	cmova rbp, rax
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	movaps xmmword ptr [rsp + 192], xmm0
	mov rdi, rbp
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	mov rdi, qword ptr [rsp + 264]
	movaps xmm1, xmmword ptr [rsp + 208]
	unpcklps xmm1, xmm1
	movaps xmm2, xmmword ptr [rsp + 192]
	unpcklps xmm2, xmm0
	mulps xmm2, xmm1
	mov rax, qword ptr [rsp + 64]
	movsd xmm0, qword ptr [rax]
	addps xmm0, xmm2
	movlps qword ptr [rax], xmm0
	dec r14
	add qword ptr [rsp + 8], 4
	mov r10, qword ptr [rsp + 72]
	mov rbp, r10
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 192], rax
	mov r9, qword ptr [rsp + 24]
	mov r15, r9
	mov rcx, qword ptr [rsp + 56]
	mov rsi, rcx
	mov r13, rbx
	mov r11, rdi
	mov r8, qword ptr [rsp + 288]
	mov qword ptr [rsp + 208], r8
	mov rdx, qword ptr [rsp + 280]
	mov r12, rdx
	jmp .LBB151_50
.LBB151_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB151_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 48]
	call rbx
	mov rdi, qword ptr [rsp + 40]
	call rbx
.LBB151_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 32]
	je .LBB151_62
	mov rdi, qword ptr [rsp + 232]
	call qword ptr [rip + free@GOTPCREL]
.LBB151_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB151_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB151_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB151_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB151_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB151_71
	mov rdi, qword ptr [rsp + 256]
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
	jmp qword ptr [rip + free@GOTPCREL]
.LBB151_71:
	.cfi_def_cfa_offset 448
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
.LBB151_77:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB151_9:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_75:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_17:
	mov edi, 4
	mov rsi, qword ptr [rsp + 24]
	call alloc::raw_vec::handle_error
	jmp .LBB151_46
.LBB151_44:
	mov edi, 4
	jmp .LBB151_45
.LBB151_68:
	mov edi, 4
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB151_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 40]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB151_20
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB151_74
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB151_11
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	mov rax, qword ptr [rsp]
	je .LBB151_74
.LBB151_11:
	mov rbx, rax
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	je .LBB151_74
	jmp .LBB151_73
	jmp .LBB151_19
.LBB151_19:
	mov r14, rax
.LBB151_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB151_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB151_23
.LBB151_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB151_25
.LBB151_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB151_27
.LBB151_74:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB151_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB151_24
.LBB151_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB151_26
.LBB151_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB151_74
.LBB151_27:
	mov rdi, qword ptr [rsp + 104]
.LBB151_73:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
