/*
 * File:   os_quad_task.c
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
#include "utils.h"
/*OS include*/
#include "../OS/os_if.h"
/*Low level drivers include*/
#include "../LLD/sensors.h"
/*Debug include*/
#include "plot.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
xTaskHandle Main_5ms_task_handler = NULL;
xTaskHandle Input_Processing_handler = NULL;
xTaskHandle Output_Processing_handler = NULL;

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void Os_Task_Init(void)
{
   xTaskCreate(Main_5ms_task,
           (signed char *) "Main_5ms_task",
           configMINIMAL_STACK_SIZE,
           NULL,
           MAIN_10MS_TASK_PRIORITY,
           &Main_5ms_task_handler);

   xTaskCreate(Input_Processing_task,
           (signed char *) "Input_Processing_task",
           configMINIMAL_STACK_SIZE,
           NULL,
           INPUT_PROCESSING_TASK_PRIORITY,
           &Input_Processing_handler);
   
   xTaskCreate(Output_Processing_task,
           (signed char *) "Output_Processing_task",
           configMINIMAL_STACK_SIZE,
           NULL,
           OUTPUT_PROCESSING_TASK_PRIORITY,
           &Output_Processing_handler);
}


void Main_5ms_task(void *pvParameters)
{
   for (;;)
   {
      Update_Status_LED();
      vTaskSuspend(Main_5ms_task_handler);
   }
}


void Input_Processing_task(void *pvParameters)
{
   for (;;)
   {
      //Get_Gyro_Val();
      //Get_Acc_Val();

      //Get_Computed_Sensor_Data();

      vTaskSuspend(Input_Processing_handler);
   }
}


void Output_Processing_task(void *pvParameters)
{
   for (;;)
   {

      vTaskSuspend(Output_Processing_handler);
   }
}

/*EOF*/
