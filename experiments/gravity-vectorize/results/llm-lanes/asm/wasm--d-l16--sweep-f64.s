engine::force::sweep::<f64>:
	.functype	engine::force::sweep::<f64> (i32, i32, f64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
	.local  	i32, i32, i32, i32, i32, i32, i32, f64, f64, i32, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, i32, f64, f64, f64, f64, f64, f64, f64, f64, f64, f64
	global.get __stack_pointer
	i32.const 256
	i32.sub 
	local.tee 15
	global.set __stack_pointer
	i32.const 0
	local.set 16
	local.get 15
	i32.const 8
	i32.add 
	i32.const 0
	i32.const 120
	memory.fill 0
	local.get 15
	i32.const 128
	i32.add 
	i32.const 8
	i32.add 
	i32.const 0
	i32.const 120
	memory.fill 0
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
	f64.const 0x0p0
	local.set 22
	f64.const 0x0p0
	local.set 23
	br 1
	end_block
	local.get 17
	i32.const 7
	i32.shl 
	local.set 24
	local.get 1
	f64.load 16
	local.set 25
	local.get 1
	f64.load 8
	local.set 26
	local.get 1
	f64.load 0
	local.set 27
	f64.const 0x0p0
	local.set 28
	f64.const 0x0p0
	local.set 29
	f64.const 0x0p0
	local.set 30
	f64.const 0x0p0
	local.set 31
	f64.const 0x0p0
	local.set 32
	f64.const 0x0p0
	local.set 33
	f64.const 0x0p0
	local.set 34
	f64.const 0x0p0
	local.set 35
	f64.const 0x0p0
	local.set 36
	f64.const 0x0p0
	local.set 37
	f64.const 0x0p0
	local.set 38
	f64.const 0x0p0
	local.set 39
	f64.const 0x0p0
	local.set 40
	f64.const 0x0p0
	local.set 41
	f64.const 0x0p0
	local.set 42
	f64.const 0x0p0
	local.set 43
	f64.const 0x0p0
	local.set 44
	f64.const 0x0p0
	local.set 45
	f64.const 0x0p0
	local.set 46
	f64.const 0x0p0
	local.set 47
	f64.const 0x0p0
	local.set 48
	f64.const 0x0p0
	local.set 49
	f64.const 0x0p0
	local.set 50
	f64.const 0x0p0
	local.set 51
	f64.const 0x0p0
	local.set 52
	f64.const 0x0p0
	local.set 53
	f64.const 0x0p0
	local.set 54
	f64.const 0x0p0
	local.set 55
	f64.const 0x0p0
	local.set 56
	f64.const 0x0p0
	local.set 57
	f64.const 0x0p0
	local.set 23
	f64.const 0x0p0
	local.set 22
	loop 
	local.get 11
	local.get 16
	i32.add 
	local.tee 17
	i32.const 8
	i32.add 
	local.tee 58
	f64.load 0
	local.set 59
	local.get 9
	local.get 16
	i32.add 
	local.tee 18
	i32.const 8
	i32.add 
	f64.load 0
	local.set 60
	local.get 7
	local.get 16
	i32.add 
	local.tee 19
	i32.const 8
	i32.add 
	f64.load 0
	local.set 61
	local.get 3
	local.get 16
	i32.add 
	local.tee 20
	i32.const 8
	i32.add 
	f64.load 0
	local.set 62
	local.get 5
	local.get 16
	i32.add 
	local.tee 21
	i32.const 8
	i32.add 
	f64.load 0
	local.set 63
	local.get 17
	i32.const 16
	i32.add 
	local.tee 64
	f64.load 0
	local.set 65
	local.get 18
	i32.const 16
	i32.add 
	f64.load 0
	local.set 66
	local.get 19
	i32.const 16
	i32.add 
	f64.load 0
	local.set 67
	local.get 20
	i32.const 16
	i32.add 
	f64.load 0
	local.set 68
	local.get 21
	i32.const 16
	i32.add 
	f64.load 0
	local.set 69
	local.get 17
	i32.const 24
	i32.add 
	local.tee 70
	f64.load 0
	local.set 71
	local.get 18
	i32.const 24
	i32.add 
	f64.load 0
	local.set 72
	local.get 19
	i32.const 24
	i32.add 
	f64.load 0
	local.set 73
	local.get 20
	i32.const 24
	i32.add 
	f64.load 0
	local.set 74
	local.get 21
	i32.const 24
	i32.add 
	f64.load 0
	local.set 75
	local.get 17
	i32.const 32
	i32.add 
	local.tee 76
	f64.load 0
	local.set 77
	local.get 18
	i32.const 32
	i32.add 
	f64.load 0
	local.set 78
	local.get 19
	i32.const 32
	i32.add 
	f64.load 0
	local.set 79
	local.get 20
	i32.const 32
	i32.add 
	f64.load 0
	local.set 80
	local.get 21
	i32.const 32
	i32.add 
	f64.load 0
	local.set 81
	local.get 17
	i32.const 40
	i32.add 
	local.tee 82
	f64.load 0
	local.set 83
	local.get 18
	i32.const 40
	i32.add 
	f64.load 0
	local.set 84
	local.get 19
	i32.const 40
	i32.add 
	f64.load 0
	local.set 85
	local.get 20
	i32.const 40
	i32.add 
	f64.load 0
	local.set 86
	local.get 21
	i32.const 40
	i32.add 
	f64.load 0
	local.set 87
	local.get 17
	i32.const 48
	i32.add 
	local.tee 88
	f64.load 0
	local.set 89
	local.get 18
	i32.const 48
	i32.add 
	f64.load 0
	local.set 90
	local.get 19
	i32.const 48
	i32.add 
	f64.load 0
	local.set 91
	local.get 20
	i32.const 48
	i32.add 
	f64.load 0
	local.set 92
	local.get 21
	i32.const 48
	i32.add 
	f64.load 0
	local.set 93
	local.get 17
	i32.const 56
	i32.add 
	local.tee 94
	f64.load 0
	local.set 95
	local.get 18
	i32.const 56
	i32.add 
	f64.load 0
	local.set 96
	local.get 19
	i32.const 56
	i32.add 
	f64.load 0
	local.set 97
	local.get 20
	i32.const 56
	i32.add 
	f64.load 0
	local.set 98
	local.get 21
	i32.const 56
	i32.add 
	f64.load 0
	local.set 99
	local.get 17
	i32.const 64
	i32.add 
	local.tee 100
	f64.load 0
	local.set 101
	local.get 18
	i32.const 64
	i32.add 
	f64.load 0
	local.set 102
	local.get 19
	i32.const 64
	i32.add 
	f64.load 0
	local.set 103
	local.get 20
	i32.const 64
	i32.add 
	f64.load 0
	local.set 104
	local.get 21
	i32.const 64
	i32.add 
	f64.load 0
	local.set 105
	local.get 17
	i32.const 72
	i32.add 
	local.tee 106
	f64.load 0
	local.set 107
	local.get 18
	i32.const 72
	i32.add 
	f64.load 0
	local.set 108
	local.get 19
	i32.const 72
	i32.add 
	f64.load 0
	local.set 109
	local.get 20
	i32.const 72
	i32.add 
	f64.load 0
	local.set 110
	local.get 21
	i32.const 72
	i32.add 
	f64.load 0
	local.set 111
	local.get 17
	i32.const 80
	i32.add 
	local.tee 112
	f64.load 0
	local.set 113
	local.get 18
	i32.const 80
	i32.add 
	f64.load 0
	local.set 114
	local.get 19
	i32.const 80
	i32.add 
	f64.load 0
	local.set 115
	local.get 20
	i32.const 80
	i32.add 
	f64.load 0
	local.set 116
	local.get 21
	i32.const 80
	i32.add 
	f64.load 0
	local.set 117
	local.get 17
	i32.const 88
	i32.add 
	local.tee 118
	f64.load 0
	local.set 119
	local.get 18
	i32.const 88
	i32.add 
	f64.load 0
	local.set 120
	local.get 19
	i32.const 88
	i32.add 
	f64.load 0
	local.set 121
	local.get 20
	i32.const 88
	i32.add 
	f64.load 0
	local.set 122
	local.get 21
	i32.const 88
	i32.add 
	f64.load 0
	local.set 123
	local.get 17
	i32.const 96
	i32.add 
	local.tee 124
	f64.load 0
	local.set 125
	local.get 18
	i32.const 96
	i32.add 
	f64.load 0
	local.set 126
	local.get 19
	i32.const 96
	i32.add 
	f64.load 0
	local.set 127
	local.get 20
	i32.const 96
	i32.add 
	f64.load 0
	local.set 128
	local.get 21
	i32.const 96
	i32.add 
	f64.load 0
	local.set 129
	local.get 17
	i32.const 104
	i32.add 
	local.tee 130
	f64.load 0
	local.set 131
	local.get 18
	i32.const 104
	i32.add 
	f64.load 0
	local.set 132
	local.get 19
	i32.const 104
	i32.add 
	f64.load 0
	local.set 133
	local.get 20
	i32.const 104
	i32.add 
	f64.load 0
	local.set 134
	local.get 21
	i32.const 104
	i32.add 
	f64.load 0
	local.set 135
	local.get 17
	i32.const 112
	i32.add 
	local.tee 136
	f64.load 0
	local.set 137
	local.get 18
	i32.const 112
	i32.add 
	f64.load 0
	local.set 138
	local.get 19
	i32.const 112
	i32.add 
	f64.load 0
	local.set 139
	local.get 20
	i32.const 112
	i32.add 
	f64.load 0
	local.set 140
	local.get 21
	i32.const 112
	i32.add 
	f64.load 0
	local.set 141
	local.get 17
	i32.const 120
	i32.add 
	local.tee 142
	f64.load 0
	local.set 143
	local.get 18
	i32.const 120
	i32.add 
	f64.load 0
	local.set 144
	local.get 19
	i32.const 120
	i32.add 
	f64.load 0
	local.set 145
	local.get 20
	i32.const 120
	i32.add 
	f64.load 0
	local.set 146
	local.get 21
	i32.const 120
	i32.add 
	f64.load 0
	local.set 147
	local.get 17
	local.get 17
	f64.load 0
	local.get 20
	f64.load 0
	local.get 27
	f64.sub 
	local.tee 148
	f64.const 0x0p0
	local.get 19
	f64.load 0
	local.get 25
	f64.mul 
	local.get 2
	local.get 148
	local.get 148
	f64.mul 
	local.get 21
	f64.load 0
	local.get 26
	f64.sub 
	local.tee 148
	local.get 148
	f64.mul 
	f64.add 
	f64.add 
	local.tee 149
	local.get 149
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 149
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 150
	f64.mul 
	local.tee 151
	local.get 18
	f64.load 0
	local.tee 152
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 142
	local.get 143
	local.get 144
	local.get 146
	local.get 27
	f64.sub 
	local.tee 149
	f64.const 0x0p0
	local.get 145
	local.get 25
	f64.mul 
	local.get 2
	local.get 149
	local.get 149
	f64.mul 
	local.get 147
	local.get 26
	f64.sub 
	local.tee 149
	local.get 149
	f64.mul 
	f64.add 
	f64.add 
	local.tee 145
	local.get 145
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 145
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 146
	f64.mul 
	local.tee 147
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 136
	local.get 137
	local.get 138
	local.get 140
	local.get 27
	f64.sub 
	local.tee 145
	f64.const 0x0p0
	local.get 139
	local.get 25
	f64.mul 
	local.get 2
	local.get 145
	local.get 145
	f64.mul 
	local.get 141
	local.get 26
	f64.sub 
	local.tee 145
	local.get 145
	f64.mul 
	f64.add 
	f64.add 
	local.tee 139
	local.get 139
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 139
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 140
	f64.mul 
	local.tee 141
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 130
	local.get 131
	local.get 132
	local.get 134
	local.get 27
	f64.sub 
	local.tee 139
	f64.const 0x0p0
	local.get 133
	local.get 25
	f64.mul 
	local.get 2
	local.get 139
	local.get 139
	f64.mul 
	local.get 135
	local.get 26
	f64.sub 
	local.tee 139
	local.get 139
	f64.mul 
	f64.add 
	f64.add 
	local.tee 133
	local.get 133
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 133
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 134
	f64.mul 
	local.tee 135
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 124
	local.get 125
	local.get 126
	local.get 128
	local.get 27
	f64.sub 
	local.tee 133
	f64.const 0x0p0
	local.get 127
	local.get 25
	f64.mul 
	local.get 2
	local.get 133
	local.get 133
	f64.mul 
	local.get 129
	local.get 26
	f64.sub 
	local.tee 133
	local.get 133
	f64.mul 
	f64.add 
	f64.add 
	local.tee 127
	local.get 127
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 127
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 128
	f64.mul 
	local.tee 129
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 118
	local.get 119
	local.get 120
	local.get 122
	local.get 27
	f64.sub 
	local.tee 127
	f64.const 0x0p0
	local.get 121
	local.get 25
	f64.mul 
	local.get 2
	local.get 127
	local.get 127
	f64.mul 
	local.get 123
	local.get 26
	f64.sub 
	local.tee 127
	local.get 127
	f64.mul 
	f64.add 
	f64.add 
	local.tee 121
	local.get 121
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 121
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 122
	f64.mul 
	local.tee 123
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 112
	local.get 113
	local.get 114
	local.get 116
	local.get 27
	f64.sub 
	local.tee 121
	f64.const 0x0p0
	local.get 115
	local.get 25
	f64.mul 
	local.get 2
	local.get 121
	local.get 121
	f64.mul 
	local.get 117
	local.get 26
	f64.sub 
	local.tee 121
	local.get 121
	f64.mul 
	f64.add 
	f64.add 
	local.tee 115
	local.get 115
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 115
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 116
	f64.mul 
	local.tee 117
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 106
	local.get 107
	local.get 108
	local.get 110
	local.get 27
	f64.sub 
	local.tee 115
	f64.const 0x0p0
	local.get 109
	local.get 25
	f64.mul 
	local.get 2
	local.get 115
	local.get 115
	f64.mul 
	local.get 111
	local.get 26
	f64.sub 
	local.tee 115
	local.get 115
	f64.mul 
	f64.add 
	f64.add 
	local.tee 109
	local.get 109
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 109
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 110
	f64.mul 
	local.tee 111
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 100
	local.get 101
	local.get 102
	local.get 104
	local.get 27
	f64.sub 
	local.tee 109
	f64.const 0x0p0
	local.get 103
	local.get 25
	f64.mul 
	local.get 2
	local.get 109
	local.get 109
	f64.mul 
	local.get 105
	local.get 26
	f64.sub 
	local.tee 109
	local.get 109
	f64.mul 
	f64.add 
	f64.add 
	local.tee 103
	local.get 103
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 103
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 104
	f64.mul 
	local.tee 105
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 94
	local.get 95
	local.get 96
	local.get 98
	local.get 27
	f64.sub 
	local.tee 103
	f64.const 0x0p0
	local.get 97
	local.get 25
	f64.mul 
	local.get 2
	local.get 103
	local.get 103
	f64.mul 
	local.get 99
	local.get 26
	f64.sub 
	local.tee 103
	local.get 103
	f64.mul 
	f64.add 
	f64.add 
	local.tee 97
	local.get 97
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 97
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 98
	f64.mul 
	local.tee 99
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 88
	local.get 89
	local.get 90
	local.get 92
	local.get 27
	f64.sub 
	local.tee 97
	f64.const 0x0p0
	local.get 91
	local.get 25
	f64.mul 
	local.get 2
	local.get 97
	local.get 97
	f64.mul 
	local.get 93
	local.get 26
	f64.sub 
	local.tee 97
	local.get 97
	f64.mul 
	f64.add 
	f64.add 
	local.tee 91
	local.get 91
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 91
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 92
	f64.mul 
	local.tee 93
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 82
	local.get 83
	local.get 84
	local.get 86
	local.get 27
	f64.sub 
	local.tee 91
	f64.const 0x0p0
	local.get 85
	local.get 25
	f64.mul 
	local.get 2
	local.get 91
	local.get 91
	f64.mul 
	local.get 87
	local.get 26
	f64.sub 
	local.tee 91
	local.get 91
	f64.mul 
	f64.add 
	f64.add 
	local.tee 85
	local.get 85
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 85
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 86
	f64.mul 
	local.tee 87
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 76
	local.get 77
	local.get 78
	local.get 80
	local.get 27
	f64.sub 
	local.tee 85
	f64.const 0x0p0
	local.get 79
	local.get 25
	f64.mul 
	local.get 2
	local.get 85
	local.get 85
	f64.mul 
	local.get 81
	local.get 26
	f64.sub 
	local.tee 85
	local.get 85
	f64.mul 
	f64.add 
	f64.add 
	local.tee 79
	local.get 79
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 79
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 80
	f64.mul 
	local.tee 81
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 70
	local.get 71
	local.get 72
	local.get 74
	local.get 27
	f64.sub 
	local.tee 79
	f64.const 0x0p0
	local.get 73
	local.get 25
	f64.mul 
	local.get 2
	local.get 79
	local.get 79
	f64.mul 
	local.get 75
	local.get 26
	f64.sub 
	local.tee 79
	local.get 79
	f64.mul 
	f64.add 
	f64.add 
	local.tee 73
	local.get 73
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 73
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 74
	f64.mul 
	local.tee 75
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 64
	local.get 65
	local.get 66
	local.get 68
	local.get 27
	f64.sub 
	local.tee 73
	f64.const 0x0p0
	local.get 67
	local.get 25
	f64.mul 
	local.get 2
	local.get 73
	local.get 73
	f64.mul 
	local.get 69
	local.get 26
	f64.sub 
	local.tee 73
	local.get 73
	f64.mul 
	f64.add 
	f64.add 
	local.tee 67
	local.get 67
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 67
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 68
	f64.mul 
	local.tee 69
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 58
	local.get 59
	local.get 60
	local.get 62
	local.get 27
	f64.sub 
	local.tee 67
	f64.const 0x0p0
	local.get 61
	local.get 25
	f64.mul 
	local.get 2
	local.get 67
	local.get 67
	f64.mul 
	local.get 63
	local.get 26
	f64.sub 
	local.tee 67
	local.get 67
	f64.mul 
	f64.add 
	f64.add 
	local.tee 61
	local.get 61
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 61
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 61
	f64.mul 
	local.tee 62
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 13
	local.get 16
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 152
	local.get 148
	local.get 150
	f64.mul 
	local.tee 148
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	i32.const 8
	i32.add 
	local.tee 18
	f64.load 0
	local.set 59
	local.get 17
	i32.const 16
	i32.add 
	local.tee 19
	f64.load 0
	local.set 63
	local.get 17
	i32.const 24
	i32.add 
	local.tee 20
	f64.load 0
	local.set 65
	local.get 17
	i32.const 32
	i32.add 
	local.tee 21
	f64.load 0
	local.set 71
	local.get 17
	i32.const 40
	i32.add 
	local.tee 58
	f64.load 0
	local.set 77
	local.get 17
	i32.const 48
	i32.add 
	local.tee 64
	f64.load 0
	local.set 83
	local.get 17
	i32.const 56
	i32.add 
	local.tee 70
	f64.load 0
	local.set 89
	local.get 17
	i32.const 64
	i32.add 
	local.tee 76
	f64.load 0
	local.set 95
	local.get 17
	i32.const 72
	i32.add 
	local.tee 82
	f64.load 0
	local.set 101
	local.get 17
	i32.const 80
	i32.add 
	local.tee 88
	f64.load 0
	local.set 107
	local.get 17
	i32.const 88
	i32.add 
	local.tee 94
	f64.load 0
	local.set 113
	local.get 17
	i32.const 96
	i32.add 
	local.tee 100
	f64.load 0
	local.set 119
	local.get 17
	i32.const 104
	i32.add 
	local.tee 106
	f64.load 0
	local.set 125
	local.get 17
	i32.const 112
	i32.add 
	local.tee 112
	f64.load 0
	local.set 131
	local.get 17
	i32.const 120
	i32.add 
	local.tee 17
	local.get 17
	f64.load 0
	local.get 144
	local.get 149
	local.get 146
	f64.mul 
	local.tee 149
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 112
	local.get 131
	local.get 138
	local.get 145
	local.get 140
	f64.mul 
	local.tee 144
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 106
	local.get 125
	local.get 132
	local.get 139
	local.get 134
	f64.mul 
	local.tee 138
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 100
	local.get 119
	local.get 126
	local.get 133
	local.get 128
	f64.mul 
	local.tee 132
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 94
	local.get 113
	local.get 120
	local.get 127
	local.get 122
	f64.mul 
	local.tee 126
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 88
	local.get 107
	local.get 114
	local.get 121
	local.get 116
	f64.mul 
	local.tee 120
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 82
	local.get 101
	local.get 108
	local.get 115
	local.get 110
	f64.mul 
	local.tee 114
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 76
	local.get 95
	local.get 102
	local.get 109
	local.get 104
	f64.mul 
	local.tee 108
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 70
	local.get 89
	local.get 96
	local.get 103
	local.get 98
	f64.mul 
	local.tee 102
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 64
	local.get 83
	local.get 90
	local.get 97
	local.get 92
	f64.mul 
	local.tee 96
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 58
	local.get 77
	local.get 84
	local.get 91
	local.get 86
	f64.mul 
	local.tee 90
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 21
	local.get 71
	local.get 78
	local.get 85
	local.get 80
	f64.mul 
	local.tee 84
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 20
	local.get 65
	local.get 72
	local.get 79
	local.get 74
	f64.mul 
	local.tee 78
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 19
	local.get 63
	local.get 66
	local.get 73
	local.get 68
	f64.mul 
	local.tee 72
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 18
	local.get 59
	local.get 60
	local.get 67
	local.get 61
	f64.mul 
	local.tee 66
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 148
	local.get 22
	f64.add 
	local.set 22
	local.get 151
	local.get 23
	f64.add 
	local.set 23
	local.get 149
	local.get 28
	f64.add 
	local.set 28
	local.get 144
	local.get 29
	f64.add 
	local.set 29
	local.get 138
	local.get 30
	f64.add 
	local.set 30
	local.get 132
	local.get 31
	f64.add 
	local.set 31
	local.get 126
	local.get 32
	f64.add 
	local.set 32
	local.get 120
	local.get 33
	f64.add 
	local.set 33
	local.get 114
	local.get 34
	f64.add 
	local.set 34
	local.get 108
	local.get 35
	f64.add 
	local.set 35
	local.get 102
	local.get 36
	f64.add 
	local.set 36
	local.get 96
	local.get 37
	f64.add 
	local.set 37
	local.get 90
	local.get 38
	f64.add 
	local.set 38
	local.get 84
	local.get 39
	f64.add 
	local.set 39
	local.get 78
	local.get 40
	f64.add 
	local.set 40
	local.get 72
	local.get 41
	f64.add 
	local.set 41
	local.get 66
	local.get 42
	f64.add 
	local.set 42
	local.get 147
	local.get 43
	f64.add 
	local.set 43
	local.get 141
	local.get 44
	f64.add 
	local.set 44
	local.get 135
	local.get 45
	f64.add 
	local.set 45
	local.get 129
	local.get 46
	f64.add 
	local.set 46
	local.get 123
	local.get 47
	f64.add 
	local.set 47
	local.get 117
	local.get 48
	f64.add 
	local.set 48
	local.get 111
	local.get 49
	f64.add 
	local.set 49
	local.get 105
	local.get 50
	f64.add 
	local.set 50
	local.get 99
	local.get 51
	f64.add 
	local.set 51
	local.get 93
	local.get 52
	f64.add 
	local.set 52
	local.get 87
	local.get 53
	f64.add 
	local.set 53
	local.get 81
	local.get 54
	f64.add 
	local.set 54
	local.get 75
	local.get 55
	f64.add 
	local.set 55
	local.get 69
	local.get 56
	f64.add 
	local.set 56
	local.get 62
	local.get 57
	f64.add 
	local.set 57
	local.get 24
	local.get 16
	i32.const 128
	i32.add 
	local.tee 16
	i32.ne 
	br_if 0
	end_loop
	local.get 15
	local.get 43
	f64.store 120
	local.get 15
	local.get 44
	f64.store 112
	local.get 15
	local.get 45
	f64.store 104
	local.get 15
	local.get 46
	f64.store 96
	local.get 15
	local.get 47
	f64.store 88
	local.get 15
	local.get 48
	f64.store 80
	local.get 15
	local.get 49
	f64.store 72
	local.get 15
	local.get 50
	f64.store 64
	local.get 15
	local.get 51
	f64.store 56
	local.get 15
	local.get 52
	f64.store 48
	local.get 15
	local.get 53
	f64.store 40
	local.get 15
	local.get 54
	f64.store 32
	local.get 15
	local.get 55
	f64.store 24
	local.get 15
	local.get 56
	f64.store 16
	local.get 15
	local.get 57
	f64.store 8
	local.get 15
	local.get 28
	f64.store 248
	local.get 15
	local.get 29
	f64.store 240
	local.get 15
	local.get 30
	f64.store 232
	local.get 15
	local.get 31
	f64.store 224
	local.get 15
	local.get 32
	f64.store 216
	local.get 15
	local.get 33
	f64.store 208
	local.get 15
	local.get 34
	f64.store 200
	local.get 15
	local.get 35
	f64.store 192
	local.get 15
	local.get 36
	f64.store 184
	local.get 15
	local.get 37
	f64.store 176
	local.get 15
	local.get 38
	f64.store 168
	local.get 15
	local.get 39
	f64.store 160
	local.get 15
	local.get 40
	f64.store 152
	local.get 15
	local.get 41
	f64.store 144
	local.get 15
	local.get 42
	f64.store 136
	end_block
	local.get 15
	local.get 22
	f64.store 128
	local.get 15
	local.get 23
	f64.store 0
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
	i32.const 134217712
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 17
	local.get 11
	local.get 12
	i32.const 134217712
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 18
	local.get 9
	local.get 10
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 21
	local.get 7
	local.get 8
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 16
	local.get 5
	local.get 6
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 58
	local.get 3
	local.get 4
	i32.const 268435440
	i32.and 
	i32.const 3
	i32.shl 
	i32.add 
	local.set 64
	local.get 1
	f64.load 16
	local.set 60
	local.get 1
	f64.load 8
	local.set 66
	local.get 1
	f64.load 0
	local.set 72
	local.get 15
	i32.const 128
	i32.add 
	local.set 19
	local.get 15
	local.set 20
	loop 
	local.get 20
	local.get 20
	f64.load 0
	local.get 64
	f64.load 0
	local.get 72
	f64.sub 
	local.tee 25
	f64.const 0x0p0
	local.get 16
	f64.load 0
	local.get 60
	f64.mul 
	local.get 2
	local.get 25
	local.get 25
	f64.mul 
	local.get 58
	f64.load 0
	local.get 66
	f64.sub 
	local.tee 25
	local.get 25
	f64.mul 
	f64.add 
	f64.add 
	local.tee 26
	local.get 26
	f64.sqrt
	f64.mul 
	f64.div 
	local.get 26
	f64.const 0x0p0
	f64.eq 
	f64.select
	local.tee 26
	f64.mul 
	local.tee 27
	f64.add 
	f64.store 0
	local.get 19
	local.get 19
	f64.load 0
	local.get 25
	local.get 26
	f64.mul 
	local.tee 25
	f64.add 
	f64.store 0
	local.get 18
	local.get 18
	f64.load 0
	local.get 21
	f64.load 0
	local.tee 26
	local.get 27
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 17
	local.get 17
	f64.load 0
	local.get 26
	local.get 25
	f64.mul 
	f64.sub 
	f64.store 0
	local.get 20
	i32.const 8
	i32.add 
	local.set 20
	local.get 19
	i32.const 8
	i32.add 
	local.set 19
	local.get 64
	i32.const 8
	i32.add 
	local.set 64
	local.get 58
	i32.const 8
	i32.add 
	local.set 58
	local.get 16
	i32.const 8
	i32.add 
	local.set 16
	local.get 21
	i32.const 8
	i32.add 
	local.set 21
	local.get 18
	i32.const 8
	i32.add 
	local.set 18
	local.get 17
	i32.const 8
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
	local.get 15
	i32.const 128
	memory.copy 0, 0
	local.get 0
	i32.const 128
	i32.add 
	local.get 15
	i32.const 128
	i32.add 
	i32.const 128
	memory.copy 0, 0
	local.get 15
	i32.const 256
	i32.add 
	global.set __stack_pointer
	end_function
