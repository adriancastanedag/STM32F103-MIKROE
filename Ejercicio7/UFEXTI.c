#define DISPLAY     GPIOB_ODR
#define LED         GPIOA_ODR.B5
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
#define CARB        0X86
#define CARC        0XA7
#define CARD        0XA1
#define CARE        0X86
#define CARF        0X8E
//Declara variables globales
const unsigned short int segmentos[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,
    SIETE,OCHO,NUEVE,CARA,CARB,CARC,CARD,CARE,CARF};
unsigned short int contador ,play;
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
   RCC_APB2ENR|=1<<IOPBEN; //hABILITA EL RELOJ DEL PUERTO B
    //APAGA LOS BITS DE CONFIGURACION DEL PBO A PB7
   GPIOB_CRH&=~( (15uL<<(0*4))|(1<<(9*4))|(15<<(2*4))|(15<<(3*4))|
                 (15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));
   //PUERTO B DEL B8 al B15 COMO SALIDAS OPEN DRAIN
   GPIOB_CRH|= ( (6uL<<(0*4))|(6<<(1*4))|(6<<(2*4))|(6<<(3*4))|
                 (6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));

   //PC13 COMO ENTRADA FLOTANTE
   RCC_APB2ENR|=1<<IOPCEN;
   GPIOC_CRH&=~(15uL<<(5*4));
   GPIOC_CRH|= 4ul<<(5*4);

   //PA5 COMO SALIDA PUSH PULL
   RCC_APB2ENR|=1<<IOPAEN;
   GPIOA_CRL&=~(15ul<<(5*4));
   GPIOA_CRL|= 6ul<<(5*4);

   //CONFIGURA LA INTERRUPCION EXTERNA EN EL BIT 13
   RCC_APB2ENR|=1<<AFIOEN;
   AFIO_EXTICR4&=~(15ul<<(1*4));  //ESCOGE LA FUENTE DE LA LINEA 13 AL PUERTO C
   AFIO_EXTICR4|=(2ul<<(1*4));   //PUERTO C13 COMO FUENTE DE INTERRUPCION EXTERNA
   EXTI_FTSRbits.TR13=1;       //ACTIVACIÓN POR FLANCO DE BAJADA LINEA 13
   EXTI_IMRbits.MR13=1;        //PETICION DE LA LINEA 13 PARA INTERRUPCION
   NVIC_IntEnable(IVT_INT_EXTI15_10); //INDICA AL NVIC ATENCIÓN A LA LINEA 13
   EnableInterrupts();                //HABILITA INERRUPCIONES

}
void Ini_var()
{
  contador = 0;
  DISPLAY=segmentos[contador]<<8;
  play=0;
  LED=1;
}
void Proceso()
{
   if(play)
   {
      DISPLAY=segmentos[contador]<<8;
      if(++contador==16)
         contador=0;
      Delay_ms(1000);
   }
}
void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
  EXTI_PRbits.PR13=1;
  play=~play;
  LED=~LED;
}
