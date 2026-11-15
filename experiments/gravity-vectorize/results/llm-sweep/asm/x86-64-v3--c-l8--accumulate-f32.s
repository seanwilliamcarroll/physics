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
	sub rsp, 440
	.cfi_def_cfa_offset 496
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r13, rcx
	movabs rax, 4611686018427387872
	mov r14, qword ptr [rsi + 16]
	lea rbp, [4*r14]
	add rax, 31
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
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 208], r13
	mov qword ptr [rsp + 32], rbp
	je .LBB149_2
	mov rbx, rsi
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB149_95
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_9
	mov r15, rax
	mov rdi, rbp
	call qword ptr [rip + malloc@GOTPCREL]
	mov rsi, rbp
	test rax, rax
	je .LBB149_93
	mov rbp, rax
	mov rdi, rsi
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB149_17
	mov rsi, rbx
	mov r13, qword ptr [rsp + 8]
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
	mov qword ptr [rsp + 192], rcx
	test rcx, rcx
	je .LBB149_4
	mov r15, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 56], rax
	xor ebp, ebp
	jmp .LBB149_30
	.p2align	4
.LBB149_41:
	mov rax, qword ptr [rsp + 176]
	vmovss xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rax + 4*r14], xmm0
	inc r14
	mov qword ptr [rsp + 184], r14
	cmp qword ptr [rsp + 192], rbp
	je .LBB149_5
.LBB149_30:
	vmovss xmm0, dword ptr [r15 + 8*rbp]
	vmovss dword ptr [rsp + 16], xmm0
	vmovss xmm0, dword ptr [r15 + 8*rbp + 4]
	vmovss dword ptr [rsp + 40], xmm0
	mov rax, qword ptr [rsp + 56]
	vmovss xmm0, dword ptr [rax + 4*rbp]
	vmovss dword ptr [rsp + 8], xmm0
	cmp rbp, qword ptr [rsp + 96]
	mov rax, r13
	jne .LBB149_33
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 104]
.LBB149_33:
	mov r13, rax
	vmovss xmm0, dword ptr [rsp + 16]
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
	vmovss xmm0, dword ptr [rsp + 8]
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 16], xmm1
	vucomiss xmm0, xmm2
	jne .LBB149_36
	jp .LBB149_36
	mov rbx, qword ptr [rsp + 160]
	cmp rbx, qword ptr [rsp + 144]
	je .LBB149_38
	jmp .LBB149_39
	.p2align	4
.LBB149_36:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 8]
	vmovss dword ptr [rsp + 16], xmm0
	mov rbx, qword ptr [rsp + 160]
	cmp rbx, qword ptr [rsp + 144]
	jne .LBB149_39
.LBB149_38:
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_39:
	mov rax, qword ptr [rsp + 152]
	mov qword ptr [rsp + 40], rax
	vmovss xmm0, dword ptr [rsp + 16]
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 160], rbx
	mov r14, qword ptr [rsp + 184]
	cmp r14, qword ptr [rsp + 168]
	jne .LBB149_41
	lea rdi, [rsp + 168]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_41
.LBB149_4:
	mov qword ptr [rsp + 40], rbp
	mov qword ptr [rsp + 80], r15
	xor ebx, ebx
	xor r14d, r14d
	xor r12d, r12d
	xor ebp, ebp
.LBB149_5:
	mov rcx, qword ptr [rsp + 24]
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
	mov qword ptr [rsp + 16], rdx
	test rcx, rcx
	mov r13, qword ptr [rsp + 72]
	mov qword ptr [rsp + 224], rax
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
	mov qword ptr [rsp + 16], rax
	test rax, rax
	je .LBB149_69
	mov rax, qword ptr [rsp + 224]
.LBB149_49:
	mov rdi, qword ptr [rsp + 104]
	vbroadcastsd ymm0, qword ptr [rip + .LCPI149_1]
	vmovups ymmword ptr [rsp + 400], ymm0
	mov qword ptr [rsp + 232], rax
	mov rax, qword ptr [rsp + 40]
	mov qword ptr [rsp + 192], rax
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 56], rax
	mov qword ptr [rsp + 320], rdi
	mov rax, rdi
	jmp .LBB149_50
	.p2align	4
.LBB149_89:
	mov esi, 8
	lea rdi, [rsp + 256]
	vzeroupper
	call engine::force::tree_sum::<f32>
	vbroadcastss xmm1, dword ptr [rsp + 208]
	vmovaps xmm2, xmmword ptr [rsp + 192]
	vinsertps xmm0, xmm2, xmm0, 16
	vmulps xmm0, xmm1, xmm0
	vmovsd xmm1, qword ptr [r13]
	vaddps xmm0, xmm0, xmm1
	vmovlps qword ptr [r13], xmm0
	mov r10, qword ptr [rsp + 32]
	mov rbx, r10
	mov rsi, qword ptr [rsp + 64]
	mov qword ptr [rsp + 192], rsi
	mov r9, qword ptr [rsp + 360]
	mov r12, r9
	mov rdx, qword ptr [rsp + 352]
	mov qword ptr [rsp + 56], rdx
	mov rbp, r15
	mov r8, qword ptr [rsp + 8]
	mov rax, r8
	mov r11, qword ptr [rsp + 344]
	mov qword ptr [rsp + 208], r11
	mov rcx, qword ptr [rsp + 328]
	mov r13, rcx
