#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio4/definiciones.h"
#line 16 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
const uint8_t vector[]={ 0XC0 , 0XF9 , 0XA4 , 0XB0 , 0X99 , 0X92 , 0X82 , 0XF8 , 0x80 , 0X90 ,
  0X88 , 0X83 , 0XA7 , 0XA1 , 0X86 , 0X8E  };
volatile uint8_t play;
volatile uint8_t contador=0;
volatile uint8_t entrada;

void proceso();
void conf_maq();
void ini_var();
void config_gpios();
void config_exti();
void establece();


void main() {

 conf_maq();

 ini_var();

 while(1)
 {
 proceso();
 }
}
void proceso()
{
 if(play){
 if(++contador==16) contador=0;
  GPIOB_ODR =vector[contador]<<8;
 Delay_ms(250);
 }
#line 57 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
}
void ini_var()
{
  GPIOB_ODR =vector[0]<<8;
 play=0;
}
void conf_maq()
{

 config_gpios();

 config_exti();
}
void config_gpios()
{
 uint8_t i;
 RCC_APB2ENRbits.IOPBEN=1;
#line 83 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
 for(i=8;i<16;i++)
 GPIOB_CRH &=~ (15UL<<((i-8)*4));

 for(i=8;i<16;i++)
 GPIOB_CRH |= (6UL<<((i-8)*4));
#line 94 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
 RCC_APB2ENRbits.IOPCEN=1;
 for(i=0;i<4;i++)
 GPIOC_CRL&=~(15UL<<(i*4));
 for(i=0;i<4;i++)
 GPIOC_CRL |= (8UL<<(i*4));
 GPIOC_ODR &=~15UL;
 GPIOC_ODR |= 15UL;
}
void config_exti()
{
#line 112 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio4/Ejercicio4.c"
 RCC_APB2ENRbits.IOPCEN=1;
 GPIOC_CRH &=~( 15UL<<((13-8)*4));
 GPIOC_CRH |= ( 4UL<<((13-8)*4) );

 RCC_APB2ENRbits.AFIOEN=1;
 AFIO_EXTICR4=2UL<<4;

 EXTI_RTSRbits.TR13=1;

 EXTI_IMRbits.MR13=1;


 NVIC_IntEnable(IVT_INT_EXTI15_10);



 RCC_APB2ENRbits.IOPBEN=1;
 GPIOB_CRH &=~( 15UL<<((10-8)*4));
 GPIOB_CRH |= ( 8UL<<((10-8)*4) );

 RCC_APB2ENRbits.AFIOEN=1;
 AFIO_EXTICR3=1UL<<8;

 EXTI_FTSRbits.TR10=1;

 EXTI_IMRbits.MR10=1;

 NVIC_IntEnable(IVT_INT_EXTI15_10);



 RCC_APB2ENRbits.IOPAEN=1;
 GPIOA_CRL &=~( 15UL<<((4)*4));
 GPIOA_CRL |= ( 8UL<<((4)*4) );
 GPIOA_ODR.B4=0;

 RCC_APB2ENRbits.AFIOEN=1;
 AFIO_EXTICR2bits.EXTI4=0;

 EXTI_RTSRbits.TR4=1;

 EXTI_IMRbits.MR4=1;

 NVIC_IntEnable(IVT_INT_EXTI4);

}
void leer_dipsw() iv IVT_INT_EXTI4
{
 entrada= GPIOC_IDR & 0x000F ;
 contador=entrada;
  GPIOB_ODR =vector[contador]<<8;
}
void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO
{
 if(EXTI_PRbits.PR13)
 {
 EXTI_PRbits.PR13=1;
 if(play)
 play=0;
 else
 play=1;
 }
 if(EXTI_PRbits.PR10)
 {
 EXTI_PRbits.PR10=1;

 establece();
 }
}
void establece()
{
 contador=0;
}
