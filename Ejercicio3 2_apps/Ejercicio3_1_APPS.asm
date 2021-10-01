_main:
;Ejercicio3_1_APPS.c,35 :: 		void main() {
;Ejercicio3_1_APPS.c,37 :: 		config_maq();
BL	_config_maq+0
;Ejercicio3_1_APPS.c,39 :: 		ini_var();
BL	_ini_var+0
;Ejercicio3_1_APPS.c,41 :: 		while(1)
L_main0:
;Ejercicio3_1_APPS.c,44 :: 		proceso();
BL	_proceso+0
;Ejercicio3_1_APPS.c,45 :: 		}
IT	AL
BAL	L_main0
;Ejercicio3_1_APPS.c,46 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio3_1_APPS.c,47 :: 		void proceso()
;Ejercicio3_1_APPS.c,49 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio3_1_APPS.c,51 :: 		LED_USUARIO= !LED_USUARIO;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_1_APPS.c,52 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
;Ejercicio3_1_APPS.c,53 :: 		}
L_proceso2:
;Ejercicio3_1_APPS.c,54 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
_ini_var:
;Ejercicio3_1_APPS.c,55 :: 		void ini_var()
;Ejercicio3_1_APPS.c,57 :: 		LED_USUARIO=PRENDER;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_1_APPS.c,58 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ini_var5:
SUBS	R7, R7, #1
BNE	L_ini_var5
NOP
NOP
;Ejercicio3_1_APPS.c,59 :: 		LED_USUARIO=APAGAR;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_1_APPS.c,60 :: 		}
L_end_ini_var:
BX	LR
; end of _ini_var
_config_maq:
;Ejercicio3_1_APPS.c,61 :: 		void config_maq()
;Ejercicio3_1_APPS.c,68 :: 		app=RCC_APB2ENR_DIR;                       //PRIMERAMENTE APUNTAS
; app start address is: 8 (R2)
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_1_APPS.c,69 :: 		*app &=~(1UL<<4);
LDR	R1, [R2, #0]
MVN	R0, #16
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,70 :: 		*app |= (1UL<<4);
LDR	R0, [R2, #0]
ORR	R0, R0, #16
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,74 :: 		app=GPIOC_CRH_DIR;
MOVW	R2, #4100
MOVT	R2, #16385
;Ejercicio3_1_APPS.c,75 :: 		*app   &=~(15UL<<20);
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,76 :: 		*app   |= (FINPUT<<((13-8)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
LDR	R0, [R2, #0]
ORR	R0, R0, #4194304
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,81 :: 		app=(unsigned long int*)RCC_APB2ENR_DIR;                       //PRIMERAMENTE APUNTAS
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_1_APPS.c,82 :: 		*app &=~(1UL<<2);
LDR	R1, [R2, #0]
MVN	R0, #4
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,83 :: 		*app |= (1UL<<2);
LDR	R0, [R2, #0]
ORR	R0, R0, #4
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,87 :: 		app=GPIOA_CRL_DIR;
MOVW	R2, #2048
MOVT	R2, #16385
;Ejercicio3_1_APPS.c,88 :: 		*app   &=~(15UL<<20);
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_1_APPS.c,89 :: 		*app   |= (GPOPP10MHZ<<((5-0)*4));   //(FINPUT<<20);             //(GPIOC_CRH |= (FINPUT<<((13-8)*4))
LDR	R0, [R2, #0]
ORR	R0, R0, #1048576
STR	R0, [R2, #0]
; app end address is: 8 (R2)
;Ejercicio3_1_APPS.c,90 :: 		}
L_end_config_maq:
BX	LR
; end of _config_maq
