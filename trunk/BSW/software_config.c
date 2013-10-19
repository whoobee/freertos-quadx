/*
 * File:   software_config.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "gen_inc.h"
#include "software_config.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
unsigned char LOOP_NUMBER;
system_state_t SYSTEM_STATE;

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void Set_System_Error_Critical(UINT8 error_code)
{
   if(SYSTEM_STATE.SYSTEM_ERROR.ERROR_SET == FALSE)
   {
      SYSTEM_STATE.SYSTEM_ERROR.ERROR_SET = TRUE;
      SYSTEM_STATE.SYSTEM_ERROR.ERROR_CODE = error_code;
   }
}

void Software_Initialization(void)
{
   LOOP_NUMBER = 0;

   SYSTEM_STATE.SYSTEM_INIT_DONE = FALSE;
   SYSTEM_STATE.SENSOR_INIT.GYRO_INIT_DONE = FALSE;
   SYSTEM_STATE.SENSOR_INIT.ACC_INIT_DONE = FALSE;
   SYSTEM_STATE.SENSOR_INIT.MAGNETO_INIT_DONE = FALSE;
   SYSTEM_STATE.SENSOR_INIT.PRESSURE_INIT_DONE = FALSE;

   SYSTEM_STATE.SYSTEM_ERROR.ERROR_SET = FALSE;
   SYSTEM_STATE.SYSTEM_ERROR.ERROR_CODE = 0;
}

/*EOF*/
