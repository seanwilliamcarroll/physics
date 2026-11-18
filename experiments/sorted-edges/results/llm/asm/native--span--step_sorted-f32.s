<swarm::flock::Flock>::step_sorted:
	.cfi_startproc
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
	sub rsp, 424
	.cfi_def_cfa_offset 480
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov rbx, rdi
	vmovsd xmm3, qword ptr [rbx + 288]
	vmovss xmm0, dword ptr [rip + .LCPI1950_0]
	vmovss xmm2, dword ptr [rbx + 316]
	lea rax, [rdi + 316]
	mov rsi, qword ptr [rbx + 8]
	mov rdx, qword ptr [rbx + 16]
	mov rcx, qword ptr [rbx + 32]
	mov r8, qword ptr [rbx + 40]
	xor r15d, r15d
	mov r9, -1
	mov qword ptr [rsp + 136], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 248], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm1, xmm3, xmm0
	vmovaps xmmword ptr [rsp + 64], xmm2
	vmovaps xmmword ptr [rsp + 336], xmm3
	vcmpunordss k1, xmm1, xmm1
	vmaxss xmm1, xmm2, xmm1
	mov qword ptr [rsp + 240], rax
	vmovss xmm1 {k1}, xmm1, xmm2
	vmovshdup xmm2, xmm3
	vmulss xmm0, xmm2, xmm0
	vmovaps xmmword ptr [rsp + 320], xmm2
	vmaxss xmm2, xmm1, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm2 {k1}, xmm2, xmm1
	vmulss xmm0, xmm2, dword ptr [rip + .LCPI1950_1]
	vmovss xmm1, dword ptr [rip + .LCPI1950_2]
	vxorps xmm2, xmm2, xmm2
	vdivss xmm0, xmm1, xmm0
	vmovss dword ptr [rbx + 280], xmm0
	vbroadcastss xmm0, xmm0
	vmulps xmm0, xmm3, xmm0
	vmovsd xmm3, qword ptr [rip + .LCPI1950_4]
	vroundps xmm0, xmm0, 10
	vcmpltps k1, xmm0, dword ptr [rip + .LCPI1950_3]{1to4}
	vcvtps2pd xmm1, xmm0
	vcmpleps k0, xmm2, xmm0
	vxorps xmm0, xmm0, xmm0
	vucomisd xmm1, xmm0
	vcvttsd2usi rax, xmm1
	kandw k1, k0, k1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	vshufpd xmm1, xmm1, xmm1, 1
	cmova rax, r9
	vucomisd xmm1, xmm0
	vmovq xmm2, rax
	vcvttsd2usi rax, xmm1
	cmovb rax, r15
	vucomisd xmm1, xmm3
	cmova rax, r9
	vmovq xmm0, rax
	vpunpcklqdq xmm0, xmm2, xmm0
	vpbroadcastq xmm2, qword ptr [rip + .LCPI1950_5]
	vpmaxuq xmm2 {k1}, xmm0, xmm2
	vmovdqu xmmword ptr [rbx + 264], xmm2
	call <swarm::grid::Grid>::fill
	mov r14, qword ptr [rbx + 248]
	mov rax, qword ptr [rbx + 256]
	mov rbp, qword ptr [rbx + 8]
	mov r12, qword ptr [rbx + 16]
	mov rdx, rbx
	mov qword ptr [rbx + 112], 0
	mov qword ptr [rsp + 16], rdx
	lea rbx, [r14 + 4*rax]
	lea rax, [rdx + 96]
	mov r13, r14
	mov qword ptr [rsp + 8], rax
	jmp .LBB1950_1
.LBB1950_8:
	mov rax, qword ptr [rdx + 104]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 112], r15
	.p2align	4
