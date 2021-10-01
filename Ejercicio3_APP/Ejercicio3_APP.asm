_main:
;Ejercicio3_APP.c,37 :: 		void main() {
SUB	SP, SP, #4
;Ejercicio3_APP.c,39 :: 		config_maq();
BL	_config_maq+0
;Ejercicio3_APP.c,41 :: 		ini_var();
BL	_ini_var+0
;Ejercicio3_APP.c,43 :: 		while(1)
L_main0:
;Ejercicio3_APP.c,46 :: 		proceso();
BL	_proceso+0
;Ejercicio3_APP.c,47 :: 		}
IT	AL
BAL	L_main0
;Ejercicio3_APP.c,48 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio3_APP.c,49 :: 		void proceso()
SUB	SP, SP, #4
;Ejercicio3_APP.c,51 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio3_APP.c,53 :: 		LED_USUARIO= !LED_USUARIO;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_APP.c,54 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
;Ejercicio3_APP.c,55 :: 		}
L_proceso2:
;Ejercicio3_APP.c,56 :: 		}
L_end_proceso:
ADD	SP, SP, #4
BX	LR
; end of _proceso
_ini_var:
;Ejercicio3_APP.c,57 :: 		void ini_var()
SUB	SP, SP, #4
;Ejercicio3_APP.c,59 :: 		LED_USUARIO=PRENDER;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_APP.c,60 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ini_var5:
SUBS	R7, R7, #1
BNE	L_ini_var5
NOP
NOP
;Ejercicio3_APP.c,61 :: 		LED_USUARIO=APAGAR;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_APP.c,62 :: 		}
L_end_ini_var:
ADD	SP, SP, #4
BX	LR
; end of _ini_var
_config_maq:
;Ejercicio3_APP.c,63 :: 		void config_maq()
SUB	SP, SP, #4
;Ejercicio3_APP.c,71 :: 		apuntador = RCC_APB2ENR_DIR;               //ESTOY APUNTANDO A LA DIRECCIÓN DE MEMORIA 0X40021018
; apuntador start address is: 8 (R2)
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_APP.c,72 :: 		*apuntador &=~(1UL<<IOPCENx);                    //apaga el bit 4
LDR	R1, [R2, #0]
MVN	R0, #16
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_APP.c,73 :: 		*apuntador |= (1UL<<IOPCENx);              //prende el bit 4 del rcc_apb2enr habilita puerto C
LDR	R0, [R2, #0]
ORR	R0, R0, #16
STR	R0, [R2, #0]
;Ejercicio3_APP.c,77 :: 		apuntador= GPIOC_CRH_DIR;
MOVW	R2, #4100
MOVT	R2, #16385
;Ejercicio3_APP.c,78 :: 		*apuntador &=~(15UL<<20);
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_APP.c,79 :: 		*apuntador |= (FINPUT<<((13-8)*4));
LDR	R0, [R2, #0]
ORR	R0, R0, #4194304
STR	R0, [R2, #0]
;Ejercicio3_APP.c,84 :: 		apuntador=RCC_APB2ENR_DIRx;
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_APP.c,85 :: 		*apuntador &=~ (1UL<<IOPAENx);           //hABILITA EL PUERTO A
LDR	R1, [R2, #0]
MVN	R0, #4
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_APP.c,86 :: 		*apuntador |=  (1UL<<IOPAENx);           //hABILITA EL PUERTO A
LDR	R0, [R2, #0]
ORR	R0, R0, #4
STR	R0, [R2, #0]
;Ejercicio3_APP.c,90 :: 		apuntador = GPIOA_CRL_DIR;
MOVW	R2, #2048
MOVT	R2, #16385
;Ejercicio3_APP.c,91 :: 		*apuntador &=~(15UL<<((5-0)*4));
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_APP.c,92 :: 		*apuntador |= (GPOPP10MHZ<<((5-0)*4));
LDR	R0, [R2, #0]
ORR	R0, R0, #1048576
STR	R0, [R2, #0]
; apuntador end address is: 8 (R2)
;Ejercicio3_APP.c,95 :: 		}
L_end_config_maq:
ADD	SP, SP, #4
BX	LR
; end of _config_maq
