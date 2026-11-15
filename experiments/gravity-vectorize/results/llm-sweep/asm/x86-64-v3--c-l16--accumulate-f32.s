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
	sub rsp, 376
	.cfi_def_cfa_offset 432
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
	mov qword ptr [rsp + 64], rdi
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
	mov qword ptr [rsp + 72], rdx
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
	mov qword ptr [rsp + 32], rcx
	test rcx, rcx
	je .LBB151_4
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 192], rax
	xor r13d, r13d
	jmp .LBB151_30
	.p2align	4
.LBB151_41:
	mov rax, qword ptr [rsp + 176]
	vmovss xmm0, dword ptr [rsp]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp qword ptr [rsp + 32], r13
	je .LBB151_5
.LBB151_30:
	vmovss xmm0, dword ptr [r12 + 8*r13]
	vmovss dword ptr [rsp + 8], xmm0
	vmovss xmm0, dword ptr [r12 + 8*r13 + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 192]
	vmovss xmm0, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp], xmm0
	cmp r13, qword ptr [rsp + 96]
	jne .LBB151_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rbx, qword ptr [rsp + 104]
.LBB151_33:
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rbx + 4*r13], xmm0
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
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 136], r15
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 8], xmm1
	vucomiss xmm0, xmm2
	jne .LBB151_36
	jp .LBB151_36
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	je .LBB151_38
	jmp .LBB151_39
	.p2align	4
.LBB151_36:
	vmovss xmm0, dword ptr [rip + .LCPI151_0]
	vdivss xmm0, xmm0, dword ptr [rsp]
	vmovss dword ptr [rsp + 8], xmm0
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	jne .LBB151_39
.LBB151_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB151_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 160], rbp
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB151_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB151_41
.LBB151_4:
	mov qword ptr [rsp + 40], r13
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
	mov rdx, qword ptr [rsp + 64]
	vmovss xmm0, dword ptr [rdx]
	vmovss dword ptr [rsp + 92], xmm0
	vmovss xmm0, dword ptr [rdx + 4]
	vmovss dword ptr [rsp + 88], xmm0
	mov edx, 4
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 32], rdx
	test rcx, rcx
	mov r12, qword ptr [rsp + 72]
	mov qword ptr [rsp + 224], rax
	je .LBB151_49
	mov esi, 1
	mov rbx, qword ptr [rsp + 24]
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB151_44
	mov esi, 1
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB151_68
	mov rax, qword ptr [rsp + 224]
.LBB151_49:
	mov rsi, qword ptr [rsp + 104]
	dec r14
	add rax, 4
	mov qword ptr [rsp + 24], rax
	mov rdi, qword ptr [rsp + 40]
	mov qword ptr [rsp + 192], rdi
	mov rdx, qword ptr [rsp + 80]
	mov qword ptr [rsp + 248], rsi
	mov rdi, rsi
	.p2align	4
