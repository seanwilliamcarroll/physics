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
	sub rsp, 472
	.cfi_def_cfa_offset 528
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
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 336], r13
	mov qword ptr [rsp + 64], rdi
	je .LBB148_2
	mov qword ptr [rsp + 8], rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB148_93
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_9
	mov rbp, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_91
	mov rbx, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_17
	mov rsi, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp]
	jmp .LBB148_3
.LBB148_2:
	mov ebx, 8
	mov r13d, 8
	mov ebp, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 176], r12
	mov qword ptr [rsp + 80], r14
	mov qword ptr [rsp + 88], r13
	mov qword ptr [rsp + 96], 0
	mov qword ptr [rsp + 104], r14
	mov qword ptr [rsp + 112], rbp
	mov qword ptr [rsp + 120], 0
	mov qword ptr [rsp + 128], r14
	mov qword ptr [rsp + 136], rbx
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 152], r14
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 168], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 24], rcx
	test rcx, rcx
	je .LBB148_4
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 368], rax
	add rbp, 8
	xor r12d, r12d
	jmp .LBB148_30
	.p2align	4
.LBB148_41:
	mov rax, qword ptr [rsp + 160]
	vmovsd xmm0, qword ptr [rsp]
	vmovsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 168], rbx
	add rbp, 16
	cmp qword ptr [rsp + 24], r12
	je .LBB148_5
.LBB148_30:
	vmovsd xmm0, qword ptr [rbp - 8]
	vmovsd qword ptr [rsp + 8], xmm0
	vmovsd xmm0, qword ptr [rbp]
	vmovsd qword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 368]
	vmovsd xmm0, qword ptr [rax + 8*r12]
	vmovsd qword ptr [rsp], xmm0
	cmp r12, qword ptr [rsp + 80]
	mov rax, r13
	jne .LBB148_33
	lea rdi, [rsp + 80]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 88]
.LBB148_33:
	mov r13, rax
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 96], r12
	mov r15, qword ptr [rsp + 120]
	cmp r15, qword ptr [rsp + 104]
	jne .LBB148_35
	lea rdi, [rsp + 104]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_35:
	mov rax, qword ptr [rsp + 112]
	mov qword ptr [rsp + 40], rax
	vmovsd xmm0, qword ptr [rsp + 48]
	vmovsd qword ptr [rax + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 120], r15
	vxorpd xmm2, xmm2, xmm2
	vmovsd xmm0, qword ptr [rsp]
	vxorpd xmm1, xmm1, xmm1
	vmovsd qword ptr [rsp + 8], xmm1
	vucomisd xmm0, xmm2
	jne .LBB148_36
	jp .LBB148_36
	mov r14, qword ptr [rsp + 144]
	cmp r14, qword ptr [rsp + 128]
	je .LBB148_38
	jmp .LBB148_39
	.p2align	4
.LBB148_36:
	vmovsd xmm0, qword ptr [rip + .LCPI148_0]
	vdivsd xmm0, xmm0, qword ptr [rsp]
	vmovsd qword ptr [rsp + 8], xmm0
	mov r14, qword ptr [rsp + 144]
	cmp r14, qword ptr [rsp + 128]
	jne .LBB148_39
.LBB148_38:
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_39:
	mov rax, qword ptr [rsp + 136]
	mov qword ptr [rsp + 48], rax
	vmovsd xmm0, qword ptr [rsp + 8]
	vmovsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 144], r14
	mov rbx, qword ptr [rsp + 168]
	cmp rbx, qword ptr [rsp + 152]
	jne .LBB148_41
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_41
.LBB148_4:
	mov qword ptr [rsp + 48], rbx
	mov qword ptr [rsp + 40], rbp
	xor r14d, r14d
	xor r15d, r15d
	xor r12d, r12d
	xor ebx, ebx
.LBB148_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 60
	je .LBB148_42
	xor edi, edi
.LBB148_45:
	mov rsi, qword ptr [rsp + 336]
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_42:
	mov rdx, qword ptr [rsp + 64]
	vmovsd xmm0, qword ptr [rdx]
	vmovsd qword ptr [rsp + 288], xmm0
	vmovsd xmm0, qword ptr [rdx + 8]
	vmovsd qword ptr [rsp + 280], xmm0
	mov edx, 8
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 24], rdx
	test rcx, rcx
	mov rbp, qword ptr [rsp + 72]
	mov qword ptr [rsp + 192], rax
	je .LBB148_49
	mov esi, 1
	mov r13, qword ptr [rsp + 336]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 32], rax
	test rax, rax
	je .LBB148_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB148_69
	mov rax, qword ptr [rsp + 192]
