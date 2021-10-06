_main:
;UFEXTI.c,28 :: 		void main()
;UFEXTI.c,30 :: 		Conf_maq();
BL	_Conf_maq+0
;UFEXTI.c,31 :: 		Ini_var();
BL	_Ini_var+0
;UFEXTI.c,32 :: 		while(1)  // Bucle principal
L_main0:
;UFEXTI.c,34 :: 		Proceso();
BL	_Proceso+0
;UFEXTI.c,35 :: 		}
IT	AL
BAL	L_main0
;UFEXTI.c,36 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_maq:
;UFEXTI.c,38 :: 		void Conf_maq()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;UFEXTI.c,40 :: 		RCC_APB2ENR|=1<<IOPBEN; //hABILITA EL RELOJ DEL PUERTO B
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFEXTI.c,43 :: 		(15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #240
MOVT	R0, #256
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;UFEXTI.c,46 :: 		(6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1717986918
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;UFEXTI.c,49 :: 		RCC_APB2ENR|=1<<IOPCEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFEXTI.c,50 :: 		GPIOC_CRH&=~(15uL<<(5*4));
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;UFEXTI.c,51 :: 		GPIOC_CRH|= 4ul<<(5*4);
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;UFEXTI.c,54 :: 		RCC_APB2ENR|=1<<IOPAEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFEXTI.c,55 :: 		GPIOA_CRL&=~(15ul<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFEXTI.c,56 :: 		GPIOA_CRL|= 6ul<<(5*4);
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #6291456
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;UFEXTI.c,59 :: 		RCC_APB2ENR|=1<<AFIOEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;UFEXTI.c,60 :: 		AFIO_EXTICR4&=~(15ul<<(1*4));  //ESCOGE LA FUENTE DE LA LINEA 13 AL PUERTO C
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
LDR	R1, [R0, #0]
MVN	R0, #240
ANDS	R1, R0
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;UFEXTI.c,61 :: 		AFIO_EXTICR4|=(2ul<<(1*4));   //PUERTO C13 COMO FUENTE DE INTERRUPCION EXTERNA
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;UFEXTI.c,62 :: 		EXTI_FTSRbits.TR13=1;       //ACTIVACIÓN POR FLANCO DE BAJADA LINEA 13
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
_SX	[R0, ByteOffset(EXTI_FTSRbits+0)]
;UFEXTI.c,63 :: 		EXTI_IMRbits.MR13=1;        //PETICION DE LA LINEA 13 PARA INTERRUPCION
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
_SX	[R0, ByteOffset(EXTI_IMRbits+0)]
;UFEXTI.c,64 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10); //INDICA AL NVIC ATENCIÓN A LA LINEA 13
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;UFEXTI.c,65 :: 		EnableInterrupts();                //HABILITA INERRUPCIONES
BL	_EnableInterrupts+0
;UFEXTI.c,67 :: 		}
L_end_Conf_maq:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_maq
_Ini_var:
;UFEXTI.c,68 :: 		void Ini_var()
;UFEXTI.c,70 :: 		contador = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
;UFEXTI.c,71 :: 		DISPLAY=segmentos[contador]<<8;
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_segmentos+0)
MOVT	R0, #hi_addr(_segmentos+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;UFEXTI.c,72 :: 		play=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
STRB	R1, [R0, #0]
;UFEXTI.c,73 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;UFEXTI.c,74 :: 		}
L_end_Ini_var:
BX	LR
; end of _Ini_var
_Proceso:
;UFEXTI.c,75 :: 		void Proceso()
;UFEXTI.c,77 :: 		if(play)
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Proceso2
;UFEXTI.c,79 :: 		DISPLAY=segmentos[contador]<<8;
MOVW	R2, #lo_addr(_contador+0)
MOVT	R2, #hi_addr(_contador+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_segmentos+0)
MOVT	R0, #hi_addr(_segmentos+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;UFEXTI.c,80 :: 		if(++contador==16)
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R2, #0]
CMP	R0, #16
IT	NE
BNE	L_Proceso3
;UFEXTI.c,81 :: 		contador=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
L_Proceso3:
;UFEXTI.c,82 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Proceso4:
SUBS	R7, R7, #1
BNE	L_Proceso4
NOP
NOP
;UFEXTI.c,83 :: 		}
L_Proceso2:
;UFEXTI.c,84 :: 		}
L_end_Proceso:
BX	LR
; end of _Proceso
_playpause:
;UFEXTI.c,85 :: 		void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO {
;UFEXTI.c,86 :: 		EXTI_PRbits.PR13=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PRbits+0)
MOVT	R0, #hi_addr(EXTI_PRbits+0)
_SX	[R0, ByteOffset(EXTI_PRbits+0)]
;UFEXTI.c,87 :: 		play=~play;
MOVW	R1, #lo_addr(_play+0)
MOVT	R1, #hi_addr(_play+0)
LDRB	R0, [R1, #0]
MVN	R0, R0
STRB	R0, [R1, #0]
;UFEXTI.c,88 :: 		LED=~LED;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;UFEXTI.c,89 :: 		}
L_end_playpause:
BX	LR
; end of _playpause
