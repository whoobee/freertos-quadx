/* 
 * File:   uart_driver.h
 * Author: Huby
 *
 * Created on October 17, 2012, 11:13 PM
 */

#ifndef UART_DRIVER_H
#define	UART_DRIVER_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define BAUD_RATE 57600

/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
extern unsigned char CHANNEL[64];
extern unsigned char CHANNEL_SIZE;

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
void SendDataBuffer(char *buffer, UINT32 size);
void UART_Init(void);

#endif	/* UART_DRIVER_H */

