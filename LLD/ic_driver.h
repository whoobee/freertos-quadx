/* 
 * File:   input_processing.h
 * Author: Huby
 *
 * Created on October 18, 2012, 8:31 PM
 */

#ifndef IC_DRIVER_H
#define	IC_DRIVER_H

/*===========================================================================*
 *                        Macros and definitions                             *
 *===========================================================================*/
#define ICAP1 0
#define ICAP2 1
#define ICAP3 2
#define ICAP4 3


typedef struct input_capture_data_tag
{
    unsigned short input_capture;
    unsigned short input_capture_old;
    unsigned short duty_cicle;
}input_capture_data_t;

typedef struct input_capture_error_tag
{
    BOOL data_loss;
    BOOL next_edge_rise;
}input_capture_error_t;

typedef struct input_capture_tag
{
   input_capture_data_t data;
   input_capture_error_t error;
}input_capture_t;


/*===========================================================================*
 *                        Variable declarations                              *
 *===========================================================================*/
extern input_capture_t INPUT_CAPTURE_1;
extern input_capture_t INPUT_CAPTURE_2;
extern input_capture_t INPUT_CAPTURE_3;
extern input_capture_t INPUT_CAPTURE_4;


/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/

void ICAP_Init(void);
unsigned short Get_Incap_Data(unsigned char device);

#endif	/* IC_DRIVER_H */

