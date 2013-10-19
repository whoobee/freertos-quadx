/*
 * File:   sensors.c
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
#include "../BSW/software_config.h"
#include "i2c_driver.h"

#include "sensors.h"


/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
CREATE_SENSOR_VARIABLE_CONST(GYRO_C, GYROSCOPE_ADDRESS, GYRO_CONFIG_REGISTER, GYRO_DATA_REGISTER, GYRO_CONFIG_VALUE);
CREATE_SENSOR_VARIABLE_CONST(ACC_C, ACCELEROMETER_ADDRESS, ACC_CONFIG_REGISTER, ACC_DATA_REGISTER, ACC_CONFIG_VALUE);
CREATE_SENSOR_VARIABLE_CONST(MAGNETO_C, MAGNETOMETER_ADDRESS, MAGNETO_CONFIG_REGISTER, MAGNETO_DATA_REGISTER, MAGNETO_CONFIG_VALUE);
CREATE_SENSOR_VARIABLE_CONST(PRESSURE_C, PRESSURE_ADDRESS, PRESSURE_CONFIG_REGISTER, PRESSURE_DATA_REGISTER, PRESSURE_CONFIG_VALUE);

const signed short A[5] = {-3, 12, 17, 12, 3};


/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/


BOOL Gyro_Init(void)
{
   return Sensor_Send_Data_Value(&GYRO_C);
}


BOOL Get_Gyro_Val(void)
{
   BOOL ret_val = FALSE;
   UINT8 index = 0;

   do
   {
      ret_val = Sensor_Receive_Data_Value(&GYRO_C, index);
      index++;
   }
   while (/*(SYSTEM_STATE.SENSOR_INIT.GYRO_INIT_DONE == FALSE) && */(index <= 5));
   SYSTEM_STATE.SENSOR_INIT.GYRO_INIT_DONE = TRUE;
   return ret_val;
}


BOOL Acc_Init(void)
{
   return Sensor_Send_Data_Value(&ACC_C);
}


BOOL Get_Acc_Val(void)
{
   BOOL ret_val = FALSE;
   UINT8 index = 0;

   do
   {
      ret_val = Sensor_Receive_Data_Value(&ACC_C, index);
      index++;
   }
   while (/*(SYSTEM_STATE.SENSOR_INIT.ACC_INIT_DONE == FALSE) && */(index <= 5));
   SYSTEM_STATE.SENSOR_INIT.ACC_INIT_DONE = TRUE;
   return ret_val;
}


BOOL Magneto_Init(void)
{
   return Sensor_Send_Data_Value(&MAGNETO_C);
}


BOOL Get_Magneto_Val(void)
{
   BOOL ret_val = FALSE;
   UINT8 index = 0;

   do
   {
      ret_val = Sensor_Receive_Data_Value(&MAGNETO_C, index);
      index++;
   }
   while (/*(SYSTEM_STATE.SENSOR_INIT.MAGNETO_INIT_DONE == FALSE) && */(ret_val == TRUE));

   return ret_val;
}


BOOL Pressure_Init(void)
{
   return Sensor_Send_Data_Value(&PRESSURE_C);
}


BOOL Get_Pressure_Val(void)
{
   BOOL ret_val = FALSE;
   UINT8 index = 0;

   do
   {
      ret_val = Sensor_Receive_Data_Value(&PRESSURE_C, index);
      index++;
   }
   while (/*(SYSTEM_STATE.SENSOR_INIT.PRESSURE_INIT_DONE == FALSE) && */(ret_val == TRUE));

   return ret_val;
}


BOOL Sensor_Send_Data_Value(sensor_c_t *sensor)
{
   return I2C_Send_One_Byte(sensor->config_c.i2c_address, sensor->config_c.config_register, sensor->config_c.config_value);
}


BOOL Sensor_Receive_Data_Value(sensor_c_t *sensor, UINT8 index)
{
   BOOL ret_val = FALSE;
   UINT8 data[6];

   ret_val = I2C_Receive_Multiple_Byte(sensor->config_c.i2c_address, sensor->config_c.data_register, data, 6);

   sensor->data_c.data_raw.x_raw[index] = data[1] << 8;
   sensor->data_c.data_raw.x_raw[index] += data[0];

   sensor->data_c.data_raw.y_raw[index] = data[3] << 8;
   sensor->data_c.data_raw.y_raw[index] += data[2];

   sensor->data_c.data_raw.z_raw[index] = data[5] << 8;
   sensor->data_c.data_raw.z_raw[index] += data[4];

   return ret_val;
}

void Get_Computed_Sensor_Data(void)
{
   UINT8 index;
   static double acc_x_angle;
   static double acc_y_angle;
   //static double acc_z_angle;

   if ( SYSTEM_STATE.SYSTEM_INIT_DONE &&
        SYSTEM_STATE.SENSOR_INIT.GYRO_INIT_DONE &&
        SYSTEM_STATE.SENSOR_INIT.ACC_INIT_DONE
       )
   {
      for (index = 0; index < 5; index++)
      {
         acc_x_angle += (float) (A[index]*(ACC_C.data_c.data_raw.x_raw[index]));
         acc_y_angle += (float) (A[index]*(ACC_C.data_c.data_raw.y_raw[index]));
      }
      acc_x_angle = acc_x_angle / 35;
      acc_y_angle = acc_y_angle / 35;
      ACC_C.data_c.data_computed.x_computed = (acc_x_angle * 57.3); /* 57.3 == 3.14159 * 180 */
      ACC_C.data_c.data_computed.y_computed = (acc_y_angle * 57.3); /* 57.3 == 3.14159 * 180 */

      /*Calculate the actual pitch and roll using complementary filter*/
      GYRO_C.data_c.data_computed.x_computed = (float) ((0.98)*(GYRO_C.data_c.data_computed.x_computed + 
              (float) (GYRO_C.data_c.data_raw.x_raw[4] / 200000)) + (0.02) * ACC_C.data_c.data_computed.x_computed);
      GYRO_C.data_c.data_computed.y_computed = (float) ((0.98)*(GYRO_C.data_c.data_computed.y_computed +
              (float) (GYRO_C.data_c.data_raw.y_raw[4] / 200000)) + (0.02) * ACC_C.data_c.data_computed.y_computed);
   }
}

/*EOF*/
