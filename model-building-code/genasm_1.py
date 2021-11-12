#! /bin/bash

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

insts_g_eor = ['eors','adds', 'ands', 'cmps', 'movs', 'orrs', 'subs']
insts_cls_eor = [0,0,0,0,0,0,0]

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

def f(l):
    return [l[0]]

insts += f(insts_g_eor)
insts += f(insts_g_lsl)
insts += f(insts_g_str)
insts += f(insts_g_ldr)
insts += f(insts_g_mul)
insts += f(insts_g_pop)
insts += f(insts_g_push)

insts_cls = []
insts_cls += f(insts_cls_eor)
insts_cls += f(insts_cls_lsl)
insts_cls += f(insts_cls_str)
insts_cls += f(insts_cls_ldr)
insts_cls += f(insts_cls_mul)
insts_cls += f(insts_cls_pop)
insts_cls += f(insts_cls_push)


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
    a += ['{} {}, {}'.format(inst, r2, r1)]
    return a
def run_push(a, inst, r1, r2):
    a += ['{} {{{}}}'.format(inst, r2)]
    return a
def run_pop(a, inst, r1, r2):
    a += ['{} {{{}}}'.format(inst, r2)]
    return a

def print_insts(insts):
    for inst in insts:
        print(inst)
    
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
def insts_load_inputs(a):
    a += [
        'mov r10, r0',
        'mov r11, r1', 
        'mov r7, r2',
        'mov r6, r3',
        'ldr r7, [r7]'
        ]
    return a
def insts_pad(a, nopr):
    a += ['movs {}, {}'.format(nopr, nopr)]
    return a
insts_init = [init_eors, init_lsls, init_str, init_ldr, init_muls, init_pop, init_push]
insts_finit = [finit_dummy,finit_dummy,finit_dummy,finit_dummy,finit_dummy, finit_dummy, finit_push]
insts_run = [run_eors, run_lsls, run_str, run_ldr, run_muls, run_pop, run_push]

a = []

a = insts_load_inputs(a)
#a = insts_starttrigger(a)

for i in range(0, len(insts)):
    inp_offset = 0
    out_offset = 0
    
    a, inp_offset, out_offset = insts_init[insts_cls[i]](a, 'r2','r3', inp_offset, out_offset)
    a = insts_endtrigger(a)
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_run[insts_cls[i]](a, insts[i], 'r2', 'r3')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_pad(a,'r7')
    a = insts_finit[insts_cls[i]](a, 'r2', 'r3')
print(pre_text)
print_insts(a)
print(post_text)


