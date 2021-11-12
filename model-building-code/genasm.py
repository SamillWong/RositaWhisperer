#! /usr/bin/python3
import sys
insts_idxs = [0,1,2,3,4]
insts_idxs1 = [0]
insts_idxs2 = [0]
# instrction classes from ELMO's model
insts = ['eors','lsls','str','ldr','movs']
# state instruction classes from leakage matrix
state_insts = ['eors','movs','str','ldr']
insts_len = [1,1,2,2,1]

# Memory setup for experiments
# 
# BASE[0..] - input buffer
# SBASE[0..] - output buffer
#
# Above buffers are the only state changes that are
# seen by different tests all other states are assumed 
# to be the same
#
# WORKAREA[0..] - workarea buffer, includes R, op2 of 
# current instruction and space for scratch work for
# each test.
#
# := is word copy
#
# ** IMPORTANT ** 
# The device this code was run on (stm32f030 discovery board)
# shows leakage between mov instructions (but not movs)
# We've only used mov instructions for manipulations with 
# addresses. No values are moved with mov.
BASE = 'r10'
SBASE = 'r11'
W_ADDR = 'r9'

class Context:
    op2reg = None
    isOp2Val = None

def init_movs(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init movs',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    c.isOp2Val = True
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8   
    return (a, inp_offset, out_offset)

def init_muls(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init muls',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    c.isOp2Val = True
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8   
    return (a, inp_offset, out_offset)

def init_eors(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init eors',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]

    c.isOp2Val = True
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8
    return (a, inp_offset, out_offset)

def init_lsls(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init lsls',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'movs {}, #31'.format(r1),
         'ands {}, {}'.format(r2, r1),
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    c.isOp2Val = True
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8
    return (a, inp_offset, out_offset)
    
def init_ldr(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init ldr',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{}, #{}]'.format(r1, r1, inp_offset),
         #'ldr {}, ={}'.format(r2, BASE),
         'mov {}, {}'.format(r2, BASE),
         'adds {}, #{}'.format(r2, inp_offset+4)
         ]
    c.isOp2Val = False
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8
    return (a, inp_offset, out_offset)

# let str r2, [r1] store data and set up init values
def init_str(a, r1, r2, c, inp_offset, out_offset):
    a += ['@ init str',
         'mov {}, {}'.format(r2, BASE),
         'ldr {}, [{}, #{}]'.format(r2, r2, inp_offset), # r2 := BASE[inp_offset]
         'mov {}, {}'.format(r1, SBASE),
         'adds {}, #{}'.format(r1, out_offset),
         'str {}, [{}]'.format(r2, r1), # SBASE[out_offset] := r2, r1 = &SBASE[out_offset]
         'mov {}, {}'.format(r2, BASE), # r2 = &BASE[0]
         'ldr {}, [{}, #{}]'.format(r2, r2, inp_offset+4) # r2 := BASE[inp_offset+4]
         ]
    c.isOp2Val = True
    c.op2reg = r2
    out_offset += 4
    inp_offset += 8
    return (a, inp_offset, out_offset)



def insts_ldr_state_init(a, rt1, rt2, c, inp_offset, out_offset):
    # rt2 - value
    # rt1 - @value
    a += [
        '@ ldr state set',
        'mov {}, {}'.format(rt1, W_ADDR)]
    if c.isOp2Val:
        a += [
            'movs {}, {}'.format(rt1, rt1), # balance ldr inst below
            'movs {}, {}'.format(rt1, rt1),
            'str {}, [{},#{}]'.format(c.op2reg, rt1, 8), # HD_str = 0
            'movs {}, {}'.format(rt1, c.op2reg), # HD_movs = 0
            'eors {}, {}'.format(rt1, c.op2reg), # HD_eors = 0
            ]
    else:
        a += [
            'ldr {}, [{}]'.format(rt2, c.op2reg),
            'str {}, [{},#{}]'.format(rt2, rt1, 8), # HD_str = 0
            'movs {}, {}'.format(rt1, rt2), # HD_movs = 0
            'eors {}, {}'.format(rt1, rt2), # HD_eors = 0
            ]

    a += ['mov {}, {}'.format(rt1, BASE),
        'ldr {}, [{},#{}]'.format(rt2, rt1, inp_offset),
        'movs {}, #0'.format(rt2) # clear value from register
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)

def insts_str_state_init(a, rt1, rt2, c, inp_offset, out_offset):
    # rt2 - value
    # rt1 - @value
    a += [
        '@ str state set',
        'mov {}, {}'.format(rt2, BASE),
        'ldr {}, [{}, #{}]'.format(rt2, rt2, inp_offset), # rt2 := BASE[inp_offset]

        'mov {}, {}'.format(rt1, W_ADDR)]
    if c.isOp2Val:
        a += [
            'ldr {}, [{}, #{}]'.format(rt1, rt1, 4),
            'movs {}, {}'.format(rt1, c.op2reg),
            'eors {}, {}'.format(rt1, c.op2reg),
            ]
    else:
        a += [
            'ldr {}, [{}]'.format(rt1, c.op2reg),
            'movs {}, {}'.format(rt1, rt1),
            'eors {}, {}'.format(rt1, rt1),
            ]
    a += [
        'mov {}, {}'.format(rt1, SBASE),        
        'str {}, [{}, #{}]'.format(rt2, rt1, out_offset), # SBASE[out_offset] := rt2

        'movs {}, #0'.format(rt2) # clear value from register
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)

def insts_eors_state_init(a, rt1, rt2, c, inp_offset, out_offset):
    # rt2 - value
    # rt1 - value
    a += [
        '@ eors state set',
        'mov {}, {}'.format(rt1, BASE), # state
        #'ldr {}, [{},#{}]'.format(rt2, rt1, inp_offset),
        'ldr {}, [{},#{}]'.format(rt1, rt1, inp_offset), 
        'mov {}, {}'.format(rt2, W_ADDR)
        ]

    if c.isOp2Val:
        a += [
            'ldr {}, [{},#{}]'.format(c.op2reg, rt2, 4), # make HD_ldr = 0
            'str {}, [{},#{}]'.format(c.op2reg, rt2, 8), # write to WorkArea so that HD_str = 0
            'movs {}, {}'.format(rt2, c.op2reg), # reset op1
            ]
    else:
        a += [
            'ldr {}, [{}]'.format(rt2, c.op2reg), 
            'str {}, [{}]'.format(rt2, c.op2reg), # write to WorkArea so that HD_str = 0
            'movs {}, {}'.format(rt2, rt2), # reset op1
            ]
    a += [
        'movs {}, #0'.format(rt2), # clear value
        'eors {}, {}'.format(rt2, rt1), # rt2 := BASE[inp_offset] ^ 0
        'movs {}, #0'.format(rt1), # clear value
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)


def insts_movs_state_init(a, rt1, rt2, c, inp_offset, out_offset):
    # rt2 - value
    # rt1 - value
    a += [
        '@ movs state set',
        'mov {}, {}'.format(rt1, BASE), # state
        #'ldr {}, [{},#{}]'.format(rt2, rt1, inp_offset),
        'ldr {}, [{},#{}]'.format(rt1, rt1, inp_offset), 
        'mov {}, {}'.format(rt2, W_ADDR)
        ]

    if c.isOp2Val:
        a += [
            'ldr {}, [{},#{}]'.format(c.op2reg, rt2, 4), # make HD_ldr = 0
            'str {}, [{},#{}]'.format(c.op2reg, rt2, 8), # write to WorkArea so that HD_str = 0
            'eors {}, {}'.format(rt2, c.op2reg), # reset op1
            ]
    else:
        a += [
            'ldr {}, [{}]'.format(rt2, c.op2reg), 
            'str {}, [{}]'.format(rt2, c.op2reg), # write to WorkArea so that HD_str = 0
            'eors {}, {}'.format(rt2, rt2), # reset op1
            ]
    a += [
        'movs {}, {}'.format(rt2, rt1), # rt2 := BASE[inp_offset] ^ 0 
        'movs {}, #0'.format(rt2), # clear value
        'movs {}, #0'.format(rt1), # clear value
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)

def insts_no_state_init(a, rt1, rt2, c, inp_offset, out_offset):
    # rt2 - value
    # rt1 - value
    a += [
        '@ no state set',
        'mov {}, {}'.format(rt1, BASE), # state
        #'ldr {}, [{},#{}]'.format(rt2, rt1, inp_offset),
        'ldr {}, [{},#{}]'.format(rt1, rt1, inp_offset), 
        'mov {}, {}'.format(rt2, W_ADDR)
        ]

    if c.isOp2Val:
        a += [
            'ldr {}, [{},#{}]'.format(c.op2reg, rt2, 4), # make HD_ldr = 0
            'str {}, [{},#{}]'.format(c.op2reg, rt2, 8), # write to WorkArea so that HD_str = 0
            'eors {}, {}'.format(rt2, c.op2reg), # reset op1
            'movs {}, {}'.format(rt2, c.op2reg), # rt2 := BASE[inp_offset] ^ 0
            ]
    else:
        a += [
            'ldr {}, [{}]'.format(rt2, c.op2reg), 
            'str {}, [{}]'.format(rt2, c.op2reg), # write to WorkArea so that HD_str = 0
            'eors {}, {}'.format(rt1, rt2), # reset op1
            'movs {}, {}'.format(rt1, rt2), # rt2 := BASE[inp_offset] ^ 0
            ]
    a += [
        'movs {}, #0'.format(rt2), # clear value
        'movs {}, #0'.format(rt1), # clear value
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)

def run_eors(a, r1, r2):
    a += ['eors {}, {}'.format(r1, r2)]
    return a
def run_lsls(a, r1, r2):
    a += ['lsls {}, {}'.format(r1, r2)]
    return a
def run_ldr(a, r1, r2):
    a += ['ldr {}, [{}]'.format(r1, r2)]
    return a
def run_str(a, r1, r2):
    a += ['str {}, [{}]'.format(r2, r1)]
    return a
def run_movs(a, r1, r2):
    a += ['movs {}, {}'.format(r1, r2)]
    return a

#def run_state_ldr_ldr(a, r1, r2, rt):
    #a += ['movs {}, {}'.format(rt, rt),
        #'ldr {}, [{}]'.format(r1, r2),
        #'movs {}, {}'.format(rt, rt)]
    #return a

#def run_state_ldr_str(a, r1, r2, rt):
    #return run_state_str_str(a, r1, r2, rt)

#def run_state_str_str(a, r1, r2, rt):
    #a += ['movs {}, {}'.format(rt, rt),
        #'str {}, [{}]'.format(r2, r1),
        #'movs {}, {}'.format(rt, rt)]
    #return a

#def run_state_str_ldr(a, r1, r2, rt):
    #return run_state_ldr_ldr(a, r1, r2, rt)
    
def insts_incr(a):
    a += [
        'push {r0-r3}',
        'bl incr_base',
        'pop {r0-r3}']
    return a;
def insts_trigger(a):
    a += [
        'push {r0-r3}',
        'bl endtrigger',
        'pop {r0-r3}']
    return a

def insts_comment(a,comment):
    a += ['@ '+comment]
    return a
insts_init = [init_eors, init_lsls, init_str, init_ldr, init_movs]

insts_run = [run_eors, run_lsls, run_str, run_ldr, run_movs]
def print_insts(insts):
    for inst in insts:
        print(inst)
    
inp_offset = 0
out_offset = 0

def insts_load_inputs():
    a= [
        'mov r10, r0',
        'mov r11, r1',
        'mov r9, r2',
        ]
    return a

def insts_pad(a, nopr):
    a += ['movs {}, {}'.format(nopr, nopr)]
    return a

pre_text ="""


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
"""
post_text="""

    pop {r0-r7}
    pop {pc}

.endfunc


"""

print(pre_text)
a = insts_load_inputs()
print_insts(a)

mode = sys.argv[1]

for inst1 in insts_idxs:
    for inst2 in insts_idxs1:
        for inst3 in insts_idxs1:
            inp_offset = 0
            out_offset = 0
            a = []
            c0 = Context()
            c = Context()
            a, inp_offset, out_offset = insts_init[inst1](a, 'r2','r3', c0, inp_offset, out_offset)
            a, inp_offset, out_offset = insts_init[inst2](a, 'r4','r5', c,  inp_offset, out_offset)
            a, inp_offset, out_offset = insts_init[inst3](a, 'r6','r7', c0, inp_offset, out_offset)
            a = insts_trigger(a)
            a = insts_comment(a, '--------code start ---------')
            
            
            if mode == 'ldr-state':
                a, inp_offset, out_offset = insts_ldr_state_init(a, 'r0', 'r1', c, inp_offset, out_offset)
            elif mode == 'str-state':
                a, inp_offset, out_offset = insts_str_state_init(a, 'r1', 'r0', c, inp_offset, out_offset)
            elif mode == 'eors-state':
                a, inp_offset, out_offset = insts_eors_state_init(a, 'r0', 'r1', c, inp_offset, out_offset)
            elif mode == 'movs-state':
                a, inp_offset, out_offset = insts_movs_state_init(a, 'r0', 'r1', c, inp_offset, out_offset)
            elif mode == 'no-state':
                a, inp_offset, out_offset = insts_no_state_init(a, 'r0', 'r1', c, inp_offset, out_offset)
            else:
                raise BaseException("invalid")
            a = insts_pad(a, 'r0')
            a = insts_pad(a, 'r0')
            a = insts_pad(a, 'r0')
            a = insts_pad(a, 'r0')
            a = insts_pad(a, 'r0')
            
            a = insts_run[inst1](a, 'r2','r3')

            a = insts_run[inst2](a, 'r4','r5')

            a = insts_run[inst3](a, 'r6','r7')
            
            a = insts_comment(a, '--------------------')
            
            a = insts_incr(a)
            print_insts(a)

print(post_text)
