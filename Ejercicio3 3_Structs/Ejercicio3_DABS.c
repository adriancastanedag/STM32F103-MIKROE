//---1.- incluir las bibliotecas esenenciales
//#include <stdint.h> //para utilizar formatos como uint8_t
#include "STM32F103XX.h"
//---2.- Definiciones de Software
#define PRESIONADO     0
#define NO_PRESIONADO  1
#define PRENDER        1
#define APAGAR         0
//---2.- Definir el hardware
//#define FLASH_BASE_ADR          0x08000000UL
#define iniFlash                 FLASH_BASE_ADR
#define LED_USUARIO              GPIOA_ODR.B5        //PA5   OUTPUT
#define BOTON                    GPIOC_IDR.B13       //PC13 INPUT
//---3.-variables globales
volatile uint32_t *apuntador = (uint32_t *) iniFlash;
//  GPIOX_t *PUERTOA = (GPIOX_t*)GPIOA_BASEX;
//  GPIOX_t *PUERTOC = (GPIOX_t*)GPIOC_BASEX;
volatile GPIOX_ODR_BITS_t *GPIOA_ODRX = (GPIOX_ODR_BITS_t*)(GPIOA_BASEX+ODR_OFFSET);
uint8_t variable;
//---4.-Funciones glogales
void config_maq();
void ini_var();
void proceso();
//---5.-Funcion main
void main() {
    //---5a.-Configurar la máquina
    config_maq();
    //---5b.-Iniciar mis variables
    ini_var();
    //---5c.-Ciclo principal del main
    while(1)
    {
       //---5d.-Llamar a mis procesos dentro del ciclo principal
       proceso();

    }
}
void proceso()
{
    GPIOA_ODRX->ODR5=~GPIOA_ODRX->ODR5;
    Delay_ms(500);
}
void ini_var()
{
  LED_USUARIO=0;
}
void config_maq()
{
   volatile GPIOX_REGISTERS_t *puertoa = GPIOA_REGISTERS;
   volatile GPIOX_REGISTERS_t *puertoc = ((GPIOX_REGISTERS_t *)GPIOC_BASE_ADR);
   volatile RCC_APB2_ENR_BITS_t *RCC_APB2_ENR_BITS = (RCC_APB2_ENR_BITS_t*)RCC_APB2_ENR_ADR;
// volatile GPIOX_ODR_BITS_t *GPIOA_ODRX = (GPIOX_ODR_BITS_t*)(GPIOA_BASEX+ODR_OFFSET);

   // GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
     //---1.-hABILAR EL RELOJ DEL PERIFERICO A
  //RCC_APB2ENR &=~(1UL<<2);
  //RCC_APB2ENR |= (1UL<<2);
  RCC_APB2_ENR_BITS->IOPAEN=1;
  //---2.-CONFIGURAR EL PIN DEL PUERTO PA5 GPOPP10MHZ
  //GPIOA_CRL   &=~(15UL<<((5-0)*4));
  //GPIOA_CRL   |= (1UL<<((5-0)*4));
  puertoa->CRL  &=~(15UL<<((5-0)*4));
  puertoa->CRL  |= (1UL<<((5-0)*4));

   puertoa->ODR|=1<<5;
   Delay_ms(2000);
   puertoa->ODR&=~(1<<5);
   Delay_ms(2000);
   GPIOA_ODRX->ODR5=1;//~GPIOA_ODRX->ODR5;
   Delay_ms(2000);
   GPIOA_ODRX->ODR5=0;//~GPIOA_ODRX->ODR5;
   Delay_ms(2000);

}