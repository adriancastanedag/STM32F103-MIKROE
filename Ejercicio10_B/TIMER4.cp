#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER10_B/TIMER4.c"



void Conf_maq();
void Ini_var();


void main() {

 Conf_maq();
 RCC_APB2ENR|=1<<IOPAEN;
 GPIOA_CRL &= ~( (15<<(2*4))|(15<<(3*4))|(15<<(5*4)) );
 GPIOA_CRL |= ( (11<<(2*4))| (4<<(3*4))|(2<<(5*4)));
  GPIOA_ODR.B5 =1;
 Ini_var();
 while(1)
 {

 }

}
void Conf_maq()
{

 GPIOA_CRL &=~(15<<(5*4));
 GPIOA_CRL |= (2<<(5*4));
  GPIOA_ODR.B5 =1;
#line 38 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER10_B/TIMER4.c"
}
void Ini_var()
{
  GPIOA_ODR.B5  = 0;
}
void conmutar() iv IVT_INT_TIM4 ics ICS_AUTO {
 TIM4_SRbits.UIF=0;
  GPIOA_ODR.B5 =~ GPIOA_ODR.B5 ;
}
