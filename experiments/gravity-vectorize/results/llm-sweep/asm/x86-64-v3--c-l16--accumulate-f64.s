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
	jne .LBB150_1
	call alloc::raw_vec::capacity_overflow
.LBB150_1:
	mov qword ptr [rsp + 72], rdi
	test r13, r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r13
	je .LBB150_2
	mov r12, rdx
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB150_77
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB150_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB150_75
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB150_17
	mov rsi, rbx
	mov rdx, r12
	mov rbx, qword ptr [rsp + 8]
	jmp .LBB150_3
.LBB150_2:
	mov r13d, 8
	mov ebx, 8
	mov r15d, 8
	mov eax, 8
.LBB150_3:
	mov qword ptr [rsp + 208], rbp
	mov qword ptr [rsp + 80], rdx
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
	mov qword ptr [rsp + 40], rcx
	test rcx, rcx
	je .LBB150_4
	mov r12, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 192], rax
	add r12, 8
	xor r13d, r13d
	jmp .LBB150_30
	.p2align	4
.LBB150_41:
	mov rax, qword ptr [rsp + 176]
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	add r12, 16
	cmp qword ptr [rsp + 40], r13
	je .LBB150_5
.LBB150_30:
	vmovsd xmm0, qword ptr [r12 - 8]
	vmovsd qword ptr [rsp + 16], xmm0
	vmovsd xmm0, qword ptr [r12]
	vmovsd qword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 192]
	vmovsd xmm0, qword ptr [rax + 8*r13]
	vmovsd qword ptr [rsp + 8], xmm0
	cmp r13, qword ptr [rsp + 96]
	jne .LBB150_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rbx, qword ptr [rsp + 104]
.LBB150_33:
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rbx + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 112], r13
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	jne .LBB150_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB150_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 88], rax
	vmovsd xmm0, qword ptr [rsp + 48]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 136], r15
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp + 8]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 16], xmm1
	vucomisd xmm0, xmm2
	jne .LBB150_36
	jp .LBB150_36
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	je .LBB150_38
	jmp .LBB150_39
	.p2align	4
.LBB150_36:
	vmovsd xmm0, qword ptr [rip + .LCPI150_0]
	vdivsd xmm0, xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rsp + 16], xmm0
	mov rbp, qword ptr [rsp + 160]
	cmp rbp, qword ptr [rsp + 144]
	jne .LBB150_39
.LBB150_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB150_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 48], rax
	vmovsd xmm0, qword ptr [rsp + 16]
	vmovsd qword ptr [rax + 8*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 160], rbp
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB150_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB150_41
.LBB150_4:
	mov qword ptr [rsp + 48], r13
	mov qword ptr [rsp + 88], r15
	xor ebp, ebp
	xor r15d, r15d
	xor r13d, r13d
	xor r14d, r14d
.LBB150_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 60
	je .LBB150_42
	xor edi, edi
.LBB150_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB150_46
.LBB150_42:
	mov rdx, qword ptr [rsp + 72]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd qword ptr [rsp + 248], xmm0
	vmovsd xmm0, qword ptr [rdx + 8]
	vmovsd qword ptr [rsp + 240], xmm0
	mov edx, 8
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 40], rdx
	test rcx, rcx
	mov r12, qword ptr [rsp + 80]
	mov qword ptr [rsp + 224], rax
	je .LBB150_49
	mov esi, 1
	mov rbx, qword ptr [rsp + 32]
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB150_44
	mov esi, 1
	mov rdi, rbx
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 40], rax
	test rax, rax
	je .LBB150_68
	mov rax, qword ptr [rsp + 224]
.LBB150_49:
	mov rsi, qword ptr [rsp + 104]
	dec r14
	add rax, 8
	mov qword ptr [rsp + 32], rax
	mov rdi, qword ptr [rsp + 48]
	mov qword ptr [rsp + 192], rdi
	mov rdx, qword ptr [rsp + 88]
	mov qword ptr [rsp + 232], rsi
	mov rdi, rsi
	.p2align	4
