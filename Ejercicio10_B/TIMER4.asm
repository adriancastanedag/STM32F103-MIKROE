_main:
;TIMER4.c,8 :: 		void main() {
;TIMER4.c,10 :: 		Conf_maq();
BL	_Conf_maq+0
;TIMER4.c,11 :: 		RCC_APB2ENR|=1<<IOPAEN;
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;TIMER4.c,12 :: 		GPIOA_CRL &=  ~( (15<<(2*4))|(15<<(3*4))|(15<<(5*4)) );
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #255
MOVT	R0, #65295
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;TIMER4.c,13 :: 		GPIOA_CRL |=  ( (11<<(2*4))| (4<<(3*4))|(2<<(5*4)));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #19200
MOVT	R0, #32
ORRS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;TIMER4.c,14 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;TIMER4.c,15 :: 		Ini_var();
BL	_Ini_var+0
;TIMER4.c,16 :: 		while(1)  // Bucle principal
L_main0:
;TIMER4.c,19 :: 		}
IT	AL
BAL	L_main0
;TIMER4.c,21 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_maq:
;TIMER4.c,22 :: 		void Conf_maq()
;TIMER4.c,25 :: 		GPIOA_CRL &=~(15<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;TIMER4.c,26 :: 		GPIOA_CRL |= (2<<(5*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2097152
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;TIMER4.c,27 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;TIMER4.c,38 :: 		}
L_end_Conf_maq:
BX	LR
; end of _Conf_maq
_Ini_var:
;TIMER4.c,39 :: 		void Ini_var()
;TIMER4.c,41 :: 		LED = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;TIMER4.c,42 :: 		}
L_end_Ini_var:
BX	LR
; end of _Ini_var
_conmutar:
;TIMER4.c,43 :: 		void conmutar() iv IVT_INT_TIM4 ics ICS_AUTO {
;TIMER4.c,44 :: 		TIM4_SRbits.UIF=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SRbits+0)
MOVT	R0, #hi_addr(TIM4_SRbits+0)
STR	R1, [R0, #0]
;TIMER4.c,45 :: 		LED=~LED;
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
LDR	R0, [R1, #0]
EOR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;TIMER4.c,46 :: 		}
L_end_conmutar:
BX	LR
; end of _conmutar
