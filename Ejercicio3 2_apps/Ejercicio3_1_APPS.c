//---1.- incluir las bibliotecas esenenciales
//---#include <stm32f103rb.h> OK
//---2.- Definir el hardware
#define RCC_DIR               0X40021000UL        //DIRECCION BASE DEL RCC
#define APB2ENR_OFFSET        0X18UL
#define RCC_APB2ENR_DIR       (RCC_DIR+APB2ENR_OFFSET)
#define RCC_APBEENR_DIRX      0X40021018UL
#define GPIOC_DIR             0X40011000UL       //Dirección base del puerto c
#define GPIOA_DIR             0X40010800UL       //DIRECCIÓN BASE DEL PUERTO A
#define CRL_OFFSET            0x00UL             //OFFSET DEL REGISTRO CRL
#define CRH_OFFSET            0X04UL             //OFFSET DEL REGISTRO CRH
#define GPIOC_CRH_DIR         (GPIOC_DIR+CRH_OFFSET)      //DIRECCION DEL REGISTRO GPIOC_CRH
#define GPIOC_CRL_DIR         (GPIOC_DIR+CRL_OFFSET)       //DIRECCIÓN DEL REGISTRO GPIOC_CRL
#define GPIOA_CRH_DIR         (GPIOA_DIR+CRH_OFFSET)      //DIRECCION DEL REGISTRO GPIOA_CRH
#define GPIOA_CRL_DIR         (GPIOA_DIR+CRL_OFFSET)       //DIRECCIÓN DEL REGISTRO GPIOA_CRL
#define GPIOC_CRH_DIRX        0X40011004UL                //DIRECCIÓN DEL REGISTRO GPIOC_CRH
#define GPIOA_CRL_DIRX        0x40010804UL                //dirección del registro GPIOA_CRL

#define FINPUT                0X04UL              //ENTRADA FLOTANTE
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
   volatile unsigned long int *app;
// Set GPIOC pins 13 as digital input
  //---1.-Habilitar el reloj del periférico C
  //RCC_APB2ENR &=~(1UL<<4);                 //APAGAR BITS
  //RCC_APB2ENR |= (1UL<<4);                 //PRENDE BITS ->PRENDEMOS GPIOC
  app=RCC_APB2ENR_DIR;                       //PRIMERAMENTE APUNTAS
  *app &=~(1UL<<4);
  *app |= (1UL<<4);
  //---2.-cONFIGURAR EL PIN DEL PUERTO  pc13 -> crh
//  GPIOC_CRH   &=~(15UL<<20);
//  GPIOC_CRH   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
    app=GPIOC_CRH_DIR;
    *app   &=~(15UL<<20);
    *app   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
// Set GPIOA pins 5 as digital output
  //---1.-hABILAR EL RELOJ DEL PERIFERICO A
  //RCC_APB2ENR &=~(1UL<<2);
  //RCC_APB2ENR |= (1UL<<2);
  app=(unsigned long int*)RCC_APB2ENR_DIR;                       //PRIMERAMENTE APUNTAS
  *app &=~(1UL<<2);
  *app |= (1UL<<2);
  //---2.-CONFIGURAR EL PIN DEL PUERTO PA5 GPOPP10MHZ
  //GPIOA_CRL   &=~(15UL<<((5-0)*4));
  //GPIOA_CRL   |= (GPOPP10MHZ<<((5-0)*4));
  app=GPIOA_CRL_DIR;
    *app   &=~(15UL<<20);
    *app   |= (GPOPP10MHZ<<((5-0)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
}
