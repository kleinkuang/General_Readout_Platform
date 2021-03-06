// File:    i2c.c
// Author:  Lei Kuang
// Date:    2019.11.18
// @ Imperial College London

#include "i2c.h"

#define IIC_BASE_ADDRESS 0x40800000

uint8_t txBuffer[3];
uint8_t rxBuffer[3];

uint8_t DEVICE_ADDR = 0x48;		// DAC7574 Broadcast mode
								// U9:  0x4C
								// U10:	0x4D
								// U11: 0x4E
								// U12: 0x4F

// Maximum biasing voltage is approximately 3.7v
// as the OPAMP is not rail-to-rail

// ----------------------------------------------------------------
// I2C for DAC7574
// ----------------------------------------------------------------
uint32_t DAC7574_Set(uint8_t addr, uint8_t cha, uint16_t val)
{
	uint32_t cnt;
	// Ctrl + MB + LB
	txBuffer[0] = 0x10 | (cha&0x3) << 1;
	txBuffer[1] = (val & 0xFF0) >> 4;
	txBuffer[2] = (val & 0x00F) << 4 ;

	cnt = XIic_Send(IIC_BASE_ADDRESS, addr, txBuffer, 3, XIIC_STOP);

	return cnt==0 ? 0xFFFFFFFF : 0;
}
