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
	vmovss xmm1, dword ptr [rip + .LCPI1950_0]
	vmovss xmm0, dword ptr [rbx + 316]
	lea rax, [rdi + 316]
	mov rsi, qword ptr [rbx + 8]
	mov rdx, qword ptr [rbx + 16]
	mov rcx, qword ptr [rbx + 32]
	mov r8, qword ptr [rbx + 40]
	xor r15d, r15d
	mov r9, -1
	mov qword ptr [rsp + 240], rax
	mov eax, dword ptr [rdi + 312]
	mov dword ptr [rsp + 312], eax
	mov rax, qword ptr [rdi + 304]
	add rdi, 192
	vmulss xmm2, xmm3, xmm1
	vmovaps xmmword ptr [rsp + 368], xmm3
	vcmpunordss k1, xmm2, xmm2
	vmaxss xmm2, xmm0, xmm2
	mov qword ptr [rsp + 304], rax
	vmovss xmm2 {k1}, xmm2, xmm0
	vmovshdup xmm0, xmm3
	vmovaps xmmword ptr [rsp + 352], xmm0
	vmulss xmm0, xmm0, xmm1
	vmaxss xmm1, xmm2, xmm0
	vcmpunordss k1, xmm0, xmm0
	vmovss xmm1 {k1}, xmm1, xmm2
	vmulss xmm0, xmm1, dword ptr [rip + .LCPI1950_1]
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
	mov rsi, rbx
	mov qword ptr [rbx + 112], 0
	mov qword ptr [rsp + 24], rsi
	lea rbx, [r14 + 4*rax]
	lea rax, [rsi + 96]
	mov r13, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_1
.LBB1950_8:
	mov rax, qword ptr [rsi + 104]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 112], r15
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
	cmp r15, qword ptr [rsi + 96]
	jne .LBB1950_8
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 24]
	jmp .LBB1950_8
.LBB1950_9:
	mov r13, qword ptr [rsi + 32]
	mov r12, qword ptr [rsi + 40]
	lea rax, [rsi + 120]
	mov qword ptr [rsi + 136], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_10
.LBB1950_17:
	mov rax, qword ptr [rsi + 128]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 136], r15
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
	cmp r15, qword ptr [rsi + 120]
	jne .LBB1950_17
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 24]
	jmp .LBB1950_17
.LBB1950_18:
	mov r13, qword ptr [rsi + 56]
	mov r12, qword ptr [rsi + 64]
	lea rax, [rsi + 144]
	mov qword ptr [rsi + 160], 0
	xor r15d, r15d
	mov rbp, r14
	mov qword ptr [rsp + 16], rax
	jmp .LBB1950_19
.LBB1950_26:
	mov rax, qword ptr [rsi + 152]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 160], r15
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
	cmp r15, qword ptr [rsi + 144]
	jne .LBB1950_26
	mov rdi, qword ptr [rsp + 16]
	mov edx, 1
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 24]
	jmp .LBB1950_26
.LBB1950_27:
	mov r13, qword ptr [rsi + 80]
	mov r12, qword ptr [rsi + 88]
	lea rbp, [rsi + 168]
	xor r15d, r15d
	mov qword ptr [rsi + 184], 0
	jmp .LBB1950_28
.LBB1950_35:
	mov rax, qword ptr [rsi + 176]
	vmovd dword ptr [rax + 4*r15], xmm0
	inc r15
	mov qword ptr [rsi + 184], r15
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
	cmp r15, qword ptr [rsi + 168]
	jne .LBB1950_35
	mov edx, 1
	mov rdi, rbp
	mov rsi, r15
	vmovd dword ptr [rsp + 8], xmm0
	call <alloc::raw_vec::RawVecInner<_>>::reserve::do_reserve_and_handle::<alloc::alloc::Global>
	vmovd xmm0, dword ptr [rsp + 8]
	mov rsi, qword ptr [rsp + 24]
	jmp .LBB1950_35
