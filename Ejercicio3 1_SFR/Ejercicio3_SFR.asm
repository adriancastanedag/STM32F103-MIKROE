_main:
;Ejercicio3_SFR.c,20 :: 		void main() {
;Ejercicio3_SFR.c,22 :: 		config_maq();
BL	_config_maq+0
;Ejercicio3_SFR.c,24 :: 		ini_var();
BL	_ini_var+0
;Ejercicio3_SFR.c,26 :: 		while(1)
L_main0:
;Ejercicio3_SFR.c,29 :: 		proceso();
BL	_proceso+0
;Ejercicio3_SFR.c,30 :: 		}
IT	AL
BAL	L_main0
;Ejercicio3_SFR.c,31 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio3_SFR.c,32 :: 		void proceso()
;Ejercicio3_SFR.c,34 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio3_SFR.c,36 :: 		LED_USUARIO= !LED_USUARIO;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_SFR.c,37 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
;Ejercicio3_SFR.c,38 :: 		}
L_proceso2:
;Ejercicio3_SFR.c,39 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
_ini_var:
;Ejercicio3_SFR.c,40 :: 		void ini_var()
;Ejercicio3_SFR.c,42 :: 		LED_USUARIO=PRENDER;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_SFR.c,43 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ini_var5:
SUBS	R7, R7, #1
BNE	L_ini_var5
NOP
NOP
;Ejercicio3_SFR.c,44 :: 		LED_USUARIO=APAGAR;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_SFR.c,45 :: 		}
L_end_ini_var:
BX	LR
; end of _ini_var
_config_maq:
;Ejercicio3_SFR.c,46 :: 		void config_maq()
;Ejercicio3_SFR.c,51 :: 		RCC_APB2ENR &=~(1UL<<4);                 //APAGAR BITS
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R1, [R0, #0]
MVN	R0, #16
ANDS	R1, R0
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,52 :: 		RCC_APB2ENR |= (1UL<<4);                 //PRENDE BITS ->PRENDEMOS GPIOC
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,54 :: 		GPIOC_CRH   &=~(15UL<<20);
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,55 :: 		GPIOC_CRH   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,57 :: 		RCC_APB2ENR &=~(1UL<<2);
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R1, [R0, #0]
MVN	R0, #4
ANDS	R1, R0
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,58 :: 		RCC_APB2ENR |= (1UL<<2);
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,60 :: 		GPIOA_CRL   &=~(15UL<<((5-0)*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,61 :: 		GPIOA_CRL   |= (GPOPP10MHZ<<((5-0)*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1048576
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Ejercicio3_SFR.c,64 :: 		}
L_end_config_maq:
BX	LR
; end of _config_maq
