_main:
;UFUSART2.c,4 :: 		void main() {
SUB	SP, SP, #4
;UFUSART2.c,9 :: 		RCC_APB2ENR|=1<<IOPAEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFUSART2.c,10 :: 		GPIOA_CRL &= ~(15<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2.c,11 :: 		GPIOA_CRL |=  (2<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2.c,12 :: 		LED=1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;UFUSART2.c,15 :: 		GPIOA_CRL &= ~( (15<<(2*4))| (15<<(3*4)));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #65280
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2.c,16 :: 		GPIOA_CRL |=  ( (11<<(2*4))| (4<<(3*4)) );
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #19200
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2.c,18 :: 		RCC_APB1ENRbits.USART2EN=1;
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB1ENRbits+0)]
;UFUSART2.c,19 :: 		USART2_CR1bits.UE=1;       //hABILITA LA USART2
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;UFUSART2.c,20 :: 		USART2_CR1bits.M=0;        //8 BITS DE PALABRA
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;UFUSART2.c,21 :: 		USART2_CR1bits.PCE=0;      //SIN PARIDAD
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;UFUSART2.c,22 :: 		USART2_CR2bits.STOP=0;     //1 BIT DE STOP
MOVS	R2, #0
MOVW	R1, #lo_addr(USART2_CR2bits+0)
MOVT	R1, #hi_addr(USART2_CR2bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #2
STRH	R0, [R1, #0]
;UFUSART2.c,23 :: 		USART2_BRR=0X9C4;//0X683;          //9600 @ 24MHZ   BAUD=24MHZ/(16*9600)
MOVW	R1, #2500
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;UFUSART2.c,24 :: 		USART2_CR1bits.RE=1;       //HABILITA RECEPCIÓN
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;UFUSART2.c,25 :: 		USART2_CR1bits.TE=1;       //HABILITA TRANSMISIÓN
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
_SX	[R0, ByteOffset(USART2_CR1bits+0)]
;UFUSART2.c,27 :: 		app=msn;
; app start address is: 8 (R2)
MOVW	R2, #lo_addr(_msn+0)
MOVT	R2, #hi_addr(_msn+0)
; app end address is: 8 (R2)
;UFUSART2.c,28 :: 		while(*app!=0)
L_main0:
; app start address is: 8 (R2)
LDRB	R0, [R2, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main1
; app end address is: 8 (R2)
;UFUSART2.c,30 :: 		while(USART2_SRBITS.TXE==0);
L_main2:
; app start address is: 8 (R2)
MOVW	R0, #lo_addr(USART2_SRbits+0)
MOVT	R0, #hi_addr(USART2_SRbits+0)
_LX	[R0, ByteOffset(USART2_SRbits+0)]
CMP	R0, #0
IT	NE
BNE	L_main3
IT	AL
BAL	L_main2
L_main3:
;UFUSART2.c,31 :: 		USART2_SRBITS.TXE=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_SRbits+0)
MOVT	R0, #hi_addr(USART2_SRbits+0)
_SX	[R0, ByteOffset(USART2_SRbits+0)]
;UFUSART2.c,32 :: 		USART2_DR=*app;
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
;UFUSART2.c,33 :: 		app++;
ADDS	R2, R2, #1
;UFUSART2.c,34 :: 		}
; app end address is: 8 (R2)
IT	AL
BAL	L_main0
L_main1:
;UFUSART2.c,35 :: 		USART2_DR=0X20;
MOVS	R1, #32
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
;UFUSART2.c,37 :: 		while(1)
L_main4:
;UFUSART2.c,39 :: 		LED=~LED;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;UFUSART2.c,40 :: 		Delay_ms(500);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;UFUSART2.c,41 :: 		if(USART2_SRbits.RXNE==1)
MOVW	R0, #lo_addr(USART2_SRbits+0)
MOVT	R0, #hi_addr(USART2_SRbits+0)
_LX	[R0, ByteOffset(USART2_SRbits+0)]
CMP	R0, #0
IT	EQ
BEQ	L_main8
;UFUSART2.c,43 :: 		dato=USART2_DR;
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
LDR	R0, [R0, #0]
STRB	R0, [SP, #0]
;UFUSART2.c,44 :: 		USART2_DR=dato;
LDRB	R1, [SP, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
;UFUSART2.c,45 :: 		while(USART2_SRBITS.TC==0);
L_main9:
MOVW	R0, #lo_addr(USART2_SRbits+0)
MOVT	R0, #hi_addr(USART2_SRbits+0)
_LX	[R0, ByteOffset(USART2_SRbits+0)]
CMP	R0, #0
IT	NE
BNE	L_main10
IT	AL
BAL	L_main9
L_main10:
;UFUSART2.c,46 :: 		}
L_main8:
;UFUSART2.c,47 :: 		}
IT	AL
BAL	L_main4
;UFUSART2.c,49 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