.LBB1950_36:
	vmovups zmm0, zmmword ptr [rsi + 96]
	vmovdqu64 zmm1, zmmword ptr [rsi]
	mov rax, qword ptr [rsi + 8]
	mov rdx, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov rdi, qword ptr [rsi + 112]
	mov qword ptr [rsp + 216], rax
	mov qword ptr [rsp + 208], rdx
	mov qword ptr [rsp + 200], rcx
	vmovups zmmword ptr [rsi], zmm0
	vmovdqu64 zmmword ptr [rsi + 96], zmm1
	vmovdqu ymm0, ymmword ptr [rsi + 64]
	vmovups xmm2, xmmword ptr [rsi + 160]
	mov rdx, qword ptr [rsi + 80]
	mov rcx, qword ptr [rsi + 176]
	mov rax, qword ptr [rsi + 64]
	mov qword ptr [rsp + 192], rdx
	vmovups xmmword ptr [rsi + 64], xmm2
	mov qword ptr [rsi + 80], rcx
	mov qword ptr [rsi + 88], r15
	vmovdqu ymmword ptr [rsi + 160], ymm0
	test rdi, rdi
	je .LBB1950_61
	vmovss xmm3, dword ptr [rsi + 320]
	vmovss xmm2, dword ptr [rsi + 316]
	vmovdqa64 ymm29, ymmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_7]
	vmovdqa64 zmm31, zmmword ptr [rip + .LCPI1950_8]
	vextracti128 xmm0, ymm0, 1
	mov qword ptr [rsp + 232], rdi
	vmulss xmm25, xmm3, xmm3
	vextracti128 xmm3, ymm1, 1
	vextracti32x4 xmm1, zmm1, 2
	vmulss xmm26, xmm2, xmm2
	vmovq rdx, xmm3
	vpextrq rcx, xmm1, 1
	cmp rcx, rdx
	cmovb rdx, rcx
	vpextrq rcx, xmm0, 1
	vbroadcastss ymm27, xmm26
	vbroadcastss ymm13, xmm25
	vmovaps xmmword ptr [rsp + 336], xmm25
	vmovaps xmmword ptr [rsp + 320], xmm26
	cmp rax, rdx
	cmovb rdx, rax
	vmovups ymmword ptr [rsp + 128], ymm13
	vmovups ymmword ptr [rsp + 384], ymm27
	cmp rcx, rdx
	cmovb rdx, rcx
	xor r8d, r8d
	mov qword ptr [rsp + 224], rdx
	jmp .LBB1950_38
.LBB1950_59:
	vmovaps xmm25, xmmword ptr [rsp + 336]
	vmovaps xmm26, xmmword ptr [rsp + 320]
	vmovups ymm27, ymmword ptr [rsp + 384]
	vmovups ymm13, ymmword ptr [rsp + 128]
	vmovdqa64 ymm29, ymmword ptr [rip + .LCPI1950_6]
	vmovdqa64 zmm30, zmmword ptr [rip + .LCPI1950_7]
	vmovdqa64 zmm31, zmmword ptr [rip + .LCPI1950_8]
	mov rsi, qword ptr [rsp + 24]
	mov rdi, qword ptr [rsp + 232]
	.p2align	4
.LBB1950_60:
	inc r8
	cmp r8, rdi
	je .LBB1950_61