.LBB149_50:
	mov rdi, r8
	mov r8, r15
	mov qword ptr [rsp + 72], r13
	lea r15, [r13 + 8]
	mov r13, qword ptr [rsp + 208]
	sub r13, 1
	cmovae r11, r13
	mov qword ptr [rsp + 344], r11
	mov qword ptr [rsp + 336], r15
	cmovae rcx, r15
	lea r11, [rax + 4]
	mov r15, rbp
	sub r15, 1
	cmovb r15, r8
	cmovb r11, rdi
	mov qword ptr [rsp + 8], r11
	mov r11, qword ptr [rsp + 56]
	lea r8, [r11 + 4]
	mov rdi, r12
	sub rdi, 1
	cmovae r9, rdi
	mov qword ptr [rsp + 360], r9
	cmovae rdx, r8
	mov qword ptr [rsp + 352], rdx
	mov r9, rbx
	sub r9, 1
	cmovae r10, r9
	mov qword ptr [rsp + 32], r10
	mov rdx, qword ptr [rsp + 192]
	lea r10, [rdx + 4]
	cmovae rsi, r10
	mov qword ptr [rsp + 64], rsi
	test r14, r14
	je .LBB149_58
	cmp qword ptr [rsp + 208], 0
	je .LBB149_58
	test rbp, rbp
	je .LBB149_58
	test rax, rax
	je .LBB149_58
	test r12, r12
	je .LBB149_58
	mov rsi, r11
	test r11, r11
	je .LBB149_58
	test rbx, rbx
	je .LBB149_58
	test rdx, rdx
	je .LBB149_58
	mov qword ptr [rsp + 328], rcx
	dec r14
	vmovss xmm0, dword ptr [rax]
	vmovss xmm1, dword ptr [rsi]
	mov rax, qword ptr [rsp + 232]
	vmovss xmm2, dword ptr [rax]
	vmovaps xmmword ptr [rsp + 208], xmm2
	add rax, 4
	vmovss xmm2, dword ptr [rsp + 92]
	vmulss xmm2, xmm2, dword ptr [rdx]
	vmovss dword ptr [rsp + 240], xmm0
	vmovss dword ptr [rsp + 244], xmm1
	vmovss dword ptr [rsp + 248], xmm2
	vmovss xmm0, dword ptr [rsp + 88]
	vmovss dword ptr [rsp + 252], xmm0
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rsp + 256], rcx
	mov qword ptr [rsp + 264], r15
	mov qword ptr [rsp + 272], r8
	mov qword ptr [rsp + 280], rdi
	mov qword ptr [rsp + 288], r10
	mov qword ptr [rsp + 296], r9
	mov qword ptr [rsp + 232], rax
	mov qword ptr [rsp + 304], rax
	mov qword ptr [rsp + 312], r14
	mov r12, qword ptr [rsp + 48]
	mov qword ptr [rsp + 368], r12
	mov rbx, qword ptr [rsp + 24]
	mov qword ptr [rsp + 376], rbx
	mov rax, qword ptr [rsp + 16]
	mov qword ptr [rsp + 384], rax
	mov qword ptr [rsp + 392], rbx
	lea rdi, [rsp + 240]
	lea rsi, [rsp + 256]
	mov rdx, qword ptr [rsp + 336]
	mov rcx, r13
	lea r8, [rsp + 368]
	vzeroupper
	call engine::force::pass_one::<f32>
	cmp r13, rbx
	mov rax, r12
	mov ecx, 4
	cmova rax, rcx
	mov rbx, r13
	mov ecx, 0
	cmova rbx, rcx
	vxorps xmm0, xmm0, xmm0
	vmovups ymmword ptr [rsp + 256], ymm0
	lea r12, [4*rbx]
	movabs rcx, 4611686018427387872
	and r12, rcx
	je .LBB149_78
	lea rdx, [r12 - 32]
	mov rcx, rax
	test dl, 32
	jne .LBB149_74
	vaddps ymm0, ymm0, ymmword ptr [rax]
	lea rcx, [rax + 32]
.LBB149_74:
	test rdx, rdx
	je .LBB149_77
	lea rdx, [rax + r12]
	.p2align	4
.LBB149_76:
	vaddps ymm0, ymm0, ymmword ptr [rcx]
	vaddps ymm0, ymm0, ymmword ptr [rcx + 32]
	add rcx, 64
	cmp rcx, rdx
	jne .LBB149_76
.LBB149_77:
	vmovups ymmword ptr [rsp + 256], ymm0
