#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER10/Timer.c"



void Conf_maq();
void Ini_var();


void main() {
 Conf_maq();
 Ini_var();
 while(1)
 {

 }

}
void Conf_maq()
{

 RCC_APB2ENRbits.IOPAEN=1;
 GPIOA_CRL &=~(15<<(5*4));
 GPIOA_CRL |= (2<<(5*4));
  GPIOA_ODR.B5 =1;


 RCC_APB1ENRbits.TIM4EN=1;
 TIM4_CR1.CEN=0;
 TIM4_PSC=7999;
 TIM4_ARR=500;
 TIM4_DIER.UIF=1;
 NVIC_IntEnable(IVT_INT_TIM4);
 TIM4_CR1.CEN=1;

}
void Ini_var()
{
  GPIOA_ODR.B5  = 0;
}
void conmutar() iv IVT_INT_TIM4 ics ICS_AUTO {
 TIM4_SRbits.UIF=0;
  GPIOA_ODR.B5 =~ GPIOA_ODR.B5 ;
}