.LBB1950_38:
	mov rbp, qword ptr [rsi + 16]
	cmp r8, rbp
	jae .LBB1950_60
	mov rax, qword ptr [rsi + 40]
	mov qword ptr [rsp + 88], rax
	cmp r8, rax
	jae .LBB1950_60
	mov rax, qword ptr [rsi + 64]
	mov rdx, qword ptr [rsi + 88]
	cmp r8, rax
	mov qword ptr [rsp + 72], rdx
	mov qword ptr [rsp + 80], rax
	setb cl
	cmp r8, rdx
	setb dl
	and dl, cl
	cmp dl, 1
	jne .LBB1950_60
	mov rax, qword ptr [rsi + 8]
	mov rdi, qword ptr [rsi + 32]
	mov rcx, qword ptr [rsi + 56]
	mov rdx, qword ptr [rsi + 80]
	vmovsd xmm6, qword ptr [rip + .LCPI1950_4]
	vxorpd xmm7, xmm7, xmm7
	mov qword ptr [rsp + 248], r8
	vmovss xmm28, dword ptr [rax + 4*r8]
	vmovss xmm1, dword ptr [rdi + 4*r8]
	vmovss xmm2, dword ptr [rcx + 4*r8]
	vmovss xmm3, dword ptr [rdx + 4*r8]
	mov qword ptr [rsp + 120], rax
	mov qword ptr [rsp + 112], rdi
	mov eax, 0
	mov qword ptr [rsp + 104], rcx
	mov rcx, qword ptr [rsi + 264]
	mov qword ptr [rsp + 96], rdx
	mov rdx, qword ptr [rsi + 272]
	mov qword ptr [rsp + 296], rcx
	vmovss dword ptr [rsp + 160], xmm28
	vmovss dword ptr [rsp + 164], xmm1
	vmovss dword ptr [rsp + 168], xmm2
	vmovss dword ptr [rsp + 172], xmm3
	vmovss xmm3, dword ptr [rsi + 280]
	vxorps xmm2, xmm2, xmm2
	vmovups xmmword ptr [rsp + 44], xmm2
	vmovaps xmmword ptr [rsp + 32], xmm2
	vxorps xmm2, xmm2, xmm2
	mov rsi, -1
	vmulss xmm4, xmm28, xmm3
	vmulss xmm3, xmm1, xmm3
	vmaxss xmm4, xmm4, xmm2
	vmaxss xmm3, xmm3, xmm2
	vcvtss2sd xmm5, xmm4, xmm4
	vucomisd xmm5, xmm7
	vcvttsd2usi rdi, xmm5
	cmovb rdi, rax
	vucomisd xmm5, xmm6
	vmovss xmm5, dword ptr [rip + .LCPI1950_3]
	cmova rdi, rsi
	sub rcx, 1
	cmovb rcx, rax
	cmp rcx, rdi
	cmovb rdi, rcx
	vucomiss xmm4, xmm5
	vcvtss2sd xmm4, xmm3, xmm3
	vcvttsd2usi r8, xmm4
	cmovae rdi, rax
	vucomisd xmm4, xmm7
	cmovb r8, rax
	vucomisd xmm4, xmm6
	vxorps xmm4, xmm4, xmm4
	cmova r8, rsi
	sub rdx, 1
	mov rsi, rdi
	cmovb rdx, rax
	cmp rdx, r8
	cmovb r8, rdx
	vucomiss xmm3, xmm5
	vxorps xmm5, xmm5, xmm5
	cmovae r8, rax
	sub rdi, 1
	cmovb rdi, rax
	mov r14, r8
	sub r14, 1
	cmovb r14, rax
	inc r8
	mov qword ptr [rsp + 280], rdi
	cmp rdx, r8
	cmovb r8, rdx
	mov qword ptr [rsp + 288], r8
	cmp r14, r8
	ja .LBB1950_57
	mov rax, qword ptr [rsp + 80]
	mov rdx, qword ptr [rsp + 72]
	inc rsi
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vbroadcastss ymm11, xmm1
	vbroadcastss ymm12, xmm28
	vxorps xmm21, xmm21, xmm21
	vxorps xmm23, xmm23, xmm23
	vxorps xmm3, xmm3, xmm3
	vxorps xmm5, xmm5, xmm5
	vxorpd xmm6, xmm6, xmm6
	vxorps xmm9, xmm9, xmm9
	vxorps xmm10, xmm10, xmm10
	vxorps xmm8, xmm8, xmm8
	vxorpd xmm7, xmm7, xmm7
	vxorps xmm24, xmm24, xmm24
	vxorps xmm22, xmm22, xmm22
	cmp rcx, rsi
	cmovb rsi, rcx
	cmp rax, rdx
	cmovb rdx, rax
	inc rsi
	mov qword ptr [rsp + 272], rsi
	mov rsi, qword ptr [rsp + 88]
	cmp rsi, rdx
	cmovb rdx, rsi
	mov qword ptr [rsp + 256], rdx
	mov rdx, qword ptr [rsp + 24]
	mov rdi, qword ptr [rdx + 208]
	mov rcx, qword ptr [rdx + 200]
	mov qword ptr [rsp + 264], rcx
	mov qword ptr [rsp], rdi
	.p2align	4
