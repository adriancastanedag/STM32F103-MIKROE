_main:
;Timer.c,8 :: 		void main() {
;Timer.c,9 :: 		Conf_maq();
BL	_Conf_maq+0
;Timer.c,10 :: 		Ini_var();
BL	_Ini_var+0
;Timer.c,11 :: 		while(1)  // Bucle principal
L_main0:
;Timer.c,14 :: 		}
IT	AL
BAL	L_main0
;Timer.c,16 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_maq:
;Timer.c,17 :: 		void Conf_maq()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Timer.c,20 :: 		RCC_APB2ENRbits.IOPAEN=1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R2, [R0, #0]
;Timer.c,21 :: 		GPIOA_CRL &=~(15<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Timer.c,22 :: 		GPIOA_CRL |= (2<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Timer.c,23 :: 		LED=1;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R2, [R0, #0]
;Timer.c,26 :: 		RCC_APB1ENRbits.TIM4EN=1;
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R2, [R0, #0]
;Timer.c,27 :: 		TIM4_CR1.CEN=0;//DETIENE EL CONTADOR
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;Timer.c,28 :: 		TIM4_PSC=7999; //prescalador FrecContador= Frec APB1/(prescalador+1)
MOVW	R1, #7999
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;Timer.c,29 :: 		TIM4_ARR=500; //ARR=tiempo deseado* FrecContador (500 ms de retardo)
MOVW	R1, #500
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;Timer.c,30 :: 		TIM4_DIER.UIF=1; //pedir atención por interrupción la bandera de interrupción
MOVW	R0, #lo_addr(TIM4_DIER+0)
MOVT	R0, #hi_addr(TIM4_DIER+0)
STR	R2, [R0, #0]
;Timer.c,31 :: 		NVIC_IntEnable(IVT_INT_TIM4);//Configura la interrupción en el NVIC
MOVW	R0, #46
BL	_NVIC_IntEnable+0
;Timer.c,32 :: 		TIM4_CR1.CEN=1;//Empieza a contar
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_CR1+0)
MOVT	R0, #hi_addr(TIM4_CR1+0)
STR	R1, [R0, #0]
;Timer.c,34 :: 		}
L_end_Conf_maq:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_maq
_Ini_var:
;Timer.c,35 :: 		void Ini_var()
;Timer.c,37 :: 		LED = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Timer.c,38 :: 		}
L_end_Ini_var:
BX	LR
; end of _Ini_var
_conmutar:
;Timer.c,39 :: 		void conmutar() iv IVT_INT_TIM4 ics ICS_AUTO {
;Timer.c,40 :: 		TIM4_SRbits.UIF=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SRbits+0)
MOVT	R0, #hi_addr(TIM4_SRbits+0)
STR	R1, [R0, #0]
;Timer.c,41 :: 		LED=~LED;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Timer.c,42 :: 		}
L_end_conmutar:
BX	LR
; end of _conmutar
