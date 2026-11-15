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
	jne .LBB147_1
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	mov qword ptr [rsp + 32], rdi
	test r13, r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 208], rbp
	mov qword ptr [rsp + 8], r13
	je .LBB147_2
	mov rbx, rsi
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB147_95
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_9
	mov r15, rax
	mov rdi, r13
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, r13
	test rax, rax
	je .LBB147_93
	mov r13, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB147_17
	mov rsi, rbx
	mov rbp, qword ptr [rsp]
	jmp .LBB147_3
.LBB147_2:
	mov r13d, 4
	mov ebp, 4
	mov r15d, 4
	mov eax, 4
.LBB147_3:
	mov qword ptr [rsp + 112], r14
	mov qword ptr [rsp + 120], rbp
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r14
	mov qword ptr [rsp + 144], r15
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 160], r14
	mov qword ptr [rsp + 168], r13
	mov qword ptr [rsp + 176], 0
	mov qword ptr [rsp + 184], r14
	mov qword ptr [rsp + 192], rax
	mov qword ptr [rsp + 200], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 80], rcx
	test rcx, rcx
	je .LBB147_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor r13d, r13d
	jmp .LBB147_30
	.p2align	4
.LBB147_41:
	mov rax, qword ptr [rsp + 192]
	vmovss xmm0, dword ptr [rsp]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 200], r14
	cmp qword ptr [rsp + 80], r13
	je .LBB147_5
.LBB147_30:
	vmovss xmm0, dword ptr [r15 + 8*r13]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r15 + 8*r13 + 4]
	vmovss dword ptr [rsp + 48], xmm0
	mov rax, qword ptr [rsp + 72]
	vmovss xmm0, dword ptr [rax + 4*r13]
	vmovss dword ptr [rsp], xmm0
	cmp r13, qword ptr [rsp + 112]
	mov rax, rbp
	jne .LBB147_33
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 120]
.LBB147_33:
	mov rbp, rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*r13], xmm0
	inc r13
	mov qword ptr [rsp + 128], r13
	mov r12, qword ptr [rsp + 152]
	cmp r12, qword ptr [rsp + 136]
	jne .LBB147_35
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_35:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 96], rax
	vmovss xmm0, dword ptr [rsp + 48]
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 152], r12
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 16], xmm1
	vucomiss xmm0, xmm2
	jne .LBB147_36
	jp .LBB147_36
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	je .LBB147_38
	jmp .LBB147_39
	.p2align	4
.LBB147_36:
	vmovss xmm0, dword ptr [rip + .LCPI147_0]
	vdivss xmm0, xmm0, dword ptr [rsp]
	vmovss dword ptr [rsp + 16], xmm0
	mov rbx, qword ptr [rsp + 176]
	cmp rbx, qword ptr [rsp + 160]
	jne .LBB147_39
.LBB147_38:
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_39:
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp + 48], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 176], rbx
	mov r14, qword ptr [rsp + 200]
	cmp r14, qword ptr [rsp + 184]
	jne .LBB147_41
	lea rdi, [rsp + 184]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_41
.LBB147_4:
	mov qword ptr [rsp + 48], r13
	mov qword ptr [rsp + 96], r15
	xor ebx, ebx
	xor r14d, r14d
	xor r12d, r12d
	xor r13d, r13d
.LBB147_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 61
	je .LBB147_42
	xor edi, edi
.LBB147_45:
	mov rsi, qword ptr [rsp + 8]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_42:
	mov rdx, qword ptr [rsp + 32]
	vmovss xmm0, dword ptr [rdx]
	vmovss dword ptr [rsp + 108], xmm0
	vmovss xmm0, dword ptr [rdx + 4]
	vmovss dword ptr [rsp + 104], xmm0
	mov edx, 4
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 64], rdx
	test rcx, rcx
	mov rbp, qword ptr [rsp + 40]
	mov qword ptr [rsp + 232], rax
	je .LBB147_49
	mov esi, 1
	mov r15, qword ptr [rsp + 8]
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB147_44
	mov esi, 1
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 64], rax
	test rax, rax
	je .LBB147_68
	mov rax, qword ptr [rsp + 232]
.LBB147_49:
	mov r8, qword ptr [rsp + 120]
	mov qword ptr [rsp + 240], rax
	mov rax, qword ptr [rsp + 48]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 80], rax
	mov qword ptr [rsp + 272], r8
	mov rax, r8
	jmp .LBB147_50
	.p2align	4
.LBB147_71:
	vxorps xmm0, xmm0, xmm0
	vxorps xmm1, xmm1, xmm1
	mov r8, qword ptr [rsp + 40]
	mov rbx, qword ptr [rsp + 72]
	mov rbp, qword ptr [rsp + 8]
	mov r9, qword ptr [rsp + 88]
	mov r10, qword ptr [rsp + 32]
	mov r11, qword ptr [rsp + 248]
