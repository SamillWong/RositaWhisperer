


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
bl trigger_high
pop {r0-r3}
@ --------code start ---------
@ no state set
mov r0, r10
ldr r0, [r0,#24]
mov r1, r9
ldr r5, [r1,#4]
str r5, [r1,#8]
eors r1, r5
movs r1, r5
movs r1, #0
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
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
mov r7, r7
bl trigger_low
pop {r0-r3}


    pop {r0-r7}
    pop {pc}

.endfunc