.LBB150_50:
	mov qword ptr [rsp + 16], r8
	mov r8, rbx
	mov qword ptr [rsp + 80], r12
	lea rsi, [r12 + 16]
	mov r12, qword ptr [rsp + 208]
	sub r12, 1
	cmovae r11, r12
	mov qword ptr [rsp + 256], r11
	mov qword ptr [rsp + 64], rsi
	cmovae rax, rsi
	mov rsi, rdi
	add rdi, 8
	mov rbx, r13
	sub rbx, 1
	cmovb rbx, r8
	cmovb rdi, qword ptr [rsp + 16]
	mov qword ptr [rsp + 16], rdi
	lea r11, [rdx + 8]
	mov rdi, r15
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 272], r9
	cmovae rcx, r11
	mov qword ptr [rsp + 264], rcx
	mov r9, rbp
	sub r9, 1
	cmovae r10, r9
	mov qword ptr [rsp + 72], r10
	mov rcx, qword ptr [rsp + 192]
	lea r10, [rcx + 8]
	mov r8, qword ptr [rsp + 8]
	cmovae r8, r10
	mov qword ptr [rsp + 8], r8
	cmp r14, -1
	je .LBB150_58
	cmp qword ptr [rsp + 208], 0
	je .LBB150_58
	test r13, r13
	je .LBB150_58
	test rsi, rsi
	je .LBB150_58
	test r15, r15
	je .LBB150_58
	test rdx, rdx
	je .LBB150_58
	test rbp, rbp
	je .LBB150_58
	test rcx, rcx
	je .LBB150_58
	vmovsd xmm0, qword ptr [rsi]
	vmovsd xmm1, qword ptr [rdx]
	vmovsd xmm2, qword ptr [rsp + 248]
	vmulsd xmm2, xmm2, qword ptr [rcx]
	mov r13, qword ptr [rsp + 32]
	vmovddup xmm3, qword ptr [r13 - 8]
	vmovaps xmmword ptr [rsp + 208], xmm3
	vmovsd qword ptr [rsp + 280], xmm0
	vmovsd qword ptr [rsp + 288], xmm1
	vmovsd qword ptr [rsp + 296], xmm2
	vmovsd xmm0, qword ptr [rsp + 240]
	vmovsd qword ptr [rsp + 304], xmm0
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rsp + 344], rcx
	mov qword ptr [rsp + 352], rbx
	mov qword ptr [rsp + 360], r11
	mov qword ptr [rsp + 368], rdi
	mov qword ptr [rsp + 376], r10
	mov qword ptr [rsp + 384], r9
	mov qword ptr [rsp + 392], r13
	mov qword ptr [rsp + 400], r14
	mov rbp, qword ptr [rsp + 56]
	mov qword ptr [rsp + 312], rbp
	mov r15, qword ptr [rsp + 24]
	mov qword ptr [rsp + 320], r15
	mov rcx, qword ptr [rsp + 40]
	mov qword ptr [rsp + 328], rcx
	mov qword ptr [rsp + 336], r15
	lea rdi, [rsp + 280]
	lea rsi, [rsp + 344]
	mov rdx, qword ptr [rsp + 64]
	mov rcx, r12
	lea r8, [rsp + 312]
	mov qword ptr [rsp + 64], rax
	call engine::force::pass_one::<f64>
	cmp r12, r15
	mov rdi, rbp
	mov eax, 8
	cmova rdi, rax
	mov ecx, 0
	cmova r12, rcx
	mov rbp, qword ptr [rsp + 40]
	cmova rbp, rax
	mov rsi, r12
	call engine::force::lane_sum::<f64>
	vmovapd xmmword ptr [rsp + 192], xmm0
	mov rdi, rbp
	mov rsi, r12
	call engine::force::lane_sum::<f64>
	mov r8, qword ptr [rsp + 16]
	vmovapd xmm1, xmmword ptr [rsp + 192]
	vunpcklpd xmm0, xmm1, xmm0
	vmulpd xmm0, xmm0, xmmword ptr [rsp + 208]
	mov rax, qword ptr [rsp + 80]
	vaddpd xmm0, xmm0, xmmword ptr [rax]
	vmovupd xmmword ptr [rax], xmm0
	dec r14
	add r13, 8
	mov qword ptr [rsp + 32], r13
	mov r10, qword ptr [rsp + 72]
	mov rbp, r10
	mov rax, qword ptr [rsp + 8]
	mov qword ptr [rsp + 192], rax
	mov r9, qword ptr [rsp + 272]
	mov r15, r9
	mov rcx, qword ptr [rsp + 264]
	mov rdx, rcx
	mov r13, rbx
	mov rdi, r8
	mov r11, qword ptr [rsp + 256]
	mov qword ptr [rsp + 208], r11
	mov r12, qword ptr [rsp + 64]
	mov rax, r12
	jmp .LBB150_50
.LBB150_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB150_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 40]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB150_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 88]
	mov r14, qword ptr [rsp + 48]
	je .LBB150_62
	mov rdi, qword ptr [rsp + 224]
	call qword ptr [rip + free@GOTPCREL]
.LBB150_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB150_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB150_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB150_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB150_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB150_71
	mov rdi, qword ptr [rsp + 232]
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
.LBB150_71:
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
.LBB150_77:
	.cfi_def_cfa_offset 464
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB150_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB150_46
.LBB150_75:
	mov edi, 8
	call alloc::raw_vec::handle_error
	jmp .LBB150_46
.LBB150_17:
	mov edi, 8
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB150_46
.LBB150_44:
	mov edi, 8
	jmp .LBB150_45
.LBB150_68:
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB150_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB150_20
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB150_74
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB150_11
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rax, qword ptr [rsp + 8]
	je .LBB150_74
.LBB150_11:
	mov rbx, rax
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	je .LBB150_74
	jmp .LBB150_73
	jmp .LBB150_19
.LBB150_19:
	mov r14, rax
.LBB150_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB150_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB150_23
.LBB150_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB150_25
.LBB150_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB150_27
.LBB150_74:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB150_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB150_24
.LBB150_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB150_26
.LBB150_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB150_74
.LBB150_27:
	mov rdi, qword ptr [rsp + 104]
.LBB150_73:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