.LBB1950_1:
	cmp r13, rbx
	je .LBB1950_2
	mov eax, dword ptr [r13]
	add r13, 4
	cmp r12, rax
	jbe .LBB1950_1
	vmovd xmm0, dword ptr [rbp + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_6
	jmp .LBB1950_9
.LBB1950_2:
	xor eax, eax
	mov r13, rbx
	cmp eax, 1
	jne .LBB1950_9
.LBB1950_6:
	cmp r15, qword ptr [rdx + 96]
	jne .LBB1950_8
	mov rdi, qword ptr [rsp + 8]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rdx + 32]
	mov r12, qword ptr [rdx + 40]
	lea rax, [rdx + 120]
	mov qword ptr [rdx + 136], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 8], rax
	jmp .LBB1950_10
.LBB1950_17:
	mov rax, qword ptr [rdx + 128]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 136], r15
	.p2align	4
.LBB1950_10:
	cmp rbp, rbx
	je .LBB1950_11
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_10
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_15
	jmp .LBB1950_18
.LBB1950_11:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_18
.LBB1950_15:
	cmp r15, qword ptr [rdx + 120]
	jne .LBB1950_17
	mov rdi, qword ptr [rsp + 8]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rdx + 56]
	mov r12, qword ptr [rdx + 64]
	lea rax, [rdx + 144]
	mov qword ptr [rdx + 160], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 8], rax
	jmp .LBB1950_19
.LBB1950_26:
	mov rax, qword ptr [rdx + 152]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 160], r15
	.p2align	4
.LBB1950_19:
	cmp rbp, rbx
	je .LBB1950_20
	mov eax, dword ptr [rbp]
	add rbp, 4
	cmp r12, rax
	jbe .LBB1950_19
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_24
	jmp .LBB1950_27
.LBB1950_20:
	xor eax, eax
	mov rbp, rbx
	cmp eax, 1
	jne .LBB1950_27
.LBB1950_24:
	cmp r15, qword ptr [rdx + 144]
	jne .LBB1950_26
	mov rdi, qword ptr [rsp + 8]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1950_26
.LBB1950_27:
	mov r13, qword ptr [rdx + 80]
	mov r12, qword ptr [rdx + 88]
	lea rbp, [rdx + 168]
	xor r15d, r15d
	mov qword ptr [rdx + 184], 0
	jmp .LBB1950_28
.LBB1950_35:
	mov rax, qword ptr [rdx + 176]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rdx + 184], r15
	.p2align	4
.LBB1950_28:
	cmp r14, rbx
	je .LBB1950_29
	mov eax, dword ptr [r14]
	add r14, 4
	cmp r12, rax
	jbe .LBB1950_28
	vmovd xmm0, dword ptr [r13 + 4*rax]
	mov eax, 1
	cmp eax, 1
	je .LBB1950_33
	jmp .LBB1950_36
.LBB1950_29:
	xor eax, eax
	mov r14, rbx
	cmp eax, 1
	jne .LBB1950_36
