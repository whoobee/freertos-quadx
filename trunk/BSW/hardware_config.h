/* 
 * File:   Hardware_Config.h
 * Author: Huby
 *
 * Created on October 18, 2012, 8:22 PM
 */

#ifndef HARDWARE_CONFIG_H
#define	HARDWARE_CONFIG_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define _LEGACY_VECTOR_MACROS
#define SYS_CLOCK (80000000ul)
#define FOSC (80000000ul)
#define GetPeripheralClock()    (SYS_CLOCK/(1 << OSCCONbits.PBDIV))
#define	GetInstructionClock()   (SYS_CLOCK)


// Let compile time pre-processor calculate the PR1 (period)
#define PB_DIV                 8
#define PRESCALE               256
#define MSEC                   10E-3
#define TOGGLES_PER_SEC        10*MSEC

/* I/O Definitions */
#define LED _RC14
#define BUT _RC13

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
void Hardware_Initialization(void);

#endif	/* HARDWARE_CONFIG_H */

