/*
 * File:   i2c_driver.c
 * Author: Huby
 *
 * Created on October 18, 2012, 9:17 PM
 */

/*===========================================================================*
 *                               Include                                     *
 *===========================================================================*/
/*Generic include*/
#include "../BSW/gen_inc.h"
#include "../BSW/software_config.h"
#include "../BSW/hardware_config.h"

#include "i2c_driver.h"
#include "sensors.h"


/*===========================================================================*
 *                          Global variables                                 *
 *===========================================================================*/

/*===========================================================================*
 *                        Function declarations                              *
 *===========================================================================*/
BOOL StartTransfer(BOOL restart);
BOOL TransmitOneByte(UINT8 data);
void StopTransfer(void);


/*===========================================================================*
 *                        Function definition                                *
 *===========================================================================*/
BOOL I2C_Init(void)
{
   BOOL ret_val = TRUE;
   UINT32 actualClock;

   /* Set the I2C baud rate */
   actualClock = I2CSetFrequency(I2C_BUS, GetPeripheralClock(), I2C_CLOCK_FREQ);
   if (abs(actualClock - I2C_CLOCK_FREQ) > I2C_CLOCK_FREQ / 10)
   {
       Set_System_Error_Critical(0x01);
       ret_val = FALSE;
   }

   /* Enable the I2C bus */
   I2CEnable(I2C_BUS, TRUE);

   return ret_val;
}


BOOL StartTransfer(BOOL restart)
{
   BOOL ret_val = TRUE;
   I2C_STATUS status;

   /* Send the Start (or Restart) signal */
   if (restart)
   {
      I2CRepeatStart(I2C_BUS);
   }
   else
   {
      /* Wait for the bus to be idle, then start the transfer */
      while (!I2CBusIsIdle(I2C_BUS));

      if (I2CStart(I2C_BUS) != I2C_SUCCESS)
      {
         ret_val = FALSE;
      }
   }

   /* Wait for the signal to complete */
   do
   {
      status = I2CGetStatus(I2C_BUS);

   } while (!(status & I2C_START));

   return ret_val;
}


BOOL TransmitOneByte(UINT8 data)
{
   BOOL ret_val = TRUE;
   /* Wait for the transmitter to be ready */
   while (!I2CTransmitterIsReady(I2C_BUS));

   /* Transmit the byte */
   if (I2CSendByte(I2C_BUS, data) == I2C_MASTER_BUS_COLLISION)
   {
      ret_val = FALSE;
   }

   /* Wait for the transmission to finish */
   while (!I2CTransmissionHasCompleted(I2C_BUS));

   return ret_val;
}


void StopTransfer(void)
{
   I2C_STATUS status;

   /* Send the Stop signal */
   I2CStop(I2C_BUS);

   /* Wait for the signal to complete */
   do
   {
      status = I2CGetStatus(I2C_BUS);

   } while (!(status & I2C_STOP));
}


BOOL I2C_Send_One_Byte(UINT8 i2c_address, UINT8 register_value, UINT8 data)
{
   BOOL ret_val = TRUE;

   I2C_7_BIT_ADDRESS slave_address;
   UINT8 i2c_data[3];
   UINT8 data_sz = 3;
   UINT8 index;
   BOOL acknowledged;

   /* Initialize the data buffer */
   I2C_FORMAT_7_BIT_ADDRESS(slave_address, i2c_address, I2C_WRITE);
   i2c_data[0] = slave_address.byte;
   i2c_data[1] = register_value;
   i2c_data[2] = data;

   /* Start the transfer to write data to the device */
   if (!StartTransfer(FALSE))
   {
      ret_val = FALSE;
   }

   /* Transmit all data */
   index = 0;
   while (ret_val && (index < data_sz))
   {
      /* Transmit a byte*/
      if (TransmitOneByte(i2c_data[index]))
      {
         /* Advance to the next byte */
         index++;

         /* Verify that the byte was acknowledged */
         if (!I2CByteWasAcknowledged(I2C_BUS))
         {
            ret_val = FALSE;
         }
      }
      else
      {
         ret_val = FALSE;
      }
   }

   /* End the transfer */
   StopTransfer();

   /* Wait for the device to complete write process, by polling the ACK status */
   acknowledged = FALSE;
   do
   {
      /* Start the transfer to address the device */
      if (!StartTransfer(FALSE))
      {
         ret_val = FALSE;
      }

      /* Transmit just the device's address */
      if (TransmitOneByte(slave_address.byte))
      {
         /* Check to see if the byte was acknowledged */
         acknowledged = I2CByteWasAcknowledged(I2C_BUS);
      }
      else
      {
         ret_val = FALSE;
      }

      /* End the transfer*/
      StopTransfer();

   } while (acknowledged != TRUE);

   return ret_val;
}