.LBB148_49:
	mov qword ptr [rsp], rbx
	mov rdx, qword ptr [rsp + 88]
	vbroadcastsd ymm3, qword ptr [rip + .LCPI148_2]
	vbroadcastsd ymm4, qword ptr [rip + .LCPI148_3]
	mov qword ptr [rsp + 200], rax
	mov r9, qword ptr [rsp + 40]
	vmovupd ymmword ptr [rsp + 368], ymm3
	vmovupd ymmword ptr [rsp + 336], ymm4
	jmp .LBB148_50
	.p2align	4
.LBB148_87:
	mov qword ptr [rsp], rbx
	mov esi, 8
	lea rdi, [rsp + 208]
	vzeroupper
	call engine::force::tree_sum::<f64>
	vmovddup xmm1, qword ptr [rsp + 176]
	vmovapd xmm2, xmmword ptr [rsp + 48]
	vunpcklpd xmm0, xmm2, xmm0
	vmulpd xmm0, xmm1, xmm0
	vaddpd xmm0, xmm0, xmmword ptr [r12]
	vmovupd xmmword ptr [r12], xmm0
	mov r10, qword ptr [rsp + 312]
	mov r14, r10
	mov r11, qword ptr [rsp + 304]
	mov qword ptr [rsp + 48], r11
	mov rax, qword ptr [rsp + 296]
	mov r15, rax
	mov rdi, qword ptr [rsp + 40]
	mov r9, rdi
	mov rsi, qword ptr [rsp + 8]
	mov r12, rsi
	mov rcx, r13
	mov rdx, r13
	mov r8, qword ptr [rsp + 64]
	mov qword ptr [rsp + 176], r8
	mov r13, rbp
.LBB148_50:
	mov qword ptr [rsp + 72], rbp
	lea rbx, [rbp + 16]
	mov rbp, qword ptr [rsp + 176]
	sub rbp, 1
	cmovae r8, rbp
	mov qword ptr [rsp + 64], r8
	mov qword ptr [rsp + 320], rbx
	cmovae r13, rbx
	mov qword ptr [rsp + 328], r13
	mov rbx, rdx
	lea r13, [rdx + 8]
	mov r8, r12
	sub r8, 1
	cmovb r8, rsi
	mov qword ptr [rsp + 8], r8
	cmovb r13, rcx
	mov rdx, r9
	lea rsi, [r9 + 8]
	mov rcx, r15
	sub rcx, 1
	cmovae rax, rcx
	cmovae rdi, rsi
	mov qword ptr [rsp + 40], rdi
	mov rdi, r14
	sub rdi, 1
	cmovae r10, rdi
	mov r8, qword ptr [rsp + 48]
	mov r9, r8
	lea r8, [r8 + 8]
	cmovae r11, r8
	cmp qword ptr [rsp], 0
	je .LBB148_58
	cmp qword ptr [rsp + 176], 0
	je .LBB148_58
	test r12, r12
	je .LBB148_58
	test rbx, rbx
	je .LBB148_58
	test r15, r15
	je .LBB148_58
	test rdx, rdx
	je .LBB148_58
	test r14, r14
	je .LBB148_58
	test r9, r9
	je .LBB148_58
	mov qword ptr [rsp + 296], rax
	mov qword ptr [rsp + 304], r11
	mov qword ptr [rsp + 312], r10
	mov rax, qword ptr [rsp]
	dec rax
	vmovsd xmm0, qword ptr [rbx]
	mov rbx, rax
	vmovsd xmm1, qword ptr [rdx]
	mov rax, qword ptr [rsp + 200]
	vmovsd xmm2, qword ptr [rax]
	vmovaps xmmword ptr [rsp + 176], xmm2
	add rax, 8
	vmovsd xmm2, qword ptr [rsp + 288]
	vmulsd xmm2, xmm2, qword ptr [r9]
	vmovsd qword ptr [rsp + 408], xmm0
	vmovsd qword ptr [rsp + 416], xmm1
	vmovsd qword ptr [rsp + 424], xmm2
	vmovsd xmm0, qword ptr [rsp + 280]
	vmovsd qword ptr [rsp + 432], xmm0
	mov qword ptr [rsp + 208], r13
	mov r9, qword ptr [rsp + 8]
	mov qword ptr [rsp + 216], r9
	mov qword ptr [rsp + 224], rsi
	mov qword ptr [rsp + 232], rcx
	mov qword ptr [rsp + 240], r8
	mov qword ptr [rsp + 248], rdi
	mov qword ptr [rsp + 200], rax
	mov qword ptr [rsp + 256], rax
	mov qword ptr [rsp + 264], rbx
	mov r14, qword ptr [rsp + 32]
	mov qword ptr [rsp + 440], r14
	mov r12, qword ptr [rsp + 16]
	mov qword ptr [rsp + 448], r12
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rsp + 456], rax
	mov qword ptr [rsp + 464], r12
	lea rdi, [rsp + 408]
	lea rsi, [rsp + 208]
	mov rdx, qword ptr [rsp + 320]
	mov rcx, rbp
	lea r8, [rsp + 440]
	vzeroupper
	call engine::force::pass_one::<f64>
	vmovdqu ymm7, ymmword ptr [rsp + 336]
	vpcmpeqd ymm6, ymm6, ymm6
	vmovdqu ymm5, ymmword ptr [rsp + 368]
	cmp rbp, r12
	mov rcx, r14
	mov eax, 8
	cmova rcx, rax
	mov r14, rbp
	mov eax, 0
	cmova r14, rax
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 240], ymm0
	vmovupd ymmword ptr [rsp + 208], ymm0
	lea r15, [8*r14]
	movabs rax, 4611686018427387840
	and r15, rax
	lea rax, [rcx + r15]
	test r15, r15
	je .LBB148_76
	lea rdx, [r15 - 64]
	vxorpd xmm1, xmm1, xmm1
	test dl, 64
	jne .LBB148_74
	vaddpd ymm0, ymm1, ymmword ptr [rcx]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 32]
	add rcx, 64