.LBB1950_43:
	mov rcx, qword ptr [rsp + 296]
	mov rax, qword ptr [rsp + 280]
	mov qword ptr [rsp + 8], r14
	imul rcx, r14
	lea rsi, [rcx + rax]
	cmp rsi, rdi
	jae .LBB1950_44
	add rcx, qword ptr [rsp + 272]
	mov r11d, 0
	mov edx, 0
	cmp rcx, rdi
	jae .LBB1950_47
	mov rax, qword ptr [rsp + 264]
	mov edx, dword ptr [rax + 4*rsi]
	mov r11d, dword ptr [rax + 4*rcx]
	jmp .LBB1950_47
	.p2align	4
.LBB1950_44:
	xor r11d, r11d
	xor edx, edx
.LBB1950_47:
	mov rax, qword ptr [rsp + 120]
	mov r13, r11
	sub r13, rdx
	mov r14, rbp
	mov r9, qword ptr [rsp + 104]
	setb r8b
	cmp r11, rbp
	mov ebp, 0
	mov rsi, r13
	mov rbx, r13
	seta cl
	or cl, r8b
	cmovne rsi, rbp
	lea rdi, [rax + 4*rdx]
	mov eax, 4
	lea r9, [r9 + 4*rdx]
	cmovne rdi, rax
	cmp r11, qword ptr [rsp + 88]
	seta cl
	or cl, r8b
	mov rcx, qword ptr [rsp + 112]
	cmovne rbx, rbp
	mov qword ptr [rsp + 16], rbx
	lea rcx, [rcx + 4*rdx]
	cmovne rcx, rax
	shr rbx, 3
	cmp r11, qword ptr [rsp + 80]
	seta r10b
	or r10b, r8b
	mov r10, r13
	cmovne r10, rbp
	cmovne r9, rax
	mov r15, r10
	shr r10, 3
	cmp r11, qword ptr [rsp + 72]
	seta r12b
	or r12b, r8b
	mov r12, qword ptr [rsp + 96]
	cmovne r13, rbp
	mov r8, r13
	lea r12, [r12 + 4*rdx]
	cmovne r12, rax
	mov rax, rsi
	shr rsi, 3
	shr r8, 3
	cmp rbx, rsi
	cmovb rsi, rbx
	cmp r10, rsi
	cmovb rsi, r10
	cmp r8, rsi
	cmovb rsi, r8
	test rsi, rsi
	je .LBB1950_50
	shl rsi, 5
	xor r8d, r8d
	vxorps xmm0, xmm0, xmm0
	.p2align	4
.LBB1950_49:
	vmovups ymm15, ymmword ptr [rdi + r8]
	vmovups ymm16, ymmword ptr [rcx + r8]
	vsubps ymm17, ymm12, ymm15
	vsubps ymm18, ymm11, ymm16
	vmulps ymm19, ymm17, ymm17
	vmulps ymm20, ymm18, ymm18
	vaddps ymm4, ymm19, ymm20
	vcmpltps ymm14, ymm4, ymm13
	vcmpleps k1, ymm13, ymm4
	vandps ymm14, ymm14, ymm2
	vcmpltps k1 {k1}, ymm4, ymm27
	vcmpltps ymm4, ymm0, ymm4
	vmulps ymm17, ymm17, ymm14
	vmulps ymm14, ymm18, ymm14
	vandps ymm4 {k1} {z}, ymm4, ymm2
	vaddps ymm6, ymm4, ymm6
	vaddps ymm5, ymm5, ymm17
	vmulps ymm17, ymm15, ymm4
	vmulps ymm15, ymm16, ymm4
	vmulps ymm16, ymm4, ymmword ptr [r9 + r8]
	vaddps ymm3, ymm14, ymm3
	vaddps ymm8, ymm15, ymm8
	vmulps ymm15, ymm4, ymmword ptr [r12 + r8]
	vaddps ymm7, ymm7, ymm17
	add r8, 32
	vaddps ymm10, ymm16, ymm10
	vaddps ymm9, ymm15, ymm9
	cmp rsi, r8
	jne .LBB1950_49
