#define DISPLAY     GPIOB_ODR
#define SENSORES    GPIOC_IDR
#define BOMBAS      GPIOA_ODR
#define BOMBA1      GPIOA_ODR.B8
#define BOMBA2      GPIOA_ODR.B9
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
const unsigned short int indicadores[]={CARF,UNO,DOS,CARA,CERO,UNO,CARE,CARE};
const unsigned short int activadores[]={0,0,0,0,1,0,3,3};
unsigned short int estado;
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

   RCC_APB2ENR|=1<<IOPCEN;
   //PUERTO C DEL BIT0 AL BIT 2 COMO ENTRADAS CON PULLUP
   GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4)) );
   GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4)) );
   GPIOC_BSRR|= ( (1<<(0))|(1<<(1))|(1<<(2)) );

   RCC_APB2ENR|=1<<IOPAEN;
   //PUERTO A BIT8 Y BIT9 COMO SALIDAS CON PUSH PULL 2MHZ
   GPIOC_CRH&=~( (15<<(0*4))|(15<<(1*4)) );
   GPIOC_CRH|= ( (2<<(0*4))|(2<<(1*4)) );

}
void Ini_var()
{
  estado=SENSORES&0X07;
  DISPLAY= indicadores[estado]<<8;
  BOMBA1=0;
  BOMBA2=0;
}
void Proceso()
{
  estado=SENSORES&0X07;
  DISPLAY= indicadores[estado]<<8;
  BOMBAS=activadores[estado]<<8;
}