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
	sub rsp, 264
	.cfi_def_cfa_offset 320
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
	jne .LBB146_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB146_1:
	test rbx, rbx
	mov qword ptr [rsp + 64], rdi
	je .LBB146_2
	mov qword ptr [rsp + 16], r8
	mov r13, rdx
	mov r14, rsi
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB146_89
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_19
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_87
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_27
	mov rsi, r14
	mov rdx, r13
	mov rcx, qword ptr [rsp + 8]
	mov r8, qword ptr [rsp + 16]
	jmp .LBB146_3
.LBB146_2:
	mov ebp, 8
	mov ecx, 8
	mov r12d, 8
	mov eax, 8
.LBB146_3:
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 56], r15
	mov qword ptr [rsp + 88], r8
	mov r15, rcx
	mov qword ptr [rsp + 96], rcx
	mov qword ptr [rsp + 104], 0
	mov qword ptr [rsp + 112], r8
	mov qword ptr [rsp + 120], r12
	mov qword ptr [rsp + 128], 0
	mov qword ptr [rsp + 136], r8
	mov qword ptr [rsp + 144], rbp
	mov qword ptr [rsp + 152], 0
	mov qword ptr [rsp + 160], r8
	mov qword ptr [rsp + 168], rax
	mov qword ptr [rsp + 176], 0
	mov rcx, qword ptr [rsi + 64]
	cmp rcx, r8
	cmovb r8, rcx
	test r8, r8
	je .LBB146_4
	mov qword ptr [rsp + 16], r8
	mov rbp, qword ptr [rsi + 8]
	mov rax, qword ptr [rsi + 56]
	mov qword ptr [rsp + 72], rax
	add rbp, 8
	xor r14d, r14d
	jmp .LBB146_40
	.p2align	4
.LBB146_51:
	mov rax, qword ptr [rsp + 168]
	movsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rax + 8*r13], xmm0
	inc r13
	mov qword ptr [rsp + 176], r13
	add rbp, 16
	cmp qword ptr [rsp + 16], r14
	je .LBB146_5
.LBB146_40:
	movsd xmm0, qword ptr [rbp - 8]
	movsd qword ptr [rsp + 24], xmm0
	movsd xmm0, qword ptr [rbp]
	movsd qword ptr [rsp + 32], xmm0
	mov rax, qword ptr [rsp + 72]
	movsd xmm0, qword ptr [rax + 8*r14]
	movsd qword ptr [rsp + 8], xmm0
	cmp r14, qword ptr [rsp + 88]
	mov rax, r15
	jne .LBB146_43
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 88]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	mov rax, qword ptr [rsp + 96]
.LBB146_43:
	mov r15, rax
	movsd xmm0, qword ptr [rsp + 24]
	movsd qword ptr [rax + 8*r14], xmm0
	inc r14
	mov qword ptr [rsp + 104], r14
	mov r12, qword ptr [rsp + 128]
	cmp r12, qword ptr [rsp + 112]
	jne .LBB146_45
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 112]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_45:
	mov rax, qword ptr [rsp + 120]
	mov qword ptr [rsp + 80], rax
	movsd xmm0, qword ptr [rsp + 32]
	movsd qword ptr [rax + 8*r12], xmm0
	inc r12
	mov qword ptr [rsp + 128], r12
	xorpd xmm2, xmm2
	movsd xmm0, qword ptr [rsp + 8]
	xorpd xmm1, xmm1
	movsd qword ptr [rsp + 24], xmm1
	ucomisd xmm0, xmm2
	jne .LBB146_46
	jp .LBB146_46
	mov rbx, qword ptr [rsp + 152]
	cmp rbx, qword ptr [rsp + 136]
	je .LBB146_48
	jmp .LBB146_49
	.p2align	4
.LBB146_46:
	movsd xmm0, qword ptr [rip + .LCPI146_0]
	divsd xmm0, qword ptr [rsp + 8]
	movsd qword ptr [rsp + 24], xmm0
	mov rbx, qword ptr [rsp + 152]
	cmp rbx, qword ptr [rsp + 136]
	jne .LBB146_49
