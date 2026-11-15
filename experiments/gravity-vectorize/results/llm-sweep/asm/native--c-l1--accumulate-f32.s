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
	mov r15, qword ptr [rsi + 16]
	mov r12, rcx
	movabs rcx, 9223372036854775805
	lea rbp, [4*r15]
	mov rax, r15
	shr rax, 62
	sete al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB147_1
	call alloc::raw_vec::capacity_overflow
.LBB147_1:
	mov qword ptr [rsp + 72], rdi
	mov qword ptr [rsp + 24], r15
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 224], r12
	mov qword ptr [rsp + 32], rbp
	test rbp, rbp
	je .LBB147_2
	mov r14, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	mov rbx, rsi
	call r14
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB147_94
	mov rdi, rbp
	call r14
	test rax, rax
	je .LBB147_9
	mov rdi, rbp
	mov r12, rax
	call r14
	mov rsi, rbp
	test rax, rax
	je .LBB147_92
	mov rdi, rsi
	mov rbp, rax
	call r14
	test rax, rax
	je .LBB147_17
	mov rcx, qword ptr [rsp + 8]
	mov rsi, rbx
	jmp .LBB147_3
.LBB147_2:
	mov ebp, 4
	mov ecx, 4
	mov r12d, 4
	mov eax, 4
.LBB147_3:
	mov rdx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], rcx
	mov qword ptr [rsp + 152], r15
	mov qword ptr [rsp + 160], r12
	mov qword ptr [rsp + 176], r15
	mov qword ptr [rsp + 184], rbp
	mov qword ptr [rsp + 200], r15
	mov qword ptr [rsp + 208], rax
	mov r13, rcx
	mov qword ptr [rsp + 144], 0
	mov qword ptr [rsp + 168], 0
	mov qword ptr [rsp + 192], 0
	mov qword ptr [rsp + 216], 0
	cmp rdx, r15
	cmovae rdx, r15
	mov qword ptr [rsp + 88], rdx
	test rdx, rdx
	je .LBB147_4
	mov rax, qword ptr [rsi + 56]
	mov r15, qword ptr [rsi + 8]
	xor ebp, ebp
	mov qword ptr [rsp + 80], rax
	jmp .LBB147_30
	.p2align	4
.LBB147_41:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 208]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 216], r14
	cmp qword ptr [rsp + 88], rbp
	je .LBB147_5
.LBB147_30:
	vmovss xmm0, dword ptr [r15 + 8*rbp]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r15 + 8*rbp + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 80]
	vmovss xmm0, dword ptr [rax + 4*rbp]
	vmovss dword ptr [rsp + 8], xmm0
	cmp rbp, qword ptr [rsp + 128]
	jne .LBB147_33
	lea rdi, [rsp + 128]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov r13, qword ptr [rsp + 136]
.LBB147_33:
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [r13 + 4*rbp], xmm0
	inc rbp
	mov r12, qword ptr [rsp + 168]
	mov qword ptr [rsp + 144], rbp
	cmp r12, qword ptr [rsp + 152]
	jne .LBB147_35
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_35:
	mov rax, qword ptr [rsp + 160]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	mov qword ptr [rsp + 112], rax
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss xmm3, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm1
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	vucomiss xmm3, xmm2
	mov qword ptr [rsp + 168], r12
	jne .LBB147_36
	jp .LBB147_36
	mov rbx, qword ptr [rsp + 192]
	cmp rbx, qword ptr [rsp + 176]
	je .LBB147_38
	jmp .LBB147_39
	.p2align	4
.LBB147_36:
	vmovss xmm0, dword ptr [rip + .LCPI147_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm0
	mov rbx, qword ptr [rsp + 192]
	cmp rbx, qword ptr [rsp + 176]
	jne .LBB147_39
.LBB147_38:
	lea rdi, [rsp + 176]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB147_39:
	mov rax, qword ptr [rsp + 184]
	mov qword ptr [rsp + 104], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov r14, qword ptr [rsp + 216]
	mov qword ptr [rsp + 192], rbx
	cmp r14, qword ptr [rsp + 200]
	jne .LBB147_41
	lea rdi, [rsp + 200]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB147_41
.LBB147_4:
	mov qword ptr [rsp + 104], rbp
	mov qword ptr [rsp + 112], r12
	xor ebx, ebx
	xor r14d, r14d
	xor r12d, r12d
	xor ebp, ebp
.LBB147_5:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, rcx
	shr rdx, 61
	je .LBB147_42
	xor edi, edi
.LBB147_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_42:
	mov rdx, qword ptr [rsp + 72]
	vmovss xmm0, dword ptr [rdx]
	vmovss xmm1, dword ptr [rdx + 4]
	mov edx, 4
	vmovss dword ptr [rsp + 124], xmm0
	vmovss dword ptr [rsp + 120], xmm1
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 64], rdx
	mov r13, qword ptr [rsp + 48]
	mov qword ptr [rsp + 248], rax
	test rcx, rcx
	je .LBB147_49
	mov r15, qword ptr [rsp + 32]
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 56], rax
	test rax, rax
	je .LBB147_44
	mov rax, qword ptr [rip + calloc@GOTPCREL]
	mov esi, 1
	mov rdi, r15
	call rax
	mov qword ptr [rsp + 64], rax
	test rax, rax
	je .LBB147_68
	mov rax, qword ptr [rsp + 248]
