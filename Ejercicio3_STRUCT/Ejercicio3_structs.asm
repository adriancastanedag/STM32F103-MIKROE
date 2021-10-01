_main:
;Ejercicio3_structs.c,22 :: 		void main() {
SUB	SP, SP, #4
;Ejercicio3_structs.c,24 :: 		config_maq();
BL	_config_maq+0
;Ejercicio3_structs.c,26 :: 		ini_var();
BL	_ini_var+0
;Ejercicio3_structs.c,28 :: 		while(1)
L_main0:
;Ejercicio3_structs.c,31 :: 		proceso();
BL	_proceso+0
;Ejercicio3_structs.c,32 :: 		}
IT	AL
BAL	L_main0
;Ejercicio3_structs.c,33 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio3_structs.c,34 :: 		void proceso()
SUB	SP, SP, #4
;Ejercicio3_structs.c,36 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio3_structs.c,38 :: 		LED_USUARIO= !LED_USUARIO;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_structs.c,39 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
;Ejercicio3_structs.c,40 :: 		}
L_proceso2:
;Ejercicio3_structs.c,41 :: 		}
L_end_proceso:
ADD	SP, SP, #4
BX	LR
; end of _proceso
_ini_var:
;Ejercicio3_structs.c,42 :: 		void ini_var()
SUB	SP, SP, #4
;Ejercicio3_structs.c,44 :: 		LED_USUARIO=PRENDER;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_structs.c,45 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_ini_var5:
SUBS	R7, R7, #1
BNE	L_ini_var5
NOP
NOP
;Ejercicio3_structs.c,46 :: 		LED_USUARIO=APAGAR;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_structs.c,47 :: 		}
L_end_ini_var:
ADD	SP, SP, #4
BX	LR
; end of _ini_var
_config_maq:
;Ejercicio3_structs.c,48 :: 		void config_maq()
SUB	SP, SP, #4
;Ejercicio3_structs.c,68 :: 		pointer=RCC_DIR;
; pointer start address is: 12 (R3)
MOVW	R3, #4096
MOVT	R3, #16386
;Ejercicio3_structs.c,69 :: 		pointer->APB2ENR &=~(1UL<<IOPCENx);
MOVW	R0, #4096
MOVT	R0, #16386
ADDW	R2, R0, #24
LDR	R1, [R2, #0]
MVN	R0, #16
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,70 :: 		pointer->APB2ENR |= (1UL<<IOPCENx);
ADDW	R1, R3, #24
LDR	R0, [R1, #0]
ORR	R0, R0, #16
STR	R0, [R1, #0]
;Ejercicio3_structs.c,71 :: 		apuntador = RCC_APB2ENR_DIR;               //ESTOY APUNTANDO A LA DIRECCIÓN DE MEMORIA 0X40021018
; apuntador start address is: 8 (R2)
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_structs.c,72 :: 		*apuntador &=~(1UL<<IOPCENx);                    //apaga el bit 4
LDR	R1, [R2, #0]
MVN	R0, #16
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,73 :: 		*apuntador |= (1UL<<IOPCENx);              //prende el bit 4 del rcc_apb2enr habilita puerto C
LDR	R0, [R2, #0]
ORR	R0, R0, #16
STR	R0, [R2, #0]
; apuntador end address is: 8 (R2)
;Ejercicio3_structs.c,77 :: 		GPIOX=GPIOC_DIR ;
; GPIOX start address is: 16 (R4)
MOVW	R4, #4096
MOVT	R4, #16385
;Ejercicio3_structs.c,78 :: 		GPIOX->CRH &=~(15UL<<20);
MOVW	R0, #4096
MOVT	R0, #16385
ADDS	R2, R0, #4
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,79 :: 		GPIOX->CRH |= (FINPUT<<((13-8)*4));
ADDS	R1, R4, #4
; GPIOX end address is: 16 (R4)
LDR	R0, [R1, #0]
ORR	R0, R0, #4194304
STR	R0, [R1, #0]
;Ejercicio3_structs.c,80 :: 		apuntador= GPIOC_CRH_DIR;
; apuntador start address is: 8 (R2)
MOVW	R2, #4100
MOVT	R2, #16385
;Ejercicio3_structs.c,81 :: 		*apuntador &=~(15UL<<20);
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,82 :: 		*apuntador |= (FINPUT<<((13-8)*4));
LDR	R0, [R2, #0]
ORR	R0, R0, #4194304
STR	R0, [R2, #0]
; apuntador end address is: 8 (R2)
;Ejercicio3_structs.c,87 :: 		pointer->APB2ENR &=~ (1UL<<IOPAENx);
ADDW	R2, R3, #24
LDR	R1, [R2, #0]
MVN	R0, #4
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,88 :: 		pointer->APB2ENR |=  (1UL<<IOPAENx);
ADDW	R1, R3, #24
; pointer end address is: 12 (R3)
LDR	R0, [R1, #0]
ORR	R0, R0, #4
STR	R0, [R1, #0]
;Ejercicio3_structs.c,89 :: 		apuntador=RCC_APB2ENR_DIRx;
; apuntador start address is: 8 (R2)
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_structs.c,90 :: 		*apuntador &=~ (1UL<<IOPAENx);           //hABILITA EL PUERTO A
LDR	R1, [R2, #0]
MVN	R0, #4
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,91 :: 		*apuntador |=  (1UL<<IOPAENx);           //hABILITA EL PUERTO A
LDR	R0, [R2, #0]
ORR	R0, R0, #4
STR	R0, [R2, #0]
; apuntador end address is: 8 (R2)
;Ejercicio3_structs.c,95 :: 		GPIOX=(GPIOX_DEFS_t *)GPIOA_DIR;
; GPIOX start address is: 8 (R2)
MOVW	R2, #2048
MOVT	R2, #16385
;Ejercicio3_structs.c,96 :: 		GPIOX->CRL &=~(15UL<<((5-0)*4));
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,97 :: 		GPIOX->CRL |= (GPOPP10MHZ<<((5-0)*4));
LDR	R0, [R2, #0]
ORR	R0, R0, #1048576
STR	R0, [R2, #0]
; GPIOX end address is: 8 (R2)
;Ejercicio3_structs.c,98 :: 		apuntador = GPIOA_CRL_DIR;
; apuntador start address is: 8 (R2)
MOVW	R2, #2048
MOVT	R2, #16385
;Ejercicio3_structs.c,99 :: 		*apuntador &=~(15UL<<((5-0)*4));
LDR	R1, [R2, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_structs.c,100 :: 		*apuntador |= (GPOPP10MHZ<<((5-0)*4));
LDR	R0, [R2, #0]
ORR	R0, R0, #1048576
STR	R0, [R2, #0]
; apuntador end address is: 8 (R2)
;Ejercicio3_structs.c,103 :: 		GPIOX_ODR=(GPIOX_ODR_t*)GPIOA_ODR_DIRx;
; GPIOX_ODR start address is: 8 (R2)
MOVW	R2, #12
MOVT	R2, #264
;Ejercicio3_structs.c,104 :: 		GPIOX_ODR->ODR5=PRENDER;
MOVS	R1, #1
LDRB	R0, [R2, #0]
BFI	R0, R1, #5, #1
STRB	R0, [R2, #0]
;Ejercicio3_structs.c,105 :: 		GPIOX_ODR->ODR5=APAGAR;
MOVS	R1, #0
LDRB	R0, [R2, #0]
BFI	R0, R1, #5, #1
STRB	R0, [R2, #0]
; GPIOX_ODR end address is: 8 (R2)
;Ejercicio3_structs.c,107 :: 		}
L_end_config_maq:
ADD	SP, SP, #4
BX	LR
; end of _config_maq
