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
	mov rbx, rcx
	movabs rax, 4611686018427387888
	mov r13, qword ptr [rsi + 16]
	lea r12, [4*r13]
	add rax, 15
	cmp r13, rax
	setbe al
	movabs rcx, 9223372036854775805
	cmp r12, rcx
	setb cl
	test al, cl
	jne .LBB147_1
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	test r12, r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], rdi
	je .LBB147_2
	mov qword ptr [rsp + 8], rsi
	mov r14, rdx
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB147_101
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_9
	mov r15, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_99
	mov rbp, rax
	mov rdi, r12
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_17
	mov rdx, r14
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB147_3
.LBB147_2:
	mov ebp, 4
	mov ecx, 4
	mov r15d, 4
	mov eax, 4
.LBB147_3:
	mov qword ptr [rsp + 32], r12
	mov qword ptr [rsp + 64], rbx
	mov qword ptr [rsp + 216], rdx
	mov rdx, r13
	mov qword ptr [rsp + 96], r13
	mov qword ptr [rsp + 104], rcx
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r13
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r13
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov r13, qword ptr [rsi + 64]
	cmp r13, rdx
	cmovae r13, rdx
	test r13, r13
	je .LBB147_4
	mov r12, rcx
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor r15d, r15d
	jmp .LBB147_30
	.p2align	4
.LBB147_41:
	mov rax, qword ptr [rsp + 176]
	vmovss xmm0, dword ptr [rsp]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp r13, r15
	je .LBB147_5
.LBB147_30:
	vmovss xmm0, dword ptr [rbp + 8*r15]
	vmovss dword ptr [rsp + 8], xmm0
	vmovss xmm0, dword ptr [rbp + 8*r15 + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 72]
	vmovss xmm0, dword ptr [rax + 4*r15]
	vmovss dword ptr [rsp], xmm0
	cmp r15, qword ptr [rsp + 96]
	mov rax, r12
	jne .LBB147_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB147_33:
	mov r12, rax
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsp + 112], r15
	mov rax, qword ptr [rsp + 136]
	mov rbx, rax
	cmp rax, qword ptr [rsp + 120]
	jne .LBB147_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	mov rcx, rbx
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rcx
	mov rbx, rcx
	mov qword ptr [rsp + 136], rcx
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 8], xmm1
	vucomiss xmm0, xmm2
	jne .LBB147_36
	jp .LBB147_36
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	je .LBB147_38
	jmp .LBB147_39
	.p2align	4
.LBB147_36:
	vmovss xmm0, dword ptr [rip + .LCPI147_0]
	vdivss xmm0, xmm0, dword ptr [rsp]
	vmovss dword ptr [rsp + 8], xmm0
	mov rax, qword ptr [rsp + 160]
	mov r14, rax
	cmp rax, qword ptr [rsp + 144]
	jne .LBB147_39
.LBB147_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 8], r14
	mov qword ptr [rsp + 160], r14
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB147_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_41
.LBB147_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 80], r15
	mov qword ptr [rsp + 8], 0
	xor r14d, r14d
	xor ebx, ebx
	xor r15d, r15d
.LBB147_5:
	mov rdx, qword ptr [rsp + 16]
	mov rcx, rdx
	shr rcx, 61
	je .LBB147_42
	xor edi, edi
.LBB147_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_42:
	mov rcx, qword ptr [rsp + 24]
	vmovss xmm0, dword ptr [rcx]
	vmovss dword ptr [rsp + 92], xmm0
	vmovss xmm0, dword ptr [rcx + 4]
	vmovss dword ptr [rsp + 88], xmm0
	mov ecx, 4
	mov qword ptr [rsp + 48], rcx
	mov qword ptr [rsp + 24], rcx
	test rdx, rdx
	mov rbp, qword ptr [rsp + 40]
	mov qword ptr [rsp + 192], rax
	je .LBB147_49
	mov esi, 1
	mov r13, qword ptr [rsp + 32]
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB147_44
	mov esi, 1
	mov rdi, r13
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB147_68
	mov rax, qword ptr [rsp + 192]
.LBB147_49:
	mov rcx, qword ptr [rsp + 104]
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 72], rbp
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rsp + 240], rcx
	mov qword ptr [rsp], rcx
	mov r12, qword ptr [rsp + 64]
	jmp .LBB147_50
	.p2align	4
.LBB147_85:
	vmovaps xmm7, xmm4
