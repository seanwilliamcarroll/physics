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
	sub rsp, 728
	.cfi_def_cfa_offset 784
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r15, rcx
	mov r8, qword ptr [rsi + 16]
	lea rbx, [8*r8]
	mov rax, r8
	shr rax, 61
	sete al
	movabs rcx, 9223372036854775801
	cmp rbx, rcx
	setb cl
	test al, cl
	jne .LBB148_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB148_1:
	test rbx, rbx
	mov qword ptr [rsp + 40], rdi
	je .LBB148_2
	mov qword ptr [rsp + 16], r8
	mov r12, rdx
	mov r14, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB148_90
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_19
	mov r13, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_88
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_27
	mov rsi, r14
	mov rdx, r12
	mov rdi, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	jmp .LBB148_3
.LBB148_2:
	mov ebp, 8
	mov edi, 8
	mov r13d, 8
	mov eax, 8
.LBB148_3:
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 56], r15
	mov qword ptr [rsp + 72], r8
	mov qword ptr [rsp + 80], rdi
	mov qword ptr [rsp + 88], 0
	mov qword ptr [rsp + 96], r8
	mov qword ptr [rsp + 104], r13
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 120], r8
	mov qword ptr [rsp + 128], rbp
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 144], r8
	mov qword ptr [rsp + 152], rax
	mov qword ptr [rsp + 160], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB148_4
	mov qword ptr [rsp + 16], r8
	mov rbp, rdi
	mov r14, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 64], rax
	add r14, 8
	xor r15d, r15d
	jmp .LBB148_40
	.p2align	4
.LBB148_51:
	mov rax, qword ptr [rsp + 152]
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 160], r12
	add r14, 16
	cmp qword ptr [rsp + 16], r15
	je .LBB148_5
.LBB148_40:
	movsd xmm0, qword ptr [r14 - 8]
	movsd qword ptr [rsp], xmm0
	movsd xmm0, qword ptr [r14]
	movsd qword ptr [rsp + 24], xmm0
	mov rax, qword ptr [rsp + 64]
	movsd xmm0, qword ptr [rax + 8*r15]
	movsd qword ptr [rsp + 8], xmm0
	cmp r15, qword ptr [rsp + 72]
	jne .LBB148_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 72]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rbp, qword ptr [rsp + 80]
.LBB148_43:
	movsd xmm0, qword ptr [rsp]
	movsd qword ptr [rbp + 8*r15], xmm0
	inc r15
	mov qword ptr [rsp + 88], r15
	mov rbx, qword ptr [rsp + 112]
	cmp rbx, qword ptr [rsp + 96]
	jne .LBB148_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_45:
	mov rax, qword ptr [rsp + 104]
	mov qword ptr [rsp + 176], rax
	movsd xmm0, qword ptr [rsp + 24]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 112], rbx
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp + 8]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp], xmm1
	ucomisd xmm0, xmm2
	jne .LBB148_46
	jp .LBB148_46
	mov r13, qword ptr [rsp + 136]
	cmp r13, qword ptr [rsp + 120]
	je .LBB148_48
	jmp .LBB148_49
	.p2align	4
.LBB148_46:
	movsd xmm0, qword ptr [rip + .LCPI148_0]
	divsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rsp], xmm0
	mov r13, qword ptr [rsp + 136]
	cmp r13, qword ptr [rsp + 120]
	jne .LBB148_49
.LBB148_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB148_49:
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 24], rax
	movsd xmm0, qword ptr [rsp]
	movsd qword ptr [rax + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 136], r13
	mov r12, qword ptr [rsp + 160]
	cmp r12, qword ptr [rsp + 144]
	jne .LBB148_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 144]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB148_51
.LBB148_4:
	mov qword ptr [rsp + 24], rbp
	mov qword ptr [rsp + 176], r13
	xor ebx, ebx
	xor r13d, r13d
	xor r12d, r12d
	xor r15d, r15d
.LBB148_5:
	mov qword ptr [rsp + 168], rax
	mov r14, qword ptr [rsp + 56]
	lea rdi, [8*r14]
	test r14, r14
	mov qword ptr [rsp + 48], rdi
	je .LBB148_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_64
	cmp r14, 4
	mov rbp, qword ptr [rsp + 32]
	lea rdi, [8*r14]
	ja .LBB148_62
	xor esi, esi
	jmp .LBB148_55
