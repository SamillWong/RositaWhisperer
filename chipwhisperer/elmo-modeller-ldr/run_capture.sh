#!/bin/bash
echo "Starting capture, this will take a moment..."
for state in ldr-state str-state eors-state movs-state no-state; do
    echo -e "\nCapturing traces for $state..."
    for i1 in {0..4}; do
        for i2 in {0..4}; do
            for i3 in {0..4}; do
                echo -ne "Capturing traces for: $state/$i1-$i2-$i3\033[0K\r"
                cp ~/Desktop/rosita/cwmodel/$state/obj/$i1-$i2-$i3.o ~/Desktop/chipwhisperer/hardware/victims/firmware/elmo-modeller-ldr/calib.o

                arm-none-eabi-gcc -mcpu=cortex-m0 -I. -mthumb -mfloat-abi=soft -ffunction-sections -gdwarf-2 -DSS_VER=SS_VER_1_1 -DSTM32F030x6 -DSTM32F0 -DSTM32 -DDEBUG -DHAL_TYPE=HAL_stm32f0_nano -DPLATFORM=CWNANO -DF_CPU=7372800UL -DSS_VER_2_0=2 -DSS_VER_1_1=1 -DSS_VER_1_0=0 -O0 -funsigned-char -funsigned-bitfields -fshort-enums -Wall -Wstrict-prototypes -Wa,-adhlns=objdir/ldr-state.o -I.././simpleserial/ -I.././hal -I.././hal/stm32f0 -I.././hal/stm32f0/CMSIS -I.././hal/stm32f0/CMSIS/core -I.././hal/stm32f0/CMSIS/device -I.././hal/stm32f0/Legacy -I.././crypto/ -std=gnu99  -MMD -MP -MF .dep/ldr-state-CWNANO.elf.d elmoasmfunctions.o calib.o objdir/ldr-state.o objdir/simpleserial.o objdir/stm32f0_hal_nano.o objdir/stm32f0_hal_lowlevel.o objdir/stm32f0_startup.o --output ldr-state-CWNANO.elf --specs=nano.specs --specs=nosys.specs -T .././hal/stm32f0_nano/LinkerScript.ld -Wl,--gc-sections -lm -mthumb -mcpu=cortex-m0  -Wl,-Map=ldr-state-CWNANO.map,--cref   -lm  
                arm-none-eabi-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature ldr-state-CWNANO.elf ldr-state-CWNANO.hex
                
                python ~/Desktop/chipwhisperer/hardware/victims/firmware/elmo-modeller-ldr/capture_trace.py $state $i1 $i2 $i3 1>/dev/null
            done
        done
    done
done
echo -e "\nDone!"
