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
	mov r13, rcx
	movabs rax, 4611686018427387896
	mov r14, qword ptr [rsi + 16]
	lea rbp, [4*r14]
	add rax, 7
	cmp r14, rax
	setbe al
	movabs rcx, 9223372036854775805
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB149_1
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	mov qword ptr [rsp + 64], rdi
	test rbp, rbp
	mov qword ptr [rsp + 16], r14
	mov qword ptr [rsp + 56], rdx
	mov qword ptr [rsp + 192], r13
	mov qword ptr [rsp + 32], rbp
	je .LBB149_2
	mov rbx, rsi
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp], rax
	test rax, rax
	je .LBB149_97
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_9
	mov r15, rax
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, rbp
	test rax, rax
	je .LBB149_95
	mov rbp, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_17
	mov rsi, rbx
	mov r13, qword ptr [rsp]
	jmp .LBB149_3
.LBB149_2:
	mov ebp, 4
	mov r13d, 4
	mov r15d, 4
	mov eax, 4
.LBB149_3:
	mov qword ptr [rsp + 96], r14
	mov qword ptr [rsp + 104], r13
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r14
	mov qword ptr [rsp + 128], r15
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r14
	mov qword ptr [rsp + 152], rbp
	mov qword ptr [rsp + 160], 0
	mov qword ptr [rsp + 168], r14
	mov qword ptr [rsp + 176], rax
	mov qword ptr [rsp + 184], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r14
	cmovae rcx, r14
	mov qword ptr [rsp + 24], rcx
	test rcx, rcx
	je .LBB149_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	xor ebp, ebp
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	mov rax, qword ptr [rsp + 176]
	vmovss xmm0, dword ptr [rsp]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 184], rbx
	cmp qword ptr [rsp + 24], rbp
	je .LBB149_5
.LBB149_30:
	vmovss xmm0, dword ptr [r15 + 8*rbp]
	vmovss dword ptr [rsp + 8], xmm0
	vmovss xmm0, dword ptr [r15 + 8*rbp + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 72]
	vmovss xmm0, dword ptr [rax + 4*rbp]
	vmovss dword ptr [rsp], xmm0
	cmp rbp, qword ptr [rsp + 96]
	mov rax, r13
	jne .LBB149_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB149_33:
	mov r13, rax
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 112], rbp
	mov r12, qword ptr [rsp + 136]
	cmp r12, qword ptr [rsp + 120]
	jne .LBB149_35
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_35:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 80], rax
	vmovss xmm0, dword ptr [rsp + 40]
	vmovss dword ptr [rax + 4*r12], xmm0
	inc r12
	mov qword ptr [rsp + 136], r12
	vxorps xmm2, xmm2, xmm2
	vmovss xmm0, dword ptr [rsp]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 8], xmm1
	vucomiss xmm0, xmm2
	jne .LBB149_36
	jp .LBB149_36
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp]
	vmovss dword ptr [rsp + 8], xmm0
	mov r14, qword ptr [rsp + 160]
	cmp r14, qword ptr [rsp + 144]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 160], r14
	mov rbx, qword ptr [rsp + 184]
	cmp rbx, qword ptr [rsp + 168]
	jne .LBB149_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 80], r15
	xor r14d, r14d
	xor ebx, ebx
	xor r12d, r12d
	xor ebp, ebp
.LBB149_5:
	mov rcx, qword ptr [rsp + 16]
	mov rdx, rcx
	shr rdx, 61
	je .LBB149_42
	xor edi, edi
.LBB149_45:
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_42:
	mov rdx, qword ptr [rsp + 64]
	vmovss xmm0, dword ptr [rdx]
	vmovss dword ptr [rsp + 92], xmm0
	vmovss xmm0, dword ptr [rdx + 4]
	vmovss dword ptr [rsp + 88], xmm0
	mov edx, 4
	mov qword ptr [rsp + 48], rdx
	mov qword ptr [rsp + 24], rdx
	test rcx, rcx
	mov r13, qword ptr [rsp + 56]
	mov qword ptr [rsp + 208], rax
	je .LBB149_49
	mov esi, 1
	mov r15, qword ptr [rsp + 32]
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 48], rax
	test rax, rax
	je .LBB149_44
	mov esi, 1
	mov rdi, r15
	call qword ptr [rip + calloc@GOTPCREL]
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB149_69
	mov rax, qword ptr [rsp + 208]
.LBB149_49:
	mov qword ptr [rsp + 8], rbx
	mov rdi, qword ptr [rsp + 104]
	mov qword ptr [rsp + 216], rax
	mov rbx, qword ptr [rsp + 40]
	mov rsi, qword ptr [rsp + 80]
	mov qword ptr [rsp + 320], rdi
	mov rax, rdi
	jmp .LBB149_50
	.p2align	4