.LBB148_74:
	test rdx, rdx
	je .LBB148_75
	.p2align	4
.LBB148_94:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 32]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 96]
	sub rcx, -128
	cmp rcx, rax
	jne .LBB148_94
.LBB148_75:
	vmovupd ymmword ptr [rsp + 208], ymm0
	vmovupd ymmword ptr [rsp + 240], ymm1
.LBB148_76:
	and r14d, 7
	je .LBB148_79
	lea rcx, [r14 - 1]
	vmovq xmm0, rcx
	vpbroadcastq ymm0, xmm0
	lea ecx, [8*r14 + 24]
	and ecx, -32
	vpxor ymm0, ymm0, ymm5
	xor edx, edx
	vmovdqa ymm1, ymmword ptr [rip + .LCPI148_1]
	.p2align	4
.LBB148_78:
	vpxor ymm2, ymm1, ymm5
	vpcmpgtq ymm2, ymm2, ymm0
	vpxor ymm2, ymm2, ymm6
	vmaskmovpd ymm3, ymm2, ymmword ptr [rax + rdx]
	vmaskmovpd ymm4, ymm2, ymmword ptr [rsp + rdx + 208]
	vaddpd ymm3, ymm3, ymm4
	vmaskmovpd ymmword ptr [rsp + rdx + 208], ymm2, ymm3
	vpaddq ymm1, ymm1, ymm7
	add rdx, 32
	cmp rcx, rdx
	jne .LBB148_78
.LBB148_79:
	mov esi, 8
	lea rdi, [rsp + 208]
	vzeroupper
	call engine::force::tree_sum::<f64>
	cmp rbp, r12
	mov rcx, qword ptr [rsp + 24]
	mov eax, 8
	cmova rcx, rax
	vmovapd xmmword ptr [rsp + 48], xmm0
	vxorpd xmm0, xmm0, xmm0
	vmovupd ymmword ptr [rsp + 240], ymm0
	lea rax, [rcx + r15]
	vmovupd ymmword ptr [rsp + 208], ymm0
	test r15, r15
	mov r12, qword ptr [rsp + 72]
	mov rbp, qword ptr [rsp + 328]
	je .LBB148_84
	add r15, -64
	vxorpd xmm1, xmm1, xmm1
	test r15b, 64
	jne .LBB148_82
	vaddpd ymm0, ymm1, ymmword ptr [rcx]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 32]
	add rcx, 64
