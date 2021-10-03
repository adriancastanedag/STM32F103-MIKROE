//1.-incluir las bibliotecas
//---#include<stm32f103x.h
#include <stdint.h>

//2.-Definiciones del programa
#include "definiciones.h"
//B15 B14 B13 B12 B11 B10 B9 B8 B7 B6 B5 B4 B3 B2 B1 B0
// 0   0   0   0   0   0   0  0  1  1 0   0  0  0  0  0  0X00C0  << 8
// 1   1   0   0   0   0   0  0  0  0 0   0  1  0  0  0  0XC000
// 0   0   0   0   0   0   0  0  0  0 0   0  1  1  1  1
// 0   0   0   0                             1  0  0  0
//---definir el hardware
#define Display     GPIOB_ODR
#define DipSW       GPIOC_IDR & 0x000F
//3.-Variables globales
const uint8_t vector[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,SIETE,OCHO,NUEVE,
                   CARA,CARB,CARC,CARD,CARE,CARF };
volatile uint8_t play;
volatile uint8_t contador=0;
volatile uint8_t entrada;
//4.-Funciones glogales
void proceso();
void conf_maq();
void ini_var();
void config_gpios();
void config_exti();
void establece();
//void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO;
//5.-Función principal main
void main() {
   //5a.-configurar máquina
   conf_maq();
   //5b.-iniciar variables
   ini_var();
   //5c.-ciclo principal
   while(1)
   {
     proceso();
   }
}
void proceso()
{
  if(play){
     if(++contador==16) contador=0;
     Display=vector[contador]<<8;
     Delay_ms(250);
  }
  /*
  switch(contador){
     case 0: Display = CERO; break;
     case 1: Display = UNO; break;
     ..
     ..
     ..
     case 15: Display = CARF; break;
  } */
}
void ini_var()
{
   Display=vector[0]<<8;
   play=0;
}
void conf_maq()
{
   //---Configurar puertos
   config_gpios();
   //---Configurar interrupciones
   config_exti();
}
void config_gpios()
{
   uint8_t i;
   RCC_APB2ENRbits.IOPBEN=1;
   //---cONFIGURAR DEL PB8 AL PB15  como open drain 2 MHZ
   /*
   GPIOB_CRH &=~ ( (15UL<<((8-8)*4)) | (15UL<<((9-8)*4)) | (15UL<<((10-8)*4)) | (15UL<<((11-8)*4))
                  |(15UL<<((12-8)*4))| (15UL<<((13-8)*4)) | (15UL<<((14-8)*4)) | (15UL<<((15-8)*4)));
   //---
   GPIOB_CRH |= ( (6UL<<((8-8)*4)) | (6UL<<((9-8)*4)) | (6UL<<((10-8)*4)) | (6UL<<((11-8)*4))
                |  (6UL<<((12-8)*4)) | (6UL<<((13-8)*4)) |(6UL<<((14-8)*4)) | (6UL<<((15-8)*4)) );
   */

   for(i=8;i<16;i++)
      GPIOB_CRH &=~ (15UL<<((i-8)*4));
   #ifdef anodo
   for(i=8;i<16;i++)
      GPIOB_CRH |= (6UL<<((i-8)*4)); // salida open drain 2 MHZ
   #else
   for(i=8;i<16;i++)
      GPIOB_CRH |= (1UL<<((i-8)*4)); // salida pushpull 2 MHZ
   #endif
   //---Configurar GPIOC B0 B1 B2 B3 como entradas con pullup
   //---los botones del dipsw son activos en bajo
   RCC_APB2ENRbits.IOPCEN=1;
   for(i=0;i<4;i++)
      GPIOC_CRL&=~(15UL<<(i*4));
   for(i=0;i<4;i++)
      GPIOC_CRL |= (8UL<<(i*4));  //ENTRADA DIGITAL PULLUP O PULLDOWN
   GPIOC_ODR &=~15UL; //BO B1 B2 B3 COMO PULLDOWN
   GPIOC_ODR |= 15UL; //B0 B1 B2 B3 COMO PULLUP
}
void config_exti()
{
  /*
     @información de la función
   //1.-Configurar la(s) unidad(es) funcional(es)
   //2.-Pedir la petición de la bandera de interrupción
   //3.-Crear la función de interrupcion
   //4.-Habilitar al controlador anidado de interrupciones (NVIC)
  */
  //---Configurar el pinc13 con entrada digital flotante
  RCC_APB2ENRbits.IOPCEN=1;
  GPIOC_CRH &=~( 15UL<<((13-8)*4));
  GPIOC_CRH |= ( 4UL<<((13-8)*4) );     //EDF
  //---HABILITAR EL DEMULTIPLEXOR DEL AFIO
  RCC_APB2ENRbits.AFIOEN=1;
  AFIO_EXTICR4=2UL<<4;
  //---DECIRLE AL EXTI QUE FLANCO DETECTAR
  EXTI_RTSRbits.TR13=1;
  //---PIDIENDO QUE EL NVIC ATIENDA LA BANDERA DEL BIT 13
  EXTI_IMRbits.MR13=1;
  //---hABILITAR AL NVIC
  //NVIC_IntEnable(IVT_INT_EXTI15_10);
  NVIC_IntEnable(IVT_INT_EXTI15_10);

  //---DETECTAR FLANCO NEGATIVO EN EL PUERTO PB10 Y ATENDERLO POR INTERRUPCION
  //---Configurar el pinB10 con entrada digital CON PULLDOWN
  RCC_APB2ENRbits.IOPBEN=1;
  GPIOB_CRH &=~( 15UL<<((10-8)*4));
  GPIOB_CRH |= ( 8UL<<((10-8)*4) );     //EDPD
  //---HABILITAR EL DEMULTIPLEXOR DEL AFIO
  RCC_APB2ENRbits.AFIOEN=1;
  AFIO_EXTICR3=1UL<<8;     //pb10 COMO LINEA 10 de interrupción
  //---DECIRLE AL EXTI QUE FLANCO DETECTAR
  EXTI_FTSRbits.TR10=1;    //linea 10 por falnco de bajada
  //---PIDIENDO QUE EL NVIC ATIENDA LA BANDERA DE la linea 10
  EXTI_IMRbits.MR10=1;
  //---hABILITAR AL NVIC
  NVIC_IntEnable(IVT_INT_EXTI15_10);

  //---DETECTAR FLANCO POSITIVO EN EL PUERTO PA4 Y ATENDERLO POR INTERRUPCION
  //---Configurar el pinA4 con entrada digital CON PULLDOWN
  RCC_APB2ENRbits.IOPAEN=1;
  GPIOA_CRL &=~( 15UL<<((4)*4));
  GPIOA_CRL |= ( 8UL<<((4)*4) );     //EDPD
  GPIOA_ODR.B4=0;   //ACTIVA RESISTENCIA DE PULLDOWN
  //---HABILITAR EL DEMULTIPLEXOR DEL AFIO
  RCC_APB2ENRbits.AFIOEN=1;
  AFIO_EXTICR2bits.EXTI4=0;     //PA4 COMO LINEA 4 de interrupción
  //---DECIRLE AL EXTI QUE FLANCO DETECTAR
  EXTI_RTSRbits.TR4=1;    //linea 4 por falnco de SUBIDA
  //---PIDIENDO QUE EL NVIC ATIENDA LA BANDERA DE la linea 4
  EXTI_IMRbits.MR4=1;
  //---hABILITAR AL NVIC
  NVIC_IntEnable(IVT_INT_EXTI4);

}
void leer_dipsw() iv IVT_INT_EXTI4
{
   entrada=DipSW;   //leer puerto GPIOC_IDR&0X000F
   contador=entrada;
   Display=vector[contador]<<8;
}
void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO 
{
   if(EXTI_PRbits.PR13)         //esta función inicia o detiene la exhibición
   {
      EXTI_PRbits.PR13=1;       //LINEA ATENDIDA
      if(play)
         play=0;
      else
         play=1;
   }
   if(EXTI_PRbits.PR10)    //esta función establece el display al primer caracter
   {
      EXTI_PRbits.PR10=1;   //LINEA ATENDIDAD
      //contador=0;
      establece();
   }
}
void establece()
{
   contador=0;
}