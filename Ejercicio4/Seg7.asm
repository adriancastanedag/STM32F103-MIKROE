_main:
;Seg7.c,28 :: 		void main()
;Seg7.c,30 :: 		Conf_maq();
BL	_Conf_maq+0
;Seg7.c,31 :: 		Ini_var();
BL	_Ini_var+0
;Seg7.c,32 :: 		while(1)  // Bucle principal
L_main0:
;Seg7.c,34 :: 		Proceso();
BL	_Proceso+0
;Seg7.c,35 :: 		}
IT	AL
BAL	L_main0
;Seg7.c,36 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_maq:
;Seg7.c,38 :: 		void Conf_maq()
;Seg7.c,41 :: 		RCC_APB2ENR|=1<<IOPBEN; //hABILITA EL RELOJ DEL PUERTO B
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Seg7.c,44 :: 		(15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Seg7.c,47 :: 		(6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1717986918
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Seg7.c,52 :: 		RCC_APB2ENR|=1<<IOPCEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Seg7.c,54 :: 		GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4))|(15<<(3*4)) );
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, #0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Seg7.c,55 :: 		GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4))|(8<<(3*4)) );
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #34952
ORRS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Seg7.c,59 :: 		}
L_end_Conf_maq:
BX	LR
; end of _Conf_maq
_Ini_var:
;Seg7.c,60 :: 		void Ini_var()
;Seg7.c,62 :: 		contador = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
;Seg7.c,63 :: 		}
L_end_Ini_var:
BX	LR
; end of _Ini_var
_Proceso:
;Seg7.c,64 :: 		void Proceso()
;Seg7.c,66 :: 		DISPLAY=segmentos[contador]<<8;
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
;Seg7.c,67 :: 		if(++contador==16)
MOV	R0, R2
LDRB	R0, [R0, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R2, #0]
CMP	R0, #16
IT	NE
BNE	L_Proceso2
;Seg7.c,68 :: 		contador=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
L_Proceso2:
;Seg7.c,69 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Proceso3:
SUBS	R7, R7, #1
BNE	L_Proceso3
NOP
NOP
;Seg7.c,70 :: 		}
L_end_Proceso:
BX	LR
; end of _Proceso
