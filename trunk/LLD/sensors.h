/* 
 * File:   sensors.h
 * Author: Huby
 *
 * Created on October 18, 2012, 8:30 PM
 */

#ifndef SENSORS_H
#define	SENSORS_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define GYROSCOPE_ADDRESS           0x69
#define GYRO_CONFIG_REGISTER        0x20
#define GYRO_DATA_REGISTER          0xA8
#define GYRO_CONFIG_VALUE           0x4F

#define ACCELEROMETER_ADDRESS       0x53
#define ACC_CONFIG_REGISTER         0x2D
#define ACC_DATA_REGISTER           0x32
#define ACC_CONFIG_VALUE            0x08

#define PRESSURE_ADDRESS            0xEE
#define MAGNETO_CONFIG_REGISTER     0x00
#define MAGNETO_DATA_REGISTER       0x00
#define MAGNETO_CONFIG_VALUE        0x00

#define MAGNETOMETER_ADDRESS        0x3C
#define PRESSURE_CONFIG_REGISTER    0x00
#define PRESSURE_DATA_REGISTER      0x00
#define PRESSURE_CONFIG_VALUE       0x00


#define CREATE_SENSOR_VARIABLE_CONST(var, i2c_add, conf_reg, data_reg, conf_val)\
sensor_c_t var = {\
                    {i2c_add, conf_reg, data_reg, conf_val},\
                    {0, {0, 0, 0}, {0, 0, 0}}\
                 }

/*===========================================================================*
 *                              Typedefs                                     *
 *===========================================================================*/
typedef struct raw_data_class_tag
{
    INT16 x_raw[5];
    INT16 y_raw[5];
    INT16 z_raw[5];
}raw_data_c_t;

typedef struct computed_data_class_tag
{
    INT16 x_computed;
    INT16 y_computed;
    INT16 z_computed;
}computed_data_c_t;

typedef struct config_class_tag
{
    const UINT8 i2c_address;
    const UINT8 config_register;
    const UINT8 data_register;
    const UINT8 config_value;
}config_c_t;

typedef struct static_class_tag
{
    UINT8 status;
    raw_data_c_t data_raw;
    computed_data_c_t data_computed;
}static_c_t;

typedef struct sensor_class_tag
{
    config_c_t config_c;
    static_c_t data_c;
}sensor_c_t;


/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
extern sensor_c_t GYRO_C;
extern sensor_c_t ACC_C;
extern sensor_c_t MAGNETO_C;
extern sensor_c_t PRESSURE_C;

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/


BOOL Gyro_Init(void);
BOOL Get_Gyro_Val(void);

BOOL Acc_Init(void);
BOOL Get_Acc_Val(void);

BOOL Magneto_Init(void);
BOOL Get_Magneto_Val(void);

BOOL Pressure_Init(void);
BOOL Get_Pressure_Val(void);

BOOL Sensor_Send_Data_Value(sensor_c_t *sensor);
BOOL Sensor_Receive_Data_Value(sensor_c_t *sensor, UINT8 index);

#endif	/* SENSORS_H */

