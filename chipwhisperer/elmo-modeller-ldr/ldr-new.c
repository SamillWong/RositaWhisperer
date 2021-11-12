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

#define NTRACES /*@NTRACES{*/ 20000 /*}*/
#define TEST_TRACES (NTRACES/2)

#include "hal.h"
#include "elmoasmfunctionsdef.h"

extern void run_calib(void);

void simple_init(void)
{
    int j=0;
    for(;j<16;j++)
    {
    }
}

void simple_run(void)
{
    int i;

    for(i=0;i<NTRACES;i++)
    {
        run_calib();   
    }

    endprogram();
}

int main(void)
{
    platform_init();
    init_uart();
    trigger_setup();

    trigger_high();
    simple_init();
    simple_run();
    
    return 0;
}