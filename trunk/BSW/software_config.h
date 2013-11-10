/* 
 * File:   software_config.h
 * Author: Huby
 *
 * Created on July 14, 2013, 7:59 PM
 */

#ifndef SOFTWARE_CONFIG_H
#define	SOFTWARE_CONFIG_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
enum
{
   ms_0 = 0,
   ms_1,
   ms_2,
   ms_3,
   ms_4
};

typedef struct system_init_tag
{
    BOOL GYRO_INIT_DONE;
    BOOL ACC_INIT_DONE;
    BOOL MAGNETO_INIT_DONE;
    BOOL PRESSURE_INIT_DONE;
}system_init_t;

typedef struct system_error_tag
{
    BOOL ERROR_SET;
    UINT8 ERROR_CODE;
}system_error_t;

typedef struct system_state_tag
{
    BOOL SYSTEM_INIT_DONE;
    system_init_t SENSOR_INIT;
    system_error_t SYSTEM_ERROR;
}system_state_t;

/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
extern unsigned char LOOP_NUMBER;
extern system_state_t SYSTEM_STATE;

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
void Set_System_Error_Critical(UINT8 error_code);
void Software_Initialization(void);

#endif	/* SOFTWARE_CONFIG_H */

