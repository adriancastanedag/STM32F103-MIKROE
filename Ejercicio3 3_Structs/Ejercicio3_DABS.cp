#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 3_Structs/Ejercicio3_DABS.c"
#line 1 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio3 3_structs/stm32f103xx.h"
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
#line 44 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio3 3_structs/stm32f103xx.h"
typedef struct{
 volatile uint32_t CRL;
 volatile uint32_t CRH;
 volatile uint32_t IDR;
 volatile uint32_t ODR;
 volatile uint32_t BSRR;
 volatile uint32_t BRR;
 volatile uint32_t LCKR;
}GPIOX_REGISTERS_t;


typedef struct{
 union
 {
 struct
 {
 uint32_t ODR0 :1;
 uint32_t ODR1 :1;
 uint32_t ODR2 :1;
 uint32_t ODR3 :1;
 uint32_t ODR4 :1;
 uint32_t ODR5 :1;
 uint32_t ODR6 :1;
 uint32_t ODR7 :1;
 uint32_t ODR8 :1;
 uint32_t ODR9 :1;
 uint32_t ODR10 :1;
 uint32_t ODR11 :1;
 uint32_t ODR12 :1;
 uint32_t ODR13 :1;
 uint32_t ODR14 :1;
 uint32_t ODR15 :1;
 uint32_t RSVD :16;
 };
 };
}GPIOX_ODR_BITS_t;


typedef struct{
 union{
 struct{
 uint32_t AFIOEN :1;
 uint32_t RSVD1 :1;
 uint32_t IOPAEN :1;
 uint32_t IOPBEN :1;
 uint32_t IOPCEN :1;
 uint32_t IOPDEN :1;
 uint32_t IOPEEN :1;
 uint32_t IOPFEN :1;
 uint32_t IOPGEN :1;
 uint32_t ADC1EN :1;
 uint32_t ADC2EN :1;
 uint32_t TIM1EN :1;
 uint32_t SPI1EN :1;
 uint32_t TIM8EN :1;
 uint32_t USART1EN :1;
 uint32_t ADC3EN :1;
 uint32_t RSVD2 :3;
 uint32_t TIM9EN :1;
 uint32_t TIM10EN :1;
 uint32_t TIM11EN :1;
 uint32_t RSVD3 :10;
 };
 };
}RCC_APB2_ENR_BITS_t;
#line 15 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 3_Structs/Ejercicio3_DABS.c"
volatile uint32_t *apuntador = (uint32_t *)  0x08000000UL ;


volatile GPIOX_ODR_BITS_t *GPIOA_ODRX = (GPIOX_ODR_BITS_t*)( 0x40010800UL + 0X0CUL );
uint8_t variable;

void config_maq();
void ini_var();
void proceso();

void main() {

 config_maq();

 ini_var();

 while(1)
 {

 proceso();

 }
}
void proceso()
{
 GPIOA_ODRX->ODR5=~GPIOA_ODRX->ODR5;
 Delay_ms(500);
}
void ini_var()
{
  GPIOA_ODR.B5 =0;
}
void config_maq()
{
 volatile GPIOX_REGISTERS_t *puertoa =  ((GPIOX_REGISTERS_t*) ( 0x40010000UL +0X0800UL) ) ;
 volatile GPIOX_REGISTERS_t *puertoc = ((GPIOX_REGISTERS_t *) ( 0x40010000UL +0X1000UL) );
 volatile RCC_APB2_ENR_BITS_t *RCC_APB2_ENR_BITS = (RCC_APB2_ENR_BITS_t*) ( 0x40021000UL + 0x18UL ); ;






 RCC_APB2_ENR_BITS->IOPAEN=1;



 puertoa->CRL &=~(15UL<<((5-0)*4));
 puertoa->CRL |= (1UL<<((5-0)*4));

 puertoa->ODR|=1<<5;
 Delay_ms(2000);
 puertoa->ODR&=~(1<<5);
 Delay_ms(2000);
 GPIOA_ODRX->ODR5=1;
 Delay_ms(2000);
 GPIOA_ODRX->ODR5=0;
 Delay_ms(2000);

}
