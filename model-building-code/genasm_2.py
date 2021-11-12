#! /usr/bin/python3

# This file generates asm code for state lekage matrix experiment
# Leakage is checked for a code block similar to below,
# registers aa,bb,cc,dd are loaded with values/pointers so that
# there is some input correlation between the values (controlled from
# experiment config 'exp_XXX_leakagemat')
# AAA aa,bb
# movs r7,r7
# movs r7,r7
# movs r7,r7
# BBB cc,dd  <-- check for leakage here
#
import random
import sys
#insts_idxs = [0,1,2,3,4]
#insts = ['eors','lsls','str','ldr','muls']

insts_g_eor = ['eors','adds', 'ands', 'bics', 'cmps', 'mov', 'movs', 'orrs', 'subs']
insts_cls_eor = [0,0,0,0,0,0,0,0,0]

insts_g_lsl = ['lsls','rors', 'lsrs']
insts_cls_lsl = [1,1,1]

insts_g_str = ['str','strb', 'strh']
insts_cls_str = [2,2,2]

insts_g_ldr = ['ldr','ldrb', 'ldrh']
insts_cls_ldr = [3,3,3]

insts_g_mul = ['muls']
insts_cls_mul = [4]

insts_g_pop = ['pop']
insts_cls_pop = [5]

insts_g_push = ['push']
insts_cls_push = [6]


insts = []
insts += insts_g_eor
insts += insts_g_lsl
insts += insts_g_str
insts += insts_g_ldr
insts += insts_g_mul
insts += insts_g_pop
insts += insts_g_push

insts_cls = []
insts_cls += insts_cls_eor
insts_cls += insts_cls_lsl
insts_cls += insts_cls_str
insts_cls += insts_cls_ldr
insts_cls += insts_cls_mul
insts_cls += insts_cls_pop
insts_cls += insts_cls_push

#print(insts)
#print(insts_cls)
#exit()

insts_g = [insts_g_eor, insts_g_lsl, insts_g_str, insts_g_ldr, insts_g_mul]

insts_len = [1,1,2,2,1,2,2]

inst_state = ['ldr-ldr', 'ldr-str', 'str-ldr', 'str-str', 'ror']

def gen_u32():
    return random.getrandbits(32)

gen_u32()


class UnusedRegisters:
    def __init__(self):
        self.regs = ['r0','r1','r2','r3','r4','r5','r6','r7']
    def pick(self, num):
        if num > len(self.regs):
            raise Exception('?')
        p = self.regs[:num]
        self.regs = self.regs[num:]
        return tuple(p)
u = UnusedRegisters()