.LBB149_91:
	mov esi, 2
	lea rdi, [rsp + 240]
	call engine::force::tree_sum::<f32>
	vbroadcastss xmm1, dword ptr [rsp + 192]
	vmovaps xmm2, xmmword ptr [rsp + 304]
	vinsertps xmm0, xmm2, xmm0, 16
	vmulps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [r13]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [r13], xmm0
	mov r11, qword ptr [rsp + 344]
	mov r14, r11
	mov rbx, r12
	mov r9, qword ptr [rsp + 72]
	mov r12, r9
	mov r10, qword ptr [rsp + 32]
	mov rsi, r10
	mov rbp, r15
	mov r8, qword ptr [rsp + 328]
	mov rax, r8
	mov rdx, qword ptr [rsp + 64]
	mov qword ptr [rsp + 192], rdx
	mov rcx, qword ptr [rsp + 336]
	mov r13, rcx
.LBB149_50:
	mov rdi, r8
	mov r8, r15
	mov qword ptr [rsp + 56], r13
	lea r15, [r13 + 8]
	mov r13, qword ptr [rsp + 192]
	sub r13, 1
	cmovae rdx, r13
	mov qword ptr [rsp + 64], rdx
	mov qword ptr [rsp + 304], r15
	cmovae rcx, r15
	mov r15, rax
	lea rdx, [rax + 4]
	mov rax, rbp
	sub rax, 1
	cmovb rax, r8
	mov qword ptr [rsp + 352], rax
	cmovb rdx, rdi
	mov rax, rsi
	lea r8, [rsi + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 72], r9
	cmovae r10, r8
	mov qword ptr [rsp + 32], r10
	mov r9, r14
	sub r9, 1
	cmovae r11, r9
	lea r10, [rbx + 4]
	mov rsi, qword ptr [rsp]
	cmovae rsi, r10
	mov qword ptr [rsp], rsi
	cmp qword ptr [rsp + 8], 0
	je .LBB149_58
	cmp qword ptr [rsp + 192], 0
	je .LBB149_58
	test rbp, rbp
	je .LBB149_58
	test r15, r15
	je .LBB149_58
	test r12, r12
	je .LBB149_58
	test rax, rax
	je .LBB149_58
	test r14, r14
	je .LBB149_58
	mov rsi, rbx
	test rbx, rbx
	je .LBB149_58
	mov qword ptr [rsp + 336], rcx
	mov qword ptr [rsp + 344], r11
	mov rbx, qword ptr [rsp + 8]
	dec rbx
	vmovss xmm0, dword ptr [r15]
	vmovss xmm1, dword ptr [rax]
	mov rax, qword ptr [rsp + 216]
	vmovss xmm2, dword ptr [rax]
	vmovaps xmmword ptr [rsp + 192], xmm2
	add rax, 4
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [rsi]
	vmovss dword ptr [rsp + 224], xmm0
	vmovss dword ptr [rsp + 228], xmm1
	vmovss dword ptr [rsp + 232], xmm2
	vmovss xmm0, dword ptr [rsp + 88]
	vmovss dword ptr [rsp + 236], xmm0
	mov qword ptr [rsp + 328], rdx
	mov qword ptr [rsp + 240], rdx
	mov r15, qword ptr [rsp + 352]
	mov qword ptr [rsp + 248], r15
	mov qword ptr [rsp + 256], r8
	mov qword ptr [rsp + 264], rdi
	mov qword ptr [rsp + 272], r10
	mov qword ptr [rsp + 280], r9
	mov qword ptr [rsp + 216], rax
	mov qword ptr [rsp + 288], rax
	mov qword ptr [rsp + 296], rbx
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 360], r12
	mov r14, qword ptr [rsp + 16]
	mov qword ptr [rsp + 368], r14
	mov rax, qword ptr [rsp + 24]
	mov qword ptr [rsp + 376], rax
	mov qword ptr [rsp + 384], r14
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 240]
	mov rdx, qword ptr [rsp + 304]
	mov rcx, r13
	lea r8, [rsp + 360]
	call engine::force::pass_one::<f32>
	cmp r13, r14
	mov rax, r12
	mov ecx, 4
	cmova rax, rcx
	mov r14, r13
	mov ecx, 0
	cmova r14, rcx
	mov qword ptr [rsp + 240], 0
	lea r12, [4*r14]
	movabs rcx, 4611686018427387896
	and r12, rcx
	je .LBB149_72
	lea rdx, [r12 - 8]
	mov esi, edx
	shr esi, 3
	inc esi
	vxorps xmm0, xmm0, xmm0
	mov rcx, rax
	and esi, 7
	je .LBB149_75
	.p2align	4
.LBB149_74:
	vmovsd xmm1, qword ptr [rcx]
	vaddps xmm0, xmm0, xmm1
	add rcx, 8
	dec rsi
	jne .LBB149_74
.LBB149_75:
	cmp rdx, 56
	jb .LBB149_78
	lea rdx, [rax + r12]
	.p2align	4
