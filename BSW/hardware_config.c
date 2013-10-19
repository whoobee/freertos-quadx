/*
 * File:   hardware_config.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "gen_inc.h"
#include "hardware_config.h"
/*Low level drivers include*/
#include "../LLD/uart_driver.h"
#include "../LLD/i2c_driver.h"
#include "../LLD/sensors.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void Hardware_Initialization(void)
{
    SYSTEMConfig(SYS_CLOCK, SYS_CFG_WAIT_STATES|SYS_CFG_PCACHE);
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
    AD1PCFG = 0xFFFF;
    TRISC = 0x2000;

    LED = 0;
    BUT = 0;

    UART_Init();
    I2C_Init();
}

/*EOF*/