# Memory setup for experiments
# 
# BASE[0..15] - input buffer
# SBASE[0..15] - output buffer
#
# Above buffers are the only state changes that are
# seen by different tests all other states are assumed 
# to be the same
BASE = 'r10'
SBASE = 'r11'
def init_muls(a, r1, r2, inp_offset, out_offset):
    a += ['@ init muls',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    inp_offset += 8
    
    return (a, inp_offset, out_offset)

def init_eors(a, r1, r2, inp_offset, out_offset):
    a += ['@ init eors',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    inp_offset += 8
    return (a, inp_offset, out_offset)

def init_lsls(a, r1, r2, inp_offset, out_offset):
    a += ['@ init lsls',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]

    inp_offset += 8
    return (a, inp_offset, out_offset)
    
def init_ldr(a, r1, r2, inp_offset, out_offset):
    a += ['@ init ldr',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{}, #{}]'.format(r1, r1, inp_offset),
         #'ldr {}, ={}'.format(r2, BASE),
         'mov {}, {}'.format(r2, BASE),
         'adds {}, #{}'.format(r2, inp_offset+4)
         ]
    inp_offset += 8
    return (a, inp_offset, out_offset)

# let str r2, [r1] store data and set up init values
def init_str(a, r1, r2, inp_offset, out_offset):
    a += ['@ init str',
         'mov {}, {}'.format(r2, BASE),
         'ldr {}, [{}, #{}]'.format(r2, r2, inp_offset),
         #'ldr {}, ={}'.format(r1, SBASE),
         'mov {}, {}'.format(r1, SBASE),
         'adds {}, #{}'.format(r1, out_offset),
         'str {}, [{}]'.format(r2, r1),
         #'ldr {}, ={}'.format(r2, BASE),
         'mov {}, {}'.format(r2, BASE),
         'ldr {}, [{}, #{}]'.format(r2, r2, inp_offset+4)
         ]
    out_offset += 4
    inp_offset += 8
    return (a, inp_offset, out_offset)



def init_pop(a, r1, r2, inp_offset, out_offset):
    a += ['@ init pop',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset),
         'push {{{}}}'.format(r2)]
    inp_offset += 8
    
    return (a, inp_offset, out_offset)

def init_push(a, r1, r2, inp_offset, out_offset):
    a += ['@ init push',
         'mov {}, {}'.format(r1, BASE),
         'ldr {}, [{},#{}]'.format(r2, r1, inp_offset+4),
         'ldr {}, [{},#{}]'.format(r1, r1, inp_offset)]
    inp_offset += 8
    
    return (a, inp_offset, out_offset)

def finit_dummy(a, r1, r2):
    return a

def finit_push(a, r1, r2):
    a += ['@ finit push',
         'pop {{{}}}'.format(r2)
         ]
    return a


def insts_ldr_state_init(a, rt1, rt2, inp_offset):
    # rt2 - value
    # rt1 - @value
    a += [
        '@ ldr state set',
        'mov {}, {}'.format(rt1, BASE),
        'adds {}, #{}'.format(rt1, inp_offset),
        'ldr {}, [{}]'.format(rt2, rt1),
        ]
    inp_offset += 4
    return (a, inp_offset)

def insts_str_state_init(a, rt1, rt2, inp_offset, out_offset):
    # rt2 - value
    # rt1 - @value
    a += [
        '@ str state set',
        'mov {}, {}'.format(rt2, BASE),
        'ldr {}, [{}, #{}]'.format(rt2, rt2, inp_offset),
        'mov {}, {}'.format(rt1, SBASE),
        'str {}, [{}, #{}]'.format(rt2, rt1, out_offset),
        'mov {}, {}'.format(rt1, BASE),
        'adds {}, #{}'.format(rt1, inp_offset)
        ]
    inp_offset += 4
    out_offset += 4
    return (a, inp_offset, out_offset)

def run_eors(a, inst, r1, r2):
    a += ['{} {}, {}'.format(inst, r1, r2)]
    return a
def run_lsls(a, inst, r1, r2):
    a += ['{} {}, {}'.format(inst, r1, r2)]
    return a
def run_ldr(a, inst, r1, r2):
    a += ['{} {}, [{}]'.format(inst, r1, r2)]
    return a
def run_str(a, inst, r1, r2):
    a += ['{} {}, [{}]'.format(inst, r2, r1)]
    return a
def run_muls(a, inst, r1, r2):
    a += ['{} {}, {}'.format(inst, r1, r2)]
    return a
def run_push(a, inst, r1, r2):
    a += ['{} {{{}}}'.format(inst, r2)]
    return a

def run_pop(a, inst, r1, r2):
    a += ['{} {{{}}}'.format(inst, r2)]
    return a

def run_state_ldr_ldr(a, r1, r2, rt):
    a += ['movs {}, {}'.format(rt, rt),
        'ldr {}, [{}]'.format(r1, r2),
        'movs {}, {}'.format(rt, rt)]
    return a

def run_state_ldr_str(a, r1, r2, rt):
    return run_state_str_str(a, r1, r2, rt)

def run_state_str_str(a, r1, r2, rt):
    a += ['movs {}, {}'.format(rt, rt),
        'str {}, [{}]'.format(r2, r1),
        'movs {}, {}'.format(rt, rt)]
    return a

def run_state_str_ldr(a, r1, r2, rt):
    return run_state_ldr_ldr(a, r1, r2, rt)
    
def insts_incr(a):
    a += [
        'push {r0-r3}',
        'bl incr_base',
        'pop {r0-r3}']
    return a
def insts_starttrigger(a):
    a += [
        'push {r0-r3}',
        'bl starttrigger',
        'pop {r0-r3}']
    return a

def insts_endtrigger(a):
    a += [
        'push {r0-r3}',
        'bl endtrigger',
        'pop {r0-r3}']
    return a

def insts_comment(a,comment):
    a += ['@ '+comment]
    return a

def insts_pad(a, nopr):
    a += ['movs {}, {}'.format(nopr, nopr)]
    return a
def insts_mask(a, m, rx):
    a += ['eors {}, {}'.format(rx, m)]
    return a
insts_init = [init_eors, init_lsls, init_str, init_ldr, init_muls, init_pop, init_push]
insts_finit = [finit_dummy,finit_dummy,finit_dummy,finit_dummy,finit_dummy, finit_dummy, finit_push]
insts_run = [run_eors, run_lsls, run_str, run_ldr, run_muls, run_pop, run_push]
def print_insts(insts):
    for inst in insts:
        print(inst)
    
inp_offset = 0
out_offset = 0

def insts_load_inputs():
    a= [
        'mov r10, r0',
        'mov r11, r1',
        'mov r7, r2',
        'mov r6, r3',
        'ldr r7, [r7]'
        ]
    return a
def clear_state(a, rx):
    a += ['push {{{}}}'.format(rx),
        'pop {{{}}}'.format(rx)]
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
  .end

"""

print(pre_text)
a = insts_load_inputs()
print_insts(a)
nostate = True
# eors r1, r2
#for inst1 in range(0,len(insts)):
#    for inst2 in range(0,len(insts)):
        
inst1 = int(sys.argv[1])
inst2 = int(sys.argv[2])

inp_offset = 0
out_offset = 0
a = []

a, inp_offset, out_offset = insts_init[insts_cls[inst1]](a, 'r2','r3', inp_offset, out_offset)
a, inp_offset, out_offset = insts_init[insts_cls[inst2]](a, 'r4','r5', inp_offset, out_offset)
a = insts_starttrigger(a)
a = insts_comment(a, 'START CODE -------- '+insts[inst1]+'--'+insts[inst2]+'-------')

a = clear_state(a, 'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_run[insts_cls[inst1]](a, insts[inst1], 'r2','r3')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_run[insts_cls[inst2]](a, insts[inst2], 'r4','r5')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_pad(a,'r7')
a = insts_comment(a, 'END CODE --------------------')
a = insts_endtrigger(a)
a = insts_finit[insts_cls[inst2]](a,'r2','r3')
a = insts_finit[insts_cls[inst1]](a,'r4','r5')
#a = insts_incr(a)
print_insts(a)
a = []
a = insts_comment(a, '------code size -- '+str(len(insts)*len(insts))+'-------')
print_insts(a)
print(post_text)
