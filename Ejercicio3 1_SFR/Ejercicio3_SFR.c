//---1.- incluir las bibliotecas esenenciales
//---#include <stm32f103rb.h> OK
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
// Set GPIOC pins 13 as digital input
//GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
  //---1.-Habilitar el reloj del periférico C
  RCC_APB2ENR &=~(1UL<<4);                 //APAGAR BITS
  RCC_APB2ENR |= (1UL<<4);                 //PRENDE BITS ->PRENDEMOS GPIOC
  //---2.-cONFIGURAR EL PIN DEL PUERTO  pc13 -> crh
  GPIOC_CRH   &=~(15UL<<20);
  GPIOC_CRH   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
  //---1.-hABILAR EL RELOJ DEL PERIFERICO A
  RCC_APB2ENR &=~(1UL<<2);
  RCC_APB2ENR |= (1UL<<2);
  //---2.-CONFIGURAR EL PIN DEL PUERTO PA5 GPOPP10MHZ
  GPIOA_CRL   &=~(15UL<<((5-0)*4));
  GPIOA_CRL   |= (GPOPP10MHZ<<((5-0)*4));
// Set GPIOA pins 5 as digital output
//GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
}