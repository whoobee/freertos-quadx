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
#include "../LLD/ic_driver.h"
/*Debug include*/
#include "plot.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
xTaskHandle Main_5ms_task_h = NULL;
xTaskHandle Input_Processing_h = NULL;
xTaskHandle Output_Processing_h = NULL;

xSemaphoreHandle sem_Main_5ms_h = NULL;
xSemaphoreHandle sem_Input_Processing_h = NULL;
xSemaphoreHandle sem_Output_Processing_h = NULL;


BOOL UpdatedTime;
unsigned short CaptureTime;
unsigned short CaptureTimeOld;
unsigned short DeltaTime;

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
                &Main_5ms_task_h);
    vSemaphoreCreateBinary( sem_Main_5ms_h );

    xTaskCreate(Input_Processing_task,
                (signed char *) "Input_Processing_task",
                configMINIMAL_STACK_SIZE,
                NULL,
                INPUT_PROCESSING_TASK_PRIORITY,
                &Input_Processing_h);
    vSemaphoreCreateBinary( sem_Input_Processing_h );

    xTaskCreate(Output_Processing_task,
                (signed char *) "Output_Processing_task",
                configMINIMAL_STACK_SIZE,
                NULL,
                OUTPUT_PROCESSING_TASK_PRIORITY,
                &Output_Processing_h);
    vSemaphoreCreateBinary( sem_Output_Processing_h );
}

void Main_5ms_task(void *pvParameters)
{
    xSemaphoreTake( sem_Main_5ms_h, DONT_BLOCK );
    for (;;)
    {
        if( xSemaphoreTake(sem_Main_5ms_h, portMAX_DELAY ) == pdTRUE)
        {
            /*Todo: Add mainloop functionality*/

            Update_Status_LED(UPDATE_EACH_SECOND);
        }
    }
}

void Input_Processing_task(void *pvParameters)
{
    xSemaphoreTake( sem_Input_Processing_h, DONT_BLOCK );
    for (;;)
    {
        if( xSemaphoreTake(sem_Input_Processing_h, portMAX_DELAY ) == pdTRUE)
        {
            /*Todo: Add input processing functionality*/

        }
    }
}

void Output_Processing_task(void *pvParameters)
{
    xSemaphoreTake( sem_Output_Processing_h, DONT_BLOCK );
    for (;;)
    {
        if( xSemaphoreTake(sem_Output_Processing_h, portMAX_DELAY ) == pdTRUE)
        {
            /*Todo: Add output processing functionality*/

        }
    }
}

/*EOF*/
