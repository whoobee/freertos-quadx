/*
 * File:   timer.h
 * Author: Huby
 *
 * Created on October 18, 2012, 8:32 PM
 */

#ifndef TIMER_H
#define	TIMER_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/

// Let compile time pre-processor calculate the PR2 (period)
/* T2_FREQUENCY = T2_PRESCALER/PER_CLOCK */
/* T2_ACCURACY = 1/T2_FREQUENCY */
/* T2_RESOLUTION = 5E-3*/
#define T2_TICK  0x186  /* T2_TICK = T2_RESOLUTION/T2_ACCURACY */


/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

void Timer_Init(void);

#endif	/* TIMER_H */