.LBB148_6:
	mov eax, 8
	mov qword ptr [rsp], rax
	mov r11d, 8
	jmp .LBB148_7
.LBB148_62:
	mov edx, r14d
	and edx, 3
	mov ecx, 4
	cmovne rcx, rdx
	mov rsi, r14
	sub rsi, rcx
	lea rcx, [rbp + 48]
	xor edx, edx
	.p2align	4
.LBB148_63:
	movsd xmm0, qword ptr [rcx - 48]
	movhpd xmm0, qword ptr [rcx - 32]
	movsd xmm1, qword ptr [rcx - 16]
	movhpd xmm1, qword ptr [rcx]
	movupd xmmword ptr [rax + 8*rdx], xmm0
	movupd xmmword ptr [rax + 8*rdx + 16], xmm1
	add rdx, 4
	add rcx, 64
	cmp rsi, rdx
	jne .LBB148_63
.LBB148_55:
	mov rcx, rsi
	shl rcx, 4
	add rcx, rbp
	.p2align	4
.LBB148_56:
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rax + 8*rsi], xmm0
	inc rsi
	add rcx, 16
	cmp r14, rsi
	jne .LBB148_56
	mov qword ptr [rsp], rax
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB148_68
	mov r11, rax
	cmp r14, 4
	lea rdi, [8*r14]
	ja .LBB148_66
	xor eax, eax
	jmp .LBB148_60
.LBB148_66:
	mov eax, r14d
	and eax, 3
	mov ecx, 4
	cmovne rcx, rax
	mov rax, r14
	sub rax, rcx
	lea rcx, [rbp + 56]
	xor edx, edx
	.p2align	4
.LBB148_67:
	movsd xmm0, qword ptr [rcx - 48]
	movhpd xmm0, qword ptr [rcx - 32]
	movsd xmm1, qword ptr [rcx - 16]
	movhpd xmm1, qword ptr [rcx]
	movupd xmmword ptr [r11 + 8*rdx], xmm0
	movupd xmmword ptr [r11 + 8*rdx + 16], xmm1
	add rdx, 4
	add rcx, 64
	cmp rax, rdx
	jne .LBB148_67
.LBB148_60:
	mov rcx, rax
	shl rcx, 4
	add rcx, rbp
	add rcx, 8
	.p2align	4
.LBB148_61:
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [r11 + 8*rax], xmm0
	inc rax
	add rcx, 16
	cmp r14, rax
	jne .LBB148_61
.LBB148_7:
	test r15, r15
	je .LBB148_14
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 192], rax
	mov rax, qword ptr [rsp + 40]
	movsd xmm0, qword ptr [rax]
	movsd qword ptr [rsp + 184], xmm0
	movsd xmm0, qword ptr [rax + 8]
	movsd qword ptr [rsp + 40], xmm0
	xor ebp, ebp
	xor r14d, r14d
	mov qword ptr [rsp + 200], r11
	.p2align	4
