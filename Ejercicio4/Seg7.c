#define DISPLAY     GPIOB_ODR
#define DIPSW       GPIOC_IDR
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
//Declara variables globales
const unsigned short int segmentos[]={CERO,UNO,DOS,TRES,CUATRO,CINCO,SEIS,
    SIETE,OCHO,NUEVE,CARA,CARB,CARC,CARD,CARE,CARF};
unsigned short int contador;
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
    //APAGA LOS BITS DE CONFIGURACION DEL PB8 A PB15
   GPIOB_CRH&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4))|(15<<(3*4))|
                 (15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));
   //PUERTO B DEL B8 B15 COMO SALIDAS OPEN DRAIN 2MHZ
   GPIOB_CRH|= ( (6<<(0*4))|(6<<(1*4))|(6<<(2*4))|(6<<(3*4))|
                 (6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));
/*
   //PUERTO B DEL B0 B7 COMO SALIDAS PUSH PULL 2MHZ
   GPIOB_CRL|= ( (2<<(0*4))|(2<<(1*4))|(2<<(2*4))|(2<<(3*4))|
                 (2<<(4*4))|(2<<(5*4))|(2<<(6*4))|(2<<(7*4)));*/
   RCC_APB2ENR|=1<<IOPCEN;
   //PUERT C DEL BIT0 AL BIT 3 COMO ENTRADAS CON PULLDOWN
   GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4))|(15<<(3*4)) );
   GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4))|(8<<(3*4)) );
   
   

}
void Ini_var()
{
  contador = 0;
}
void Proceso()
{
      DISPLAY=segmentos[contador]<<8;
      if(++contador==16)
         contador=0;
      Delay_ms(1000);
}