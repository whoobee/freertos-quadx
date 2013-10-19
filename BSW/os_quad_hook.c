/*
 * File:   os_quad_hook.c
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
/*OS include*/
#include "../OS/os_if.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
void vApplicationMallocFailedHook(void)
{
   /* Called if a call to pvPortMalloc() fails because there is insufficient
   free memory available in the FreeRTOS heap.  pvPortMalloc() is called
   internally by FreeRTOS API functions that create tasks, queues, software
   timers, and semaphores.  The size of the FreeRTOS heap is set by the
   configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */
   for (;;);
}


void vApplicationStackOverflowHook(xTaskHandle pxTask, signed char *pcTaskName)
{
   (void) pcTaskName;
   (void) pxTask;

   /* Run time stack overflow checking is performed if
   configconfigCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
   function is called if a stack overflow is detected. */
   for (;;);
}


void vApplicationIdleHook(void)
{
   volatile size_t xFreeHeapSpace;

   /* This function is called on each cycle of the idle task.  In this case it
   does nothing useful, other than report the amout of FreeRTOS heap that
   remains unallocated. */
   xFreeHeapSpace = xPortGetFreeHeapSize();

   if (xFreeHeapSpace > 100)
   {
      /* By now, the kernel has allocated everything it is going to, so
      if there is a lot of heap remaining unallocated then
      the value of configTOTAL_HEAP_SIZE in FreeRTOSConfig.h can be
      reduced accordingly. */
   }
}


void vMainConfigureTimerForRunTimeStats(void)
{
   /* This function is not used by the Blinky build configuration, but needs
   to be defined as the Blinky and Full build configurations share a
   FreeRTOSConfig.h header file. */
}


unsigned long ulGetRunTimeCounterValue(void)
{
   /* This function is not used by the Blinky build configuration, but needs
   to be defined as the Blinky and Full build configurations share a
   FreeRTOSConfig.h header file. */
   return 0UL;
}

/*EOF*/
