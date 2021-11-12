#!/bin/bash
python ~/Desktop/rosita/elmo-model/Model\ Building\ Code/genasm_pad.py ldr-state > ~/Desktop/rosita/cwmodel/src/ldr-state.s
arm-none-eabi-as -g ~/Desktop/rosita/cwmodel/src/ldr-state.s -o ~/Desktop/chipwhisperer/hardware/victims/firmware/elmo-modeller-ldr/ldr.o
