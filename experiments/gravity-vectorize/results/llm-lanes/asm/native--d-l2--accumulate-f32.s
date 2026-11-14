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
	sub rsp, 248
	.cfi_def_cfa_offset 304
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov r14, rdx
	mov rdx, qword ptr [rsi + 16]
	mov r13, rcx
	movabs rcx, 9223372036854775805
	lea rbp, [4*rdx]
	mov rax, rdx
	shr rax, 62
	sete al
	cmp rbp, rcx
	setb cl
	test al, cl
	jne .LBB149_1
	.cfi_escape 0x2e, 0x00
	call alloc::raw_vec::capacity_overflow
.LBB149_1:
	mov qword ptr [rsp + 56], r13
	mov qword ptr [rsp + 40], rdi
	test rbp, rbp
	je .LBB149_2
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 8], rsi
	.cfi_escape 0x2e, 0x00
	mov r15, qword ptr [rip + malloc@GOTPCREL]
	mov rdi, rbp
	call r15
	mov qword ptr [rsp + 24], rax
	test rax, rax
	je .LBB149_103
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB149_20
	mov r12, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB149_101
	mov rbx, rax
	.cfi_escape 0x2e, 0x00
	mov rdi, rbp
	call r15
	test rax, rax
	je .LBB149_28
	mov rsi, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 24]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB149_3
.LBB149_2:
	mov ebx, 4
	mov r13d, 4
	mov r12d, 4
	mov eax, 4
.LBB149_3:
	mov rcx, qword ptr [rsi + 64]
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 96], rdx
	mov qword ptr [rsp + 120], rdx
	mov qword ptr [rsp + 152], rdx
	mov qword ptr [rsp + 80], r13
	mov qword ptr [rsp + 104], r12
	mov qword ptr [rsp + 128], rbx
	mov qword ptr [rsp + 160], rax
	mov qword ptr [rsp + 88], 0
	mov qword ptr [rsp + 112], 0
	mov qword ptr [rsp + 136], 0
	mov qword ptr [rsp + 168], 0
	cmp rcx, rdx
	cmovb rdx, rcx
	test rdx, rdx
	je .LBB149_4
	mov rax, qword ptr [rsi + 56]
	mov r12, qword ptr [rsi + 8]
	xor ebx, ebx
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 64], rax
	jmp .LBB149_41
	.p2align	4
.LBB149_52:
	vmovss xmm0, dword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 160]
	vmovss dword ptr [rax + 4*rbp], xmm0
	inc rbp
	mov qword ptr [rsp + 168], rbp
	cmp qword ptr [rsp + 16], rbx
	je .LBB149_5
.LBB149_41:
	mov rax, qword ptr [rsp + 64]
	vmovss xmm0, dword ptr [r12 + 8*rbx]
	vmovss xmm2, dword ptr [r12 + 8*rbx + 4]
	vmovss xmm1, dword ptr [rax + 4*rbx]
	mov rax, r13
	vmovss dword ptr [rsp + 8], xmm0
	vmovss dword ptr [rsp + 32], xmm2
	vmovss dword ptr [rsp + 24], xmm1
	cmp rbx, qword ptr [rsp + 72]
	jne .LBB149_44
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 72]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	mov rax, qword ptr [rsp + 80]
.LBB149_44:
	vmovss xmm0, dword ptr [rsp + 8]
	mov r13, rax
	vmovss dword ptr [rax + 4*rbx], xmm0
	inc rbx
	mov rax, qword ptr [rsp + 112]
	mov qword ptr [rsp + 88], rbx
	mov r15, rax
	cmp rax, qword ptr [rsp + 96]
	jne .LBB149_46
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 96]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_46:
	vmovss xmm0, dword ptr [rsp + 32]
	vmovss xmm3, dword ptr [rsp + 24]
	mov rax, qword ptr [rsp + 104]
	vxorps xmm2, xmm2, xmm2
	vxorps xmm1, xmm1, xmm1
	vmovss dword ptr [rsp + 8], xmm1
	mov qword ptr [rsp + 208], rax
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	vucomiss xmm3, xmm2
	mov qword ptr [rsp + 32], r15
	mov qword ptr [rsp + 112], r15
	jne .LBB149_47
	jp .LBB149_47
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	je .LBB149_49
	jmp .LBB149_50
	.p2align	4