.LBB149_77:
	vmovsd xmm1, qword ptr [rcx]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 8]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 24]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 40]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 48]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 56]
	vaddps xmm0, xmm0, xmm1
	add rcx, 64
	cmp rcx, rdx
	jne .LBB149_77
.LBB149_78:
	vmovlps qword ptr [rsp + 240], xmm0
	jmp .LBB149_79
	.p2align	4
.LBB149_72:
	vxorps xmm0, xmm0, xmm0
.LBB149_79:
	mov rbp, r14
	movabs rcx, 1152921504606846974
	and rbp, rcx
	test r14b, 1
	je .LBB149_81
	vaddss xmm0, xmm0, dword ptr [rax + 4*rbp]
	vmovss dword ptr [rsp + 240], xmm0
.LBB149_81:
	mov esi, 2
	lea rdi, [rsp + 240]
	call engine::force::tree_sum::<f32>
	cmp r13, qword ptr [rsp + 16]
	mov rax, qword ptr [rsp + 24]
	mov ecx, 4
	cmova rax, rcx
	vmovaps xmmword ptr [rsp + 304], xmm0
	mov qword ptr [rsp + 240], 0
	test r12, r12
	je .LBB149_82
	lea rdx, [r12 - 8]
	mov esi, edx
	shr esi, 3
	inc esi
	and esi, 7
	mov r13, qword ptr [rsp + 56]
	vxorps xmm0, xmm0, xmm0
	mov rcx, rax
	je .LBB149_85
	.p2align	4
.LBB149_84:
	vmovsd xmm1, qword ptr [rcx]
	vaddps xmm0, xmm0, xmm1
	add rcx, 8
	dec rsi
	jne .LBB149_84
.LBB149_85:
	cmp rdx, 56
	jb .LBB149_88
	add r12, rax
	.p2align	4
.LBB149_87:
	vmovsd xmm1, qword ptr [rcx]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 8]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 16]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 24]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 32]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 40]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 48]
	vaddps xmm0, xmm0, xmm1
	vmovsd xmm1, qword ptr [rcx + 56]
	vaddps xmm0, xmm0, xmm1
	add rcx, 64
	cmp rcx, r12
	jne .LBB149_87
.LBB149_88:
	vmovlps qword ptr [rsp + 240], xmm0
	mov qword ptr [rsp + 8], rbx
	test r14b, 1
	mov r12, qword ptr [rsp]
	je .LBB149_91
	jmp .LBB149_90
	.p2align	4
.LBB149_82:
	vxorps xmm0, xmm0, xmm0
	mov r13, qword ptr [rsp + 56]
	mov qword ptr [rsp + 8], rbx
	test r14b, 1
	mov r12, qword ptr [rsp]
	je .LBB149_91
.LBB149_90:
	vaddss xmm0, xmm0, dword ptr [rax + 4*rbp]
	vmovss dword ptr [rsp + 240], xmm0
	jmp .LBB149_91
.LBB149_58:
	cmp qword ptr [rsp + 16], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 24]
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 40]
	je .LBB149_62
	mov rdi, qword ptr [rsp + 208]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB149_64
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB149_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_66
	mov rdi, rbx
	call qword ptr [rip + free@GOTPCREL]
.LBB149_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_68
	mov rdi, qword ptr [rsp + 320]
	call qword ptr [rip + free@GOTPCREL]
.LBB149_68:
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
.LBB149_97:
	.cfi_def_cfa_offset 448
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_95:
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_17:
	mov edi, 4
	mov rsi, qword ptr [rsp + 32]
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_44:
	mov edi, 4
	jmp .LBB149_45
.LBB149_69:
	mov edi, 4
	mov rsi, r15
	call alloc::raw_vec::handle_error
.LBB149_46:
	ud2
	mov r14, rax
	mov rdi, qword ptr [rsp + 48]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB149_20
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB149_94
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp]
	jmp .LBB149_11
	mov r14, rax
	cmp qword ptr [rsp + 16], 0
	mov rax, qword ptr [rsp]
	je .LBB149_94
.LBB149_11:
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
	je .LBB149_94
	jmp .LBB149_93
	jmp .LBB149_19
.LBB149_19:
	mov r14, rax
.LBB149_20:
	cmp qword ptr [rsp + 168], 0
	jne .LBB149_21
	cmp qword ptr [rsp + 144], 0
	jne .LBB149_23
.LBB149_24:
	cmp qword ptr [rsp + 120], 0
	jne .LBB149_25
.LBB149_26:
	cmp qword ptr [rsp + 96], 0
	jne .LBB149_27
.LBB149_94:
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB149_21:
	mov rdi, qword ptr [rsp + 176]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 144], 0
	je .LBB149_24
.LBB149_23:
	mov rdi, qword ptr [rsp + 152]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB149_26
.LBB149_25:
	mov rdi, qword ptr [rsp + 128]
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB149_94
.LBB149_27:
	mov rdi, qword ptr [rsp + 104]
.LBB149_93:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
