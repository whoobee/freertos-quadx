/*
 * File:   uart_driver.c
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

#include "uart_driver.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
unsigned char CHANNEL[64];
unsigned char CHANNEL_SIZE;

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void UART_Init(void)
{
    UARTConfigure(UART1, UART_ENABLE_PINS_TX_RX_ONLY);
    //UARTSetFifoMode(UART1, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
    UARTSetLineControl(UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
    UARTSetDataRate(UART1, GetPeripheralClock(), BAUD_RATE);
    UARTEnable(UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));
}

void SendDataBuffer(char *buffer, UINT32 size)
{
    while(size)
    {
        while(!UARTTransmitterIsReady(UART1));

        UARTSendDataByte(UART1, *buffer);
        buffer++;
        size--;
    }

    while(!UARTTransmissionHasCompleted(UART1));
}

/*EOF*/