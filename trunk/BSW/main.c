/*
 * File:   main.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "gen_inc.h"
#include "hardware_config.h"
#include "software_config.h"
#include "utils.h"
/*OS include*/
#include "../OS/os_if.h"

/*===========================================================================*
 *                    PIC32 Configuration registers                          *
 *===========================================================================*/
#pragma config FPLLMUL  = MUL_20        // PLL Multiplier
#pragma config FPLLIDIV = DIV_2         // PLL Input Divider
#pragma config FPLLODIV = DIV_1         // PLL Output Divider
#pragma config FPBDIV   = DIV_4         // Peripheral Clock divisor
#pragma config FWDTEN   = OFF           // Watchdog Timer
#pragma config WDTPS    = PS1           // Watchdog Timer Postscale
#pragma config FCKSM    = CSECME        // Clock Switching & Fail Safe Clock Monitor
#pragma config OSCIOFNC = OFF           // CLKO Enable
#pragma config POSCMOD  = OFF           // Primary Oscillator
#pragma config IESO     = OFF           // Internal/External Switch-over
#pragma config FSOSCEN  = OFF           // Secondary Oscillator Enable
#pragma config FNOSC    = FRCPLL        // Oscillator Selection
#pragma config CP       = OFF           // Code Protect
#pragma config BWP      = OFF           // Boot Flash Write Protect
#pragma config PWP      = OFF           // Program Flash Write Protect
#pragma config ICESEL   = ICS_PGx1      // ICE/ICD Comm Channel Select
#pragma config DEBUG    = OFF           // Debugger Disabled for Starter Kit

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

static void System_Initialization(void);
static void System_Initialization(void)
{
   Hardware_Initialization();
   Software_Initialization();

   //Gyro_Init();
   //Acc_Init();
   
   SYSTEM_STATE.SYSTEM_INIT_DONE = TRUE;
}

void main(void)
{
   System_Initialization();

   Os_Task_Init();
   //Os_Timer_Init();

   vTaskStartScheduler();

   INFINITE_LOOP();
}

/*EOF*/
