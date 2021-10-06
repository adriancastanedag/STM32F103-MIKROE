#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER4/Seg7.c"
#line 20 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER4/Seg7.c"
const unsigned short int segmentos[]={ 0XC0 , 0XF9 , 0XA4 , 0XB0 , 0X99 , 0X92 , 0X82 ,
  0XF8 , 0x80 , 0X90 , 0X88 , 0X83 , 0XA7 , 0XA1 , 0X86 , 0X8E };
unsigned short int contador;

void Conf_maq();
void Ini_var();
void Proceso();

void main()
{
 Conf_maq();
 Ini_var();
 while(1)
 {
 Proceso();
 }
}

void Conf_maq()
{

 RCC_APB2ENR|=1<<IOPBEN;

 GPIOB_CRH&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4))|(15<<(3*4))|
 (15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));

 GPIOB_CRH|= ( (6<<(0*4))|(6<<(1*4))|(6<<(2*4))|(6<<(3*4))|
 (6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));
#line 52 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER4/Seg7.c"
 RCC_APB2ENR|=1<<IOPCEN;

 GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4))|(15<<(3*4)) );
 GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4))|(8<<(3*4)) );



}
void Ini_var()
{
 contador = 0;
}
void Proceso()
{
  GPIOB_ODR =segmentos[contador]<<8;
 if(++contador==16)
 contador=0;
 Delay_ms(1000);
}
