#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER6/PIE.c"
#line 23 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER6/PIE.c"
const unsigned short int indicadores[]={ 0X8E , 0XF9 , 0XA4 , 0X88 , 0XC0 , 0XF9 , 0X86 , 0X86 };
const unsigned short int activadores[]={0,0,0,0,1,0,3,3};
unsigned short int estado;

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

 RCC_APB2ENR|=1<<IOPCEN;

 GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4)) );
 GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4)) );
 GPIOC_BSRR|= ( (1<<(0))|(1<<(1))|(1<<(2)) );

 RCC_APB2ENR|=1<<IOPAEN;

 GPIOC_CRH&=~( (15<<(0*4))|(15<<(1*4)) );
 GPIOC_CRH|= ( (2<<(0*4))|(2<<(1*4)) );

}
void Ini_var()
{
 estado= GPIOC_IDR &0X07;
  GPIOB_ODR = indicadores[estado]<<8;
  GPIOA_ODR.B8 =0;
  GPIOA_ODR.B9 =0;
}
void Proceso()
{
 estado= GPIOC_IDR &0X07;
  GPIOB_ODR = indicadores[estado]<<8;
  GPIOA_ODR =activadores[estado]<<8;
}
