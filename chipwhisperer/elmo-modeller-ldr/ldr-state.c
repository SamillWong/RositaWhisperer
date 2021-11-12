/* Copyright 2021 University of Adelaide
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *    http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "hal.h"
#include "simpleserial.h"
#define N_BASE 32

unsigned char SEED[N_BASE] = {0};
unsigned char BASE[N_BASE] = {0};
unsigned char SBASE[N_BASE] = {0};
unsigned int R = 0;
extern void run_calib(unsigned char*, unsigned char*, unsigned int*);

void init_seed(void)
{
    for (int i = 0; i < N_BASE; i++)
    {
	    SEED[i] = BASE[i];
    }
}

void incr_base(void)
{
    for (int i = 0; i < N_BASE; i++)
    {
    	SEED[i] = 1103515245 * SEED[i] + 12345;
    	BASE[i] = SEED[i] >> 24;
    }
}

void get_pt(uint8_t* pt, uint8_t len)
{
    init_seed();
    incr_base();
    run_calib(BASE, SBASE, &R);
    for (volatile int i = 0; i < 100; i++) {}
}

int main(void)
{
    platform_init();
    init_uart();
    trigger_setup();
	simpleserial_init();
    simpleserial_addcmd('p', 16, get_pt);
    
    while(1)
        simpleserial_get();
    
    return 0;
}