.LBB149_47:
	vmovss xmm0, dword ptr [rip + .LCPI149_0]
	vdivss xmm0, xmm0, dword ptr [rsp + 24]
	vmovss dword ptr [rsp + 8], xmm0
	mov r15, qword ptr [rsp + 136]
	cmp r15, qword ptr [rsp + 120]
	jne .LBB149_50
.LBB149_49:
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 120]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
.LBB149_50:
	vmovss xmm0, dword ptr [rsp + 8]
	mov rax, qword ptr [rsp + 128]
	mov qword ptr [rsp + 200], rax
	vmovss dword ptr [rax + 4*r15], xmm0
	inc r15
	mov rbp, qword ptr [rsp + 168]
	mov qword ptr [rsp + 136], r15
	cmp rbp, qword ptr [rsp + 152]
	jne .LBB149_52
	.cfi_escape 0x2e, 0x00
	lea rdi, [rsp + 152]
	call <alloc::raw_vec::RawVec<f32>>::grow_one
	jmp .LBB149_52
.LBB149_4:
	mov qword ptr [rsp + 200], rbx
	mov qword ptr [rsp + 208], r12
	mov qword ptr [rsp + 32], 0
	xor r15d, r15d
	xor ebp, ebp
	xor ebx, ebx
.LBB149_5:
	mov r13, qword ptr [rsp + 56]
	mov qword ptr [rsp + 192], rax
	lea rdi, [4*r13]
	mov qword ptr [rsp + 48], rdi
	test r13, r13
	je .LBB149_6
	.cfi_escape 0x2e, 0x00
	mov r12, qword ptr [rip + malloc@GOTPCREL]
	call r12
	test rax, rax
	je .LBB149_68
	cmp r13, 9
	jae .LBB149_61
	xor esi, esi
	jmp .LBB149_56
.LBB149_6:
	mov eax, 4
	mov r11d, 4
	mov qword ptr [rsp + 8], rax
	jmp .LBB149_7
.LBB149_61:
	cmp r13, 65
	jae .LBB149_63
	xor esi, esi
	jmp .LBB149_66
.LBB149_63:
	vmovaps zmm0, zmmword ptr [rip + .LCPI149_1]
	mov edx, r13d
	and edx, 63
	mov ecx, 64
	mov rsi, r13
	cmovne rcx, rdx
	xor edx, edx
	sub rsi, rcx
	.p2align	4
.LBB149_64:
	vmovups zmm1, zmmword ptr [r14 + 8*rdx]
	vmovups zmm2, zmmword ptr [r14 + 8*rdx + 128]
	vmovups zmm3, zmmword ptr [r14 + 8*rdx + 256]
	vmovups zmm4, zmmword ptr [r14 + 8*rdx + 384]
	vpermt2ps zmm1, zmm0, zmmword ptr [r14 + 8*rdx + 64]
	vpermt2ps zmm2, zmm0, zmmword ptr [r14 + 8*rdx + 192]
	vpermt2ps zmm3, zmm0, zmmword ptr [r14 + 8*rdx + 320]
	vpermt2ps zmm4, zmm0, zmmword ptr [r14 + 8*rdx + 448]
	vmovups zmmword ptr [rax + 4*rdx], zmm1
	vmovups zmmword ptr [rax + 4*rdx + 64], zmm2
	vmovups zmmword ptr [rax + 4*rdx + 128], zmm3
	vmovups zmmword ptr [rax + 4*rdx + 192], zmm4
	add rdx, 64
	cmp rsi, rdx
	jne .LBB149_64
	cmp ecx, 8
	jbe .LBB149_56
.LBB149_66:
	mov rcx, rsi
	mov esi, r13d
	and esi, 7
	mov edx, 8
	cmovne rdx, rsi
	mov rsi, r13
	sub rsi, rdx
	.p2align	4
.LBB149_67:
	vmovups ymm0, ymmword ptr [r14 + 8*rcx]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rcx + 32], 136
	vpermpd ymm0, ymm0, 216
	vmovups ymmword ptr [rax + 4*rcx], ymm0
	add rcx, 8
	cmp rsi, rcx
	jne .LBB149_67
	.p2align	4
.LBB149_56:
	vmovss xmm0, dword ptr [r14 + 8*rsi]
	vmovss dword ptr [rax + 4*rsi], xmm0
	inc rsi
	cmp r13, rsi
	jne .LBB149_56
	mov qword ptr [rsp + 8], rax
	.cfi_escape 0x2e, 0x00
	lea rdi, [4*r13]
	vzeroupper
	call r12
	test rax, rax
	je .LBB149_77
	mov r11, rax
	cmp r13, 9
	jae .LBB149_70
	xor eax, eax
	jmp .LBB149_60