.LBB147_88:
	vinsertps xmm0, xmm0, xmm1, 16
	vbroadcastss xmm1, dword ptr [rsp + 208]
	vmulps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [r8]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [r8], xmm0
	mov rcx, rbx
	mov qword ptr [rsp + 16], rbp
	mov r12, r9
	mov qword ptr [rsp + 80], r10
	mov r13, r15
	mov rdi, qword ptr [rsp]
	mov rax, rdi
	mov qword ptr [rsp + 208], r11
	mov rdx, qword ptr [rsp + 280]
	mov rsi, rbp
	mov rbp, rdx
.LBB147_50:
	mov r8, r15
	mov qword ptr [rsp + 40], rbp
	lea r15, [rbp + 8]
	mov rbp, qword ptr [rsp + 208]
	sub rbp, 1
	cmovae r11, rbp
	mov qword ptr [rsp + 248], r11
	mov qword ptr [rsp + 288], r15
	cmovae rdx, r15
	lea r11, [rax + 4]
	mov r15, r13
	sub r15, 1
	cmovb r15, r8
	cmovb r11, rdi
	mov qword ptr [rsp], r11
	mov r11, qword ptr [rsp + 80]
	lea r8, [r11 + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 88], r9
	cmovae r10, r8
	mov qword ptr [rsp + 32], r10
	mov r9, rbx
	sub r9, 1
	cmovae rcx, r9
	mov qword ptr [rsp + 72], rcx
	mov rcx, qword ptr [rsp + 16]
	lea r10, [rcx + 4]
	cmovae rsi, r10
	mov qword ptr [rsp + 8], rsi
	test r14, r14
	je .LBB147_58
	cmp qword ptr [rsp + 208], 0
	je .LBB147_58
	test r13, r13
	je .LBB147_58
	test rax, rax
	je .LBB147_58
	test r12, r12
	je .LBB147_58
	mov rsi, r11
	test r11, r11
	je .LBB147_58
	test rbx, rbx
	je .LBB147_58
	test rcx, rcx
	je .LBB147_58
	mov qword ptr [rsp + 280], rdx
	dec r14
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rsi]
	mov r13, qword ptr [rsp + 240]
	vmovss xmm2, dword ptr [r13]
	vmovaps xmmword ptr [rsp + 208], xmm2
	add r13, 4
	vmovss xmm2, dword ptr [rsp + 108]
	vmulss xmm2, xmm2, dword ptr [rcx]
	vmovss dword ptr [rsp + 256], xmm0
	vmovss dword ptr [rsp + 260], xmm1
	vmovss dword ptr [rsp + 264], xmm2
	vmovss xmm0, dword ptr [rsp + 104]
	vmovss dword ptr [rsp + 268], xmm0
	mov rax, qword ptr [rsp]
	mov qword ptr [rsp + 328], rax
	mov qword ptr [rsp + 336], r15
	mov qword ptr [rsp + 344], r8
	mov qword ptr [rsp + 352], rdi
	mov qword ptr [rsp + 360], r10
	mov qword ptr [rsp + 368], r9
	mov qword ptr [rsp + 376], r13
	mov qword ptr [rsp + 384], r14
	mov r12, qword ptr [rsp + 56]
	mov qword ptr [rsp + 296], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 304], rbx
	mov rax, qword ptr [rsp + 64]
	mov qword ptr [rsp + 312], rax
	mov qword ptr [rsp + 320], rbx
	lea rdi, [rsp + 256]
	lea rsi, [rsp + 328]
	mov rdx, qword ptr [rsp + 288]
	mov rcx, rbp
	lea r8, [rsp + 296]
	call engine::force::pass_one::<f32>
	cmp rbp, rbx
	mov rdi, r12
	mov eax, 4
	cmova rdi, rax
	mov r8, rbp
	mov eax, 0
	cmova r8, rax
	test r8, r8
	mov qword ptr [rsp + 240], r13
	je .LBB147_71
	lea rax, [4*r8]
	lea rcx, [rax - 4]
	mov rsi, rcx
	shr rsi, 2
	inc rsi
	mov rdx, rsi
	and rdx, 7
	mov r11, qword ptr [rsp + 248]
	je .LBB147_73
	lea r10d, [4*rdx]
	vxorps xmm0, xmm0, xmm0
	mov r9, rdi
	.p2align	4
.LBB147_75:
	vaddss xmm0, xmm0, dword ptr [r9]
	add r9, 4
	add r10, -4
	jne .LBB147_75
	cmp rcx, 28
	jae .LBB147_77
	jmp .LBB147_79
	.p2align	4
.LBB147_73:
	vxorps xmm0, xmm0, xmm0
	mov r9, rdi
	cmp rcx, 28
	jb .LBB147_79