.LBB148_82:
	test r15, r15
	je .LBB148_83
	.p2align	4
.LBB148_95:
	vaddpd ymm0, ymm0, ymmword ptr [rcx]
	vaddpd ymm0, ymm0, ymmword ptr [rcx + 64]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 32]
	vaddpd ymm1, ymm1, ymmword ptr [rcx + 96]
	sub rcx, -128
	cmp rcx, rax
	jne .LBB148_95
.LBB148_83:
	vmovupd ymmword ptr [rsp + 208], ymm0
	vmovupd ymmword ptr [rsp + 240], ymm1
.LBB148_84:
	test r14, r14
	vmovdqu ymm5, ymmword ptr [rsp + 368]
	vpcmpeqd ymm6, ymm6, ymm6
	vmovdqu ymm7, ymmword ptr [rsp + 336]
	je .LBB148_87
	lea rcx, [r14 - 1]
	vmovq xmm0, rcx
	vpbroadcastq ymm0, xmm0
	lea ecx, [8*r14 + 24]
	and ecx, -32
	vpxor ymm0, ymm0, ymm5
	xor edx, edx
	vmovdqa ymm1, ymmword ptr [rip + .LCPI148_1]
	.p2align	4
.LBB148_86:
	vpxor ymm2, ymm1, ymm5
	vpcmpgtq ymm2, ymm2, ymm0
	vpxor ymm2, ymm2, ymm6
	vmaskmovpd ymm3, ymm2, ymmword ptr [rax + rdx]
	vmaskmovpd ymm4, ymm2, ymmword ptr [rsp + rdx + 208]
	vaddpd ymm3, ymm3, ymm4
	vmaskmovpd ymmword ptr [rsp + rdx + 208], ymm2, ymm3
	vpaddq ymm1, ymm1, ymm7
	add rdx, 32
	cmp rcx, rdx
	jne .LBB148_86
	jmp .LBB148_87
.LBB148_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB148_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 24]
	vzeroupper
	call rbx
	mov rdi, qword ptr [rsp + 32]
	call rbx
.LBB148_60:
	cmp qword ptr [rsp + 152], 0
	je .LBB148_62
	mov rdi, qword ptr [rsp + 192]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_62:
	cmp qword ptr [rsp + 128], 0
	je .LBB148_64
	mov rdi, qword ptr [rsp + 136]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_64:
	cmp qword ptr [rsp + 104], 0
	je .LBB148_66
	mov rdi, qword ptr [rsp + 112]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_66:
	cmp qword ptr [rsp + 80], 0
	je .LBB148_68
	mov rdi, qword ptr [rsp + 88]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB148_68:
	add rsp, 472
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
	vzeroupper
	ret
.LBB148_93:
	.cfi_def_cfa_offset 528
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_9:
	mov edi, 8
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB148_46
.LBB148_91:
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
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB148_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 32]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_20
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_90
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB148_11
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	mov rax, qword ptr [rsp]
	je .LBB148_90
.LBB148_11:
	mov rbx, rax
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	je .LBB148_90
	jmp .LBB148_89
	jmp .LBB148_19
.LBB148_19:
	mov r14, rax
.LBB148_20:
	cmp qword ptr [rsp + 152], 0
	jne .LBB148_21
	cmp qword ptr [rsp + 128], 0
	jne .LBB148_23
.LBB148_24:
	cmp qword ptr [rsp + 104], 0
	jne .LBB148_25
.LBB148_26:
	cmp qword ptr [rsp + 80], 0
	jne .LBB148_27
.LBB148_90:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB148_21:
	mov rdi, qword ptr [rsp + 160]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 128], 0
	je .LBB148_24
.LBB148_23:
	mov rdi, qword ptr [rsp + 136]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 104], 0
	je .LBB148_26
.LBB148_25:
	mov rdi, qword ptr [rsp + 112]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 80], 0
	je .LBB148_90
.LBB148_27:
	mov rdi, qword ptr [rsp + 88]
.LBB148_89:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