.LBB147_49:
	mov qword ptr [rsp + 72], rax
	mov r10, qword ptr [rsp + 136]
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 88], rax
	mov r15, qword ptr [rsp + 112]
	mov qword ptr [rsp + 272], r10
	jmp .LBB147_50
	.p2align	4
.LBB147_71:
	mov r8, qword ptr [rsp + 48]
	mov rbx, qword ptr [rsp + 8]
	mov r9, qword ptr [rsp + 96]
	mov r13, qword ptr [rsp + 80]
	mov r11, qword ptr [rsp + 32]
	vxorps xmm0, xmm0, xmm0
	vxorps xmm1, xmm1, xmm1
.LBB147_87:
	vbroadcastss xmm3, dword ptr [rsp + 224]
	vmovsd xmm2, qword ptr [r8]
	vinsertps xmm0, xmm0, xmm1, 16
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 88], rbp
	mov rdx, rbp
	mov rsi, r9
	mov r12, r9
	mov r15, r13
	mov r9, r13
	mov rbp, rax
	vmulps xmm0, xmm3, xmm0
	vaddps xmm0, xmm0, xmm2
	vmovlps qword ptr [r8], xmm0
	mov r8, qword ptr [rsp + 16]
	mov qword ptr [rsp + 224], r11
	mov rcx, qword ptr [rsp + 280]
	mov r10, r8
	mov r13, rcx
.LBB147_50:
	mov qword ptr [rsp + 48], r13
	mov rdi, r8
	mov r8, rax
	lea rax, [r13 + 8]
	mov r13, qword ptr [rsp + 224]
	sub r13, 1
	cmovae r11, r13
	cmovae rcx, rax
	mov qword ptr [rsp + 32], r11
	mov r11, rbp
	sub r11, 1
	mov qword ptr [rsp + 288], rax
	mov rax, r10
	lea r10, [r10 + 4]
	cmovb r11, r8
	cmovb r10, rdi
	mov rdi, r12
	sub rdi, 1
	lea r8, [r15 + 4]
	cmovae rsi, rdi
	cmovae r9, r8
	mov qword ptr [rsp + 40], r11
	mov qword ptr [rsp + 16], r10
	mov qword ptr [rsp + 96], rsi
	mov qword ptr [rsp + 80], r9
	mov r9, rbx
	sub r9, 1
	mov r11, qword ptr [rsp + 88]
	mov rsi, qword ptr [rsp + 8]
	lea r10, [r11 + 4]
	cmovae rsi, r9
	cmovae rdx, r10
	mov qword ptr [rsp + 8], rsi
	test r14, r14
	je .LBB147_58
	cmp qword ptr [rsp + 224], 0
	je .LBB147_58
	test rbp, rbp
	je .LBB147_58
	test rax, rax
	je .LBB147_58
	test r12, r12
	je .LBB147_58
	test r15, r15
	je .LBB147_58
	test rbx, rbx
	je .LBB147_58
	mov rsi, r11
	test r11, r11
	je .LBB147_58
	mov qword ptr [rsp + 280], rcx
	vmovss xmm0, dword ptr [rax]
	mov rbp, rdx
	vmovss xmm1, dword ptr [r15]
	dec r14
	mov rax, qword ptr [rsp + 72]
	vmovss xmm2, dword ptr [rax]
	add rax, 4
	vmovaps xmmword ptr [rsp + 224], xmm2
	vmovss xmm2, dword ptr [rsp + 124]
	mov rcx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 40]
	vmulss xmm2, xmm2, dword ptr [rsi]
	vmovss dword ptr [rsp + 256], xmm0
	vmovss xmm0, dword ptr [rsp + 120]
	mov qword ptr [rsp + 72], rax
	lea rsi, [rsp + 328]
	vmovss dword ptr [rsp + 260], xmm1
	mov r12, qword ptr [rsp + 56]
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 328], rcx
	mov qword ptr [rsp + 336], rdx
	mov rcx, qword ptr [rsp + 64]
	mov rdx, qword ptr [rsp + 288]
	mov qword ptr [rsp + 344], r8
	mov qword ptr [rsp + 352], rdi
	lea rdi, [rsp + 256]
	lea r8, [rsp + 296]
	mov qword ptr [rsp + 360], r10
	mov qword ptr [rsp + 368], r9
	mov qword ptr [rsp + 376], rax
	mov qword ptr [rsp + 384], r14
	mov qword ptr [rsp + 296], r12
	mov qword ptr [rsp + 304], rbx
	mov qword ptr [rsp + 312], rcx
	mov rcx, r13
	mov qword ptr [rsp + 320], rbx
	vmovss dword ptr [rsp + 264], xmm2
	vmovss dword ptr [rsp + 268], xmm0
	call engine::force::pass_one::<f32>
	cmp r13, rbx
	mov eax, 4
	mov rdi, r12
	mov r8, r13
	cmova rdi, rax
	mov eax, 0
	cmova r8, rax
	test r8, r8
	je .LBB147_71
	lea rax, [4*r8]
	mov r11, qword ptr [rsp + 32]
	lea rcx, [rax - 4]
	mov rsi, rcx
	shr rsi, 2
	inc rsi
	mov rdx, rsi
	and rdx, 7
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
	mov rdi, qword ptr [rsp + 64]
	cmp r13, rbx
	mov r13, qword ptr [rsp + 80]
	mov r8d, 4
	cmova rdi, r8
	test sil, 7
	je .LBB147_80
	mov r8, qword ptr [rsp + 48]
	mov r9, qword ptr [rsp + 96]
	shl edx, 2
	vxorps xmm1, xmm1, xmm1
	mov rsi, rdi
	.p2align	4
