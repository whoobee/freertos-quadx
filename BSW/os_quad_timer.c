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


/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void __ISR(_TIMER_2_VECTOR, IPL2SOFT) Timer2Handler(void)
{
   static signed portBASE_TYPE xHigherPriorityTaskWoken = pdFALSE;

   mT2ClearIntFlag();

   switch(LOOP_NUMBER)
   {
      case ms_0:
         xSemaphoreGiveFromISR(sem_Main_5ms_h, &xHigherPriorityTaskWoken);
         break;
      case ms_1:
         xSemaphoreGiveFromISR(sem_Main_5ms_h, &xHigherPriorityTaskWoken);
         break;
      case ms_2:
         xSemaphoreGiveFromISR(sem_Main_5ms_h, &xHigherPriorityTaskWoken);
         break;
      case ms_3:
         xSemaphoreGiveFromISR(sem_Main_5ms_h, &xHigherPriorityTaskWoken);
         break;
      case ms_4:
         xSemaphoreGiveFromISR(sem_Main_5ms_h, &xHigherPriorityTaskWoken);
         xSemaphoreGiveFromISR(sem_Input_Processing_h, &xHigherPriorityTaskWoken);
         xSemaphoreGiveFromISR(sem_Output_Processing_h, &xHigherPriorityTaskWoken);
         break;
   }

   if (LOOP_NUMBER < ms_4)
   {
      LOOP_NUMBER += ms_1;
   }
   else
   {
      LOOP_NUMBER = ms_0;
   }

   portEND_SWITCHING_ISR( xHigherPriorityTaskWoken );
}

/*EOF*/