.LBB1950_50:
	mov r8d, eax
	and r8d, 7
	mov r10, r11
	sub r10, 8
	mov edx, 0
	mov rbp, r14
	cmovae rdx, r10
	test r8, r8
	je .LBB1950_62
	lea rbx, [rdx + 8]
	cmp rbx, rbp
	ja .LBB1950_62
	cmp rbx, qword ptr [rsp + 256]
	ja .LBB1950_62
	sub r11, rdx
	vmovdqa64 zmm2, zmmword ptr [rip + .LCPI1950_9]
	vmovq xmm16, r8
	vxorps xmm0, xmm0, xmm0
	mov rax, r11
	sub rax, r8
	cmp r11, 2
	vpinsrq xmm14, xmm31, r11, 0
	setae cl
	cmp rax, 3
	vmovq xmm4, rax
	vinserti32x4 zmm14, zmm31, xmm14, 0
	setb dil
	cmp r11, 4
	vpunpcklqdq xmm4, xmm16, xmm4
	setae r9b
	cmp rax, 5
	setb r10b
	cmp r11, 6
	setae sil
	cmp rax, 7
	mov eax, 1
	vmovd xmm15, eax
	setb bl
	cmp r11, 8
	vpinsrb xmm15, xmm15, ecx, 1
	setae al
	mov rcx, qword ptr [rsp + 112]
	vpermq zmm14, zmm2, zmm14
	vpinsrb xmm15, xmm15, edi, 2
	vpinsrb xmm15, xmm15, r9d, 3
	vpinsrb xmm15, xmm15, r10d, 4
	vpinsrb xmm15, xmm15, esi, 5
	vpinsrb xmm15, xmm15, ebx, 6
	vpinsrb xmm15, xmm15, eax, 7
	mov eax, 2
	vmovq xmm16, rax
	mov rax, qword ptr [rsp + 120]
	vinserti32x4 ymm4, ymm4, xmm16, 1
	vpermt2q zmm4, zmm30, zmm29
	vmovups ymm20, ymmword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsp + 104]
	vpcmpeqq k0, zmm4, zmm14
	vpcmpltuq k1, zmm4, zmm14
	vpmovm2d ymm4, k0
	vpmovm2d ymm14, k1
	vpblendd ymm4, ymm14, ymm4, 1
	vpmovd2m k1, ymm4
	vpmovzxbq zmm4, xmm15
	vmovups ymm15, ymmword ptr [rcx + 4*rdx]
	vsubps ymm16, ymm12, ymm20
	vptestmq k0 {k1}, zmm4, qword ptr [rip + .LCPI1950_5]{1to8}
	vmulps ymm18, ymm16, ymm16
	vsubps ymm17, ymm11, ymm15
	vmulps ymm19, ymm17, ymm17
	vpmovm2d ymm4, k0
	vpsrld ymm4, ymm4, 31
	vcvtdq2ps ymm4, ymm4
	vaddps ymm2, ymm18, ymm19
	vcmpleps k1, ymm13, ymm2
	vcmpltps ymm13, ymm0, ymm2
	vcmpltps k1 {k1}, ymm2, ymm27
	vcmpltps ymm2, ymm2, ymmword ptr [rsp + 128]
	vandps ymm13 {k1} {z}, ymm13, dword ptr [rip + .LCPI1950_2]{1to8}
	vandps ymm2, ymm2, dword ptr [rip + .LCPI1950_2]{1to8}
	vmulps ymm13, ymm13, ymm4
	vmulps ymm18, ymm13, ymmword ptr [rax + 4*rdx]
	mov rax, qword ptr [rsp + 96]
	vmulps ymm2, ymm4, ymm2
	vaddps ymm6, ymm13, ymm6
	vmulps ymm4, ymm16, ymm2
	vmulps ymm2, ymm17, ymm2
	vmulps ymm19, ymm13, ymmword ptr [rax + 4*rdx]
	mov rdx, qword ptr [rsp + 8]
	vaddps ymm3, ymm3, ymm2
	vmulps ymm2, ymm20, ymm13
	vaddps ymm5, ymm5, ymm4
	vaddps ymm10, ymm18, ymm10
	vaddps ymm7, ymm7, ymm2
	vmulps ymm2, ymm15, ymm13
	vmovups ymm13, ymmword ptr [rsp + 128]
	vaddps ymm8, ymm8, ymm2
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vaddps ymm9, ymm19, ymm9
	jmp .LBB1950_54
	.p2align	4