.LBB1950_33:
	cmp r15, qword ptr [rdx + 168]
	jne .LBB1950_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovd dword ptr [rsp], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp]
	mov rdx, qword ptr [rsp + 16]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups zmm0, zmmword ptr [rdx + 96]
	vmovdqu64 zmm1, zmmword ptr [rdx]
	mov rax, qword ptr [rdx + 8]
	mov rdi, qword ptr [rdx + 32]
	mov rcx, qword ptr [rdx + 56]
	mov rsi, qword ptr [rdx + 112]
	mov qword ptr [rsp + 112], rax
	mov qword ptr [rsp + 104], rdi
	mov qword ptr [rsp + 96], rcx
	vmovups zmmword ptr [rdx], zmm0
	vmovdqu64 zmmword ptr [rdx + 96], zmm1
	vmovdqu ymm0, ymmword ptr [rdx + 64]
	vmovups xmm2, xmmword ptr [rdx + 160]
	mov rdi, qword ptr [rdx + 80]
	mov rcx, qword ptr [rdx + 176]
	mov rax, qword ptr [rdx + 64]
	mov qword ptr [rsp + 88], rdi
	vmovups xmmword ptr [rdx + 64], xmm2
	mov qword ptr [rdx + 80], rcx
	mov qword ptr [rdx + 88], r15
	vmovdqu ymmword ptr [rdx + 160], ymm0
	test rsi, rsi
	je .LBB1950_98
	vmovss xmm2, dword ptr [rdx + 320]
	vextracti128 xmm3, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vbroadcastss ymm28, dword ptr [rip + .LCPI1950_2]
	vextracti128 xmm0, ymm0, 1
	vxorps xmm27, xmm27, xmm27
	mov qword ptr [rsp + 128], rsi
	vmovq rdi, xmm3
	vpextrq rcx, xmm1, 1
	cmp rcx, rdi
	cmovb rdi, rcx
	vpextrq rcx, xmm0, 1
	cmp rax, rdi
	cmovb rdi, rax
	cmp rcx, rdi
	cmovb rdi, rcx
	vmulss xmm23, xmm2, xmm2
	vmovaps xmm2, xmmword ptr [rsp + 64]
	mov qword ptr [rsp + 120], rdi
	xor edi, edi
	vbroadcastss ymm0, xmm23
	vmovaps xmmword ptr [rsp + 304], xmm23
	vmovups ymmword ptr [rsp + 384], ymm0
	vmulss xmm24, xmm2, xmm2
	vbroadcastss ymm25, xmm24
	vmovaps xmmword ptr [rsp + 288], xmm24
	vmovups ymmword ptr [rsp + 352], ymm25
	jmp .LBB1950_38
.LBB1950_96:
	vmovaps xmm23, xmmword ptr [rsp + 304]
	vmovaps xmm24, xmmword ptr [rsp + 288]
	vmovups ymm25, ymmword ptr [rsp + 352]
	vbroadcastss ymm28, dword ptr [rip + .LCPI1950_2]
	mov rdx, qword ptr [rsp + 16]
	mov rsi, qword ptr [rsp + 128]
	vxorps xmm27, xmm27, xmm27
	.p2align	4
.LBB1950_97:
	inc rdi
	cmp rdi, rsi
	je .LBB1950_98
