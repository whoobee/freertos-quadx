/* 
 * File:   i2c_driver.h
 * Author: Huby
 *
 * Created on October 17, 2012, 8:40 PM
 */

#ifndef I2C_DRIVER_H
#define	I2C_DRIVER_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define I2C_CLOCK_FREQ                   5000
#define I2C_BUS                          I2C2

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
BOOL I2C_Init(void);
BOOL I2C_Send_One_Byte(UINT8 device_address, UINT8 reg_add, UINT8 data);
BOOL I2C_Receive_One_Byte(UINT8 device_address, UINT8 reg_add, UINT8 *data);

#endif	/* I2C_DRIVER_H */