.LBB1950_62:
	mov r14, qword ptr [rsp + 16]
	mov r10d, r15d
	mov r11d, r13d
	and r10d, 7
	and r11d, 7
	mov edx, r14d
	and edx, 7
	cmp rdx, r8
	cmovb r8, rdx
	mov rdx, qword ptr [rsp + 8]
	cmp r10, r8
	cmovb r8, r10
	cmp r11, r8
	cmovb r8, r11
	test r8, r8
	je .LBB1950_54
	mov rsi, rax
	and esi, -8
	and r14d, -8
	and r15d, -8
	and r13d, -8
	vmovss xmm15, dword ptr [rdi + 4*rsi]
	vmovss xmm16, dword ptr [rcx + 4*r14]
	mov rax, rsi
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_64
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_67
	.p2align	4
.LBB1950_64:
	vucomiss xmm26, xmm19
	jbe .LBB1950_67
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_67
	vmovss xmm2, dword ptr [r9 + 4*r15]
	vmovss xmm4, dword ptr [r12 + 4*r13]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_67:
	cmp r8d, 1
	je .LBB1950_68
	vmovss xmm15, dword ptr [rdi + 4*rax + 4]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 4]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_70
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_74
.LBB1950_70:
	vucomiss xmm26, xmm19
	jbe .LBB1950_74
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_74
	vmovss xmm2, dword ptr [r9 + 4*r15 + 4]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 4]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_74:
	cmp r8d, 2
	je .LBB1950_68
	vmovss xmm15, dword ptr [rdi + 4*rax + 8]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 8]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_76
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_80
.LBB1950_76:
	vucomiss xmm26, xmm19
	jbe .LBB1950_80
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_80
	vmovss xmm2, dword ptr [r9 + 4*r15 + 8]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 8]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_80:
	cmp r8d, 3
	je .LBB1950_68
	vmovss xmm15, dword ptr [rdi + 4*rax + 12]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 12]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_82
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_86
.LBB1950_82:
	vucomiss xmm26, xmm19
	jbe .LBB1950_86
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_86
	vmovss xmm2, dword ptr [r9 + 4*r15 + 12]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 12]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_86:
	cmp r8d, 4
	je .LBB1950_68
	vmovss xmm15, dword ptr [rdi + 4*rax + 16]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 16]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_88
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_92
.LBB1950_88:
	vucomiss xmm26, xmm19
	jbe .LBB1950_92
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_92
	vmovss xmm2, dword ptr [r9 + 4*r15 + 16]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 16]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_92:
	cmp r8d, 5
	je .LBB1950_68
	vmovss xmm15, dword ptr [rdi + 4*rax + 20]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 20]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_94
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_98
.LBB1950_94:
	vucomiss xmm26, xmm19
	jbe .LBB1950_98
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_98
	vmovss xmm2, dword ptr [r9 + 4*r15 + 20]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 20]
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm13, xmm15, xmm16, 16
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
.LBB1950_98:
	cmp r8d, 6
	jne .LBB1950_99
	.p2align	4