.LBB149_70:
	cmp r13, 65
	jae .LBB149_72
	xor eax, eax
	jmp .LBB149_75
.LBB149_72:
	vmovaps zmm0, zmmword ptr [rip + .LCPI149_1]
	mov eax, r13d
	and eax, 63
	mov ecx, 64
	cmovne rcx, rax
	mov rax, r13
	xor edx, edx
	sub rax, rcx
	.p2align	4
.LBB149_73:
	vmovups zmm1, zmmword ptr [r14 + 8*rdx + 4]
	vmovups zmm2, zmmword ptr [r14 + 8*rdx + 132]
	vmovups zmm3, zmmword ptr [r14 + 8*rdx + 260]
	vmovups zmm4, zmmword ptr [r14 + 8*rdx + 388]
	vpermt2ps zmm1, zmm0, zmmword ptr [r14 + 8*rdx + 68]
	vpermt2ps zmm2, zmm0, zmmword ptr [r14 + 8*rdx + 196]
	vpermt2ps zmm3, zmm0, zmmword ptr [r14 + 8*rdx + 324]
	vpermt2ps zmm4, zmm0, zmmword ptr [r14 + 8*rdx + 452]
	vmovups zmmword ptr [r11 + 4*rdx], zmm1
	vmovups zmmword ptr [r11 + 4*rdx + 64], zmm2
	vmovups zmmword ptr [r11 + 4*rdx + 128], zmm3
	vmovups zmmword ptr [r11 + 4*rdx + 192], zmm4
	add rdx, 64
	cmp rax, rdx
	jne .LBB149_73
	cmp ecx, 8
	jbe .LBB149_60
.LBB149_75:
	mov rcx, rax
	mov eax, r13d
	and eax, 7
	mov edx, 8
	cmovne rdx, rax
	mov rax, r13
	sub rax, rdx
	.p2align	4
.LBB149_76:
	vmovups ymm0, ymmword ptr [r14 + 8*rcx + 4]
	vshufps ymm0, ymm0, ymmword ptr [r14 + 8*rcx + 36], 136
	vpermpd ymm0, ymm0, 216
	vmovups ymmword ptr [r11 + 4*rcx], ymm0
	add rcx, 8
	cmp rax, rcx
	jne .LBB149_76
	.p2align	4
.LBB149_60:
	vmovss xmm0, dword ptr [r14 + 8*rax + 4]
	vmovss dword ptr [r11 + 4*rax], xmm0
	inc rax
	cmp r13, rax
	jne .LBB149_60
.LBB149_7:
	test rbx, rbx
	je .LBB149_14
	mov rcx, qword ptr [rsp + 40]
	mov rax, qword ptr [rsp + 80]
	xor r12d, r12d
	xor r13d, r13d
	mov qword ptr [rsp + 240], r11
	vmovss xmm0, dword ptr [rcx]
	vmovss xmm1, dword ptr [rcx + 4]
	mov qword ptr [rsp + 232], rax
	vmovss dword ptr [rsp + 148], xmm0
	vmovss dword ptr [rsp + 40], xmm1
	.p2align	4
