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


/* I/O Definitions */
#define LED _RC14
#define BUT _RC13

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
void Update_Status_LED(void);
void Hardware_Initialization(void);

#endif	/* HARDWARE_CONFIG_H */