.LBB148_9:
	mov rax, rbx
	add rax, r14
	je .LBB148_14
	mov rax, r13
	add rax, r14
	je .LBB148_14
	mov rax, r12
	add rax, r14
	je .LBB148_14
	cmp rdi, rbp
	je .LBB148_14
	mov rcx, qword ptr [rsp + 192]
	lea rax, [rcx + rbp]
	lea rdx, [rcx + rbp]
	add rdx, 8
	lea rcx, [r15 + r14 - 1]
	mov rsi, qword ptr [rsp + 176]
	lea r8, [rsi + rbp + 8]
	lea r9, [rbx + r14 - 1]
	movsd xmm0, qword ptr [rax]
	movsd xmm1, qword ptr [rsi + rbp]
	mov rsi, qword ptr [rsp + 24]
	lea rax, [rsi + rbp + 8]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 168]
	movsd xmm2, qword ptr [rax + rbp]
	movsd qword ptr [rsp + 8], xmm2
	lea rax, [rax + rbp + 8]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rsp + 56]
	lea r10, [rax + r14 - 1]
	lea rax, [r11 + rbp + 8]
	mov rdi, qword ptr [rsp]
	lea r11, [rdi + rbp + 8]
	movsd xmm2, qword ptr [rsi + rbp]
	mulsd xmm2, qword ptr [rsp + 184]
	movsd qword ptr [rsp + 336], xmm0
	movsd qword ptr [rsp + 344], xmm1
	movsd qword ptr [rsp + 352], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 464]
	lea rsi, [rsp + 336]
	movsd xmm0, qword ptr [rsp + 40]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [r12 + r14 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 104]
	.cfi_adjust_cfa_offset 8
	lea rax, [r13 + r14 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	call engine::force::sweep::<f64>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	movups xmm0, xmmword ptr [rsp + 576]
	movaps xmmword ptr [rsp + 448], xmm0
	movups xmm0, xmmword ptr [rsp + 560]
	movaps xmmword ptr [rsp + 432], xmm0
	movups xmm0, xmmword ptr [rsp + 544]
	movaps xmmword ptr [rsp + 416], xmm0
	movups xmm0, xmmword ptr [rsp + 528]
	movaps xmmword ptr [rsp + 400], xmm0
	movups xmm0, xmmword ptr [rsp + 464]
	movups xmm1, xmmword ptr [rsp + 480]
	movups xmm2, xmmword ptr [rsp + 496]
	movups xmm3, xmmword ptr [rsp + 512]
	movaps xmmword ptr [rsp + 384], xmm3
	movaps xmmword ptr [rsp + 368], xmm2
	movaps xmmword ptr [rsp + 352], xmm1
	movaps xmmword ptr [rsp + 336], xmm0
	lea rax, [rsp + 592]
	movups xmm0, xmmword ptr [rax + 112]
	movaps xmmword ptr [rsp + 320], xmm0
	movups xmm0, xmmword ptr [rax + 96]
	movaps xmmword ptr [rsp + 304], xmm0
	movups xmm0, xmmword ptr [rax + 80]
	movaps xmmword ptr [rsp + 288], xmm0
	movups xmm0, xmmword ptr [rax + 64]
	movaps xmmword ptr [rsp + 272], xmm0
	movupd xmm0, xmmword ptr [rax]
	movups xmm1, xmmword ptr [rax + 16]
	movups xmm2, xmmword ptr [rax + 32]
	movups xmm3, xmmword ptr [rax + 48]
	movaps xmmword ptr [rsp + 256], xmm3
	movaps xmmword ptr [rsp + 240], xmm2
	movaps xmmword ptr [rsp + 224], xmm1
	movapd xmmword ptr [rsp + 208], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 16
	lea rdi, [rsp + 336]
	call engine::force::tree_sum::<f64>
	mulsd xmm0, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp]
	addsd xmm0, qword ptr [rax + rbp]
	movsd qword ptr [rax + rbp], xmm0
	movaps xmm0, xmmword ptr [rsp + 320]
	movaps xmmword ptr [rsp + 576], xmm0
	movaps xmm0, xmmword ptr [rsp + 304]
	movaps xmmword ptr [rsp + 560], xmm0
	movaps xmm0, xmmword ptr [rsp + 288]
	movaps xmmword ptr [rsp + 544], xmm0
	movaps xmm0, xmmword ptr [rsp + 272]
	movaps xmmword ptr [rsp + 528], xmm0
	movapd xmm0, xmmword ptr [rsp + 208]
	movapd xmm1, xmmword ptr [rsp + 224]
	movapd xmm2, xmmword ptr [rsp + 240]
	movapd xmm3, xmmword ptr [rsp + 256]
	movapd xmmword ptr [rsp + 512], xmm3
	movapd xmmword ptr [rsp + 496], xmm2
	movapd xmmword ptr [rsp + 480], xmm1
	movapd xmmword ptr [rsp + 464], xmm0
	.cfi_escape 0x2e, 0x00
	mov esi, 16
	lea rdi, [rsp + 464]
	call engine::force::tree_sum::<f64>
	mov r11, qword ptr [rsp + 200]
	mov rdi, qword ptr [rsp + 48]
	mulsd xmm0, qword ptr [rsp + 8]
	addsd xmm0, qword ptr [r11 + rbp]
	movsd qword ptr [r11 + rbp], xmm0
	dec r14
	add rbp, 8
	mov rax, r15
	add rax, r14
	jne .LBB148_9