.LBB149_9:
	mov rax, qword ptr [rsp + 32]
	add rax, r13
	je .LBB149_14
	mov rax, r15
	add rax, r13
	je .LBB149_14
	mov rax, rbp
	add rax, r13
	je .LBB149_14
	cmp qword ptr [rsp + 48], r12
	je .LBB149_14
	mov rdi, qword ptr [rsp + 32]
	mov rsi, qword ptr [rsp + 208]
	mov rax, qword ptr [rsp + 232]
	lea rcx, [rbx + r13 - 1]
	lea r9, [rdi + r13 - 1]
	mov rdi, qword ptr [rsp + 192]
	lea r8, [rsi + r12 + 4]
	vmovss xmm1, dword ptr [rsi + r12]
	mov rsi, qword ptr [rsp + 200]
	lea rdx, [rax + r12 + 4]
	add rax, r12
	vmovss xmm0, dword ptr [rax]
	vmovss xmm2, dword ptr [rdi + r12]
	lea rax, [rsi + r12 + 4]
	mov qword ptr [rsp + 16], rax
	lea rax, [rdi + r12 + 4]
	mov rdi, qword ptr [rsp + 8]
	mov qword ptr [rsp + 64], rax
	mov rax, qword ptr [rsp + 56]
	vmovss dword ptr [rsp + 24], xmm2
	vmovss xmm2, dword ptr [rsp + 148]
	vmulss xmm2, xmm2, dword ptr [rsi + r12]
	lea r10, [rax + r13 - 1]
	lea rax, [r11 + r12 + 4]
	lea r11, [rdi + r12 + 4]
	vmovss dword ptr [rsp + 220], xmm0
	vmovss dword ptr [rsp + 224], xmm1
	vmovss dword ptr [rsp + 228], xmm2
	.cfi_escape 0x2e, 0x40
	vmovss xmm0, dword ptr [rsp + 40]
	lea rdi, [rsp + 176]
	lea rsi, [rsp + 220]
	push r10
	.cfi_adjust_cfa_offset 8
	push rax
	.cfi_adjust_cfa_offset 8
	push r10
	.cfi_adjust_cfa_offset 8
	push r11
	.cfi_adjust_cfa_offset 8
	lea rax, [rbp + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 104]
	.cfi_adjust_cfa_offset 8
	lea rax, [r15 + r13 - 1]
	push rax
	.cfi_adjust_cfa_offset 8
	push qword ptr [rsp + 72]
	.cfi_adjust_cfa_offset 8
	vzeroupper
	call engine::force::sweep::<f32>
	add rsp, 64
	.cfi_adjust_cfa_offset -64
	mov rcx, qword ptr [rsp + 184]
	mov rax, qword ptr [rsp + 176]
	mov qword ptr [rsp + 16], rcx
	mov qword ptr [rsp + 176], rax
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 176]
	call engine::force::tree_sum::<f32>
	mov rax, qword ptr [rsp + 8]
	vmulss xmm0, xmm0, dword ptr [rsp + 24]
	mov rcx, qword ptr [rsp + 16]
	vaddss xmm0, xmm0, dword ptr [rax + r12]
	vmovss dword ptr [rax + r12], xmm0
	mov qword ptr [rsp + 176], rcx
	.cfi_escape 0x2e, 0x00
	mov esi, 2
	lea rdi, [rsp + 176]
	call engine::force::tree_sum::<f32>
	mov r11, qword ptr [rsp + 240]
	vmulss xmm0, xmm0, dword ptr [rsp + 24]
	dec r13
	mov rax, rbx
	vaddss xmm0, xmm0, dword ptr [r11 + r12]
	vmovss dword ptr [r11 + r12], xmm0
	add r12, 4
	add rax, r13
	jne .LBB149_9
.LBB149_14:
	mov rdi, qword ptr [rsp + 56]
	test rdi, rdi
	je .LBB149_89
	cmp rdi, 8
	jae .LBB149_79
	mov r8, qword ptr [rsp + 8]
	xor eax, eax
	jmp .LBB149_17
.LBB149_79:
	mov r8, qword ptr [rsp + 8]
	movabs rcx, 1152921504606846944
	cmp rdi, 32
	jae .LBB149_81
	xor eax, eax
	jmp .LBB149_85
.LBB149_81:
	vmovaps zmm0, zmmword ptr [rip + .LCPI149_2]
	vmovaps zmm1, zmmword ptr [rip + .LCPI149_3]
	mov rdx, rdi
	shr rdx, 5
	mov rax, rdi
	and rax, rcx
	xor esi, esi
	shl rdx, 6
	.p2align	4
.LBB149_82:
	vmovups zmm2, zmmword ptr [r8 + 2*rsi]
	vmovups zmm3, zmmword ptr [r8 + 2*rsi + 64]
	vmovups zmm4, zmmword ptr [r11 + 2*rsi]
	vmovups zmm5, zmmword ptr [r11 + 2*rsi + 64]
	vmovaps zmm6, zmm2
	vpermt2ps zmm6, zmm0, zmm4
	vpermt2ps zmm2, zmm1, zmm4
	vmovaps zmm4, zmm3
	vpermt2ps zmm4, zmm0, zmm5
	vpermt2ps zmm3, zmm1, zmm5
	vmovups zmmword ptr [r14 + 4*rsi + 64], zmm2
	vmovups zmmword ptr [r14 + 4*rsi], zmm6
	vmovups zmmword ptr [r14 + 4*rsi + 192], zmm3
	vmovups zmmword ptr [r14 + 4*rsi + 128], zmm4
	add rsi, 64
	cmp rdx, rsi
	jne .LBB149_82
	cmp rdi, rax
	je .LBB149_88
	test dil, 24
	je .LBB149_17