.LBB146_48:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 136]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
.LBB146_49:
	mov rax, qword ptr [rsp + 144]
	mov qword ptr [rsp + 32], rax
	movsd xmm0, qword ptr [rsp + 24]
	movsd qword ptr [rax + 8*rbx], xmm0
	inc rbx
	mov qword ptr [rsp + 152], rbx
	mov r13, qword ptr [rsp + 176]
	cmp r13, qword ptr [rsp + 160]
	jne .LBB146_51
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 160]
	call <alloc::raw_vec::RawVec<&alloc::string::String>>::grow_one
	jmp .LBB146_51
.LBB146_4:
	mov qword ptr [rsp + 32], rbp
	mov qword ptr [rsp + 80], r12
	xor r12d, r12d
	xor ebx, ebx
	xor r13d, r13d
	xor r14d, r14d
.LBB146_5:
	mov qword ptr [rsp + 184], rax
	mov r15, qword ptr [rsp + 56]
	lea rdi, [8*r15]
	test r15, r15
	mov qword ptr [rsp + 48], rdi
	je .LBB146_6
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	test rax, rax
	je .LBB146_64
	cmp r15, 4
	mov r8, qword ptr [rsp + 40]
	lea rdi, [8*r15]
	ja .LBB146_62
	xor esi, esi
	jmp .LBB146_55
.LBB146_6:
	mov r11d, 8
	mov eax, 8
	mov qword ptr [rsp + 8], rax
	jmp .LBB146_7
.LBB146_62:
	mov edx, r15d
	and edx, 3
	mov ecx, 4
	cmovne rcx, rdx
	mov rsi, r15
	sub rsi, rcx
	lea rcx, [r8 + 48]
	xor edx, edx
	.p2align	4
.LBB146_63:
	movsd xmm0, qword ptr [rcx - 48]
	movhpd xmm0, qword ptr [rcx - 32]
	movsd xmm1, qword ptr [rcx - 16]
	movhpd xmm1, qword ptr [rcx]
	movupd xmmword ptr [rax + 8*rdx], xmm0
	movupd xmmword ptr [rax + 8*rdx + 16], xmm1
	add rdx, 4
	add rcx, 64
	cmp rsi, rdx
	jne .LBB146_63
.LBB146_55:
	mov rcx, rsi
	shl rcx, 4
	add rcx, r8
	.p2align	4
.LBB146_56:
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rax + 8*rsi], xmm0
	inc rsi
	add rcx, 16
	cmp r15, rsi
	jne .LBB146_56
	mov rbp, rax
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + malloc@GOTPCREL]
	mov qword ptr [rsp + 8], rax
	test rax, rax
	je .LBB146_68
	cmp r15, 4
	mov r11, rbp
	lea rdi, [8*r15]
	mov r8, qword ptr [rsp + 40]
	ja .LBB146_66
	xor eax, eax
	mov rsi, qword ptr [rsp + 8]
	jmp .LBB146_60
.LBB146_66:
	mov eax, r15d
	and eax, 3
	mov ecx, 4
	cmovne rcx, rax
	mov rax, r15
	sub rax, rcx
	lea rcx, [r8 + 56]
	xor edx, edx
	mov rsi, qword ptr [rsp + 8]
	.p2align	4
.LBB146_67:
	movsd xmm0, qword ptr [rcx - 48]
	movhpd xmm0, qword ptr [rcx - 32]
	movsd xmm1, qword ptr [rcx - 16]
	movhpd xmm1, qword ptr [rcx]
	movupd xmmword ptr [rsi + 8*rdx], xmm0
	movupd xmmword ptr [rsi + 8*rdx + 16], xmm1
	add rdx, 4
	add rcx, 64
	cmp rax, rdx
	jne .LBB146_67
.LBB146_60:
	mov rcx, rax
	shl rcx, 4
	add rcx, r8
	add rcx, 8
	.p2align	4
.LBB146_61:
	movsd xmm0, qword ptr [rcx]
	movsd qword ptr [rsi + 8*rax], xmm0
	inc rax
	add rcx, 16
	cmp r15, rax
	jne .LBB146_61
