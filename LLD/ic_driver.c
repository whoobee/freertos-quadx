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
input_capture_t INPUT_CAPTURE_1;
input_capture_t INPUT_CAPTURE_2;
input_capture_t INPUT_CAPTURE_3;
input_capture_t INPUT_CAPTURE_4;

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void ICAP_Init(void)
{
    //Clear interrupt flag
    mIC4ClearIntFlag();
    
    // Enable Input Capture Module 4
    // - Capture Every edge
    // - Enable capture interrupts
    // - Use Timer 3 source
    // - Capture rising edge first
    OpenCapture4(IC_EVERY_EDGE | IC_INT_4CAPTURE | IC_TIMER3_SRC | IC_FEDGE_RISE | IC_ON);
}

unsigned short Get_Incap_Data(unsigned char device)
{
    unsigned short captured_time;
    switch (device)
    {
    case ICAP1:
        if (mIC1CaptureReady())
        {
            captured_time = (unsigned short) mIC4ReadCapture();
        }
        break;

    case ICAP2:
        if (mIC2CaptureReady())
        {
            captured_time = (unsigned short) mIC4ReadCapture();
        }
        break;

    case ICAP3:
        if (mIC3CaptureReady())
        {
            captured_time = (unsigned short) mIC4ReadCapture();
        }
        break;

    case ICAP4:
        if (mIC4CaptureReady())
        {
            captured_time = (unsigned short) mIC4ReadCapture();
        }
        break;
    }
    return captured_time;
}

/*EOF*/