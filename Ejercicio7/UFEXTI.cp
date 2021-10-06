#line 1 "C:/Users/aacgj/OneDrive/CURSO STM32F103/PRACS/EJER7/UFEXTI.c"
#line 20 "C:/Users/aacgj/OneDrive/CURSO STM32F103/PRACS/EJER7/UFEXTI.c"
const unsigned short int segmentos[]={ 0XC0 , 0XF9 , 0XA4 , 0XB0 , 0X99 , 0X92 , 0X82 ,
  0XF8 , 0x80 , 0X90 , 0X88 , 0X86 , 0XA7 , 0XA1 , 0X86 , 0X8E };
unsigned short int contador ,play;

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

 GPIOB_CRH&=~( (15uL<<(0*4))|(1<<(9*4))|(15<<(2*4))|(15<<(3*4))|
 (15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));

 GPIOB_CRH|= ( (6uL<<(0*4))|(6<<(1*4))|(6<<(2*4))|(6<<(3*4))|
 (6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));


 RCC_APB2ENR|=1<<IOPCEN;
 GPIOC_CRH&=~(15uL<<(5*4));
 GPIOC_CRH|= 4ul<<(5*4);


 RCC_APB2ENR|=1<<IOPAEN;
 GPIOA_CRL&=~(15ul<<(5*4));
 GPIOA_CRL|= 6ul<<(5*4);


 RCC_APB2ENR|=1<<AFIOEN;
 AFIO_EXTICR4&=~(15ul<<(1*4));
 AFIO_EXTICR4|=(2ul<<(1*4));
 EXTI_FTSRbits.TR13=1;
 EXTI_IMRbits.MR13=1;
 NVIC_IntEnable(IVT_INT_EXTI15_10);
 EnableInterrupts();

}
void Ini_var()
{
 contador = 0;
  GPIOB_ODR =segmentos[contador]<<8;
 play=0;
  GPIOA_ODR.B5 =1;
}
void Proceso()
{
 if(play)
 {
  GPIOB_ODR =segmentos[contador]<<8;
 if(++contador==16)
 contador=0;
 Delay_ms(1000);
 }
}
void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
 EXTI_PRbits.PR13=1;
 play=~play;
  GPIOA_ODR.B5 =~ GPIOA_ODR.B5 ;
}
