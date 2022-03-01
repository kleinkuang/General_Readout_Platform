// File:    L_pcb.c
// Author:  Lei Kuang
// Date:    10th August 2021
// @ Imperial College London

#include "L_gpio.h"

XGpio GPIO_0;

void L_GPIO_Init()
{
    // GPIOs for controlling PCB perpherials
    XGpio_Initialize		(&GPIO_0, XPAR_GPIO_0_DEVICE_ID);
    XGpio_SetDataDirection	(&GPIO_0, 1, 0x00);
    //XGpio_SetDataDirection	(&GPIO_0, 2, 0x00);
    XGpio_DiscreteWrite		(&GPIO_0, 1, 0x00);
    //XGpio_DiscreteWrite		(&GPIO_0, 2, 0x00);
}

void L_LED_Set(uint8_t channel, uint8_t state)
{
    uint32_t org = XGpio_DiscreteRead(&GPIO_0, 1);
    uint32_t msk = 0;

    // Clear bit
    msk = 1 << channel;
    org = org & ~msk;
    // Set bit
    msk = state ? 1 : 0;
    msk = msk << channel;
    org = org | msk;
    // Write
    XGpio_DiscreteWrite(&GPIO_0, 1, org);
}
