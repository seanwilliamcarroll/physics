engine::force::sweep::<f32>:
	.functype	engine::force::sweep::<f32> (i32, i32, f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, f32, f32, i32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, i32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
	i32.const 0
	local.set 15
	global.get __stack_pointer
	i32.const 128
	i32.sub 
	local.tee 16
	i32.const 0
	i32.store 60
	local.get 16
	i64.const 0
	i64.store 52:p2align=2
	local.get 16
	i64.const 0
	i64.store 44:p2align=2
	local.get 16
	i64.const 0
	i64.store 36:p2align=2
	local.get 16
	i64.const 0
	i64.store 28:p2align=2
	local.get 16
	i64.const 0
	i64.store 20:p2align=2
	local.get 16
	i64.const 0
	i64.store 12:p2align=2
	local.get 16
	i64.const 0
	i64.store 4:p2align=2
	local.get 16
	i64.const 0
	i64.store 68:p2align=2
	local.get 16
	i64.const 0
	i64.store 76:p2align=2
	local.get 16
	i64.const 0
	i64.store 84:p2align=2
	local.get 16
	i64.const 0
	i64.store 92:p2align=2
	local.get 16
	i64.const 0
	i64.store 100:p2align=2
	local.get 16
	i64.const 0
	i64.store 108:p2align=2
	local.get 16
	i64.const 0
	i64.store 116:p2align=2
	local.get 16
	i32.const 0
	i32.store 124
	block 
	block 
	local.get 14
	i32.const 4
	i32.shr_u
	local.tee 17
	local.get 12
	i32.const 4
	i32.shr_u
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 10
	i32.const 4
	i32.shr_u
	local.tee 18
	local.get 8
	i32.const 4
	i32.shr_u
	local.tee 19
	local.get 6
	i32.const 4
	i32.shr_u
	local.tee 20
	local.get 4
	i32.const 4
	i32.shr_u
	local.tee 21
	local.get 20
	local.get 21
	i32.lt_u
	i32.select
	local.tee 20
	local.get 19
	local.get 20
	i32.lt_u
	i32.select
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	br_if 0
	f32.const 0x0p0
	local.set 22
	f32.const 0x0p0
	local.set 23
	br 1
	end_block
	local.get 17
	i32.const 6
	i32.shl 
	local.set 24
	local.get 1
	f32.load 8
	local.set 25
	local.get 1
	f32.load 4
	local.set 26
	local.get 1
	f32.load 0
	local.set 27
	f32.const 0x0p0
	local.set 28
	f32.const 0x0p0
	local.set 29
	f32.const 0x0p0
	local.set 30
	f32.const 0x0p0
	local.set 31
	f32.const 0x0p0
	local.set 32
	f32.const 0x0p0
	local.set 33
	f32.const 0x0p0
	local.set 34
	f32.const 0x0p0
	local.set 35
	f32.const 0x0p0
	local.set 36
	f32.const 0x0p0
	local.set 37
	f32.const 0x0p0
	local.set 38
	f32.const 0x0p0
	local.set 39
	f32.const 0x0p0
	local.set 40
	f32.const 0x0p0
	local.set 41
	f32.const 0x0p0
	local.set 42
	f32.const 0x0p0
	local.set 43
	f32.const 0x0p0
	local.set 44
	f32.const 0x0p0
	local.set 45
	f32.const 0x0p0
	local.set 46
	f32.const 0x0p0
	local.set 47
	f32.const 0x0p0
	local.set 48
	f32.const 0x0p0
	local.set 49
	f32.const 0x0p0
	local.set 50
	f32.const 0x0p0
	local.set 51
	f32.const 0x0p0
	local.set 52
	f32.const 0x0p0
	local.set 53
	f32.const 0x0p0
	local.set 54
	f32.const 0x0p0
	local.set 55
	f32.const 0x0p0
	local.set 56
	f32.const 0x0p0
	local.set 57
	f32.const 0x0p0
	local.set 23
	f32.const 0x0p0
	local.set 22
	loop 
	local.get 11
	local.get 15
	i32.add 
	local.tee 17
	i32.const 4
	i32.add 
	local.tee 58
	f32.load 0
	local.set 59
	local.get 9
	local.get 15
	i32.add 
	local.tee 18
	i32.const 4
	i32.add 
	f32.load 0
	local.set 60
	local.get 7
	local.get 15
	i32.add 
	local.tee 19
	i32.const 4
	i32.add 
	f32.load 0
	local.set 61
	local.get 3
	local.get 15
	i32.add 
	local.tee 20
	i32.const 4
	i32.add 
	f32.load 0
	local.set 62
	local.get 5
	local.get 15
	i32.add 
	local.tee 21
	i32.const 4
	i32.add 
	f32.load 0
	local.set 63
	local.get 17
	i32.const 8
	i32.add 
	local.tee 64
	f32.load 0
	local.set 65
	local.get 18
	i32.const 8
	i32.add 
	f32.load 0
	local.set 66
	local.get 19
	i32.const 8
	i32.add 
	f32.load 0
	local.set 67
	local.get 20
	i32.const 8
	i32.add 
	f32.load 0
	local.set 68
	local.get 21
	i32.const 8
	i32.add 
	f32.load 0
	local.set 69
	local.get 17
	i32.const 12
	i32.add 
	local.tee 70
	f32.load 0
	local.set 71
	local.get 18
	i32.const 12
	i32.add 
	f32.load 0
	local.set 72
	local.get 19
	i32.const 12
	i32.add 
	f32.load 0
	local.set 73
	local.get 20
	i32.const 12
	i32.add 
	f32.load 0
	local.set 74
	local.get 21
	i32.const 12
	i32.add 
	f32.load 0
	local.set 75
	local.get 17
	i32.const 16
	i32.add 
	local.tee 76
	f32.load 0
	local.set 77
	local.get 18
	i32.const 16
	i32.add 
	f32.load 0
	local.set 78
	local.get 19
	i32.const 16
	i32.add 
	f32.load 0
	local.set 79
	local.get 20
	i32.const 16
	i32.add 
	f32.load 0
	local.set 80
	local.get 21
	i32.const 16
	i32.add 
	f32.load 0
	local.set 81
	local.get 17
	i32.const 20
	i32.add 
	local.tee 82
	f32.load 0
	local.set 83
	local.get 18
	i32.const 20
	i32.add 
	f32.load 0
	local.set 84
	local.get 19
	i32.const 20
	i32.add 
	f32.load 0
	local.set 85
	local.get 20
	i32.const 20
	i32.add 
	f32.load 0
	local.set 86
	local.get 21
	i32.const 20
	i32.add 
	f32.load 0
	local.set 87
	local.get 17
	i32.const 24
	i32.add 
	local.tee 88
	f32.load 0
	local.set 89
	local.get 18
	i32.const 24
	i32.add 
	f32.load 0
	local.set 90
	local.get 19
	i32.const 24
	i32.add 
	f32.load 0
	local.set 91
	local.get 20
	i32.const 24
	i32.add 
	f32.load 0
	local.set 92
	local.get 21
	i32.const 24
	i32.add 
	f32.load 0
	local.set 93
	local.get 17
	i32.const 28
	i32.add 
	local.tee 94
	f32.load 0
	local.set 95
	local.get 18
	i32.const 28
	i32.add 
	f32.load 0
	local.set 96
	local.get 19
	i32.const 28
	i32.add 
	f32.load 0
	local.set 97
	local.get 20
	i32.const 28
	i32.add 
	f32.load 0
	local.set 98
	local.get 21
	i32.const 28
	i32.add 
	f32.load 0
	local.set 99
	local.get 17
	i32.const 32
	i32.add 
	local.tee 100
	f32.load 0
	local.set 101
	local.get 18
	i32.const 32
	i32.add 
	f32.load 0
	local.set 102
	local.get 19
	i32.const 32
	i32.add 
	f32.load 0
	local.set 103
	local.get 20
	i32.const 32
	i32.add 
	f32.load 0
	local.set 104
	local.get 21
	i32.const 32
	i32.add 
	f32.load 0
	local.set 105
	local.get 17
	i32.const 36
	i32.add 
	local.tee 106
	f32.load 0
	local.set 107
	local.get 18
	i32.const 36
	i32.add 
	f32.load 0
	local.set 108
	local.get 19
	i32.const 36
	i32.add 
	f32.load 0
	local.set 109
	local.get 20
	i32.const 36
	i32.add 
	f32.load 0
	local.set 110
	local.get 21
	i32.const 36
	i32.add 
	f32.load 0
	local.set 111
	local.get 17
	i32.const 40
	i32.add 
	local.tee 112
	f32.load 0
	local.set 113
	local.get 18
	i32.const 40
	i32.add 
	f32.load 0
	local.set 114
	local.get 19
	i32.const 40
	i32.add 
	f32.load 0
	local.set 115
	local.get 20
	i32.const 40
	i32.add 
	f32.load 0
	local.set 116
	local.get 21
	i32.const 40
	i32.add 
	f32.load 0
	local.set 117
	local.get 17
	i32.const 44
	i32.add 
	local.tee 118
	f32.load 0
	local.set 119
	local.get 18
	i32.const 44
	i32.add 
	f32.load 0
	local.set 120
	local.get 19
	i32.const 44
	i32.add 
	f32.load 0
	local.set 121
	local.get 20
	i32.const 44
	i32.add 
	f32.load 0
	local.set 122
	local.get 21
	i32.const 44
	i32.add 
	f32.load 0
	local.set 123
	local.get 17
	i32.const 48
	i32.add 
	local.tee 124
	f32.load 0
	local.set 125
	local.get 18
	i32.const 48
	i32.add 
	f32.load 0
	local.set 126
	local.get 19
	i32.const 48
	i32.add 
	f32.load 0
	local.set 127
	local.get 20
	i32.const 48
	i32.add 
	f32.load 0
	local.set 128
	local.get 21
	i32.const 48
	i32.add 
	f32.load 0
	local.set 129
	local.get 17
	i32.const 52
	i32.add 
	local.tee 130
	f32.load 0
	local.set 131
	local.get 18
	i32.const 52
	i32.add 
	f32.load 0
	local.set 132
	local.get 19
	i32.const 52
	i32.add 
	f32.load 0
	local.set 133
	local.get 20
	i32.const 52
	i32.add 
	f32.load 0
	local.set 134
	local.get 21
	i32.const 52
	i32.add 
	f32.load 0
	local.set 135
	local.get 17
	i32.const 56
	i32.add 
	local.tee 136
	f32.load 0
	local.set 137
	local.get 18
	i32.const 56
	i32.add 
	f32.load 0
	local.set 138
	local.get 19
	i32.const 56
	i32.add 
	f32.load 0
	local.set 139
	local.get 20
	i32.const 56
	i32.add 
	f32.load 0
	local.set 140
	local.get 21
	i32.const 56
	i32.add 
	f32.load 0
	local.set 141
	local.get 17
	i32.const 60
	i32.add 
	local.tee 142
	f32.load 0
	local.set 143
	local.get 18
	i32.const 60
	i32.add 
	f32.load 0
	local.set 144
	local.get 19
	i32.const 60
	i32.add 
	f32.load 0
	local.set 145
	local.get 20
	i32.const 60
	i32.add 
	f32.load 0
	local.set 146
	local.get 21
	i32.const 60
	i32.add 
	f32.load 0
	local.set 147
	local.get 17
	local.get 17
	f32.load 0
	local.get 20
	f32.load 0
	local.get 27
	f32.sub 
	local.tee 148
	f32.const 0x0p0
	local.get 19
	f32.load 0
	local.get 25
	f32.mul 
	local.get 2
	local.get 148
	local.get 148
	f32.mul 
	local.get 21
	f32.load 0
	local.get 26
	f32.sub 
	local.tee 148
	local.get 148
	f32.mul 
	f32.add 
	f32.add 
	local.tee 149
	local.get 149
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 149
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 150
	f32.mul 
	local.tee 151
	local.get 18
	f32.load 0
	local.tee 152
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 142
	local.get 143
	local.get 144
	local.get 146
	local.get 27
	f32.sub 
	local.tee 149
	f32.const 0x0p0
	local.get 145
	local.get 25
	f32.mul 
	local.get 2
	local.get 149
	local.get 149
	f32.mul 
	local.get 147
	local.get 26
	f32.sub 
	local.tee 149
	local.get 149
	f32.mul 
	f32.add 
	f32.add 
	local.tee 145
	local.get 145
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 145
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 146
	f32.mul 
	local.tee 147
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 136
	local.get 137
	local.get 138
	local.get 140
	local.get 27
	f32.sub 
	local.tee 145
	f32.const 0x0p0
	local.get 139
	local.get 25
	f32.mul 
	local.get 2
	local.get 145
	local.get 145
	f32.mul 
	local.get 141
	local.get 26
	f32.sub 
	local.tee 145
	local.get 145
	f32.mul 
	f32.add 
	f32.add 
	local.tee 139
	local.get 139
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 139
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 140
	f32.mul 
	local.tee 141
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 130
	local.get 131
	local.get 132
	local.get 134
	local.get 27
	f32.sub 
	local.tee 139
	f32.const 0x0p0
	local.get 133
	local.get 25
	f32.mul 
	local.get 2
	local.get 139
	local.get 139
	f32.mul 
	local.get 135
	local.get 26
	f32.sub 
	local.tee 139
	local.get 139
	f32.mul 
	f32.add 
	f32.add 
	local.tee 133
	local.get 133
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 133
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 134
	f32.mul 
	local.tee 135
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 124
	local.get 125
	local.get 126
	local.get 128
	local.get 27
	f32.sub 
	local.tee 133
	f32.const 0x0p0
	local.get 127
	local.get 25
	f32.mul 
	local.get 2
	local.get 133
	local.get 133
	f32.mul 
	local.get 129
	local.get 26
	f32.sub 
	local.tee 133
	local.get 133
	f32.mul 
	f32.add 
	f32.add 
	local.tee 127
	local.get 127
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 127
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 128
	f32.mul 
	local.tee 129
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 118
	local.get 119
	local.get 120
	local.get 122
	local.get 27
	f32.sub 
	local.tee 127
	f32.const 0x0p0
	local.get 121
	local.get 25
	f32.mul 
	local.get 2
	local.get 127
	local.get 127
	f32.mul 
	local.get 123
	local.get 26
	f32.sub 
	local.tee 127
	local.get 127
	f32.mul 
	f32.add 
	f32.add 
	local.tee 121
	local.get 121
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 121
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 122
	f32.mul 
	local.tee 123
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 112
	local.get 113
	local.get 114
	local.get 116
	local.get 27
	f32.sub 
	local.tee 121
	f32.const 0x0p0
	local.get 115
	local.get 25
	f32.mul 
	local.get 2
	local.get 121
	local.get 121
	f32.mul 
	local.get 117
	local.get 26
	f32.sub 
	local.tee 121
	local.get 121
	f32.mul 
	f32.add 
	f32.add 
	local.tee 115
	local.get 115
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 115
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 116
	f32.mul 
	local.tee 117
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 106
	local.get 107
	local.get 108
	local.get 110
	local.get 27
	f32.sub 
	local.tee 115
	f32.const 0x0p0
	local.get 109
	local.get 25
	f32.mul 
	local.get 2
	local.get 115
	local.get 115
	f32.mul 
	local.get 111
	local.get 26
	f32.sub 
	local.tee 115
	local.get 115
	f32.mul 
	f32.add 
	f32.add 
	local.tee 109
	local.get 109
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 109
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 110
	f32.mul 
	local.tee 111
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 100
	local.get 101
	local.get 102
	local.get 104
	local.get 27
	f32.sub 
	local.tee 109
	f32.const 0x0p0
	local.get 103
	local.get 25
	f32.mul 
	local.get 2
	local.get 109
	local.get 109
	f32.mul 
	local.get 105
	local.get 26
	f32.sub 
	local.tee 109
	local.get 109
	f32.mul 
	f32.add 
	f32.add 
	local.tee 103
	local.get 103
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 103
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 104
	f32.mul 
	local.tee 105
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 94
	local.get 95
	local.get 96
	local.get 98
	local.get 27
	f32.sub 
	local.tee 103
	f32.const 0x0p0
	local.get 97
	local.get 25
	f32.mul 
	local.get 2
	local.get 103
	local.get 103
	f32.mul 
	local.get 99
	local.get 26
	f32.sub 
	local.tee 103
	local.get 103
	f32.mul 
	f32.add 
	f32.add 
	local.tee 97
	local.get 97
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 97
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 98
	f32.mul 
	local.tee 99
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 88
	local.get 89
	local.get 90
	local.get 92
	local.get 27
	f32.sub 
	local.tee 97
	f32.const 0x0p0
	local.get 91
	local.get 25
	f32.mul 
	local.get 2
	local.get 97
	local.get 97
	f32.mul 
	local.get 93
	local.get 26
	f32.sub 
	local.tee 97
	local.get 97
	f32.mul 
	f32.add 
	f32.add 
	local.tee 91
	local.get 91
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 91
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 92
	f32.mul 
	local.tee 93
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 82
	local.get 83
	local.get 84
	local.get 86
	local.get 27
	f32.sub 
	local.tee 91
	f32.const 0x0p0
	local.get 85
	local.get 25
	f32.mul 
	local.get 2
	local.get 91
	local.get 91
	f32.mul 
	local.get 87
	local.get 26
	f32.sub 
	local.tee 91
	local.get 91
	f32.mul 
	f32.add 
	f32.add 
	local.tee 85
	local.get 85
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 85
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 86
	f32.mul 
	local.tee 87
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 76
	local.get 77
	local.get 78
	local.get 80
	local.get 27
	f32.sub 
	local.tee 85
	f32.const 0x0p0
	local.get 79
	local.get 25
	f32.mul 
	local.get 2
	local.get 85
	local.get 85
	f32.mul 
	local.get 81
	local.get 26
	f32.sub 
	local.tee 85
	local.get 85
	f32.mul 
	f32.add 
	f32.add 
	local.tee 79
	local.get 79
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 79
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 80
	f32.mul 
	local.tee 81
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 70
	local.get 71
	local.get 72
	local.get 74
	local.get 27
	f32.sub 
	local.tee 79
	f32.const 0x0p0
	local.get 73
	local.get 25
	f32.mul 
	local.get 2
	local.get 79
	local.get 79
	f32.mul 
	local.get 75
	local.get 26
	f32.sub 
	local.tee 79
	local.get 79
	f32.mul 
	f32.add 
	f32.add 
	local.tee 73
	local.get 73
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 73
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 74
	f32.mul 
	local.tee 75
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 64
	local.get 65
	local.get 66
	local.get 68
	local.get 27
	f32.sub 
	local.tee 73
	f32.const 0x0p0
	local.get 67
	local.get 25
	f32.mul 
	local.get 2
	local.get 73
	local.get 73
	f32.mul 
	local.get 69
	local.get 26
	f32.sub 
	local.tee 73
	local.get 73
	f32.mul 
	f32.add 
	f32.add 
	local.tee 67
	local.get 67
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 67
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 68
	f32.mul 
	local.tee 69
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 58
	local.get 59
	local.get 60
	local.get 62
	local.get 27
	f32.sub 
	local.tee 67
	f32.const 0x0p0
	local.get 61
	local.get 25
	f32.mul 
	local.get 2
	local.get 67
	local.get 67
	f32.mul 
	local.get 63
	local.get 26
	f32.sub 
	local.tee 67
	local.get 67
	f32.mul 
	f32.add 
	f32.add 
	local.tee 61
	local.get 61
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 61
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 61
	f32.mul 
	local.tee 62
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 13
	local.get 15
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 152
	local.get 148
	local.get 150
	f32.mul 
	local.tee 148
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 17
	i32.const 4
	i32.add 
	local.tee 18
	f32.load 0
	local.set 59
	local.get 17
	i32.const 8
	i32.add 
	local.tee 19
	f32.load 0
	local.set 63
	local.get 17
	i32.const 12
	i32.add 
	local.tee 20
	f32.load 0
	local.set 65
	local.get 17
	i32.const 16
	i32.add 
	local.tee 21
	f32.load 0
	local.set 71
	local.get 17
	i32.const 20
	i32.add 
	local.tee 58
	f32.load 0
	local.set 77
	local.get 17
	i32.const 24
	i32.add 
	local.tee 64
	f32.load 0
	local.set 83
	local.get 17
	i32.const 28
	i32.add 
	local.tee 70
	f32.load 0
	local.set 89
	local.get 17
	i32.const 32
	i32.add 
	local.tee 76
	f32.load 0
	local.set 95
	local.get 17
	i32.const 36
	i32.add 
	local.tee 82
	f32.load 0
	local.set 101
	local.get 17
	i32.const 40
	i32.add 
	local.tee 88
	f32.load 0
	local.set 107
	local.get 17
	i32.const 44
	i32.add 
	local.tee 94
	f32.load 0
	local.set 113
	local.get 17
	i32.const 48
	i32.add 
	local.tee 100
	f32.load 0
	local.set 119
	local.get 17
	i32.const 52
	i32.add 
	local.tee 106
	f32.load 0
	local.set 125
	local.get 17
	i32.const 56
	i32.add 
	local.tee 112
	f32.load 0
	local.set 131
	local.get 17
	i32.const 60
	i32.add 
	local.tee 17
	local.get 17
	f32.load 0
	local.get 144
	local.get 149
	local.get 146
	f32.mul 
	local.tee 149
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 112
	local.get 131
	local.get 138
	local.get 145
	local.get 140
	f32.mul 
	local.tee 144
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 106
	local.get 125
	local.get 132
	local.get 139
	local.get 134
	f32.mul 
	local.tee 138
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 100
	local.get 119
	local.get 126
	local.get 133
	local.get 128
	f32.mul 
	local.tee 132
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 94
	local.get 113
	local.get 120
	local.get 127
	local.get 122
	f32.mul 
	local.tee 126
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 88
	local.get 107
	local.get 114
	local.get 121
	local.get 116
	f32.mul 
	local.tee 120
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 82
	local.get 101
	local.get 108
	local.get 115
	local.get 110
	f32.mul 
	local.tee 114
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 76
	local.get 95
	local.get 102
	local.get 109
	local.get 104
	f32.mul 
	local.tee 108
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 70
	local.get 89
	local.get 96
	local.get 103
	local.get 98
	f32.mul 
	local.tee 102
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 64
	local.get 83
	local.get 90
	local.get 97
	local.get 92
	f32.mul 
	local.tee 96
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 58
	local.get 77
	local.get 84
	local.get 91
	local.get 86
	f32.mul 
	local.tee 90
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 21
	local.get 71
	local.get 78
	local.get 85
	local.get 80
	f32.mul 
	local.tee 84
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 20
	local.get 65
	local.get 72
	local.get 79
	local.get 74
	f32.mul 
	local.tee 78
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 19
	local.get 63
	local.get 66
	local.get 73
	local.get 68
	f32.mul 
	local.tee 72
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 18
	local.get 59
	local.get 60
	local.get 67
	local.get 61
	f32.mul 
	local.tee 66
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 148
	local.get 22
	f32.add 
	local.set 22
	local.get 151
	local.get 23
	f32.add 
	local.set 23
	local.get 149
	local.get 28
	f32.add 
	local.set 28
	local.get 144
	local.get 29
	f32.add 
	local.set 29
	local.get 138
	local.get 30
	f32.add 
	local.set 30
	local.get 132
	local.get 31
	f32.add 
	local.set 31
	local.get 126
	local.get 32
	f32.add 
	local.set 32
	local.get 120
	local.get 33
	f32.add 
	local.set 33
	local.get 114
	local.get 34
	f32.add 
	local.set 34
	local.get 108
	local.get 35
	f32.add 
	local.set 35
	local.get 102
	local.get 36
	f32.add 
	local.set 36
	local.get 96
	local.get 37
	f32.add 
	local.set 37
	local.get 90
	local.get 38
	f32.add 
	local.set 38
	local.get 84
	local.get 39
	f32.add 
	local.set 39
	local.get 78
	local.get 40
	f32.add 
	local.set 40
	local.get 72
	local.get 41
	f32.add 
	local.set 41
	local.get 66
	local.get 42
	f32.add 
	local.set 42
	local.get 147
	local.get 43
	f32.add 
	local.set 43
	local.get 141
	local.get 44
	f32.add 
	local.set 44
	local.get 135
	local.get 45
	f32.add 
	local.set 45
	local.get 129
	local.get 46
	f32.add 
	local.set 46
	local.get 123
	local.get 47
	f32.add 
	local.set 47
	local.get 117
	local.get 48
	f32.add 
	local.set 48
	local.get 111
	local.get 49
	f32.add 
	local.set 49
	local.get 105
	local.get 50
	f32.add 
	local.set 50
	local.get 99
	local.get 51
	f32.add 
	local.set 51
	local.get 93
	local.get 52
	f32.add 
	local.set 52
	local.get 87
	local.get 53
	f32.add 
	local.set 53
	local.get 81
	local.get 54
	f32.add 
	local.set 54
	local.get 75
	local.get 55
	f32.add 
	local.set 55
	local.get 69
	local.get 56
	f32.add 
	local.set 56
	local.get 62
	local.get 57
	f32.add 
	local.set 57
	local.get 24
	local.get 15
	i32.const 64
	i32.add 
	local.tee 15
	i32.ne 
	br_if 0
	end_loop
	local.get 16
	local.get 43
	f32.store 60
	local.get 16
	local.get 44
	f32.store 56
	local.get 16
	local.get 45
	f32.store 52
	local.get 16
	local.get 46
	f32.store 48
	local.get 16
	local.get 47
	f32.store 44
	local.get 16
	local.get 48
	f32.store 40
	local.get 16
	local.get 49
	f32.store 36
	local.get 16
	local.get 50
	f32.store 32
	local.get 16
	local.get 51
	f32.store 28
	local.get 16
	local.get 52
	f32.store 24
	local.get 16
	local.get 53
	f32.store 20
	local.get 16
	local.get 54
	f32.store 16
	local.get 16
	local.get 55
	f32.store 12
	local.get 16
	local.get 56
	f32.store 8
	local.get 16
	local.get 57
	f32.store 4
	local.get 16
	local.get 28
	f32.store 124
	local.get 16
	local.get 29
	f32.store 120
	local.get 16
	local.get 30
	f32.store 116
	local.get 16
	local.get 31
	f32.store 112
	local.get 16
	local.get 32
	f32.store 108
	local.get 16
	local.get 33
	f32.store 104
	local.get 16
	local.get 34
	f32.store 100
	local.get 16
	local.get 35
	f32.store 96
	local.get 16
	local.get 36
	f32.store 92
	local.get 16
	local.get 37
	f32.store 88
	local.get 16
	local.get 38
	f32.store 84
	local.get 16
	local.get 39
	f32.store 80
	local.get 16
	local.get 40
	f32.store 76
	local.get 16
	local.get 41
	f32.store 72
	local.get 16
	local.get 42
	f32.store 68
	end_block
	local.get 16
	local.get 22
	f32.store 64
	local.get 16
	local.get 23
	f32.store 0
	block 
	local.get 14
	i32.const 15
	i32.and 
	local.tee 17
	local.get 12
	i32.const 15
	i32.and 
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 17
	local.get 10
	i32.const 15
	i32.and 
	local.tee 18
	local.get 8
	i32.const 15
	i32.and 
	local.tee 19
	local.get 6
	i32.const 15
	i32.and 
	local.tee 20
	local.get 4
	i32.const 15
	i32.and 
	local.tee 21
	local.get 20
	local.get 21
	i32.lt_u
	i32.select
	local.tee 20
	local.get 19
	local.get 20
	i32.lt_u
	i32.select
	local.tee 19
	local.get 18
	local.get 19
	i32.lt_u
	i32.select
	local.tee 18
	local.get 17
	local.get 18
	i32.lt_u
	i32.select
	local.tee 70
	i32.eqz
	br_if 0
	local.get 13
	local.get 14
	i32.const 268435440
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 17
	local.get 11
	local.get 12
	i32.const 268435440
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 18
	local.get 9
	local.get 10
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 21
	local.get 7
	local.get 8
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 15
	local.get 5
	local.get 6
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 58
	local.get 3
	local.get 4
	i32.const 536870896
	i32.and 
	i32.const 2
	i32.shl 
	i32.add 
	local.set 64
	local.get 1
	f32.load 8
	local.set 60
	local.get 1
	f32.load 4
	local.set 66
	local.get 1
	f32.load 0
	local.set 72
	local.get 16
	i32.const 64
	i32.add 
	local.set 19
	local.get 16
	local.set 20
	loop 
	local.get 20
	local.get 20
	f32.load 0
	local.get 64
	f32.load 0
	local.get 72
	f32.sub 
	local.tee 25
	f32.const 0x0p0
	local.get 15
	f32.load 0
	local.get 60
	f32.mul 
	local.get 2
	local.get 25
	local.get 25
	f32.mul 
	local.get 58
	f32.load 0
	local.get 66
	f32.sub 
	local.tee 25
	local.get 25
	f32.mul 
	f32.add 
	f32.add 
	local.tee 26
	local.get 26
	f32.sqrt
	f32.mul 
	f32.div 
	local.get 26
	f32.const 0x0p0
	f32.eq 
	f32.select
	local.tee 26
	f32.mul 
	local.tee 27
	f32.add 
	f32.store 0
	local.get 19
	local.get 19
	f32.load 0
	local.get 25
	local.get 26
	f32.mul 
	local.tee 25
	f32.add 
	f32.store 0
	local.get 18
	local.get 18
	f32.load 0
	local.get 21
	f32.load 0
	local.tee 26
	local.get 27
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 17
	local.get 17
	f32.load 0
	local.get 26
	local.get 25
	f32.mul 
	f32.sub 
	f32.store 0
	local.get 20
	i32.const 4
	i32.add 
	local.set 20
	local.get 19
	i32.const 4
	i32.add 
	local.set 19
	local.get 64
	i32.const 4
	i32.add 
	local.set 64
	local.get 58
	i32.const 4
	i32.add 
	local.set 58
	local.get 15
	i32.const 4
	i32.add 
	local.set 15
	local.get 21
	i32.const 4
	i32.add 
	local.set 21
	local.get 18
	i32.const 4
	i32.add 
	local.set 18
	local.get 17
	i32.const 4
	i32.add 
	local.set 17
	local.get 70
	i32.const -1
	i32.add 
	local.tee 70
	br_if 0
	end_loop
	end_block
	local.get 0
	local.get 16
	i64.load 56:p2align=2
	i64.store 56:p2align=2
	local.get 0
	local.get 16
	i64.load 48:p2align=2
	i64.store 48:p2align=2
	local.get 0
	local.get 16
	i64.load 40:p2align=2
	i64.store 40:p2align=2
	local.get 0
	local.get 16
	i64.load 32:p2align=2
	i64.store 32:p2align=2
	local.get 0
	local.get 16
	i64.load 24:p2align=2
	i64.store 24:p2align=2
	local.get 0
	local.get 16
	i64.load 16:p2align=2
	i64.store 16:p2align=2
	local.get 0
	local.get 16
	i64.load 8:p2align=2
	i64.store 8:p2align=2
	local.get 0
	local.get 16
	i64.load 0:p2align=2
	i64.store 0:p2align=2
	local.get 0
	local.get 16
	i64.load 64:p2align=2
	i64.store 64:p2align=2
	local.get 0
	local.get 16
	i64.load 72:p2align=2
	i64.store 72:p2align=2
	local.get 0
	local.get 16
	i64.load 80:p2align=2
	i64.store 80:p2align=2
	local.get 0
	local.get 16
	i64.load 88:p2align=2
	i64.store 88:p2align=2
	local.get 0
	local.get 16
	i64.load 96:p2align=2
	i64.store 96:p2align=2
	local.get 0
	local.get 16
	i64.load 104:p2align=2
	i64.store 104:p2align=2
	local.get 0
	local.get 16
	i64.load 112:p2align=2
	i64.store 112:p2align=2
	local.get 0
	local.get 16
	i64.load 120:p2align=2
	i64.store 120:p2align=2
	end_function
