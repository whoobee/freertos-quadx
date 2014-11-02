/* 
 * File:   utils.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "gen_inc.h"
#include "utils.h"

/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

void DelayXms(WORD delay)
 {
     unsigned int int_status;
     while( delay-- )
     {
         int_status = INTDisableInterrupts();
         OpenCoreTimer(40000);
         INTRestoreInterrupts(int_status);
         mCTClearIntFlag();
         while( !mCTGetIntFlag() );
     }
     mCTClearIntFlag();
 }

/*EOF*/