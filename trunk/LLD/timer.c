/*
 * File:   timer.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "../BSW/gen_inc.h"
#include "../BSW/hardware_config.h"

#include "timer.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

void Timer_Init(void)
{
    OpenTimer2(T2_ON | T2_SOURCE_INT | T2_PS_1_256, T2_TICK);

    // set up the timer interrupt with a priority of 2
    ConfigIntTimer2(T2_INT_ON | T2_INT_PRIOR_2);
}

/*EOF*/