BOOL I2C_Receive_One_Byte(UINT8 i2c_address, UINT8 register_value, UINT8 *data)
{
   BOOL ret_val = TRUE;

   I2C_7_BIT_ADDRESS slave_address;
   UINT8 i2c_data[2];
   UINT8 data_size = 2;
   UINT8 index;

   /* Initialize the data buffer */
   I2C_FORMAT_7_BIT_ADDRESS(slave_address, i2c_address, I2C_WRITE);
   i2c_data[0] = slave_address.byte;
   i2c_data[1] = register_value;

   /* Start the transfer to write data to the device */
   if (!StartTransfer(FALSE))
   {
      ret_val = FALSE;
   }

   /* Address the device */
   index = 0;
   while (ret_val & (index < data_size))
   {
      if (TransmitOneByte(i2c_data[index]))
      {
         index++;
      }
      else
      {
         ret_val = FALSE;
      }

      /* Verify that the byte was acknowledged */
      if (!I2CByteWasAcknowledged(I2C_BUS))
      {
         ret_val = FALSE;
      }
   }

   /* Restart and send the device's internal address to switch to a read transfer */
   if (ret_val)
   {
      /* Send a Repeated Started condition */
      if (!StartTransfer(TRUE))
      {
         ret_val = FALSE;
      }

      /* Transmit the address with the READ bit set */
      I2C_FORMAT_7_BIT_ADDRESS(slave_address, i2c_address, I2C_READ);
      if (TransmitOneByte(slave_address.byte))
      {
         /* Verify that the byte was acknowledged */
         if (!I2CByteWasAcknowledged(I2C_BUS))
         {
            ret_val = FALSE;
         }
      }
      else
      {
         ret_val = FALSE;
      }
   }

   /* Read the data from the desired address */
   if (ret_val)
   {
      if (I2CReceiverEnable(I2C_BUS, TRUE) == I2C_RECEIVE_OVERFLOW)
      {
         ret_val = FALSE;
      }
      else
      {
         while (!I2CReceivedDataIsAvailable(I2C_BUS));
         I2CAcknowledgeByte(I2C_BUS, TRUE);
         *data = I2CGetByte(I2C_BUS);
      }
   }

   /* End the transfer */
   StopTransfer();

   return ret_val;
}


BOOL I2C_Receive_Multiple_Byte(UINT8 i2c_address, UINT8 register_value, UINT8 *data, UINT8 data_size)
{
   BOOL ret_val = TRUE;

   I2C_7_BIT_ADDRESS slave_address;
   UINT8 i2c_data[2];
   UINT8 index;

   /* Initialize the data buffer */
   I2C_FORMAT_7_BIT_ADDRESS(slave_address, i2c_address, I2C_WRITE);
   i2c_data[0] = slave_address.byte;
   i2c_data[1] = register_value;

   /* Start the transfer to write data to the device */
   if (!StartTransfer(FALSE))
   {
      ret_val = FALSE;
   }

   /* Address the device */
   index = 0;
   while (ret_val & (index < 2))
   {
      if (TransmitOneByte(i2c_data[index]))
      {
         index++;
      }
      else
      {
         ret_val = FALSE;
      }

      /* Verify that the byte was acknowledged */
      if (!I2CByteWasAcknowledged(I2C_BUS))
      {
         ret_val = FALSE;
      }
   }

   /* Restart and send the device's internal address to switch to a read transfer */
   if (ret_val)
   {
      /* Send a Repeated Started condition */
      if (!StartTransfer(TRUE))
      {
         ret_val = FALSE;
      }

      /* Transmit the address with the READ bit set */
      I2C_FORMAT_7_BIT_ADDRESS(slave_address, i2c_address, I2C_READ);
      if (TransmitOneByte(slave_address.byte))
      {
         /* Verify that the byte was acknowledged */
         if (!I2CByteWasAcknowledged(I2C_BUS))
         {
            ret_val = FALSE;
         }
      }
      else
      {
         ret_val = FALSE;
      }
   }

   /* Read the data from the desired address */
   index = 0;
   if (ret_val)
   {
      while (index < data_size)
      {
         if (I2CReceiverEnable(I2C_BUS, TRUE) == I2C_RECEIVE_OVERFLOW)
         {
            ret_val = FALSE;
         }
         else
         {
            while (!I2CReceivedDataIsAvailable(I2C_BUS));
            if (index < (data_size-1))
            {
               I2CAcknowledgeByte(I2C_BUS, TRUE);
            }
            else
            {
               I2CAcknowledgeByte(I2C_BUS, FALSE);
            }
            *(data + index) = I2CGetByte(I2C_BUS);
            index++;
         }
         while ( I2C2CON & 0x1F ); 
      }
   }
   /* End the transfer */
   StopTransfer();

   return ret_val;
}

/*EOF*/
