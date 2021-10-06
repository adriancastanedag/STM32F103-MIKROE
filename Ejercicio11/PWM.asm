_main:
;PWM.c,1 :: 		void main() {
;PWM.c,4 :: 		RCC_APB2ENRbits.IOPBEN=1;
MOVS	R4, #1
SXTB	R4, R4
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
STR	R4, [R0, #0]
;PWM.c,5 :: 		GPIOB_CRH &=~( (15<<(0*4))|(15<<(1*4)) );
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, #0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;PWM.c,6 :: 		GPIOB_CRH |= ( (11<<(0*4))|(11<<(1*4)) );    //CANAL 3 Y CANAL 4 TIMER4
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #187
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;PWM.c,8 :: 		RCC_APB1ENRbits.TIM4EN=1;            //ACTIVA EL RELOJ PARA EL TIMER 2
MOVW	R0, #lo_addr(RCC_APB1ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB1ENRbits+0)
STR	R4, [R0, #0]
;PWM.c,9 :: 		TIM4_CR1bits.CEN=0;                  //CONTADOR DETENIDO
MOVS	R3, #0
SXTB	R3, R3
MOVW	R0, #lo_addr(TIM4_CR1bits+0)
MOVT	R0, #hi_addr(TIM4_CR1bits+0)
STR	R3, [R0, #0]
;PWM.c,10 :: 		TIM4_PSC=7;                         //FRECUENCIA DE CONTEO 8MHZ/(7+1)=1MHZ
MOVS	R1, #7
MOVW	R0, #lo_addr(TIM4_PSC+0)
MOVT	R0, #hi_addr(TIM4_PSC+0)
STR	R1, [R0, #0]
;PWM.c,11 :: 		TIM4_ARR=1000;                       //FRECUENCIA DEL PWM =1MHZ/(1000) =1KHZ
MOVW	R1, #1000
MOVW	R0, #lo_addr(TIM4_ARR+0)
MOVT	R0, #hi_addr(TIM4_ARR+0)
STR	R1, [R0, #0]
;PWM.c,12 :: 		TIM4_CR1bits.CMS=0;                  //ALINEADO A LA IZQUIERDA
MOVS	R2, #0
MOVW	R1, #lo_addr(TIM4_CR1bits+0)
MOVT	R1, #hi_addr(TIM4_CR1bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #5, #2
STRB	R0, [R1, #0]
;PWM.c,13 :: 		TIM4_CR1bits.DIR_=0;                 //CONTEO ASCENDENTE
MOVW	R0, #lo_addr(TIM4_CR1bits+0)
MOVT	R0, #hi_addr(TIM4_CR1bits+0)
STR	R3, [R0, #0]
;PWM.c,16 :: 		TIM4_CCMR2_Outputbits.OC3M=6;        //PWM1
MOVS	R2, #6
MOVW	R1, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R1, #hi_addr(TIM4_CCMR2_Outputbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #4, #3
STRB	R0, [R1, #0]
;PWM.c,17 :: 		TIM4_CCMR2_Outputbits.OC3PE=1;       //PRECARGA ACTIVADA
MOVW	R0, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R0, #hi_addr(TIM4_CCMR2_Outputbits+0)
STR	R4, [R0, #0]
;PWM.c,18 :: 		TIM4_CCMR2_Outputbits.CC3S=0;        //PIN MODO SALIDA
MOVS	R2, #0
MOVW	R1, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R1, #hi_addr(TIM4_CCMR2_Outputbits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #2
STRB	R0, [R1, #0]
;PWM.c,19 :: 		TIM4_CCERbits.CC3P=0;                //ACTIVO EN ALTO 0, ACTIVO EN BAJO 1
MOVW	R0, #lo_addr(TIM4_CCERbits+0)
MOVT	R0, #hi_addr(TIM4_CCERbits+0)
STR	R3, [R0, #0]
;PWM.c,20 :: 		TIM4_CCERbits.CC3E=1;                //SALIDA HABILITADA
MOVW	R0, #lo_addr(TIM4_CCERbits+0)
MOVT	R0, #hi_addr(TIM4_CCERbits+0)
STR	R4, [R0, #0]
;PWM.c,21 :: 		TIM4_CCR3=100;                       //DUTY 10%   1000/100;
MOVS	R1, #100
MOVW	R0, #lo_addr(TIM4_CCR3+0)
MOVT	R0, #hi_addr(TIM4_CCR3+0)
STR	R1, [R0, #0]
;PWM.c,23 :: 		TIM4_CCMR2_Outputbits.OC4M=6;        //PWM1
MOVS	R2, #6
MOVW	R1, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R1, #hi_addr(TIM4_CCMR2_Outputbits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #12, #3
STRH	R0, [R1, #0]
;PWM.c,24 :: 		TIM4_CCMR2_Outputbits.OC4PE=1;       //PRECARGA ACTIVADA
MOVW	R0, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R0, #hi_addr(TIM4_CCMR2_Outputbits+0)
STR	R4, [R0, #0]
;PWM.c,25 :: 		TIM4_CCMR2_Outputbits.CC4S=0;        //PIN MODO SALIDA
MOVS	R2, #0
MOVW	R1, #lo_addr(TIM4_CCMR2_Outputbits+0)
MOVT	R1, #hi_addr(TIM4_CCMR2_Outputbits+0)
LDRH	R0, [R1, #0]
BFI	R0, R2, #8, #2
STRH	R0, [R1, #0]
;PWM.c,26 :: 		TIM4_CCERbits.CC4P=1;                //ACTIVO EN ALTO 0, ACTIVO EN BAJO 1
MOVW	R0, #lo_addr(TIM4_CCERbits+0)
MOVT	R0, #hi_addr(TIM4_CCERbits+0)
STR	R4, [R0, #0]
;PWM.c,27 :: 		TIM4_CCERbits.CC4E=1;                //SALIDA HABILITADA
MOVW	R0, #lo_addr(TIM4_CCERbits+0)
MOVT	R0, #hi_addr(TIM4_CCERbits+0)
STR	R4, [R0, #0]
;PWM.c,28 :: 		TIM4_CCR4=100;                       //DUTY 10%   1000/100;
MOVS	R1, #100
MOVW	R0, #lo_addr(TIM4_CCR4+0)
MOVT	R0, #hi_addr(TIM4_CCR4+0)
STR	R1, [R0, #0]
;PWM.c,30 :: 		TIM4_EGRbits.UG=1;                   //INICIALIZA TODOS LOS REGISTROS
MOVW	R0, #lo_addr(TIM4_EGRbits+0)
MOVT	R0, #hi_addr(TIM4_EGRbits+0)
STR	R4, [R0, #0]
;PWM.c,31 :: 		TIM4_EGRbits.UG=0;
MOVW	R0, #lo_addr(TIM4_EGRbits+0)
MOVT	R0, #hi_addr(TIM4_EGRbits+0)
STR	R3, [R0, #0]
;PWM.c,32 :: 		TIM4_CR1bits.CEN=1;                  //arranca el contador
MOVW	R0, #lo_addr(TIM4_CR1bits+0)
MOVT	R0, #hi_addr(TIM4_CR1bits+0)
STR	R4, [R0, #0]
;PWM.c,33 :: 		duty=100;
; duty start address is: 4 (R1)
MOVS	R1, #100
; duty end address is: 4 (R1)
;PWM.c,34 :: 		while(1){
L_main0:
;PWM.c,35 :: 		delay_ms(100);
; duty start address is: 4 (R1)
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;PWM.c,36 :: 		duty+=50;                      //COMENTAR PARA DEJAR CICLO FIJO
ADDW	R0, R1, #50
UXTH	R0, R0
UXTH	R1, R0
;PWM.c,37 :: 		if(duty==1000)
CMP	R0, #1000
IT	NE
BNE	L__main5
;PWM.c,38 :: 		duty=0;
MOVS	R1, #0
; duty end address is: 4 (R1)
IT	AL
BAL	L_main4
L__main5:
;PWM.c,37 :: 		if(duty==1000)
;PWM.c,38 :: 		duty=0;
L_main4:
;PWM.c,39 :: 		TIM4_CCR3=duty;               //INCREMENTOS DEL 10%
; duty start address is: 4 (R1)
MOVW	R0, #lo_addr(TIM4_CCR3+0)
MOVT	R0, #hi_addr(TIM4_CCR3+0)
STR	R1, [R0, #0]
;PWM.c,40 :: 		TIM4_CCR4=duty;               //INCREMENTOS DEL 10%
MOVW	R0, #lo_addr(TIM4_CCR4+0)
MOVT	R0, #hi_addr(TIM4_CCR4+0)
STR	R1, [R0, #0]
;PWM.c,41 :: 		}
; duty end address is: 4 (R1)
IT	AL
BAL	L_main0
;PWM.c,44 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
