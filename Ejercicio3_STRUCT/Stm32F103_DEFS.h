#include <stdint.h>
#define RCC_DIR                              0X40021000UL         //Dirección del RCC
#define APB2ENR_OFFSET                       0x18UL               //offset del apb2
#define RCC_APB2ENR_DIR                      (RCC_DIR+APB2ENR_OFFSET) //Dirección del RCC_APB2ENR
#define RCC_APB2ENR_DIRx                     0X40021018UL             //Dirección del RCC_APB2ENR
#define IOPCENx                              4
#define IOPAENx                              2

#define GPIOC_DIR                            0x40011000ul             //dIR DEL GPIOC
#define CRH_OFFSET                           0x04
#define GPIOC_CRH_DIR                        (GPIOC_DIR+CRH_OFFSET)
#define GPIOC_CRH_DIRx                       0X40011004UL             //DIR DEL gpioc_crh register
#define GPIOC_ODR_DIRx                       0x4001100cUL

#define GPIOA_DIR                            0x40010800UL
#define CRL_OFFSET                           0X00
#define GPIOA_CRL_DIR                        (GPIOA_DIR+CRL_OFFSET)
#define GPIOA_CRL_DIRx                       0x40010800               //Dir GPIOA_CRL
#define ODR_OFFSET                           0X0C
#define GPIOA_ODR_DIRx                       0x400108000cul

typedef struct
{                                            //OFFSET
   volatile uint32_t CR;                     //00
   volatile uint32_t CFGR;                   //04
   volatile uint32_t CIR;                    //08
   volatile uint32_t APB2RSTR;               //0C
   volatile uint32_t APB1RSTR;               //10
   volatile uint32_t AHBENR;                 //14
   volatile uint32_t APB2ENR;                //18
   volatile uint32_t APB1ENR;                //1C
   volatile uint32_t BDCR;                   //20
}RCC_REG_DEFS_t;

typedef struct
{                                            //OFFSET
   volatile uint32_t CRL;                    //00
   volatile uint32_t CRH;                    //04
   volatile uint32_t IDR;                    //08
   volatile uint32_t ODR;                    //0C
   volatile uint32_t BSRR;                   //10
   volatile uint32_t BRR;
   volatile uint32_t LCKR;
}GPIOX_DEFS_t;

typedef struct
{
   union
   {
        struct
        {
           uint32_t IDR0       :1;
           uint32_t IDR1       :1;
           uint32_t IDR2       :1;
           uint32_t IDR3       :1;
           uint32_t IDR4       :1;
           uint32_t IDR5       :1;
           uint32_t IDR6       :1;
           uint32_t IDR7       :1;
           uint32_t IDR8       :1;
           uint32_t IDR9       :1;
           uint32_t IDR10      :1;
           uint32_t IDR11      :1;
           uint32_t IDR12      :1;
           uint32_t IDR13      :1;
           uint32_t IDR14      :1;
           uint32_t IDR15      :1;
           uint32_t RSVRD      :16;
        };
   };
}GPIOX_IDR_t;

typedef struct
{
   union
   {
      struct
      {
          volatile uint32_t ODR0        :1;
          volatile uint32_t ODR1        :1;
          volatile uint32_t ODR2        :1;
          volatile uint32_t ODR3        :1;
          volatile uint32_t ODR4        :1;
          volatile uint32_t ODR5        :1;
          volatile uint32_t ODR6        :1;
          volatile uint32_t ODR7        :1;
          volatile uint32_t ODR8        :1;
          volatile uint32_t ODR9        :1;
          volatile uint32_t ODR10       :1;
          volatile uint32_t ODR11       :1;
          volatile uint32_t ODR12       :1;
          volatile uint32_t ODR13       :1;
          volatile uint32_t ODR14       :1;
          volatile uint32_t ODR15       :1;
          volatile uint32_t RSVRD       :16;
      };
   };
}GPIOX_ODR_t;









