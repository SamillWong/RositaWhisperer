#!/bin/sh
if [[ -f "ldr-state-CWNANO.hex" ]]; then
	mv ldr-state-CWNANO.hex ./bin/ldr-state-CWNANO-`md5sum ./ldr-state-CWNANO.hex | cut -d' ' -f1`.hex
fi
