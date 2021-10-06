#line 1 "C:/Users/Tony Cast/OneDrive/CURSO STM32F103 JUN 17/PRACS/EJER8_B/UFUSART2B.c"

const char msn[]={" Hola CPU"};

void main() {
 unsigned short int dato;
 const char *app;




 RCC_APB2ENR|=1<<IOPAEN;
 GPIOA_CRL &= ~( (15<<(2*4))|(15<<(3*4))|(15<<(5*4)) );
 GPIOA_CRL |= ( (11<<(2*4))| (4<<(3*4))|(2<<(5*4)));
  GPIOA_ODR.B5 =1;



 RCC_APB1ENRbits.USART2EN=1;
 USART2_CR1bits.UE=1;
 USART2_CR1bits.M=0;
 USART2_CR1bits.PCE=0;
 USART2_CR2bits.STOP=0;
 USART2_BRR=0X9C4;
 USART2_CR1bits.RE=1;
 USART2_CR1bits.TE=1;
 Delay_ms(500);
 app=msn;
 while(*app!=0)
 {
 USART2_DR=*app;
 while(USART2_SRBITS.TXE==0);
 USART2_SRBITS.TXE=0;
 app++;
 }
 USART2_DR=0X20;

 while(1)
 {
  GPIOA_ODR.B5 =~ GPIOA_ODR.B5 ;
 Delay_ms(500);

 if(USART2_SRbits.RXNE==1)
 {
 dato=USART2_DR;
 USART2_DR=dato;
 while(USART2_SRBITS.TC==0);
 }

 }

}
