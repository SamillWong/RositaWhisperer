


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
bl trigger_high
pop {r0-r3}
@ --------code start ---------
@ ldr state set
mov r0, r9
movs r0, r0
movs r0, r0
str r5, [r0,#8]
movs r0, r5
eors r0, r5
mov r0, r10
ldr r1, [r0,#24]
movs r1, #0
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