.LBB147_77:
	lea rdi, [rdi + 4*r8]
	.p2align	4
.LBB147_78:
	vaddss xmm0, xmm0, dword ptr [r9]
	vaddss xmm0, xmm0, dword ptr [r9 + 4]
	vaddss xmm0, xmm0, dword ptr [r9 + 8]
	vaddss xmm0, xmm0, dword ptr [r9 + 12]
	vaddss xmm0, xmm0, dword ptr [r9 + 16]
	vaddss xmm0, xmm0, dword ptr [r9 + 20]
	vaddss xmm0, xmm0, dword ptr [r9 + 24]
	vaddss xmm0, xmm0, dword ptr [r9 + 28]
	add r9, 32
	cmp r9, rdi
	jne .LBB147_78
.LBB147_79:
	cmp rbp, rbx
	mov rdi, qword ptr [rsp + 64]
	mov r8d, 4
	cmova rdi, r8
	test sil, 7
	mov rbx, qword ptr [rsp + 72]
	je .LBB147_80
	shl edx, 2
	vxorps xmm1, xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 40]
	mov r9, qword ptr [rsp + 88]
	.p2align	4
.LBB147_82:
	vaddss xmm1, xmm1, dword ptr [rsi]
	add rsi, 4
	add rdx, -4
	jne .LBB147_82
	cmp rcx, 28
	jae .LBB147_85
.LBB147_84:
	mov rbp, qword ptr [rsp + 8]
	jmp .LBB147_87
	.p2align	4
.LBB147_80:
	vxorps xmm1, xmm1, xmm1
	mov rsi, rdi
	mov r8, qword ptr [rsp + 40]
	mov r9, qword ptr [rsp + 88]
	cmp rcx, 28
	jb .LBB147_84
.LBB147_85:
	add rdi, rax
	mov rbp, qword ptr [rsp + 8]
	.p2align	4
.LBB147_86:
	vaddss xmm1, xmm1, dword ptr [rsi]
	vaddss xmm1, xmm1, dword ptr [rsi + 4]
	vaddss xmm1, xmm1, dword ptr [rsi + 8]
	vaddss xmm1, xmm1, dword ptr [rsi + 12]
	vaddss xmm1, xmm1, dword ptr [rsi + 16]
	vaddss xmm1, xmm1, dword ptr [rsi + 20]
	vaddss xmm1, xmm1, dword ptr [rsi + 24]
	vaddss xmm1, xmm1, dword ptr [rsi + 28]
	add rsi, 32
	cmp rsi, rdi
	jne .LBB147_86
.LBB147_87:
	mov r10, qword ptr [rsp + 32]
	jmp .LBB147_88
.LBB147_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB147_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 64]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB147_60:
	cmp qword ptr [rsp + 184], 0
	mov rbx, qword ptr [rsp + 96]
	mov r14, qword ptr [rsp + 48]
	je .LBB147_62
	mov rdi, qword ptr [rsp + 232]
	call qword ptr [rip + free@GOTPCREL]
.LBB147_62:
	cmp qword ptr [rsp + 160], 0
	je .LBB147_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB147_64:
	cmp qword ptr [rsp + 136], 0
	je .LBB147_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB147_66:
	cmp qword ptr [rsp + 112], 0
	je .LBB147_89
	mov rdi, qword ptr [rsp + 272]
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
.LBB147_89:
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
.LBB147_95:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
.LBB147_9:
	mov edi, 4
	mov rsi, r13
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_93:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_17:
	mov edi, 4
	mov rsi, qword ptr [rsp + 8]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_44:
	mov edi, 4
	jmp .LBB147_45
.LBB147_68:
	mov edi, 4
	mov rsi, r15
	call alloc::raw_vec::handle_error
.LBB147_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 56]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB147_20
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	je .LBB147_92
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB147_11
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rax, qword ptr [rsp]
	je .LBB147_92
.LBB147_11:
	mov rbx, rax
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp]
	je .LBB147_92
	jmp .LBB147_91
	jmp .LBB147_19
.LBB147_19:
	mov r14, rax
.LBB147_20:
	cmp qword ptr [rsp + 184], 0
	jne .LBB147_21
	cmp qword ptr [rsp + 160], 0
	jne .LBB147_23
.LBB147_24:
	cmp qword ptr [rsp + 136], 0
	jne .LBB147_25
.LBB147_26:
	cmp qword ptr [rsp + 112], 0
	jne .LBB147_27
.LBB147_92:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB147_21:
	mov rdi, qword ptr [rsp + 192]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 160], 0
	je .LBB147_24
.LBB147_23:
	mov rdi, qword ptr [rsp + 168]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 136], 0
	je .LBB147_26
.LBB147_25:
	mov rdi, qword ptr [rsp + 144]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB147_92
.LBB147_27:
	mov rdi, qword ptr [rsp + 120]
.LBB147_91:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