.LBB147_94:
	mov rax, qword ptr [rsp + 56]
	vaddss xmm6, xmm6, xmm7
	vaddss xmm2, xmm2, xmm3
	vshufps xmm0, xmm0, xmm0, 255
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufps xmm1, xmm4, xmm4, 255
	vaddss xmm1, xmm1, xmm5
	vaddss xmm1, xmm1, xmm6
	vinsertps xmm0, xmm0, xmm1, 16
	vbroadcastss xmm1, dword ptr [rsp + 352]
	vmulps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [rax]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [rax], xmm0
.LBB147_50:
	mov r9, qword ptr [rsp + 216]
	mov r11, r12
	mov rsi, qword ptr [rsp]
	mov rax, rsi
	mov rdx, r15
	mov rcx, r10
	mov r8, rbx
	mov rdi, r15
	mov qword ptr [rsp + 56], r9
	lea r13, [r9 + 8]
	mov rbp, r12
	sub rbp, 1
	cmovae r12, rbp
	mov qword ptr [rsp + 64], r12
	mov qword ptr [rsp + 248], r13
	cmovae r9, r13
	mov qword ptr [rsp + 216], r9
	lea r9, [rsi + 4]
	sub r15, 1
	cmovb r15, rdi
	cmovb r9, rsi
	mov qword ptr [rsp], r9
	lea rdi, [r10 + 4]
	mov rsi, rbx
	sub rsi, 1
	cmovae rbx, rsi
	mov qword ptr [rsp + 32], rbx
	cmovae r10, rdi
	mov qword ptr [rsp + 200], r10
	mov r12, qword ptr [rsp + 72]
	mov r10, r12
	mov r13, qword ptr [rsp + 8]
	mov rbx, r13
	mov r9, r13
	sub r9, 1
	cmovae r13, r9
	mov qword ptr [rsp + 8], r13
	lea r13, [r12 + 4]
	cmovae r12, r13
	mov qword ptr [rsp + 72], r12
	test r14, r14
	je .LBB147_58
	test r11, r11
	je .LBB147_58
	test rdx, rdx
	je .LBB147_58
	test rax, rax
	je .LBB147_58
	test r8, r8
	je .LBB147_58
	test rcx, rcx
	je .LBB147_58
	test rbx, rbx
	je .LBB147_58
	test r10, r10
	je .LBB147_58
	dec r14
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rcx]
	mov rax, qword ptr [rsp + 208]
	vmovss xmm2, dword ptr [rax]
	vmovaps xmmword ptr [rsp + 352], xmm2
	add rax, 4
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [r10]
	vmovss dword ptr [rsp + 224], xmm0
	vmovss dword ptr [rsp + 228], xmm1
	vmovss dword ptr [rsp + 232], xmm2
	vmovss xmm0, dword ptr [rsp + 88]
	vmovss dword ptr [rsp + 236], xmm0
	mov rcx, qword ptr [rsp]
	mov qword ptr [rsp + 288], rcx
	mov qword ptr [rsp + 296], r15
	mov qword ptr [rsp + 304], rdi
	mov qword ptr [rsp + 312], rsi
	mov qword ptr [rsp + 320], r13
	mov qword ptr [rsp + 328], r9
	mov qword ptr [rsp + 208], rax
	mov qword ptr [rsp + 336], rax
	mov qword ptr [rsp + 344], r14
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 256], r12
	mov rbx, qword ptr [rsp + 16]
	mov qword ptr [rsp + 264], rbx
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rsp + 272], rax
	mov qword ptr [rsp + 280], rbx
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 288]
	mov rdx, qword ptr [rsp + 248]
	mov rcx, rbp
	lea r8, [rsp + 256]
	call engine::force::pass_one::<f32>
	cmp rbp, rbx
	mov rsi, r12
	mov eax, 4
	cmova rsi, rax
	mov rax, rbp
	mov ecx, 0
	cmova rax, rcx
	lea rcx, [4*rax]
	movabs rdx, 4611686018427387888
	and rcx, rdx
	je .LBB147_71
	lea rdi, [rcx - 16]
	mov r8d, edi
	shr r8d, 4
	inc r8d
	and r8d, 3
	mov r12, qword ptr [rsp + 64]
	mov r10, qword ptr [rsp + 200]
	vxorps xmm0, xmm0, xmm0
	mov rdx, rsi
	je .LBB147_76
	.p2align	4
.LBB147_75:
	vaddps xmm0, xmm0, xmmword ptr [rdx]
	add rdx, 16
	dec r8
	jne .LBB147_75
.LBB147_76:
	cmp rdi, 48
	jb .LBB147_72
	lea rdi, [rsi + rcx]
	.p2align	4
