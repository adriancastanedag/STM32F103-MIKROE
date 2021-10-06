#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER11/PWM.c"
void main() {
 unsigned int duty;

 RCC_APB2ENRbits.IOPBEN=1;
 GPIOB_CRH &=~( (15<<(0*4))|(15<<(1*4)) );
 GPIOB_CRH |= ( (11<<(0*4))|(11<<(1*4)) );

 RCC_APB1ENRbits.TIM4EN=1;
 TIM4_CR1bits.CEN=0;
 TIM4_PSC=7;
 TIM4_ARR=1000;
 TIM4_CR1bits.CMS=0;
 TIM4_CR1bits.DIR_=0;


 TIM4_CCMR2_Outputbits.OC3M=6;
 TIM4_CCMR2_Outputbits.OC3PE=1;
 TIM4_CCMR2_Outputbits.CC3S=0;
 TIM4_CCERbits.CC3P=0;
 TIM4_CCERbits.CC3E=1;
 TIM4_CCR3=100;

 TIM4_CCMR2_Outputbits.OC4M=6;
 TIM4_CCMR2_Outputbits.OC4PE=1;
 TIM4_CCMR2_Outputbits.CC4S=0;
 TIM4_CCERbits.CC4P=1;
 TIM4_CCERbits.CC4E=1;
 TIM4_CCR4=100;

 TIM4_EGRbits.UG=1;
 TIM4_EGRbits.UG=0;
 TIM4_CR1bits.CEN=1;
 duty=100;
 while(1){
 delay_ms(100);
 duty+=50;
 if(duty==1000)
 duty=0;
 TIM4_CCR3=duty;
 TIM4_CCR4=duty;
 }


}
