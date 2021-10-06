//Incluir bibliotecas
//#include <stdint.h>
// Definiciones
#define DISPLAY     GPIOB_ODR
#define SWITCH      GPIOC_IDR & 0X0F
#define ANODO       0

#ifdef ANODO

#define CONFIG      0x66666666
#define CRH         CONFIG
#define CERO        0XC0
#define UNO         0XF9
#define DOS         0XA4
#define TRES        0XB0
#define CUATRO      0X99
#define CINCO       0X92
#define SEIS        0X82
#define SIETE       0XF8
#define OCHO        0x80
#define NUEVE       0X90
#define CARA        0X88
#define CARB        0X83
#define CARC        0XA7
#define CARD        0XA1
#define CARE        0X86
#define CARF        0X8E

#else

#define CONFIG      0x22222222;
#define CRH         CONFIG
#define CERO        0X3F
#define UNO         0X06
#define DOS         0X5B
#define TRES        0X4F
#define CUATRO      0X66
#define CINCO       0X6D
#define SEIS        0X7D
#define SIETE       0X07
#define OCHO        0x7F
#define NUEVE       0X6F
#define CARA        0X77
#define CARB        0X7C
#define CARC        0X39
#define CARD        0X5E
#define CARE        0X79
#define CARF        0X71

#endif

//variables globales           //0    1   2   3    ........5                                                         15
const unsigned short int segmentos[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,SIETE,OCHO,NUEVE,CARA,CARB,CARC,CARD,CARE,CARF};
unsigned short int posicion;
// declarar solo la cabecera de las funciones
void Conf_maq();
void Ini_var();
void Proceso();

void main()
{
  Conf_maq();
  Ini_var();
  while(1)  // Bucle principal
  {
    Proceso();
  }
}

void Conf_maq()
{
  unsigned short int z;
  //---1 Habilitar el reloj del puerto B
  RCC_APB2ENRbits.IOPBEN=1;
  //---2 Configurar los pines del 8 al 15 como salidas open drain
/*GPIOB_CRH &=~( (15ul<<((8-8)*4))|(15ul<<((9-8)*4))|(15ul<<((10-8)*4))|(15ul<<((11-8)*4))|
                 (15ul<<((12-8)*4))|(15ul<<((13-8)*4))|(15ul<<((14-8)*4))|(15ul<<((15-8)*4)) );

  GPIOB_CRH |=(unsigned long int) ( (7<<((8-8)*4))|(7<<((9-8)*4))|(7<<((10-8)*4))|(7<<((11-8)*4))|
                (7<<((12-8)*4))|(7<<((13-8)*4))|(7<<((14-8)*4))|(7<<((15-8)*4)) );*/
        //--
  for(z=8;z<16;z++)
  {
     GPIOB_CRH &= ~ ( (15ul<<((z-8)*4)) );
  }
  #ifdef ANODO
  for(z=8;z<16;z++)
  {
     GPIOB_CRH |=  ( (7ul<<((z-8)*4)) );
  }
  #else
  for(z=8;z<16;z++)
  {
     GPIOB_CRH |=  ( (2ul<<((z-8)*4)) );
  }
  #endif
  //--Configurar los pines de entrada PC0-PC3
  RCC_APB2ENRbits.IOPCEN=1;
  for(z=0;z<4;z++)        //limpia
     GPIOC_CRL &=~ (15ul<<(z*4));
  for(z=0;z<4;z++)        //establece
  {
     GPIOC_CRL |= (8UL<<(z*4));  //entrada digital pullup o pulldown
     GPIOC_ODR &=~(1UL<<Z);      //PULLDOWN //GPIOC_ODR.B0=0; GPIOC_ODR.B1=0; GPIO_ODR.B2=0; GPIOC_ODR.B3=0;
  }


}
void Ini_var()
{
  posicion=0;
  DISPLAY= segmentos[posicion]<<8;
}
void Proceso()
{
  //---leer la posicion del switch externo
  posicion=SWITCH;
  DISPLAY= segmentos[posicion]<<8;
  /*
  switch(posicion)
  {
     case 0: DISPLAY =CAR0; break;
     case 1: DISPLAY =CAR1; break;
                     .
                     .
                     .
     case 15: DISPLAY =CARF; break;
  }
  if(posicion==0) DISPLAY= CAR0;
  if(posicion==0) DISPLAY= CAR1;
  .
  .
  .
  if(posicion==0) DISPLAY= CARF;
  */
  
}