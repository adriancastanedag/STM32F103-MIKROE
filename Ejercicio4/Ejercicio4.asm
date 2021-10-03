_main:
;Ejercicio4.c,30 :: 		void main() {
;Ejercicio4.c,32 :: 		conf_maq();
BL	_conf_maq+0
;Ejercicio4.c,34 :: 		ini_var();
BL	_ini_var+0
;Ejercicio4.c,36 :: 		while(1)
L_main0:
;Ejercicio4.c,38 :: 		proceso();
BL	_proceso+0
;Ejercicio4.c,39 :: 		}
IT	AL
BAL	L_main0
;Ejercicio4.c,40 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio4.c,41 :: 		void proceso()
;Ejercicio4.c,43 :: 		if(play){
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_proceso2
;Ejercicio4.c,44 :: 		if(++contador==16) contador=0;
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRB	R0, [R0, #0]
CMP	R0, #16
IT	NE
BNE	L_proceso3
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
L_proceso3:
;Ejercicio4.c,45 :: 		Display=vector[contador]<<8;
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_vector+0)
MOVT	R0, #hi_addr(_vector+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ejercicio4.c,46 :: 		Delay_ms(250);
MOVW	R7, #11305
MOVT	R7, #10
NOP
NOP
L_proceso4:
SUBS	R7, R7, #1
BNE	L_proceso4
NOP
NOP
;Ejercicio4.c,47 :: 		}
L_proceso2:
;Ejercicio4.c,57 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
_ini_var:
;Ejercicio4.c,58 :: 		void ini_var()
;Ejercicio4.c,60 :: 		Display=vector[0]<<8;
MOVW	R1, #49152
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ejercicio4.c,61 :: 		play=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
STRB	R1, [R0, #0]
;Ejercicio4.c,62 :: 		}
L_end_ini_var:
BX	LR
; end of _ini_var
_conf_maq:
;Ejercicio4.c,63 :: 		void conf_maq()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio4.c,66 :: 		config_gpios();
BL	_config_gpios+0
;Ejercicio4.c,68 :: 		config_exti();
BL	_config_exti+0
;Ejercicio4.c,69 :: 		}
L_end_conf_maq:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _conf_maq
_config_gpios:
;Ejercicio4.c,70 :: 		void config_gpios()
;Ejercicio4.c,73 :: 		RCC_APB2ENRbits.IOPBEN=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,83 :: 		for(i=8;i<16;i++)
; i start address is: 8 (R2)
MOVS	R2, #8
; i end address is: 8 (R2)
L_config_gpios6:
; i start address is: 8 (R2)
CMP	R2, #16
IT	CS
BCS	L_config_gpios7
;Ejercicio4.c,84 :: 		GPIOB_CRH &=~ (15UL<<((i-8)*4));
SUBW	R0, R2, #8
SXTH	R0, R0
LSLS	R1, R0, #2
SXTH	R1, R1
MOV	R0, #15
LSLS	R0, R1
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
AND	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,83 :: 		for(i=8;i<16;i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ejercicio4.c,84 :: 		GPIOB_CRH &=~ (15UL<<((i-8)*4));
; i end address is: 8 (R2)
IT	AL
BAL	L_config_gpios6
L_config_gpios7:
;Ejercicio4.c,86 :: 		for(i=8;i<16;i++)
; i start address is: 8 (R2)
MOVS	R2, #8
; i end address is: 8 (R2)
L_config_gpios9:
; i start address is: 8 (R2)
CMP	R2, #16
IT	CS
BCS	L_config_gpios10
;Ejercicio4.c,87 :: 		GPIOB_CRH |= (6UL<<((i-8)*4)); // salida open drain 2 MHZ
SUBW	R0, R2, #8
SXTH	R0, R0
LSLS	R1, R0, #2
SXTH	R1, R1
MOV	R0, #6
LSL	R1, R0, R1
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,86 :: 		for(i=8;i<16;i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ejercicio4.c,87 :: 		GPIOB_CRH |= (6UL<<((i-8)*4)); // salida open drain 2 MHZ
; i end address is: 8 (R2)
IT	AL
BAL	L_config_gpios9
L_config_gpios10:
;Ejercicio4.c,94 :: 		RCC_APB2ENRbits.IOPCEN=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,95 :: 		for(i=0;i<4;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_config_gpios12:
; i start address is: 8 (R2)
CMP	R2, #4
IT	CS
BCS	L_config_gpios13
;Ejercicio4.c,96 :: 		GPIOC_CRL&=~(15UL<<(i*4));
LSLS	R1, R2, #2
SXTH	R1, R1
MOV	R0, #15
LSLS	R0, R1
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
AND	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Ejercicio4.c,95 :: 		for(i=0;i<4;i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ejercicio4.c,96 :: 		GPIOC_CRL&=~(15UL<<(i*4));
; i end address is: 8 (R2)
IT	AL
BAL	L_config_gpios12
L_config_gpios13:
;Ejercicio4.c,97 :: 		for(i=0;i<4;i++)
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_config_gpios15:
; i start address is: 8 (R2)
CMP	R2, #4
IT	CS
BCS	L_config_gpios16
;Ejercicio4.c,98 :: 		GPIOC_CRL |= (8UL<<(i*4));  //ENTRADA DIGITAL PULLUP O PULLDOWN
LSLS	R1, R2, #2
SXTH	R1, R1
MOV	R0, #8
LSL	R1, R0, R1
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Ejercicio4.c,97 :: 		for(i=0;i<4;i++)
ADDS	R2, R2, #1
UXTB	R2, R2
;Ejercicio4.c,98 :: 		GPIOC_CRL |= (8UL<<(i*4));  //ENTRADA DIGITAL PULLUP O PULLDOWN
; i end address is: 8 (R2)
IT	AL
BAL	L_config_gpios15
L_config_gpios16:
;Ejercicio4.c,99 :: 		GPIOC_ODR &=~15UL; //BO B1 B2 B3 COMO PULLDOWN
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ejercicio4.c,100 :: 		GPIOC_ODR |= 15UL; //B0 B1 B2 B3 COMO PULLUP
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #15
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Ejercicio4.c,101 :: 		}
L_end_config_gpios:
BX	LR
; end of _config_gpios
_config_exti:
;Ejercicio4.c,102 :: 		void config_exti()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio4.c,112 :: 		RCC_APB2ENRbits.IOPCEN=1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,113 :: 		GPIOC_CRH &=~( 15UL<<((13-8)*4));
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #15728640
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,114 :: 		GPIOC_CRH |= ( 4UL<<((13-8)*4) );     //EDF
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,116 :: 		RCC_APB2ENRbits.AFIOEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,117 :: 		AFIO_EXTICR4=2UL<<4;
MOV	R1, #32
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;Ejercicio4.c,119 :: 		EXTI_RTSRbits.TR13=1;
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
_SX	[R0, ByteOffset(EXTI_RTSRbits+0)]
;Ejercicio4.c,121 :: 		EXTI_IMRbits.MR13=1;
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
_SX	[R0, ByteOffset(EXTI_IMRbits+0)]
;Ejercicio4.c,124 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Ejercicio4.c,128 :: 		RCC_APB2ENRbits.IOPBEN=1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,129 :: 		GPIOB_CRH &=~( 15UL<<((10-8)*4));
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R1, [R0, #0]
MVN	R0, #3840
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,130 :: 		GPIOB_CRH |= ( 8UL<<((10-8)*4) );     //EDPD
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2048
MOVW	R0, #lo_addr(GPIOB_CRH+0)
MOVT	R0, #hi_addr(GPIOB_CRH+0)
STR	R1, [R0, #0]
;Ejercicio4.c,132 :: 		RCC_APB2ENRbits.AFIOEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,133 :: 		AFIO_EXTICR3=1UL<<8;     //pb10 COMO LINEA 10 de interrupción
MOV	R1, #256
MOVW	R0, #lo_addr(AFIO_EXTICR3+0)
MOVT	R0, #hi_addr(AFIO_EXTICR3+0)
STR	R1, [R0, #0]
;Ejercicio4.c,135 :: 		EXTI_FTSRbits.TR10=1;    //linea 10 por falnco de bajada
MOVW	R0, #lo_addr(EXTI_FTSRbits+0)
MOVT	R0, #hi_addr(EXTI_FTSRbits+0)
_SX	[R0, ByteOffset(EXTI_FTSRbits+0)]
;Ejercicio4.c,137 :: 		EXTI_IMRbits.MR10=1;
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
_SX	[R0, ByteOffset(EXTI_IMRbits+0)]
;Ejercicio4.c,139 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Ejercicio4.c,143 :: 		RCC_APB2ENRbits.IOPAEN=1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,144 :: 		GPIOA_CRL &=~( 15UL<<((4)*4));
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #983040
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Ejercicio4.c,145 :: 		GPIOA_CRL |= ( 8UL<<((4)*4) );     //EDPD
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #524288
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Ejercicio4.c,146 :: 		GPIOA_ODR.B4=0;   //ACTIVA RESISTENCIA DE PULLDOWN
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio4.c,148 :: 		RCC_APB2ENRbits.AFIOEN=1;
MOVW	R0, #lo_addr(RCC_APB2ENRbits+0)
MOVT	R0, #hi_addr(RCC_APB2ENRbits+0)
_SX	[R0, ByteOffset(RCC_APB2ENRbits+0)]
;Ejercicio4.c,149 :: 		AFIO_EXTICR2bits.EXTI4=0;     //PA4 COMO LINEA 4 de interrupción
MOVS	R2, #0
MOVW	R1, #lo_addr(AFIO_EXTICR2bits+0)
MOVT	R1, #hi_addr(AFIO_EXTICR2bits+0)
LDRB	R0, [R1, #0]
BFI	R0, R2, #0, #4
STRB	R0, [R1, #0]
;Ejercicio4.c,151 :: 		EXTI_RTSRbits.TR4=1;    //linea 4 por falnco de SUBIDA
MOVW	R0, #lo_addr(EXTI_RTSRbits+0)
MOVT	R0, #hi_addr(EXTI_RTSRbits+0)
_SX	[R0, ByteOffset(EXTI_RTSRbits+0)]
;Ejercicio4.c,153 :: 		EXTI_IMRbits.MR4=1;
MOVW	R0, #lo_addr(EXTI_IMRbits+0)
MOVT	R0, #hi_addr(EXTI_IMRbits+0)
_SX	[R0, ByteOffset(EXTI_IMRbits+0)]
;Ejercicio4.c,155 :: 		NVIC_IntEnable(IVT_INT_EXTI4);
MOVW	R0, #26
BL	_NVIC_IntEnable+0
;Ejercicio4.c,157 :: 		}
L_end_config_exti:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _config_exti
_leer_dipsw:
;Ejercicio4.c,158 :: 		void leer_dipsw() iv IVT_INT_EXTI4
;Ejercicio4.c,160 :: 		entrada=DipSW;   //leer puerto GPIOC_IDR&0X000F
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #15
MOVW	R0, #lo_addr(_entrada+0)
MOVT	R0, #hi_addr(_entrada+0)
STRB	R1, [R0, #0]
;Ejercicio4.c,161 :: 		contador=entrada;
MOVW	R0, #lo_addr(_entrada+0)
MOVT	R0, #hi_addr(_entrada+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
;Ejercicio4.c,162 :: 		Display=vector[contador]<<8;
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_vector+0)
MOVT	R0, #hi_addr(_vector+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;Ejercicio4.c,163 :: 		}
L_end_leer_dipsw:
BX	LR
; end of _leer_dipsw
_playpause:
;Ejercicio4.c,164 :: 		void playpause() iv IVT_INT_EXTI15_10 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio4.c,166 :: 		if(EXTI_PRbits.PR13)         //esta función inicia o detiene la exhibición
MOVW	R0, #lo_addr(EXTI_PRbits+0)
MOVT	R0, #hi_addr(EXTI_PRbits+0)
_LX	[R0, ByteOffset(EXTI_PRbits+0)]
CMP	R0, #0
IT	EQ
BEQ	L_playpause18
;Ejercicio4.c,168 :: 		EXTI_PRbits.PR13=1;       //LINEA ATENDIDA
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PRbits+0)
MOVT	R0, #hi_addr(EXTI_PRbits+0)
_SX	[R0, ByteOffset(EXTI_PRbits+0)]
;Ejercicio4.c,169 :: 		if(play)
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_playpause19
;Ejercicio4.c,170 :: 		play=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_playpause20
L_playpause19:
;Ejercicio4.c,172 :: 		play=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_play+0)
MOVT	R0, #hi_addr(_play+0)
STRB	R1, [R0, #0]
L_playpause20:
;Ejercicio4.c,173 :: 		}
L_playpause18:
;Ejercicio4.c,174 :: 		if(EXTI_PRbits.PR10)    //esta función establece el display al primer caracter
MOVW	R0, #lo_addr(EXTI_PRbits+0)
MOVT	R0, #hi_addr(EXTI_PRbits+0)
_LX	[R0, ByteOffset(EXTI_PRbits+0)]
CMP	R0, #0
IT	EQ
BEQ	L_playpause21
;Ejercicio4.c,176 :: 		EXTI_PRbits.PR10=1;   //LINEA ATENDIDAD
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PRbits+0)
MOVT	R0, #hi_addr(EXTI_PRbits+0)
_SX	[R0, ByteOffset(EXTI_PRbits+0)]
;Ejercicio4.c,178 :: 		establece();
BL	_establece+0
;Ejercicio4.c,179 :: 		}
L_playpause21:
;Ejercicio4.c,180 :: 		}
L_end_playpause:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _playpause
_establece:
;Ejercicio4.c,181 :: 		void establece()
;Ejercicio4.c,183 :: 		contador=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_contador+0)
MOVT	R0, #hi_addr(_contador+0)
STRB	R1, [R0, #0]
;Ejercicio4.c,184 :: 		}
L_end_establece:
BX	LR
; end of _establece
