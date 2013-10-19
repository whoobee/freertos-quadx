/*
 * File:   os_quad_timer.c
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
/*OS include*/
#include "../OS/os_if.h"
/*Debug include*/
#include "plot.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/
xTimerHandle Main_loop_timer_handler = NULL;
void Main_loop_timer_cbk( xTimerHandle xTimer );
void Os_Timer_Init(void);

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void Os_Timer_Init(void)
{
   Main_loop_timer_handler = xTimerCreate((const signed char *) "Main_loop_timer",
           (MAIN_LOOP_TIME_PERIOD), pdTRUE, NULL, Main_loop_timer_cbk);

   if (Main_loop_timer_handler != NULL)
   {
      xTimerStart(Main_loop_timer_handler, DONT_BLOCK);
   }
}

void Main_loop_timer_cbk( xTimerHandle xHand)
{
   switch(LOOP_NUMBER)
   {
      case ms_0:
            vTaskResume(Main_10ms_task_handler);
         break;
      case ms_10:
            vTaskResume(Main_10ms_task_handler);
         break;
      case ms_20:
            vTaskResume(Main_10ms_task_handler);
         break;
      case ms_30:
            vTaskResume(Main_10ms_task_handler);
         break;
      case ms_40:
         vTaskResume(Main_10ms_task_handler);
         vTaskResume(Input_Processing_handler);
         vTaskResume(Output_Processing_handler);
         break;
   }
   if (LOOP_NUMBER < ms_40)
   {
      LOOP_NUMBER += ms_10;
   }
   else
   {
      LOOP_NUMBER = ms_0;
   }
}

/*EOF*/
