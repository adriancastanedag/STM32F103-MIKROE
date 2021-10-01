//---1.- incluir las bibliotecas esenenciales
//---#include <stm32f103rb.h> OK
#include "Stm32F103_DEFS.h"
//---2.- Definir el hardware

#define FINPUT               0X04UL              //ENTRADA FLOTANTE
#define GPOPP10MHZ           0X01UL              //SALIDA PUSHPUL 10MHZ

#define LED_USUARIO         GPIOA_ODR.B5        //PA5   OUTPUT
#define BOTON               GPIOC_IDR.B13       //PC13 INPUT

//---3.-variables globales
#define PRESIONADO     0
#define NO_PRESIONADO  1
#define PRENDER        1
#define APAGAR         0
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
   if(BOTON==PRESIONADO)
   {
     LED_USUARIO= !LED_USUARIO;
     Delay_ms(1000);
   }
}
void ini_var()
{
  LED_USUARIO=PRENDER;
  Delay_ms(1000);
  LED_USUARIO=APAGAR;
}
void config_maq()
{
  //volatile unsigned long *apuntador;             //variable volatile apuntador entera de 32 bits sin signo
  volatile uint32_t *apuntador;                    //variable volatile apuntador entera de 32 bits sin signo usando stdint.h
  volatile RCC_REG_DEFS_t *pointer;
  volatile GPIOX_DEFS_t *GPIOX;
  volatile GPIOX_ODR_t  *GPIOX_ODR;

/*uint8_t cntx;
  int8_t  cnty;
  char caracterz;
  caracterz='0';
  cntx= caracterz; //Cual es el valor de cntx?  =48 xq el caracter '0' equivale a un 48 decimal o un 0x30 hexadecimal
  cntx=250;        //250=0xfa
  cnty=cntx;       //Cual es el valor de cnty? es un 0xfA pero Cual es la representacion de un FA para un int8_t
  cntx=RCC_APB2ENR_DIR; //Cual es el valor de cntx? RCC_...Delay_us=0X40021018  =0x18*/// Set GPIOC pins 13 as digital input
//GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
  //---1.-Habilitar el reloj del periférico C
  //RCC_APB2ENR &=~(1UL<<4);                 //APAGAR BITS
  //RCC_APB2ENR |= (1UL<<4);                 //PRENDE BITS ->PRENDEMOS GPIOC
  pointer=RCC_DIR;
  pointer->APB2ENR &=~(1UL<<IOPCENx);
  pointer->APB2ENR |= (1UL<<IOPCENx);
  apuntador = RCC_APB2ENR_DIR;               //ESTOY APUNTANDO A LA DIRECCIÓN DE MEMORIA 0X40021018
  *apuntador &=~(1UL<<IOPCENx);                    //apaga el bit 4
  *apuntador |= (1UL<<IOPCENx);              //prende el bit 4 del rcc_apb2enr habilita puerto C
  //---2.-cONFIGURAR EL PIN DEL PUERTO  pc13 -> crh
  //GPIOC_CRH   &=~(15UL<<20);
  //PIOC_CRH   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
  GPIOX=GPIOC_DIR ;
  GPIOX->CRH &=~(15UL<<20);
  GPIOX->CRH |= (FINPUT<<((13-8)*4));
  apuntador= GPIOC_CRH_DIR;
  *apuntador &=~(15UL<<20);
  *apuntador |= (FINPUT<<((13-8)*4));

  //---1.-hABILAR EL RELOJ DEL PERIFERICO A
  //RCC_APB2ENR &=~(1UL<<2);
  //RCC_APB2ENR |= (1UL<<2);
  pointer->APB2ENR &=~ (1UL<<IOPAENx);
  pointer->APB2ENR |=  (1UL<<IOPAENx);
  apuntador=RCC_APB2ENR_DIRx;
  *apuntador &=~ (1UL<<IOPAENx);           //hABILITA EL PUERTO A
  *apuntador |=  (1UL<<IOPAENx);           //hABILITA EL PUERTO A
  //---2.-CONFIGURAR EL PIN DEL PUERTO PA5 GPOPP10MHZ
  //GPIOA_CRL   &=~(15UL<<((5-0)*4));
  //GPIOA_CRL   |= (GPOPP10MHZ<<((5-0)*4));
  GPIOX=(GPIOX_DEFS_t *)GPIOA_DIR;
  GPIOX->CRL &=~(15UL<<((5-0)*4));
  GPIOX->CRL |= (GPOPP10MHZ<<((5-0)*4));
   apuntador = GPIOA_CRL_DIR;
  *apuntador &=~(15UL<<((5-0)*4));
  *apuntador |= (GPOPP10MHZ<<((5-0)*4));
// Set GPIOA pins 5 as digital output
//GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
  GPIOX_ODR=(GPIOX_ODR_t*)GPIOA_ODR_DIRx;
  GPIOX_ODR->ODR5=PRENDER;
  GPIOX_ODR->ODR5=APAGAR;

}