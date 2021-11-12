


.syntax unified
.text
.thumb

.extern S
.extern MaskedS
.extern xtime
.extern rcon

.extern U
.extern U2
.extern V2
.extern V
.extern UV
.extern X
.extern Q
.extern G
.extern BASE
.extern SBASE
.extern index4
.extern index16

.extern ShiftRowsIndexes

.extern ShuffleMacroFour
.extern ShuffleMacroSixteen

.extern get_random

.global run_calib
.func run_calib

run_calib:
    push {lr}
    push {r0-r7}

mov r10, r0
mov r11, r1
mov r9, r2
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
eors r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
eors r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
eors r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
eors r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
eors r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
lsls r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
lsls r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
lsls r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
lsls r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
lsls r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
str r5, [r4]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
str r5, [r4]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
str r5, [r4]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
str r5, [r4]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
str r5, [r4]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
ldr r4, [r5]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
ldr r4, [r5]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
ldr r4, [r5]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
ldr r4, [r5]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
ldr r4, [r5]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
movs r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
movs r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
movs r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
movs r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init eors
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
eors r2, r3
movs r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
eors r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
eors r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
eors r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
eors r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
eors r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
lsls r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
lsls r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
lsls r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
lsls r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
lsls r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
str r5, [r4]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
str r5, [r4]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
str r5, [r4]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
str r5, [r4]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
str r5, [r4]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
ldr r4, [r5]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
ldr r4, [r5]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
ldr r4, [r5]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
ldr r4, [r5]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
ldr r4, [r5]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
movs r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
movs r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
movs r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
movs r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init lsls
mov r2, r10
ldr r3, [r2,#4]
movs r2, #31
ands r3, r2
mov r2, r10
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
lsls r2, r3
movs r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
eors r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
eors r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
eors r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
eors r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
eors r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
lsls r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
lsls r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
lsls r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
lsls r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
lsls r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
str r5, [r4]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
str r5, [r4]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
str r5, [r4]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
str r5, [r4]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
str r5, [r4]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
ldr r4, [r5]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
ldr r4, [r5]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
ldr r4, [r5]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
ldr r4, [r5]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
ldr r4, [r5]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
movs r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
movs r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
movs r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
movs r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init str
mov r3, r10
ldr r3, [r3, #0]
mov r2, r11
adds r2, #0
str r3, [r2]
mov r3, r10
ldr r3, [r3, #4]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
str r3, [r2]
movs r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
eors r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
eors r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
eors r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
eors r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
eors r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
lsls r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
lsls r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
lsls r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
lsls r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
lsls r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
str r5, [r4]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
str r5, [r4]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
str r5, [r4]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
str r5, [r4]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
str r5, [r4]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
ldr r4, [r5]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
ldr r4, [r5]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
ldr r4, [r5]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
ldr r4, [r5]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
ldr r4, [r5]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
movs r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
movs r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
movs r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
movs r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init ldr
mov r2, r10
ldr r2, [r2, #0]
mov r3, r10
adds r3, #4
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
ldr r2, [r3]
movs r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
eors r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
eors r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
eors r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
eors r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init eors
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
eors r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
lsls r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
lsls r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
lsls r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
lsls r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init lsls
mov r4, r10
ldr r5, [r4,#12]
movs r4, #31
ands r5, r4
mov r4, r10
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
lsls r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
str r5, [r4]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
str r5, [r4]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
str r5, [r4]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
str r5, [r4]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init str
mov r5, r10
ldr r5, [r5, #8]
mov r4, r11
adds r4, #4
str r5, [r4]
mov r5, r10
ldr r5, [r5, #12]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
str r5, [r4]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
ldr r4, [r5]
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
ldr r4, [r5]
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
ldr r4, [r5]
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
ldr r4, [r5]
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init ldr
mov r4, r10
ldr r4, [r4, #8]
mov r5, r10
adds r5, #12
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r5]
movs r1, r1
eors r1, r1
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
ldr r4, [r5]
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init eors
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
movs r4, r5
eors r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init lsls
mov r6, r10
ldr r7, [r6,#20]
movs r6, #31
ands r7, r6
mov r6, r10
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
movs r4, r5
lsls r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init str
mov r7, r10
ldr r7, [r7, #16]
mov r6, r11
adds r6, #8
str r7, [r6]
mov r7, r10
ldr r7, [r7, #20]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
movs r4, r5
str r7, [r6]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init ldr
mov r6, r10
ldr r6, [r6, #16]
mov r7, r10
adds r7, #20
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
movs r4, r5
ldr r6, [r7]
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}
@ init movs
mov r2, r10
ldr r3, [r2,#4]
ldr r2, [r2,#0]
@ init movs
mov r4, r10
ldr r5, [r4,#12]
ldr r4, [r4,#8]
@ init movs
mov r6, r10
ldr r7, [r6,#20]
ldr r6, [r6,#16]
push {r0-r3}
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
pop {r0-r3}
@ --------code start ---------
@ str state set
mov r0, r10
ldr r0, [r0, #24]
mov r1, r9
ldr r1, [r1, #4]
movs r1, r5
eors r1, r5
mov r1, r11
str r0, [r1, #12]
movs r0, #0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r0, r0
movs r2, r3
movs r4, r5
movs r6, r7
@ --------------------
push {r0-r3}
mov r7, r7
pop {r0-r3}


    pop {r0-r7}
    pop {pc}

.endfunc



