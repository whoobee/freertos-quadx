/* 
 * File:   os_if.h
 * Author: Huby
 *
 * Created on July 13, 2013, 5:13 PM
 */

#ifndef OS_IF_H
#define	OS_IF_H

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/* Kernel includes. */
#include "include/FreeRTOS.h"
#include "include/task.h"
#include "include/queue.h"
#include "include/timers.h"
/*OS config file*/
#include "Config/FreeRTOSConfig.h"

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
/* Priorities at which the tasks are created. */
#define MAIN_10MS_TASK_PRIORITY                 ( tskIDLE_PRIORITY + 1 )
#define INPUT_PROCESSING_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )
#define OUTPUT_PROCESSING_TASK_PRIORITY		( tskIDLE_PRIORITY + 3 )

#define MAIN_LOOP_TIME_PERIOD                   ( 10 / portTICK_RATE_MS )
#define DONT_BLOCK                              ( 0 )

/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
/*Task declarations*/
extern xTaskHandle Main_10ms_task_handler;
extern xTaskHandle Input_Processing_handler;
extern xTaskHandle Output_Processing_handler;
/*Timer declarations*/
extern xTimerHandle Main_loop_timer_handler;

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
/*Task functions*/
void Os_Task_Init(void);
void Main_10ms_task(void *pvParameters);
void Input_Processing_task(void *pvParameters);
void Output_Processing_task(void *pvParameters);
/*Timer functions*/
void Os_Timer_Init(void);
void Main_loop_timer_cbk( xTimerHandle xTimer );


#endif	/* OS_IF_H */