.LBB149_85:
	vmovaps zmm0, zmmword ptr [rip + .LCPI149_4]
	add rcx, 24
	mov rdx, rax
	mov rax, rcx
	and rax, rdi
	.p2align	4
.LBB149_86:
	vbroadcastf64x4 zmm1, ymmword ptr [r11 + 4*rdx]
	vbroadcastf64x4 zmm2, ymmword ptr [r8 + 4*rdx]
	vpermt2ps zmm2, zmm0, zmm1
	vmovups zmmword ptr [r14 + 8*rdx], zmm2
	add rdx, 8
	cmp rax, rdx
	jne .LBB149_86
	jmp .LBB149_87
.LBB149_103:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
.LBB149_20:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_69
.LBB149_101:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_69
.LBB149_28:
	.cfi_escape 0x2e, 0x00
	mov edi, 4
	mov rsi, rbp
	call alloc::raw_vec::handle_error
	jmp .LBB149_69
.LBB149_68:
	.cfi_escape 0x2e, 0x00
	mov rsi, qword ptr [rsp + 48]
	mov edi, 4
	call alloc::raw_vec::handle_error
	jmp .LBB149_69
.LBB149_77:
	.cfi_escape 0x2e, 0x00
	mov rsi, qword ptr [rsp + 48]
	mov edi, 4
	call alloc::raw_vec::handle_error
.LBB149_69:
	ud2
	mov r14, rax
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 8]
	call rax
	jmp .LBB149_31
	jmp .LBB149_30
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	je .LBB149_100
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, rbx
	call rax
	jmp .LBB149_22
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	je .LBB149_100
.LBB149_22:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, r12
	call rax
	jmp .LBB149_99
	cmp qword ptr [rsp + 16], 0
	mov r14, rax
	jne .LBB149_99
	jmp .LBB149_100
.LBB149_30:
	mov r14, rax
.LBB149_31:
	cmp qword ptr [rsp + 152], 0
	jne .LBB149_32
	cmp qword ptr [rsp + 120], 0
	jne .LBB149_34
.LBB149_35:
	cmp qword ptr [rsp + 96], 0
	jne .LBB149_36
.LBB149_37:
	cmp qword ptr [rsp + 72], 0
	jne .LBB149_38
	jmp .LBB149_100
.LBB149_32:
	mov rdi, qword ptr [rsp + 160]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 120], 0
	je .LBB149_35
.LBB149_34:
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 96], 0
	je .LBB149_37
.LBB149_36:
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	call rax
	cmp qword ptr [rsp + 72], 0
	je .LBB149_100
.LBB149_38:
	mov rax, qword ptr [rsp + 80]
	mov qword ptr [rsp + 24], rax
.LBB149_99:
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	mov rdi, qword ptr [rsp + 24]
	call rax
.LBB149_100:
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call _Unwind_Resume@PLT
.LBB149_17:
	vmovss xmm0, dword ptr [r8 + 4*rax]
	vmovss xmm1, dword ptr [r11 + 4*rax]
	vmovss dword ptr [r14 + 8*rax], xmm0
	vmovss dword ptr [r14 + 8*rax + 4], xmm1
	inc rax
.LBB149_87:
	cmp rdi, rax
	jne .LBB149_17
.LBB149_88:
	.cfi_escape 0x2e, 0x00
	mov rbx, qword ptr [rip + free@GOTPCREL]
	mov rdi, r11
	mov r14, r8
	vzeroupper
	call rbx
	.cfi_escape 0x2e, 0x00
	mov rdi, r14
	call rbx
.LBB149_89:
	cmp qword ptr [rsp + 152], 0
	mov rdi, qword ptr [rsp + 192]
	je .LBB149_91
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB149_91:
	cmp qword ptr [rsp + 120], 0
	je .LBB149_93
	mov rdi, qword ptr [rsp + 128]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB149_93:
	cmp qword ptr [rsp + 96], 0
	je .LBB149_95
	mov rdi, qword ptr [rsp + 104]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB149_95:
	cmp qword ptr [rsp + 72], 0
	je .LBB149_97
	mov rdi, qword ptr [rsp + 80]
	.cfi_escape 0x2e, 0x00
	mov rax, qword ptr [rip + free@GOTPCREL]
	vzeroupper
	call rax
.LBB149_97:
	add rsp, 248
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