.LBB1950_38:
	mov rax, qword ptr [rdx + 16]
	mov qword ptr [rsp + 8], rax
	cmp rdi, rax
	jae .LBB1950_97
	mov rax, qword ptr [rdx + 40]
	mov qword ptr [rsp + 64], rax
	cmp rdi, rax
	jae .LBB1950_97
	mov rax, qword ptr [rdx + 64]
	mov rcx, qword ptr [rdx + 88]
	cmp rdi, rax
	mov qword ptr [rsp + 232], rax
	mov qword ptr [rsp + 224], rcx
	setb al
	cmp rdi, rcx
	setb cl
	and cl, al
	cmp cl, 1
	jne .LBB1950_97
	mov rax, qword ptr [rdx + 8]
	mov rcx, qword ptr [rdx + 56]
	vmovsd xmm6, qword ptr [rip + .LCPI1950_4]
	vxorpd xmm7, xmm7, xmm7
	mov qword ptr [rsp + 144], rdi
	vmovss xmm9, dword ptr [rip + .LCPI1950_3]
	mov rsi, -1
	vxorps xmm8, xmm8, xmm8
	mov qword ptr [rsp + 216], rax
	vmovss xmm0, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rdx + 32]
	vmovss xmm2, dword ptr [rcx + 4*rdi]
	mov qword ptr [rsp + 200], rcx
	mov rcx, qword ptr [rdx + 272]
	mov qword ptr [rsp + 208], rax
	vmovss xmm1, dword ptr [rax + 4*rdi]
	mov rax, qword ptr [rdx + 80]
	vmovss xmm3, dword ptr [rax + 4*rdi]
	vmovss dword ptr [rsp + 32], xmm0
	mov qword ptr [rsp + 192], rax
	mov rax, qword ptr [rdx + 264]
	vmovss dword ptr [rsp + 36], xmm1
	vmovss dword ptr [rsp + 40], xmm2
	vxorps xmm2, xmm2, xmm2
	mov qword ptr [rsp + 184], rax
	vmovss dword ptr [rsp + 44], xmm3
	vmovss xmm3, dword ptr [rdx + 280]
	mov edx, 0
	vmulss xmm4, xmm0, xmm3
	vmulss xmm3, xmm1, xmm3
	vmaxss xmm4, xmm4, xmm2
	vmaxss xmm3, xmm3, xmm2
	vroundss xmm4, xmm4, xmm4, 9
	vroundss xmm3, xmm3, xmm3, 9
	vcvtss2sd xmm5, xmm4, xmm4
	vucomisd xmm5, xmm7
	vcvttsd2usi rdi, xmm5
	cmovb rdi, rdx
	vucomisd xmm5, xmm6
	cmova rdi, rsi
	sub rax, 1
	cmovb rax, rdx
	cmp rax, rdi
	cmovb rdi, rax
	vucomiss xmm4, xmm9
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2usi r8, xmm4
	cmovae rdi, rdx
	vucomisd xmm4, xmm7
	cmovb r8, rdx
	vucomisd xmm4, xmm6
	vxorps xmm4, xmm4, xmm4
	cmova r8, rsi
	sub rcx, 1
	mov rsi, rdi
	cmovb rcx, rdx
	cmp rcx, r8
	cmovb r8, rcx
	vucomiss xmm3, xmm9
	cmovae r8, rdx
	sub rdi, 1
	cmovb rdi, rdx
	mov r14, r8
	sub r14, 1
	cmovb r14, rdx
	inc r8
	mov qword ptr [rsp + 168], rdi
	cmp rcx, r8
	cmovb r8, rcx
	mov qword ptr [rsp + 176], r8
	cmp r14, r8
	ja .LBB1950_94
	mov rdx, qword ptr [rsp + 16]
	inc rsi
	vbroadcastss ymm13, xmm1
	vbroadcastss ymm14, xmm0
	vxorps xmm22, xmm22, xmm22
	vxorps xmm26, xmm26, xmm26
	vxorps xmm3, xmm3, xmm3
	vxorpd xmm6, xmm6, xmm6
	vxorpd xmm7, xmm7, xmm7
	vxorps xmm11, xmm11, xmm11
	vxorps xmm12, xmm12, xmm12
	vxorps xmm10, xmm10, xmm10
	vxorps xmm9, xmm9, xmm9
	vxorps xmm29, xmm29, xmm29
	vxorps xmm21, xmm21, xmm21
	cmp rax, rsi
	cmovb rsi, rax
	inc rsi
	mov qword ptr [rsp + 160], rsi
	mov rcx, qword ptr [rdx + 200]
	mov rdi, qword ptr [rdx + 208]
	mov qword ptr [rsp + 152], rcx
	mov qword ptr [rsp + 24], rdi
	jmp .LBB1950_45
	.p2align	4
.LBB1950_53:
	mov rdi, qword ptr [rsp + 24]
.LBB1950_44:
	mov rax, qword ptr [rsp]
	lea r14, [rax + 1]
	cmp rax, qword ptr [rsp + 176]
	je .LBB1950_93
.LBB1950_45:
	mov rcx, qword ptr [rsp + 184]
	mov rax, qword ptr [rsp + 168]
	mov qword ptr [rsp], r14
	imul rcx, r14
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_46
	add rcx, qword ptr [rsp + 160]
	mov edx, 0
	mov eax, 0
	cmp rcx, rdi
	jae .LBB1950_49
	mov rdx, qword ptr [rsp + 152]
	mov eax, dword ptr [rdx + 4*rsi]
	mov edx, dword ptr [rdx + 4*rcx]
	jmp .LBB1950_49
	.p2align	4
.LBB1950_46:
	xor edx, edx
	xor eax, eax