.LBB147_82:
	vaddss xmm1, xmm1, dword ptr [rsi]
	add rsi, 4
	add rdx, -4
	jne .LBB147_82
	cmp rcx, 28
	jae .LBB147_85
.LBB147_84:
	mov rbx, qword ptr [rsp + 8]
	jmp .LBB147_87
	.p2align	4
.LBB147_80:
	mov r8, qword ptr [rsp + 48]
	mov r9, qword ptr [rsp + 96]
	vxorps xmm1, xmm1, xmm1
	mov rsi, rdi
	cmp rcx, 28
	jb .LBB147_84
.LBB147_85:
	mov rbx, qword ptr [rsp + 8]
	add rdi, rax
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
	jmp .LBB147_87
.LBB147_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB147_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 64]
	call rbx
	mov rdi, qword ptr [rsp + 56]
	call rbx
.LBB147_60:
	cmp qword ptr [rsp + 200], 0
	mov rbx, qword ptr [rsp + 112]
	mov r14, qword ptr [rsp + 104]
	je .LBB147_62
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 248]
	call rax
.LBB147_62:
	cmp qword ptr [rsp + 176], 0
	je .LBB147_64
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call rax
.LBB147_64:
	cmp qword ptr [rsp + 152], 0
	je .LBB147_66
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call rax
.LBB147_66:
	cmp qword ptr [rsp + 128], 0
	je .LBB147_88
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
.LBB147_88:
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
.LBB147_94:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB147_9:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_92:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB147_46
.LBB147_17:
	mov rsi, qword ptr [rsp + 32]
	mov edi, 4
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
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 56]
	mov r14, rax
	call rbx
	jmp .LBB147_20
	cmp qword ptr [rsp + 24], 0
	mov r14, rax
	je .LBB147_91
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbp
	call rax
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB147_11
	cmp qword ptr [rsp + 24], 0
	mov rcx, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB147_91
.LBB147_11:
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	mov rbx, rcx
	call rax
	mov rdi, rbx
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
	cmp qword ptr [rsp + 24], 0
	mov rdi, qword ptr [rsp + 8]
	mov r14, rax
	je .LBB147_91
	jmp .LBB147_90
	jmp .LBB147_19
.LBB147_19:
	mov r14, rax
.LBB147_20:
	cmp qword ptr [rsp + 200], 0
	jne .LBB147_21
	cmp qword ptr [rsp + 176], 0
	jne .LBB147_23
.LBB147_24:
	cmp qword ptr [rsp + 152], 0
	jne .LBB147_25
.LBB147_26:
	cmp qword ptr [rsp + 128], 0
	jne .LBB147_27
.LBB147_91:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB147_21:
	mov rdi, qword ptr [rsp + 208]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 176], 0
	je .LBB147_24
.LBB147_23:
	mov rdi, qword ptr [rsp + 184]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 152], 0
	je .LBB147_26
.LBB147_25:
	mov rdi, qword ptr [rsp + 160]
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 128], 0
	je .LBB147_91
.LBB147_27:
	mov rdi, qword ptr [rsp + 136]
.LBB147_90:
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	mov rdi, r14
	call _Unwind_Resume@PLT