.LBB1950_68:
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
.LBB1950_54:
	mov rdi, qword ptr [rsp]
.LBB1950_55:
	lea r14, [rdx + 1]
	cmp rdx, qword ptr [rsp + 288]
	jne .LBB1950_43
	jmp .LBB1950_56
.LBB1950_99:
	vmovss xmm15, dword ptr [rdi + 4*rax + 24]
	vmovss xmm16, dword ptr [rcx + 4*r14 + 24]
	vsubss xmm17, xmm28, xmm15
	vsubss xmm18, xmm1, xmm16
	vmulss xmm2, xmm17, xmm17
	vmulss xmm4, xmm18, xmm18
	vaddss xmm19, xmm2, xmm4
	vucomiss xmm25, xmm19
	jbe .LBB1950_100
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	vaddss xmm24, xmm24, xmm17
	vaddss xmm23, xmm23, xmm18
	jmp .LBB1950_54
.LBB1950_100:
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	mov rdi, qword ptr [rsp]
	vucomiss xmm26, xmm19
	jbe .LBB1950_55
	vxorps xmm0, xmm0, xmm0
	vucomiss xmm19, xmm0
	jbe .LBB1950_55
	vmovss xmm2, dword ptr [r9 + 4*r15 + 24]
	vmovss xmm4, dword ptr [r12 + 4*r13 + 24]
	vinsertps xmm13, xmm15, xmm16, 16
	vaddss xmm22, xmm22, dword ptr [rip + .LCPI1950_2]
	vinsertps xmm2, xmm13, xmm2, 32
	vmovups ymm13, ymmword ptr [rsp + 128]
	vinsertps xmm2, xmm2, xmm4, 48
	vaddps xmm21, xmm21, xmm2
	vbroadcastss ymm2, dword ptr [rip + .LCPI1950_2]
	jmp .LBB1950_55