.LBB147_78:
	vaddps xmm0, xmm0, xmmword ptr [rdx]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 16]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 32]
	vaddps xmm0, xmm0, xmmword ptr [rdx + 48]
	add rdx, 64
	cmp rdx, rdi
	jne .LBB147_78
	jmp .LBB147_72
	.p2align	4
.LBB147_71:
	vxorps xmm0, xmm0, xmm0
	mov r12, qword ptr [rsp + 64]
	mov r10, qword ptr [rsp + 200]
.LBB147_72:
	mov rdx, rax
	movabs rdi, 1152921504606846972
	and rdx, rdi
	vmovshdup xmm2, xmm0
	vshufpd xmm1, xmm0, xmm0, 1
	and eax, 3
	je .LBB147_73
	vaddss xmm3, xmm0, dword ptr [rsi + 4*rdx]
	cmp eax, 1
	je .LBB147_82
	vaddss xmm2, xmm2, dword ptr [rsi + 4*rdx + 4]
	cmp eax, 2
	je .LBB147_82
	vaddss xmm1, xmm1, dword ptr [rsi + 4*rdx + 8]
	jmp .LBB147_82
	.p2align	4
.LBB147_73:
	vmovaps xmm3, xmm0
.LBB147_82:
	cmp rbp, rbx
	mov rsi, qword ptr [rsp + 24]
	mov edi, 4
	cmova rsi, rdi
	test rcx, rcx
	je .LBB147_83
	lea r8, [rcx - 16]
	mov r9d, r8d
	shr r9d, 4
	inc r9d
	and r9d, 3
	mov rbx, qword ptr [rsp + 32]
	vxorps xmm4, xmm4, xmm4
	mov rdi, rsi
	je .LBB147_88
	.p2align	4
.LBB147_87:
	vaddps xmm4, xmm4, xmmword ptr [rdi]
	add rdi, 16
	dec r9
	jne .LBB147_87
.LBB147_88:
	cmp r8, 48
	jb .LBB147_84
	add rcx, rsi
	.p2align	4
.LBB147_90:
	vaddps xmm4, xmm4, xmmword ptr [rdi]
	vaddps xmm4, xmm4, xmmword ptr [rdi + 16]
	vaddps xmm4, xmm4, xmmword ptr [rdi + 32]
	vaddps xmm4, xmm4, xmmword ptr [rdi + 48]
	add rdi, 64
	cmp rdi, rcx
	jne .LBB147_90
.LBB147_84:
	vmovshdup xmm6, xmm4
	vshufpd xmm5, xmm4, xmm4, 1
	test rax, rax
	jne .LBB147_91
	jmp .LBB147_85
	.p2align	4
.LBB147_83:
	vxorps xmm4, xmm4, xmm4
	mov rbx, qword ptr [rsp + 32]
	vmovshdup xmm6, xmm4
	vshufpd xmm5, xmm4, xmm4, 1
	test rax, rax
	je .LBB147_85
.LBB147_91:
	vaddss xmm7, xmm4, dword ptr [rsi + 4*rdx]
	cmp eax, 1
	je .LBB147_94
	vaddss xmm6, xmm6, dword ptr [rsi + 4*rdx + 4]
	cmp eax, 2
	je .LBB147_94
	vaddss xmm5, xmm5, dword ptr [rsi + 4*rdx + 8]
	jmp .LBB147_94
.LBB147_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB147_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 24]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB147_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 40]
	je .LBB147_62
	mov rdi, qword ptr [rsp + 192]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB147_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB147_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB147_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB147_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB147_95
	mov rdi, qword ptr [rsp + 240]
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
.LBB147_95:
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
.LBB147_101:
	.cfi_def_cfa_offset 432
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
.LBB147_9:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_99:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_17:
	mov edi, 4
	mov rsi, r12
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_44:
	mov edi, 4
	jmp .LBB147_45
.LBB147_68:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB147_46:
	ud2
	mov rbx, rax
	mov rdi, qword ptr [rsp + 48]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_20
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB147_98
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov r13, qword ptr [rsp]
	jmp .LBB147_11
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	mov r13, qword ptr [rsp]
	je .LBB147_98
.LBB147_11:
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	mov rdi, qword ptr [rsp]
	je .LBB147_98
	jmp .LBB147_97
	jmp .LBB147_19
.LBB147_19:
	mov rbx, rax
.LBB147_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB147_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB147_23
.LBB147_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB147_25
.LBB147_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB147_27
.LBB147_98:
	mov rdi, rbx
	call _Unwind_Resume@PLT
.LBB147_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB147_24
.LBB147_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB147_26
.LBB147_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB147_98
.LBB147_27:
	mov rdi, qword ptr [rsp + 104]
.LBB147_97:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call _Unwind_Resume@PLT
