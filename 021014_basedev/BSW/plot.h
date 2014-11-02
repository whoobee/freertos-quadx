/* 
 * File:   plot.h
 * Author: Huby
 *
 * Created on July 14, 2013, 8:12 PM
 */

#ifndef PLOT_H
#define	PLOT_H

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
#include "../LLD/uart_driver.h"

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define PLOT(number, name, value, type)                                                     \
	do{                                                                                 \
           if(number>CHANNEL_SIZE)                                                          \
              {CHANNEL_SIZE=number;}                                                        \
           sprintf(CHANNEL, "%d:%d:%s:%d:%s\n", CHANNEL_SIZE, number, name, value, type);   \
           SendDataBuffer(CHANNEL, strlen(CHANNEL));                                        \
	}while(0)

#endif	/* PLOT_H */

