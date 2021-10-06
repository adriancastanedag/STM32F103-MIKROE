_main:
;UFUSART2B.c,4 :: 		void main() {
SUB	SP, SP, #4
;UFUSART2B.c,11 :: 		RCC_APB2ENR|=1<<IOPAEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFUSART2B.c,12 :: 		GPIOA_CRL &=  ~( (15<<(2*4))|(15<<(3*4))|(15<<(5*4)) );
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #255
MOVT	R0, #65295
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2B.c,13 :: 		GPIOA_CRL |=  ( (11<<(2*4))| (4<<(3*4))|(2<<(5*4)));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #19200
MOVT	R0, #32
ORRS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFUSART2B.c,14 :: 		LED=1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R3, [R0, #0]
;UFUSART2B.c,18 :: 		RCC_APB1ENRbits.USART2EN=1;
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R3, [R0, #0]
;UFUSART2B.c,19 :: 		USART2_CR1bits.UE=1;       //hABILITA LA USART2
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R3, [R0, #0]
;UFUSART2B.c,20 :: 		USART2_CR1bits.M=0;        //8 BITS DE PALABRA
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;UFUSART2B.c,21 :: 		USART2_CR1bits.PCE=0;      //SIN PARIDAD
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R1, [R0, #0]
;UFUSART2B.c,22 :: 		USART2_CR2bits.STOP=0;     //1 BIT DE STOP
MOVS	R2, #0
MOVW	R1, #lo_addr(USART2_CR2bits+0)
MOVT	R1, #hi_addr(USART2_CR2bits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #2
STRH	R0, [R1, #0]
;UFUSART2B.c,23 :: 		USART2_BRR=0X9C4;          //9600 @ 24MHZ   BAUD=24MHZ/(16*9600)
MOVW	R1, #2500
MOVW	R0, #lo_addr(USART2_BRR+0)
MOVT	R0, #hi_addr(USART2_BRR+0)
STR	R1, [R0, #0]
;UFUSART2B.c,24 :: 		USART2_CR1bits.RE=1;       //HABILITA RECEPCIÓN
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R3, [R0, #0]
;UFUSART2B.c,25 :: 		USART2_CR1bits.TE=1;       //HABILITA TRANSMISIÓN
MOVW	R0, #lo_addr(USART2_CR1bits+0)
MOVT	R0, #hi_addr(USART2_CR1bits+0)
STR	R3, [R0, #0]
;UFUSART2B.c,26 :: 		Delay_ms(500);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
;UFUSART2B.c,27 :: 		app=msn;
; app start address is: 8 (R2)
MOVW	R2, #lo_addr(_msn+0)
MOVT	R2, #hi_addr(_msn+0)
; app end address is: 8 (R2)
;UFUSART2B.c,28 :: 		while(*app!=0)
L_main2:
; app start address is: 8 (R2)
LDRB	R0, [R2, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main3
;UFUSART2B.c,30 :: 		USART2_DR=*app;
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
; app end address is: 8 (R2)
;UFUSART2B.c,31 :: 		while(USART2_SRBITS.TXE==0);
L_main4:
; app start address is: 8 (R2)
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main5
IT	AL
BAL	L_main4
L_main5:
;UFUSART2B.c,32 :: 		USART2_SRBITS.TXE=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(USART2_SRbits+0)
MOVT	R0, #hi_addr(USART2_SRbits+0)
STR	R1, [R0, #0]
;UFUSART2B.c,33 :: 		app++;
ADDS	R2, R2, #1
;UFUSART2B.c,34 :: 		}
; app end address is: 8 (R2)
IT	AL
BAL	L_main2
L_main3:
;UFUSART2B.c,35 :: 		USART2_DR=0X20;
MOVS	R1, #32
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
;UFUSART2B.c,37 :: 		while(1)
L_main6:
;UFUSART2B.c,39 :: 		LED=~LED;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;UFUSART2B.c,40 :: 		Delay_ms(500);
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;UFUSART2B.c,42 :: 		if(USART2_SRbits.RXNE==1)
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main10
;UFUSART2B.c,44 :: 		dato=USART2_DR;
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
LDR	R0, [R0, #0]
STRB	R0, [SP, #0]
;UFUSART2B.c,45 :: 		USART2_DR=dato;
LDRB	R1, [SP, #0]
MOVW	R0, #lo_addr(USART2_DR+0)
MOVT	R0, #hi_addr(USART2_DR+0)
STR	R1, [R0, #0]
;UFUSART2B.c,46 :: 		while(USART2_SRBITS.TC==0);
L_main11:
MOVW	R1, #lo_addr(USART2_SRbits+0)
MOVT	R1, #hi_addr(USART2_SRbits+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main12
IT	AL
BAL	L_main11
L_main12:
;UFUSART2B.c,47 :: 		}
L_main10:
;UFUSART2B.c,49 :: 		}
IT	AL
BAL	L_main6
;UFUSART2B.c,51 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