.LBB1950_56:
	vpmovsxbd xmm2, dword ptr [rip + .LCPI1950_12]
	vunpcklps xmm0, xmm7, xmm8
	vinsertps xmm1, xmm8, xmm7, 76
	vmovaps xmmword ptr [rsp + 32], xmm21
	vmovss dword ptr [rsp + 48], xmm22
	vmovss dword ptr [rsp + 52], xmm24
	vmovss dword ptr [rsp + 56], xmm23
	vmovlhps xmm0, xmm0, xmm10
	vshufps xmm1, xmm1, xmm10, 212
	vinsertps xmm0, xmm0, xmm9, 48
	vinsertps xmm1, xmm1, xmm9, 112
	vaddps xmm0, xmm0, xmm1
	vunpckhps xmm1, xmm7, xmm8
	vmovsd xmm1, xmm10, xmm1
	vinsertps xmm1, xmm1, xmm9, 176
	vaddps xmm0, xmm0, xmm1
	vmovaps xmm1, xmm7
	vpermt2ps xmm1, xmm2, xmm8
	vextractf128 xmm2, ymm7, 1
	vshufps xmm1, xmm1, xmm10, 244
	vextractf128 xmm10, ymm10, 1
	vblendps xmm1, xmm1, xmm9, 8
	vextractf128 xmm9, ymm9, 1
	vaddps xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm8, 1
	vunpcklps xmm4, xmm2, xmm1
	vmovlhps xmm4, xmm4, xmm10
	vinsertps xmm4, xmm4, xmm9, 48
	vaddps xmm0, xmm0, xmm4
	vinsertps xmm4, xmm1, xmm2, 76
	vunpckhps xmm1, xmm2, xmm1
	vshufpd xmm2, xmm6, xmm6, 1
	vshufps xmm4, xmm4, xmm10, 212
	vmovsd xmm1, xmm10, xmm1
	vinsertps xmm2, xmm2, xmm5, 156
	vinsertps xmm4, xmm4, xmm9, 112
	vinsertps xmm1, xmm1, xmm9, 176
	vaddps xmm0, xmm0, xmm4
	vextractf128 xmm4, ymm6, 1
	vaddps xmm0, xmm0, xmm1
	vpmovsxbd xmm1, dword ptr [rip + .LCPI1950_13]
	vpermt2ps ymm7, ymm1, ymm8
	vshufps xmm1, xmm7, xmm10, 244
	vblendps xmm1, xmm1, xmm9, 8
	vaddps xmm0, xmm0, xmm1
	vhaddps xmm1, xmm6, xmm5
	vshufps xmm1, xmm1, xmm1, 232
	vaddps xmm1, xmm1, xmm2
	vshufpd xmm2, xmm5, xmm5, 1
	vinsertps xmm2, xmm2, xmm6, 204
	vaddps xmm1, xmm1, xmm2
	vextractf128 xmm2, ymm5, 1
	vinsertps xmm5, xmm4, xmm2, 28
	vaddps xmm1, xmm1, xmm5
	vinsertps xmm5, xmm2, xmm4, 76
	vaddps xmm1, xmm1, xmm5
	vshufpd xmm5, xmm4, xmm4, 1
	vinsertps xmm5, xmm5, xmm2, 156
	vshufpd xmm2, xmm2, xmm2, 1
	vinsertps xmm2, xmm2, xmm4, 204
	vaddps xmm4, xmm0, xmm21
	vmovshdup xmm0, xmm3
	vaddps xmm1, xmm1, xmm5
	vaddss xmm0, xmm3, xmm0
	vaddps xmm1, xmm1, xmm2
	vmovsd xmm2, qword ptr [rsp + 48]
	vaddps xmm5, xmm1, xmm2
	vshufpd xmm1, xmm3, xmm3, 1
	vaddss xmm0, xmm0, xmm1
	vshufps xmm1, xmm3, xmm3, 255
	vaddss xmm0, xmm0, xmm1
	vextractf128 xmm1, ymm3, 1
	vmovshdup xmm2, xmm1
	vaddss xmm0, xmm0, xmm1
	vaddss xmm0, xmm0, xmm2
	vshufpd xmm2, xmm1, xmm1, 1
	vshufps xmm1, xmm1, xmm1, 255
	vaddss xmm0, xmm0, xmm2
	vaddss xmm0, xmm0, xmm1
	vaddss xmm2, xmm0, xmm23
.LBB1950_57:
	vmovaps xmm0, xmmword ptr [rsp + 368]
	vmovdqa xmm1, xmmword ptr [rsp + 352]
	mov rsi, qword ptr [rsp + 240]
	lea rdi, [rsp + 176]
	lea rdx, [rsp + 304]
	lea rcx, [rsp + 160]
	lea r8, [rsp + 32]
	vmovaps xmmword ptr [rsp + 32], xmm4
	vmovlps qword ptr [rsp + 48], xmm5
	vmovss dword ptr [rsp + 56], xmm2
	vzeroupper
	call swarm::rules::finish
	mov r8, qword ptr [rsp + 248]
	cmp r8, qword ptr [rsp + 224]
	jae .LBB1950_59
	vmovss xmm0, dword ptr [rsp + 176]
	vmovd xmm1, dword ptr [rsp + 180]
	mov rax, qword ptr [rsp + 216]
	mov rcx, qword ptr [rsp + 208]
	vmovss xmm2, dword ptr [rsp + 184]
	vmovss xmm3, dword ptr [rsp + 188]
	mov rdx, qword ptr [rsp + 200]
	vmovss dword ptr [rax + 4*r8], xmm0
	vmovd dword ptr [rcx + 4*r8], xmm1
	mov rcx, qword ptr [rsp + 192]
	vmovss dword ptr [rdx + 4*r8], xmm2
	vmovss dword ptr [rcx + 4*r8], xmm3
	jmp .LBB1950_59
.LBB1950_61:
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
