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


#include "hardware_config.h"

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
         vTaskResume(Main_5ms_task_handler);
         break;
      case ms_1:
         vTaskResume(Main_5ms_task_handler);
         break;
      case ms_2:
         vTaskResume(Main_5ms_task_handler);
         break;
      case ms_3:
         vTaskResume(Main_5ms_task_handler);
         break;
      case ms_4:
         vTaskResume(Main_5ms_task_handler);
         vTaskResume(Input_Processing_handler);
         vTaskResume(Output_Processing_handler);
         break;
   }
}

void __ISR(_TIMER_2_VECTOR, IPL2SOFT) Timer2Handler(void)
{
   mT2ClearIntFlag();

   if (LOOP_NUMBER < ms_4)
   {
      LOOP_NUMBER += ms_1;
   }
   else
   {
      LOOP_NUMBER = ms_0;
   }


   //portEND_SWITCHING_ISR( higherPriorityTaskWoken );

}

/*EOF*/