.LBB1950_49:
	mov r11, rdx
	sub r11, rax
	mov rsi, qword ptr [rsp + 216]
	mov ebp, 0
	mov r8d, 4
	setb bl
	cmp rdx, qword ptr [rsp + 8]
	mov r13, r11
	mov r10, r11
	mov r14, r11
	lea r9, [rsi + 4*rax]
	mov rsi, qword ptr [rsp + 200]
	seta cl
	or cl, bl
	cmovne r13, rbp
	cmovne r9, r8
	cmp rdx, qword ptr [rsp + 64]
	lea rsi, [rsi + 4*rax]
	seta cl
	or cl, bl
	mov rcx, qword ptr [rsp + 208]
	cmovne r10, rbp
	mov r12, r10
	lea rcx, [rcx + 4*rax]
	cmovne rcx, r8
	shr r12, 3
	cmp rdx, qword ptr [rsp + 232]
	seta dil
	or dil, bl
	cmovne r14, rbp
	cmovne rsi, r8
	mov rdi, r14
	shr rdi, 3
	cmp rdx, qword ptr [rsp + 224]
	seta dl
	or dl, bl
	mov rdx, qword ptr [rsp + 192]
	cmovne r11, rbp
	lea r15, [rdx + 4*rax]
	mov rdx, r13
	mov rax, r11
	cmovne r15, r8
	shr rdx, 3
	shr rax, 3
	cmp r12, rdx
	cmovb rdx, r12
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp rax, rdx
	cmovb rdx, rax
	test rdx, rdx
	je .LBB1950_52
	vmovups ymm2, ymmword ptr [rsp + 384]
	shl rdx, 5
	xor eax, eax
	vxorps xmm4, xmm4, xmm4
	.p2align	4
.LBB1950_51:
	vmovups ymm15, ymmword ptr [r9 + rax]
	vmovups ymm16, ymmword ptr [rcx + rax]
	vsubps ymm17, ymm14, ymm15
	vsubps ymm18, ymm13, ymm16
	vmulps ymm19, ymm17, ymm17
	vmulps ymm20, ymm18, ymm18
	vaddps ymm5, ymm19, ymm20
	vcmpltps ymm8, ymm5, ymm2
	vcmpleps k1, ymm2, ymm5
	vandps ymm8, ymm8, ymm28
	vcmpltps k1 {k1}, ymm5, ymm25
	vcmpltps ymm5, ymm4, ymm5
	vmulps ymm17, ymm17, ymm8
	vmulps ymm8, ymm18, ymm8
	vandps ymm5 {k1} {z}, ymm5, ymm28
	vaddps ymm7, ymm5, ymm7
	vaddps ymm6, ymm6, ymm17
	vmulps ymm17, ymm15, ymm5
	vmulps ymm15, ymm16, ymm5
	vmulps ymm16, ymm5, ymmword ptr [rsi + rax]
	vaddps ymm3, ymm8, ymm3
	vaddps ymm10, ymm15, ymm10
	vmulps ymm15, ymm5, ymmword ptr [r15 + rax]
	vaddps ymm9, ymm9, ymm17
	add rax, 32
	vaddps ymm12, ymm16, ymm12
	vaddps ymm11, ymm15, ymm11
	cmp rdx, rax
	jne .LBB1950_51
.LBB1950_52:
	mov eax, r10d
	mov edx, r13d
	and eax, 7
	and edx, 7
	mov edi, r14d
	mov ebx, r11d
	and edi, 7
	and ebx, 7
	cmp rax, rdx
	cmovb rdx, rax
	cmp rdi, rdx
	cmovb rdx, rdi
	cmp rbx, rdx
	cmovb rdx, rbx
	test rdx, rdx
	je .LBB1950_53
	and r13d, -8
	and r10d, -8
	mov rdi, qword ptr [rsp + 24]
	and r14d, -8
	and r11d, -8
	vmovss xmm15, dword ptr [r9 + 4*r13]
	vmovss xmm16, dword ptr [rcx + 4*r10]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_55
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_58
	.p2align	4