.LBB146_7:
	test r14, r14
	je .LBB146_14
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 208], rax
	mov rax, qword ptr [rsp + 64]
	movsd xmm0, qword ptr [rax]
	movsd qword ptr [rsp + 200], xmm0
	movsd xmm0, qword ptr [rax + 8]
	movsd qword ptr [rsp + 192], xmm0
	xor ebp, ebp
	xor r15d, r15d
	mov qword ptr [rsp + 216], r11
	.p2align	4
.LBB146_9:
	mov rax, r12
	add rax, r15
	je .LBB146_14
	mov rax, rbx
	add rax, r15
	je .LBB146_14
	mov rax, r13
	add rax, r15
	je .LBB146_14
	cmp rdi, rbp
	je .LBB146_14
	mov rcx, qword ptr [rsp + 208]
	lea rax, [rcx + rbp]
	lea rdx, [rcx + rbp]
	add rdx, 8
	lea rcx, [r14 + r15 - 1]
	mov rsi, qword ptr [rsp + 80]
	lea r8, [rsi + rbp + 8]
	lea r9, [r12 + r15 - 1]
	movsd xmm0, qword ptr [rax]
	movsd xmm1, qword ptr [rsi + rbp]
	mov rsi, qword ptr [rsp + 32]
	lea rax, [rsi + rbp + 8]
	mov qword ptr [rsp + 16], rax
	mov rax, qword ptr [rsp + 184]
	movsd xmm2, qword ptr [rax + rbp]
	movsd qword ptr [rsp + 24], xmm2
	lea rax, [rax + rbp + 8]
	mov qword ptr [rsp + 72], rax
	mov rax, qword ptr [rsp + 56]
	lea r10, [rax + r15 - 1]
	mov rax, qword ptr [rsp + 8]
	lea rax, [rax + rbp + 8]
	lea rdi, [r11 + rbp + 8]
	mov qword ptr [rsp + 64], rdi
	movsd xmm2, qword ptr [rsi + rbp]
	mulsd xmm2, qword ptr [rsp + 200]
	movsd qword ptr [rsp + 240], xmm0
	movsd qword ptr [rsp + 248], xmm1
	movsd qword ptr [rsp + 256], xmm2
	.cfi_escape 0x2e, 0x40
	lea rdi, [rsp + 224]
	lea rsi, [rsp + 240]
	movsd xmm0, qword ptr [rsp + 192]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 88]
	.cfi_adjust_cfa_offset 8
	lea rax, [r13 + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 112]
	.cfi_adjust_cfa_offset 8
	lea rax, [rbx + r15 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	call engine::force::sweep::<f64>
	mov rdi, qword ptr [rsp + 112]
	mov r11, qword ptr [rsp + 280]
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	movsd xmm0, qword ptr [rsp + 224]
	movsd xmm1, qword ptr [rsp + 24]
	mulsd xmm0, xmm1
	mulsd xmm1, qword ptr [rsp + 232]
	addsd xmm0, qword ptr [r11 + rbp]
	movsd qword ptr [r11 + rbp], xmm0
	mov rax, qword ptr [rsp + 8]
	addsd xmm1, qword ptr [rax + rbp]
	movsd qword ptr [rax + rbp], xmm1
	dec r15
	add rbp, 8
	mov rax, r14
	add rax, r15
	jne .LBB146_9
.LBB146_14:
	mov rdx, qword ptr [rsp + 56]
	test rdx, rdx
	mov r14, qword ptr [rsp + 80]
	mov r15, qword ptr [rsp + 32]
	je .LBB146_76
	cmp rdx, 4
	jae .LBB146_70
	xor eax, eax
	mov rsi, qword ptr [rsp + 40]
	mov r8, qword ptr [rsp + 8]
	jmp .LBB146_73
.LBB146_70:
	movabs rax, 576460752303423484
	and rax, rdx
	and rdi, -32
	xor ecx, ecx
	mov rsi, qword ptr [rsp + 40]
	mov r8, qword ptr [rsp + 8]
	.p2align	4
.LBB146_71:
	movupd xmm0, xmmword ptr [r11 + rcx]
	movupd xmm1, xmmword ptr [r11 + rcx + 16]
	movupd xmm2, xmmword ptr [r8 + rcx]
	movupd xmm3, xmmword ptr [r8 + rcx + 16]
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
	jne .LBB146_71
	cmp rdx, rax
	je .LBB146_75
.LBB146_73:
	mov rcx, rax
	shl rcx, 4
	add rcx, rsi
	add rcx, 8
	.p2align	4
.LBB146_74:
	movsd xmm0, qword ptr [r11 + 8*rax]
	movsd xmm1, qword ptr [r8 + 8*rax]
	inc rax
	movsd qword ptr [rcx - 8], xmm0
	movsd qword ptr [rcx], xmm1
	add rcx, 16
	cmp rdx, rax
	jne .LBB146_74
.LBB146_75:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov r12, r11
	mov rdi, r8
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call rbx
.LBB146_76:
	cmp qword ptr [rsp + 160], 0
	mov rdi, qword ptr [rsp + 184]
	je .LBB146_78
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
.LBB146_78:
	cmp qword ptr [rsp + 136], 0
	je .LBB146_80
	.cfi_escape 0x2e, 0x00
	mov rdi, r15
	call qword ptr [rip + free@GOTPCREL]
.LBB146_80:
	cmp qword ptr [rsp + 112], 0
	je .LBB146_82
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call qword ptr [rip + free@GOTPCREL]
.LBB146_82:
	cmp qword ptr [rsp + 88], 0
	je .LBB146_83
	mov rdi, qword ptr [rsp + 96]
	add rsp, 264
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
.LBB146_83:
	.cfi_def_cfa_offset 320
	add rsp, 264
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
.LBB146_89:
	.cfi_def_cfa_offset 320
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
.LBB146_19:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_65
.LBB146_87:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_65
.LBB146_27:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, rbx
	call alloc::raw_vec::handle_error
	jmp .LBB146_65
.LBB146_64:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
	jmp .LBB146_65
.LBB146_68:
	.cfi_escape 0x2e, 0x00
	mov edi, 8
	mov rsi, qword ptr [rsp + 48]
	call alloc::raw_vec::handle_error
.LBB146_65:
	ud2
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_30
	jmp .LBB146_29
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB146_86
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_21
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	je .LBB146_86
.LBB146_21:
	.cfi_escape 0x2e, 0x00
	mov rdi, r12
	call qword ptr [rip + free@GOTPCREL]
	jmp .LBB146_85
	mov rbx, rax
	cmp qword ptr [rsp + 16], 0
	jne .LBB146_85
	jmp .LBB146_86
.LBB146_29:
	mov rbx, rax
.LBB146_30:
	cmp qword ptr [rsp + 160], 0
	jne .LBB146_31
	cmp qword ptr [rsp + 136], 0
	jne .LBB146_33
.LBB146_34:
	cmp qword ptr [rsp + 112], 0
	jne .LBB146_35
.LBB146_36:
	cmp qword ptr [rsp + 88], 0
	jne .LBB146_37
	jmp .LBB146_86
.LBB146_31:
	mov rdi, qword ptr [rsp + 168]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 136], 0
	je .LBB146_34
.LBB146_33:
	mov rdi, qword ptr [rsp + 144]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 112], 0
	je .LBB146_36
.LBB146_35:
	mov rdi, qword ptr [rsp + 120]
	.cfi_escape 0x2e, 0x00
	call qword ptr [rip + free@GOTPCREL]
	cmp qword ptr [rsp + 88], 0
	je .LBB146_86
.LBB146_37:
	mov rax, qword ptr [rsp + 96]
	mov qword ptr [rsp + 8], rax
.LBB146_85:
	.cfi_escape 0x2e, 0x00
	mov rdi, qword ptr [rsp + 8]
	call qword ptr [rip + free@GOTPCREL]
.LBB146_86:
	.cfi_escape 0x2e, 0x00
	mov rdi, rbx
	call _Unwind_Resume@PLT
