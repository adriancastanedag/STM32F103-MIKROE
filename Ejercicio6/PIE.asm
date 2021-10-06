_main:
;PIE.c,31 :: 		void main()
;PIE.c,33 :: 		Conf_maq();
BL	_Conf_maq+0
;PIE.c,34 :: 		Ini_var();
BL	_Ini_var+0
;PIE.c,35 :: 		while(1)  // Bucle principal
L_main0:
;PIE.c,37 :: 		Proceso();
BL	_Proceso+0
;PIE.c,38 :: 		}
IT	AL
BAL	L_main0
;PIE.c,39 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_maq:
;PIE.c,41 :: 		void Conf_maq()
;PIE.c,43 :: 		RCC_APB2ENR|=1<<IOPBEN; //hABILITA EL RELOJ DEL PUERTO B
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;PIE.c,46 :: 		(15<<(4*4))|(15<<(5*4))|(14<<(6*4))|(15<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #16777216
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;PIE.c,49 :: 		(6<<(4*4))|(6<<(5*4))|(6<<(6*4))|(6<<(7*4)));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1717986918
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;PIE.c,51 :: 		RCC_APB2ENR|=1<<IOPCEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;PIE.c,53 :: 		GPIOC_CRL&=~( (15<<(0*4))|(15<<(1*4))|(15<<(2*4)) );
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #61440
MOVT	R0, #65535
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;PIE.c,54 :: 		GPIOC_CRL|= ( (8<<(0*4))|(8<<(1*4))|(8<<(2*4)) );
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #2184
ORRS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;PIE.c,55 :: 		GPIOC_BSRR|= ( (1<<(0))|(1<<(1))|(1<<(2)) );
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #7
MOVW	R0, #lo_addr(GPIOC_BSRR+0)
MOVT	R0, #hi_addr(GPIOC_BSRR+0)
STR	R1, [R0, #0]
;PIE.c,57 :: 		RCC_APB2ENR|=1<<IOPAEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;PIE.c,59 :: 		GPIOC_CRH&=~( (15<<(0*4))|(15<<(1*4)) );
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;PIE.c,60 :: 		GPIOC_CRH|= ( (2<<(0*4))|(2<<(1*4)) );
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #34
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;PIE.c,62 :: 		}
L_end_Conf_maq:
BX	LR
; end of _Conf_maq
_Ini_var:
;PIE.c,63 :: 		void Ini_var()
;PIE.c,65 :: 		estado=SENSORES&0X07;
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #7
MOVW	R0, #lo_addr(_estado+0)
MOVT	R0, #hi_addr(_estado+0)
STRB	R1, [R0, #0]
;PIE.c,66 :: 		DISPLAY= indicadores[estado]<<8;
UXTB	R1, R1
MOVW	R0, #lo_addr(_indicadores+0)
MOVT	R0, #hi_addr(_indicadores+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;PIE.c,67 :: 		BOMBA1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;PIE.c,68 :: 		BOMBA2=0;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;PIE.c,69 :: 		}
L_end_Ini_var:
BX	LR
; end of _Ini_var
_Proceso:
;PIE.c,70 :: 		void Proceso()
;PIE.c,72 :: 		estado=SENSORES&0X07;
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R0, [R0, #0]
AND	R2, R0, #7
MOVW	R0, #lo_addr(_estado+0)
MOVT	R0, #hi_addr(_estado+0)
STRB	R2, [R0, #0]
;PIE.c,73 :: 		DISPLAY= indicadores[estado]<<8;
UXTB	R1, R2
MOVW	R0, #lo_addr(_indicadores+0)
MOVT	R0, #hi_addr(_indicadores+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;PIE.c,74 :: 		BOMBAS=activadores[estado]<<8;
UXTB	R1, R2
MOVW	R0, #lo_addr(_activadores+0)
MOVT	R0, #hi_addr(_activadores+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;PIE.c,75 :: 		}
L_end_Proceso:
BX	LR
; end of _Proceso