.LBB1950_55:
	vucomiss xmm24, xmm19
	jbe .LBB1950_58
	vucomiss xmm19, xmm27
	jbe .LBB1950_58
	vmovss xmm5, dword ptr [rsi + 4*r14]
	vmovss xmm8, dword ptr [r15 + 4*r11]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_58:
	cmp edx, 1
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 4]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 4]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_60
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_64
.LBB1950_60:
	vucomiss xmm24, xmm19
	jbe .LBB1950_64
	vucomiss xmm19, xmm27
	jbe .LBB1950_64
	vmovss xmm5, dword ptr [rsi + 4*r14 + 4]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 4]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_64:
	cmp edx, 2
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 8]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 8]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_66
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_70
.LBB1950_66:
	vucomiss xmm24, xmm19
	jbe .LBB1950_70
	vucomiss xmm19, xmm27
	jbe .LBB1950_70
	vmovss xmm5, dword ptr [rsi + 4*r14 + 8]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 8]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_70:
	cmp edx, 3
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 12]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 12]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_72
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_76
.LBB1950_72:
	vucomiss xmm24, xmm19
	jbe .LBB1950_76
	vucomiss xmm19, xmm27
	jbe .LBB1950_76
	vmovss xmm5, dword ptr [rsi + 4*r14 + 12]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 12]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_76:
	cmp edx, 4
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 16]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 16]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_78
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_82
.LBB1950_78:
	vucomiss xmm24, xmm19
	jbe .LBB1950_82
	vucomiss xmm19, xmm27
	jbe .LBB1950_82
	vmovss xmm5, dword ptr [rsi + 4*r14 + 16]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 16]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_82:
	cmp edx, 5
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 20]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 20]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_84
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_88
.LBB1950_84:
	vucomiss xmm24, xmm19
	jbe .LBB1950_88
	vucomiss xmm19, xmm27
	jbe .LBB1950_88
	vmovss xmm5, dword ptr [rsi + 4*r14 + 20]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 20]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
.LBB1950_88:
	cmp edx, 6
	je .LBB1950_44
	vmovss xmm15, dword ptr [r9 + 4*r13 + 24]
	vmovss xmm16, dword ptr [rcx + 4*r10 + 24]
	vsubss xmm17, xmm0, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm5, xmm17, xmm17
	vmulss xmm8, xmm18, xmm18
	vaddss xmm19, xmm5, xmm8
	vucomiss xmm23, xmm19
	jbe .LBB1950_90
	vaddss xmm29, xmm29, xmm17
	vaddss xmm26, xmm26, xmm18
	jmp .LBB1950_44
.LBB1950_90:
	vucomiss xmm24, xmm19
	jbe .LBB1950_44
	vucomiss xmm19, xmm27
	jbe .LBB1950_44
	vmovss xmm5, dword ptr [rsi + 4*r14 + 24]
	vaddss xmm21, xmm21, dword ptr [rip + .LCPI1950_2]
	vmovss xmm8, dword ptr [r15 + 4*r11 + 24]
	vinsertps xmm15, xmm15, xmm16, 16
	vinsertps xmm5, xmm15, xmm5, 32
	vinsertps xmm5, xmm5, xmm8, 48
	vaddps xmm22, xmm22, xmm5
	jmp .LBB1950_44
