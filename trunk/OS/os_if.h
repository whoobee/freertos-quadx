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
#include "include/semphr.h"
/*OS config file*/
#include "Config/FreeRTOSConfig.h"

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
/* Priorities at which the tasks are created. */
#define MAIN_10MS_TASK_PRIORITY                 ( tskIDLE_PRIORITY + 1 )
#define INPUT_PROCESSING_TASK_PRIORITY		( tskIDLE_PRIORITY + 2 )
#define OUTPUT_PROCESSING_TASK_PRIORITY		( tskIDLE_PRIORITY + 3 )

#define MAIN_LOOP_TIME_PERIOD                   ( 1 / portTICK_RATE_MS )
#define DONT_BLOCK                              ( 0 )

/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
/*Task declarations*/
extern xTaskHandle Main_5ms_task_h;
extern xTaskHandle Input_Processing_h;
extern xTaskHandle Output_Processing_h;
/*Semaphores declarations*/
extern xSemaphoreHandle sem_Main_5ms_h;
extern xSemaphoreHandle sem_Input_Processing_h;
extern xSemaphoreHandle sem_Output_Processing_h;
/*Timer declarations*/
extern xTimerHandle Main_loop_timer_handler;

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
/*Task functions*/
void Os_Task_Init(void);
void Main_5ms_task(void *pvParameters);
void Input_Processing_task(void *pvParameters);
void Output_Processing_task(void *pvParameters);
/*Timer functions*/
void Os_Timer_Init(void);
void Main_loop_timer_cbk( xTimerHandle xTimer );


#endif	/* OS_IF_H */