.LBB148_14:
	mov rdx, qword ptr [rsp + 56]
	test rdx, rdx
	je .LBB148_76
	cmp rdx, 4
	jae .LBB148_70
	xor eax, eax
	mov rsi, qword ptr [rsp + 32]
	mov r14, qword ptr [rsp]
	jmp .LBB148_73
.LBB148_70:
	movabs rax, 576460752303423484
	and rax, rdx
	and rdi, -32
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 32]
	mov r14, qword ptr [rsp]
	.p2align	4
.LBB148_71:
	movupd xmm0, xmmword ptr [r14 + rcx]
	movupd xmm1, xmmword ptr [r14 + rcx + 16]
	movupd xmm2, xmmword ptr [r11 + rcx]
	movupd xmm3, xmmword ptr [r11 + rcx + 16]
	movapd xmm4, xmm0
	unpcklpd xmm4, xmm2
	unpckhpd xmm0, xmm2
	movupd xmmword ptr [rsi + 2*rcx + 16], xmm0
	movupd xmmword ptr [rsi + 2*rcx], xmm4
	movapd xmm0, xmm1
	unpcklpd xmm0, xmm3
	unpckhpd xmm1, xmm3
	movupd xmmword ptr [rsi + 2*rcx + 48], xmm1
	movupd xmmword ptr [rsi + 2*rcx + 32], xmm0
	add rcx, 32
	cmp rdi, rcx
	jne .LBB148_71
	cmp rdx, rax
	je .LBB148_75
.LBB148_73:
	mov rcx, rax
	shl rcx, 4
	add rcx, rsi
	add rcx, 8
	.p2align	4
.LBB148_74:
	movsd xmm0, qword ptr [r14 + 8*rax]
	movsd xmm1, qword ptr [r11 + 8*rax]
	inc rax
	movsd qword ptr [rcx - 8], xmm0
	movsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp rdx, rax
	jne .LBB148_74
.LBB148_75:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r11
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call rbx
.LBB148_76:
	cmp qword ptr [rsp + 144], 0
	mov rdi, qword ptr [rsp + 168]
	je .LBB148_78
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB148_78:
	cmp qword ptr [rsp + 120], 0
	je .LBB148_80
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB148_80:
	cmp qword ptr [rsp + 96], 0
	je .LBB148_82
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB148_82:
	cmp qword ptr [rsp + 72], 0
	je .LBB148_84
	mov rdi, qword ptr [rsp + 80]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB148_84:
	add rsp, 728
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
.LBB148_90:
	.cfi_def_cfa_offset 784
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB148_19:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_65
.LBB148_88:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_65
.LBB148_27:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB148_65
.LBB148_64:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
	jmp .LBB148_65
.LBB148_68:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
.LBB148_65:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp]
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_30
	jmp .LBB148_29
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_87
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_21
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB148_87
.LBB148_21:
	.cfi_escape 0x2e, 0x00
	mov rdi, r13
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB148_86
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB148_86
	jmp .LBB148_87
.LBB148_29:
	mov rbx, rax
.LBB148_30:
	cmp qword ptr [rsp + 144], 0
	jne .LBB148_31
	cmp qword ptr [rsp + 120], 0
	jne .LBB148_33
.LBB148_34:
	cmp qword ptr [rsp + 96], 0
	jne .LBB148_35
.LBB148_36:
	cmp qword ptr [rsp + 72], 0
	jne .LBB148_37
	jmp .LBB148_87
.LBB148_31:
	mov rdi, qword ptr [rsp + 152]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 120], 0
	je .LBB148_34
.LBB148_33:
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 96], 0
	je .LBB148_36
.LBB148_35:
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 72], 0
	je .LBB148_87
.LBB148_37:
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 8], rax
.LBB148_86:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB148_87:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
