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

// Let compile time pre-processor calculate the PR1 (period)
#define PB_DIV                 8
#define PRESCALE               256
#define MSEC                   10E-3
#define TOGGLES_PER_SEC        5 * MSEC
#define T2_TICK       	       (SYS_CLOCK/PB_DIV/PRESCALE/TOGGLES_PER_SEC)
#define T3_TICK                (500 * MSEC * FOSC)/(PB_DIV * PRESCALE)

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

void Timer_Init(void);

#endif	/* TIMER_H */
