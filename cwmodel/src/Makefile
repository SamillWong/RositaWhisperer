all: ldr-state.s str-state.s eors-state.s movs-state.s no-state.s
	arm-none-eabi-as -g ldr-state.s -o ldr-state.o
	arm-none-eabi-as -g str-state.s -o str-state.o
	arm-none-eabi-as -g eors-state.s -o eors-state.o
	arm-none-eabi-as -g movs-state.s -o movs-state.o
	arm-none-eabi-as -g no-state.s -o no-state.o
	arm-none-eabi-objcopy --change-address 0x8000000 -O ihex ldr-state.o ldr-state.hex
	arm-none-eabi-objcopy --change-address 0x8000000 -O ihex str-state.o str-state.hex
	arm-none-eabi-objcopy --change-address 0x8000000 -O ihex eors-state.o eors-state.hex
	arm-none-eabi-objcopy --change-address 0x8000000 -O ihex movs-state.o movs-state.hex
	arm-none-eabi-objcopy --change-address 0x8000000 -O ihex no-state.o no-state.hex
clean:
	rm ./*.o
	rm ./*.hex
