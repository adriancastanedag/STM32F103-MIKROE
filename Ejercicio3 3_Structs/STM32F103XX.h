//---STM32F103XX.h
/*
*/
#include <stdint.h>

//
#define ENABLE     1
#define DISABLE    0
#define SET        ENABLE
#define RESET      DISABLE
#define TRUE       1
#define FALSE      0
#define HIGH       ENABLE
#define LOW        DISABLE
//
#define FLASH_BASE_ADR          0x08000000UL

#define RCC_BASE_ADR             0x40021000UL
#define RCC_APB2ENR_OFFSET       0x18UL
#define RCC_APB2_ENR_ADR         (RCC_BASE_ADR+RCC_APB2ENR_OFFSET);

#define PERIPHERALS_BASE_ADR    0x40000000UL
#define APB1_BASE_ADR           0x40000000UL
#define APB2_BASE_ADR           0x40010000UL
#define AHB_BASE_ADR            0x40018000UL

//---direcciones base de los periféricos en el bus apb2
#define GPIOA_BASE_ADR                   (APB2_BASE_ADR+0X0800UL)
#define GPIOB_BASE_ADR                   (APB2_BASE_ADR+0X0C00UL)
#define GPIOC_BASE_ADR                   (APB2_BASE_ADR+0X1000UL)

#define GPIOA_BASEX                       0x40010800UL
#define GPIOB_BASEX                       0X40010C00UL
#define GPIOC_BASEX                       0X40011000UL

#define CRL_OFFSET                        0X00UL
#define CRH_OFFSET                        0X04UL
#define IDR_OFFSET                        0X08UL
#define ODR_OFFSET                        0X0CUL
#define BSRR_OFFSET                       0X10UL
#define BRR_OFFSET                        0X14UL
#define LCKR_OFFSET                       0X18UL

typedef struct{
 volatile uint32_t CRL;                   //configuration register low offset   0x00
 volatile uint32_t CRH;                   //configuration register high offset  0x04
 volatile uint32_t IDR;                   //INPUT DATA REGISTER     offset      0x08
 volatile uint32_t ODR;                   //OUTPUT DATA REGISTER     offset     0x0C
 volatile uint32_t BSRR;                   //BIT SET RESET REGISTER     offset  0x10
 volatile uint32_t BRR;                   //BIT RESET REGISTER     offset       0x14
 volatile uint32_t LCKR;                   //INPUT DATA REGISTER     offset     0x18
}GPIOX_REGISTERS_t;
#define GPIOA_REGISTERS                   ((GPIOX_REGISTERS_t*)GPIOA_BASE_ADR)
//#define GPIOAX_CRL1()                         (GPIOAX->CRL|=(1<<20))
typedef struct{
   union
   {
      struct
      {
         uint32_t ODR0          :1;
         uint32_t ODR1          :1;
         uint32_t ODR2          :1;
         uint32_t ODR3          :1;
         uint32_t ODR4          :1;
         uint32_t ODR5          :1;
         uint32_t ODR6          :1;
         uint32_t ODR7          :1;
         uint32_t ODR8          :1;
         uint32_t ODR9          :1;
         uint32_t ODR10         :1;
         uint32_t ODR11         :1;
         uint32_t ODR12         :1;
         uint32_t ODR13         :1;
         uint32_t ODR14         :1;
         uint32_t ODR15         :1;
         uint32_t RSVD          :16;
      };
   };
}GPIOX_ODR_BITS_t;
//sfr volatile GPIOX_ODR_BITS_t GPIOX_ODR_BITS
//---Define la estructura para el registro RCC_APB2_ENR_bits
typedef struct{
   union{
      struct{
         uint32_t AFIOEN       :1;
         uint32_t RSVD1        :1;
         uint32_t IOPAEN       :1;
         uint32_t IOPBEN       :1;
         uint32_t IOPCEN       :1;
         uint32_t IOPDEN       :1;
         uint32_t IOPEEN       :1;
         uint32_t IOPFEN       :1;
         uint32_t IOPGEN       :1;
         uint32_t ADC1EN       :1;
         uint32_t ADC2EN       :1;
         uint32_t TIM1EN       :1;
         uint32_t SPI1EN       :1;
         uint32_t TIM8EN       :1;
         uint32_t USART1EN     :1;
         uint32_t ADC3EN       :1;
         uint32_t RSVD2        :3;
         uint32_t TIM9EN       :1;
         uint32_t TIM10EN      :1;
         uint32_t TIM11EN      :1;
         uint32_t RSVD3        :10;
      };
   };
}RCC_APB2_ENR_BITS_t;
//sfr volatile RCC_APB2_ENR_BITS_t RCC_APB2_ENR_BITS absolute RCC_APB2_ENR;