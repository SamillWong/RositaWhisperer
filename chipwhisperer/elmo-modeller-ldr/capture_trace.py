#!/usr/bin/env python3

SCOPETYPE = 'CWNANO'
PLATFORM = 'CWNANO'
SS_VER = 'SS_VER_1_1'

CLKOUT = 7500000
CLKFREQ = 7500000
NUM_SAMPLE = 500
NUM_TRACE = 1000

HEXFILE = "ldr-state-CWNANO.hex"

# Check arguments
import sys
if len(sys.argv) != 5:
    print("Usage: ./capture_trace.py <state> <idxs1> <idxs2> <idxs3>")
    print("Example: ./capture.trace.py ldr-state 0 1 2")
    exit()

# Import modules
import chipwhisperer as cw
import usb
import time
import numpy as np

# Setup ChipWhisperer Nano
try:
    try:
        if not scope.connectStatus:
            scope.con()
    except NameError:
        scope = cw.scope()

    SS_VER="SS_VER_1_1"
    target_type = cw.targets.SimpleSerial

    try:
        target = cw.target(scope, target_type)
    except IOError:
        print("INFO: Caught exception on reconnecting to target - attempting to reconnect to scope first.")
        print("INFO: This is a work-around when USB has died without Python knowing. Ignore errors above this line.")
        scope = cw.scope()
        target = cw.target(scope, target_type)
except:
    if usb.__version__ < '1.1.0':
        print("-----------------------------------")
        print("Unable to connect to chipwhisperer. pyusb {} detected (>= 1.1.0 required)".format(usb.__version))
        print("-----------------------------------")
    raise

# print("Found ChipWhisperer device",PLATFORM)

# Setup programmer
prog = cw.programmers.STM32FProgrammer
time.sleep(0.05)
scope.default_setup()
def reset_target(scope):
    scope.io.nrst = 'low'
    time.sleep(0.05)
    scope.io.nrst = 'high_z'
    time.sleep(0.05)

# Config scope
scope.io.clkout = CLKOUT
scope.adc.clk_freq = CLKFREQ
scope.adc.samples = NUM_SAMPLE

# print("================================================")
# print("Experiment setup:")
# print("Scope type =",SCOPETYPE)
# print("Platform =",PLATFORM)
# print("SimpleSerial version =",SS_VER)
# print("Target CLKOUT =",scope.io.clkout)
# print("Scope CLKFREQ =",scope.adc.clk_freq)
# print("Number of samples =",scope.adc.samples)
# print("Number of traces =",NUM_TRACE)

# Program target
# print("================================================")
# print("Programming target with",HEXFILE)
cw.program_target(scope, cw.programmers.STM32FProgrammer, HEXFILE)

# Capture trace
# print("================================================")
# print("Capturing traces...")

trace_array = []
text = bytearray([0] * 16) 
reset_target(scope)

for i in range(NUM_TRACE):
    target.flush()
    scope.arm()
    
    target.simpleserial_write('p', text)
    
    ret = scope.capture()
    
    if ret:
        print("Target timed out!")
        continue
    
    #response = target.simpleserial_read('r', 32)
    #print(response)

    trace_array.append(scope.get_last_trace())

# Disarm scope and target
scope.dis()
target.dis()

# Save traces to file
OUTPUTPATH = './traces/{}-{}-{}-{}.npy'.format(sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4])
with open(OUTPUTPATH, 'wb') as f:
    np.save(f, trace_array)

# print("Done! Captured traces saved as",OUTPUTPATH)