.LBB1950_93:
	vpmovsxbd xmm2, dword ptr [rip + .LCPI1950_8]
	vunpcklps xmm0, xmm9, xmm10
	vinsertps xmm1, xmm10, xmm9, 76
	vextractf128 xmm5, ymm9, 1
	vmovlhps xmm0, xmm0, xmm12
	vshufps xmm1, xmm1, xmm12, 212
	vinsertps xmm0, xmm0, xmm11, 48
	vinsertps xmm1, xmm1, xmm11, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm9, xmm10
	vmovsd xmm1, xmm12, xmm1
	vinsertps xmm1, xmm1, xmm11, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm9
	vpermt2ps xmm1, xmm2, xmm10
	vshufps xmm1, xmm1, xmm12, 244
	vextractf128 xmm12, ymm12, 1
	vblendps xmm1, xmm1, xmm11, 8
	vextractf128 xmm11, ymm11, 1
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm10, 1
	vunpcklps xmm8, xmm5, xmm1
	vmovlhps xmm8, xmm8, xmm12
	vinsertps xmm8, xmm8, xmm11, 48
	vaddps xmm0, xmm8, xmm0
	vinsertps xmm8, xmm1, xmm5, 76
	vunpckhps xmm1, xmm5, xmm1
	vextractf128 xmm5, ymm7, 1
	vshufps xmm8, xmm8, xmm12, 212
	vmovsd xmm1, xmm12, xmm1
	vinsertps xmm8, xmm8, xmm11, 112
	vinsertps xmm1, xmm1, xmm11, 176
	vaddps xmm0, xmm8, xmm0
	vaddps xmm0, xmm0, xmm1
	vpmovsxbd xmm1, dword ptr [rip + .LCPI1950_9]
	vpermt2ps ymm9, ymm1, ymm10
	vshufps xmm1, xmm9, xmm12, 244
	vblendps xmm1, xmm1, xmm11, 8
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm7, xmm7, 1
	vinsertps xmm1, xmm1, xmm6, 156
	vaddps xmm8, xmm22, xmm0
	vhaddps xmm0, xmm7, xmm6
	vshufps xmm0, xmm0, xmm0, 232
	vaddps xmm0, xmm0, xmm1
	vshufpd xmm1, xmm6, xmm6, 1
	vinsertps xmm1, xmm1, xmm7, 204
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm6, 1
	vinsertps xmm6, xmm5, xmm1, 28
	vaddps xmm0, xmm0, xmm6
	vinsertps xmm6, xmm1, xmm5, 76
	vaddps xmm0, xmm0, xmm6
	vshufpd xmm6, xmm5, xmm5, 1
	vinsertps xmm6, xmm6, xmm1, 156
	vshufpd xmm1, xmm1, xmm1, 1
	vinsertps xmm1, xmm1, xmm5, 204
	vaddps xmm0, xmm0, xmm6
	vaddps xmm0, xmm0, xmm1
	vinsertps xmm1, xmm21, xmm29, 16
	vaddps xmm4, xmm1, xmm0
	vmovshdup xmm0, xmm3
	vshufpd xmm1, xmm3, xmm3, 1
	vaddss xmm0, xmm3, xmm0
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm3, xmm3, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm3, 1
	vmovshdup xmm3, xmm1
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm3
	vshufpd xmm3, xmm1, xmm1, 1
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm3
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm26, xmm0
.LBB1950_94:
	vmovaps xmm0, xmmword ptr [rsp + 336]
	vmovdqa xmm1, xmmword ptr [rsp + 320]
	mov rsi, qword ptr [rsp + 136]
	lea rdi, [rsp + 48]
	lea rdx, [rsp + 240]
	lea rcx, [rsp + 32]
	lea r8, [rsp + 256]
	vmovaps xmmword ptr [rsp + 256], xmm8
	vmovlps qword ptr [rsp + 272], xmm4
	vmovss dword ptr [rsp + 280], xmm2
	vzeroupper
	call swarm::rules::finish
	mov rdi, qword ptr [rsp + 144]
	cmp rdi, qword ptr [rsp + 120]
	jae .LBB1950_96
	vmovss xmm0, dword ptr [rsp + 48]
	vmovd xmm1, dword ptr [rsp + 52]
	mov rax, qword ptr [rsp + 112]
	mov rcx, qword ptr [rsp + 104]
	vmovss xmm2, dword ptr [rsp + 56]
	vmovss xmm3, dword ptr [rsp + 60]
	mov rdx, qword ptr [rsp + 96]
	vmovss dword ptr [rax + 4*rdi], xmm0
	vmovd dword ptr [rcx + 4*rdi], xmm1
	mov rcx, qword ptr [rsp + 88]
	vmovss dword ptr [rdx + 4*rdi], xmm2
	vmovss dword ptr [rcx + 4*rdi], xmm3
	jmp .LBB1950_96
.LBB1950_98:
	add rsp, 424
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
