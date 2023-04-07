/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * lab1a_print.c: simple test application
 * This program should start by printing your name and then once printing the current
 * value of the dip switches.  Then, the program should run continuously in a loop
 * forever, monitoring the slider switches for changes, and printing the new value
 * when (and only when) they are moved by the operator.
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio_l.h"


int main()
{
    init_platform();
    int32_t presentSwitch, newSwitch;

    // Print
    print("Dirk Holzman\n\r");
    printf("Sending 0x3 to the LEDs...\n\r");
    XGpio_WriteReg(XPAR_DIPS_AND_LEDS_BASEADDR, XGPIO_DATA2_OFFSET,0x03);
    printf("The current value of the DIP switch port is : 0x%X\r\n", XGpio_ReadReg(XPAR_DIPS_AND_LEDS_BASEADDR,XGPIO_DATA_OFFSET));

    // Continuously loop, monitor switches for changes, and print any new values

    while(1)
    {
    	newSwitch = XGpio_ReadReg(XPAR_DIPS_AND_LEDS_BASEADDR,XGPIO_DATA_OFFSET);

    	if (presentSwitch != newSwitch)
    	{
    		printf("CHANGE : the new value is 0x%X\r\n", XGpio_ReadReg(XPAR_DIPS_AND_LEDS_BASEADDR,XGPIO_DATA_OFFSET));
			presentSwitch = XGpio_ReadReg(XPAR_DIPS_AND_LEDS_BASEADDR,XGPIO_DATA_OFFSET);
    	}
    }

    cleanup_platform();
    return 0;
}
