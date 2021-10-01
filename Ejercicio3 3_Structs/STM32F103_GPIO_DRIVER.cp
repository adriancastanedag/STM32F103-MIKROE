#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 3_Structs/STM32F103_GPIO_DRIVER.c"
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
#line 45 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio3 3_structs/stm32f103xx.h"
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




typedef struct{
 volatile uint32_t CRL;
 volatile uint32_t CRH;
 volatile uint32_t IDR;
 volatile uint32_t ODR;
 volatile uint32_t BSRR;
 volatile uint32_t BRR;
 volatile uint32_t LCKR;
}GPIOX_t;
