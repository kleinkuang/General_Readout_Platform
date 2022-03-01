// File:    main.c
// Author:  Lei Kuang
// Date:    11th February 2021
// @ Imperial College London

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "L_gpio.h"

/* Private function prototypes -----------------------------------------------*/
void Error_Handler  ();

void Rec_cmd        ();
void Exe_cmd        ();
void Print_Error    ();

/* Private variables ---------------------------------------------------------*/
uint16_t    func = 0x00;
uint16_t    par1 = 0x00;
uint16_t    par2 = 0x00;

int main()
{
    init_platform();

    // Peripherals Init
    L_GPIO_Init();

    while(1)
    {
        Rec_cmd();
        Exe_cmd();
    }

    cleanup_platform();
    return 0;
}

/* Private  function implementations -----------------------------------------*/
void Exe_cmd()
{
    uint32_t temp_u;

    switch(func)
    {
        // ----------------------------------------------------------------
        // - "get_version"
        case 0x0000:    xil_printf("M: Firmware for General Platform\n");
                        xil_printf("   Ver:   %d\n$%d#", 20211111, 20211111);
                        break;

        // ----------------------------------------------------------------
        // - "led_set"
        case 0x2100:    xil_printf("M: LED Set\n");
       					xil_printf("   Cha: %d\n",   par1);
       					xil_printf("   Val: %d\n$#", par2);
       					L_LED_Set(par1, par2);
                        break;

        default:        xil_printf("Function not implemented\n$#");
    }
}

void Rec_cmd()
{
    unsigned char buffer[6];

    for(int i=0; i<6; i++)
        buffer[i] = inbyte();

    func   = buffer[0] << 8 | buffer[1];
    par1   = buffer[2] << 8 | buffer[3];
    par2   = buffer[4] << 8 | buffer[5];
}

void Print_Error()
{
    xil_printf("M: Error!\n$#");
}

void Error_Handler()
{

}
