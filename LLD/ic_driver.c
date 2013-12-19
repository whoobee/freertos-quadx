/*
 * File:   ic_driver.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "../BSW/gen_inc.h"
#include "../BSW/software_config.h"
#include "../BSW/hardware_config.h"

#include "ic_driver.h"
/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void ICAP_Init(void)
{
    //Clear interrupt flag
    mIC4ClearIntFlag();
    
    // Enable Input Capture Module 1
    // - Capture Every edge
    // - Enable capture interrupts
    // - Use Timer 3 source
    // - Capture rising edge first
    OpenCapture4(IC_EVERY_EDGE | IC_INT_4CAPTURE | IC_TIMER3_SRC | IC_FEDGE_RISE | IC_ON);
}

/*EOF*/