.LBB149_78:
	mov rbp, rbx
	movabs rcx, 1152921504606846968
	and rbp, rcx
	and ebx, 7
	je .LBB149_80
	lea rax, [rax + 4*rbp]
	lea rcx, [rbx - 1]
	vmovq xmm0, rcx
	vpbroadcastq ymm0, xmm0
	vpxor ymm0, ymm0, ymmword ptr [rsp + 400]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI149_2]
	vpcmpgtq ymm1, ymm1, ymm0
	vmovdqa ymm2, ymmword ptr [rip + .LCPI149_3]
	vpcmpgtq ymm0, ymm2, ymm0
	vpackssdw ymm0, ymm0, ymm1
	vpcmpeqd ymm1, ymm1, ymm1
	vpxor ymm0, ymm0, ymm1
	vextracti128 xmm1, ymm0, 1
	vpackssdw xmm0, xmm0, xmm1
	vpshufd xmm0, xmm0, 216
	vpmovzxwd ymm0, xmm0
	vpslld ymm0, ymm0, 31
	vmaskmovps ymm1, ymm0, ymmword ptr [rax]
	vaddps ymm1, ymm1, ymmword ptr [rsp + 256]
	vmaskmovps ymmword ptr [rsp + 256], ymm0, ymm1
.LBB149_80:
	mov esi, 8
	lea rdi, [rsp + 256]
	vzeroupper
	call engine::force::tree_sum::<f32>
	cmp r13, qword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 16]
	mov ecx, 4
	cmova rax, rcx
	vmovaps xmmword ptr [rsp + 192], xmm0
	vxorps xmm0, xmm0, xmm0
	vmovups ymmword ptr [rsp + 256], ymm0
	test r12, r12
	mov r13, qword ptr [rsp + 72]
	je .LBB149_87
	lea rdx, [r12 - 32]
	mov rcx, rax
	test dl, 32
	jne .LBB149_83
	vaddps ymm0, ymm0, ymmword ptr [rax]
	lea rcx, [rax + 32]
.LBB149_83:
	test rdx, rdx
	je .LBB149_86
	add r12, rax
	.p2align	4
.LBB149_85:
	vaddps ymm0, ymm0, ymmword ptr [rcx]
	vaddps ymm0, ymm0, ymmword ptr [rcx + 32]
	add rcx, 64
	cmp rcx, r12
	jne .LBB149_85
.LBB149_86:
	vmovups ymmword ptr [rsp + 256], ymm0
.LBB149_87:
	test rbx, rbx
	je .LBB149_89
	lea rax, [rax + 4*rbp]
	dec rbx
	vmovq xmm0, rbx
	vpbroadcastq ymm0, xmm0
	vpxor ymm0, ymm0, ymmword ptr [rsp + 400]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI149_2]
	vpcmpgtq ymm1, ymm1, ymm0
	vmovdqa ymm2, ymmword ptr [rip + .LCPI149_3]
	vpcmpgtq ymm0, ymm2, ymm0
	vpackssdw ymm0, ymm0, ymm1
	vpcmpeqd ymm1, ymm1, ymm1
	vpxor ymm0, ymm0, ymm1
	vextracti128 xmm1, ymm0, 1
	vpackssdw xmm0, xmm0, xmm1
	vpshufd xmm0, xmm0, 216
	vpmovzxwd ymm0, xmm0
	vpslld ymm0, ymm0, 31
	vmaskmovps ymm1, ymm0, ymmword ptr [rax]
	vaddps ymm1, ymm1, ymmword ptr [rsp + 256]
	vmaskmovps ymmword ptr [rsp + 256], ymm0, ymm1
	jmp .LBB149_89
.LBB149_58:
	cmp qword ptr [rsp + 24], 0
	je .LBB149_60
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 16]
	vzeroupper
	call rbx
	mov rdi, qword ptr [rsp + 48]
	call rbx
.LBB149_60:
	cmp qword ptr [rsp + 168], 0
	mov rbx, qword ptr [rsp + 80]
	mov r14, qword ptr [rsp + 40]
	je .LBB149_62
	mov rdi, qword ptr [rsp + 224]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_62:
	cmp qword ptr [rsp + 144], 0
	je .LBB149_64
	mov rdi, r14
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_64:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_66
	mov rdi, rbx
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_66:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_68
	mov rdi, qword ptr [rsp + 320]
	vzeroupper
	call qword ptr [rip + free@GOTPCREL]
.LBB149_68:
	add rsp, 440
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
.LBB149_95:
	.cfi_def_cfa_offset 496
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_9:
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_46
.LBB149_93:
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
	cmp qword ptr [rsp + 24], 0
	je .LBB149_92
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	mov rax, qword ptr [rsp + 8]
	jmp .LBB149_11
	mov r14, rax
	cmp qword ptr [rsp + 24], 0
	mov rax, qword ptr [rsp + 8]
	je .LBB149_92
.LBB149_11:
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
	je .LBB149_92
	jmp .LBB149_91
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
.LBB149_92:
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
	je .LBB149_92
.LBB149_27:
	mov rdi, qword ptr [rsp + 104]
.LBB149_91:
	call qword ptr [rip + free@GOTPCREL]
	mov rdi, r14
	call _Unwind_Resume@PLT
