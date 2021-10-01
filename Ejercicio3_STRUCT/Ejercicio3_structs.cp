#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3_STRUCT/Ejercicio3_structs.c"
#line 1 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio3_struct/stm32f103_defs.h"
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
#line 22 "e:/onedrive - instituto politecnico nacional/docencia/periodo 20212/computadoras automotrices ii/ejercicio3_struct/stm32f103_defs.h"
typedef struct
{
 volatile uint32_t CR;
 volatile uint32_t CFGR;
 volatile uint32_t CIR;
 volatile uint32_t APB2RSTR;
 volatile uint32_t APB1RSTR;
 volatile uint32_t AHBENR;
 volatile uint32_t APB2ENR;
 volatile uint32_t APB1ENR;
 volatile uint32_t BDCR;
}RCC_REG_DEFS_t;

typedef struct
{
 volatile uint32_t CRL;
 volatile uint32_t CRH;
 volatile uint32_t IDR;
 volatile uint32_t ODR;
 volatile uint32_t BSRR;
 volatile uint32_t BRR;
 volatile uint32_t LCKR;
}GPIOX_DEFS_t;

typedef struct
{
 union
 {
 struct
 {
 uint32_t IDR0 :1;
 uint32_t IDR1 :1;
 uint32_t IDR2 :1;
 uint32_t IDR3 :1;
 uint32_t IDR4 :1;
 uint32_t IDR5 :1;
 uint32_t IDR6 :1;
 uint32_t IDR7 :1;
 uint32_t IDR8 :1;
 uint32_t IDR9 :1;
 uint32_t IDR10 :1;
 uint32_t IDR11 :1;
 uint32_t IDR12 :1;
 uint32_t IDR13 :1;
 uint32_t IDR14 :1;
 uint32_t IDR15 :1;
 uint32_t RSVRD :16;
 };
 };
}GPIOX_IDR_t;

typedef struct
{
 union
 {
 struct
 {
 volatile uint32_t ODR0 :1;
 volatile uint32_t ODR1 :1;
 volatile uint32_t ODR2 :1;
 volatile uint32_t ODR3 :1;
 volatile uint32_t ODR4 :1;
 volatile uint32_t ODR5 :1;
 volatile uint32_t ODR6 :1;
 volatile uint32_t ODR7 :1;
 volatile uint32_t ODR8 :1;
 volatile uint32_t ODR9 :1;
 volatile uint32_t ODR10 :1;
 volatile uint32_t ODR11 :1;
 volatile uint32_t ODR12 :1;
 volatile uint32_t ODR13 :1;
 volatile uint32_t ODR14 :1;
 volatile uint32_t ODR15 :1;
 volatile uint32_t RSVRD :16;
 };
 };
}GPIOX_ODR_t;
#line 18 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3_STRUCT/Ejercicio3_structs.c"
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
 if( GPIOC_IDR.B13 == 0 )
 {
  GPIOA_ODR.B5 = ! GPIOA_ODR.B5 ;
 Delay_ms(1000);
 }
}
void ini_var()
{
  GPIOA_ODR.B5 = 1 ;
 Delay_ms(1000);
  GPIOA_ODR.B5 = 0 ;
}
void config_maq()
{

 volatile uint32_t *apuntador;
 volatile RCC_REG_DEFS_t *pointer;
 volatile GPIOX_DEFS_t *GPIOX;
 volatile GPIOX_ODR_t *GPIOX_ODR;
#line 68 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3_STRUCT/Ejercicio3_structs.c"
 pointer= 0X40021000UL ;
 pointer->APB2ENR &=~(1UL<< 4 );
 pointer->APB2ENR |= (1UL<< 4 );
 apuntador =  ( 0X40021000UL + 0x18UL ) ;
 *apuntador &=~(1UL<< 4 );
 *apuntador |= (1UL<< 4 );



 GPIOX= 0x40011000ul  ;
 GPIOX->CRH &=~(15UL<<20);
 GPIOX->CRH |= ( 0X04UL <<((13-8)*4));
 apuntador=  ( 0x40011000ul + 0x04 ) ;
 *apuntador &=~(15UL<<20);
 *apuntador |= ( 0X04UL <<((13-8)*4));




 pointer->APB2ENR &=~ (1UL<< 2 );
 pointer->APB2ENR |= (1UL<< 2 );
 apuntador= 0X40021018UL ;
 *apuntador &=~ (1UL<< 2 );
 *apuntador |= (1UL<< 2 );



 GPIOX=(GPIOX_DEFS_t *) 0x40010800UL ;
 GPIOX->CRL &=~(15UL<<((5-0)*4));
 GPIOX->CRL |= ( 0X01UL <<((5-0)*4));
 apuntador =  ( 0x40010800UL + 0X00 ) ;
 *apuntador &=~(15UL<<((5-0)*4));
 *apuntador |= ( 0X01UL <<((5-0)*4));


 GPIOX_ODR=(GPIOX_ODR_t*) 0x400108000cul ;
 GPIOX_ODR->ODR5= 1 ;
 GPIOX_ODR->ODR5= 0 ;

}