.LBB151_50:
	mov qword ptr [rsp + 8], r8
	mov r8, rbx
	mov qword ptr [rsp + 72], r12
	lea rsi, [r12 + 8]
	mov r12, qword ptr [rsp + 208]
	sub r12, 1
	cmovae r11, r12
	mov qword ptr [rsp + 256], r11
	mov qword ptr [rsp + 56], rsi
	cmovae rax, rsi
	mov rsi, rdi
	add rdi, 4
	mov rbx, r13
	sub rbx, 1
	cmovb rbx, r8
	cmovb rdi, qword ptr [rsp + 8]
	mov qword ptr [rsp + 8], rdi
	lea r11, [rdx + 4]
	mov rdi, r15
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 272], r9
	cmovae rcx, r11
	mov qword ptr [rsp + 264], rcx
	mov r9, rbp
	sub r9, 1
	cmovae r10, r9
	mov qword ptr [rsp + 64], r10
	mov rcx, qword ptr [rsp + 192]
	lea r10, [rcx + 4]
	mov r8, qword ptr [rsp]
	cmovae r8, r10
	mov qword ptr [rsp], r8
	cmp r14, -1
	je .LBB151_58
	cmp qword ptr [rsp + 208], 0
	je .LBB151_58
	test r13, r13
	je .LBB151_58
	test rsi, rsi
	je .LBB151_58
	test r15, r15
	je .LBB151_58
	test rdx, rdx
	je .LBB151_58
	test rbp, rbp
	je .LBB151_58
	test rcx, rcx
	je .LBB151_58
	vmovss xmm0, dword ptr [rsi]
	vmovss xmm1, dword ptr [rdx]
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [rcx]
	mov r13, qword ptr [rsp + 24]
	vbroadcastss xmm3, dword ptr [r13 - 4]
	vmovaps xmmword ptr [rsp + 208], xmm3
	vmovss dword ptr [rsp + 232], xmm0
	vmovss dword ptr [rsp + 236], xmm1
	vmovss dword ptr [rsp + 240], xmm2
	vmovss xmm0, dword ptr [rsp + 88]
	vmovss dword ptr [rsp + 244], xmm0
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 312], rcx
	mov qword ptr [rsp + 320], rbx
	mov qword ptr [rsp + 328], r11
	mov qword ptr [rsp + 336], rdi
	mov qword ptr [rsp + 344], r10
	mov qword ptr [rsp + 352], r9
	mov qword ptr [rsp + 360], r13
	mov qword ptr [rsp + 368], r14
	mov rbp, qword ptr [rsp + 48]
	mov qword ptr [rsp + 280], rbp
	mov r15, qword ptr [rsp + 16]
	mov qword ptr [rsp + 288], r15
	mov rcx, qword ptr [rsp + 32]
	mov qword ptr [rsp + 296], rcx
	mov qword ptr [rsp + 304], r15
	lea rdi, [rsp + 232]
	lea rsi, [rsp + 312]
	mov rdx, qword ptr [rsp + 56]
	mov rcx, r12
	lea r8, [rsp + 280]
	mov qword ptr [rsp + 56], rax
	call engine::force::pass_one::<f32>
	cmp r12, r15
	mov rdi, rbp
	mov eax, 4
	cmova rdi, rax
	mov ecx, 0
	cmova r12, rcx
	mov rbp, qword ptr [rsp + 32]
	cmova rbp, rax
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	vmovaps xmmword ptr [rsp + 192], xmm0
	mov rdi, rbp
	mov rsi, r12
	call engine::force::lane_sum::<f32>
	mov r8, qword ptr [rsp + 8]
	vmovaps xmm1, xmmword ptr [rsp + 192]
	vinsertps xmm0, xmm1, xmm0, 16
	vmulps xmm0, xmm0, xmmword ptr [rsp + 208]
	mov rax, qword ptr [rsp + 72]
	vmovsd xmm1, qword ptr [rax]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [rax], xmm0
	dec r14
	add r13, 4
	mov qword ptr [rsp + 24], r13
	mov r10, qword ptr [rsp + 64]
	mov rbp, r10
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 192], rax
	mov r9, qword ptr [rsp + 272]
	mov r15, r9
	mov rcx, qword ptr [rsp + 264]
	mov rdx, rcx
	mov r13, rbx
	mov rdi, r8
	mov r11, qword ptr [rsp + 256]
	mov qword ptr [rsp + 208], r11
	mov r12, qword ptr [rsp + 56]
	mov rax, r12
	jmp .LBB151_50
.LBB151_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB151_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 32]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB151_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 40]
	je .LBB151_62
	mov rdi, qword ptr [rsp + 224]
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
	mov rdi, qword ptr [rsp + 248]
	add rsp, 376
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
	.cfi_def_cfa_offset 432
	add rsp, 376
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
	.cfi_def_cfa_offset 432
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
	mov rdi, qword ptr [rsp + 48]
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
