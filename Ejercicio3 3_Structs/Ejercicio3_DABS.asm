_main:
;Ejercicio3_DABS.c,25 :: 		void main() {
;Ejercicio3_DABS.c,27 :: 		config_maq();
BL	_config_maq+0
;Ejercicio3_DABS.c,29 :: 		ini_var();
BL	_ini_var+0
;Ejercicio3_DABS.c,31 :: 		while(1)
L_main0:
;Ejercicio3_DABS.c,34 :: 		proceso();
BL	_proceso+0
;Ejercicio3_DABS.c,36 :: 		}
IT	AL
BAL	L_main0
;Ejercicio3_DABS.c,37 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_proceso:
;Ejercicio3_DABS.c,38 :: 		void proceso()
;Ejercicio3_DABS.c,40 :: 		GPIOA_ODRX->ODR5=~GPIOA_ODRX->ODR5;
MOVW	R3, #lo_addr(_GPIOA_ODRX+0)
MOVT	R3, #hi_addr(_GPIOA_ODRX+0)
LDR	R0, [R3, #0]
LDRB	R1, [R0, #0]
UBFX	R0, R1, #5, #1
EOR	R0, R0, #1
UXTB	R2, R0
MOV	R0, R3
LDR	R1, [R0, #0]
LDRB	R0, [R1, #0]
BFI	R0, R2, #5, #1
STRB	R0, [R1, #0]
;Ejercicio3_DABS.c,41 :: 		Delay_ms(500);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_proceso2:
SUBS	R7, R7, #1
BNE	L_proceso2
NOP
NOP
NOP
NOP
;Ejercicio3_DABS.c,42 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
_ini_var:
;Ejercicio3_DABS.c,43 :: 		void ini_var()
;Ejercicio3_DABS.c,45 :: 		LED_USUARIO=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio3_DABS.c,46 :: 		}
L_end_ini_var:
BX	LR
; end of _ini_var
_config_maq:
;Ejercicio3_DABS.c,47 :: 		void config_maq()
;Ejercicio3_DABS.c,49 :: 		volatile GPIOX_REGISTERS_t *puertoa = GPIOA_REGISTERS;
; puertoa start address is: 12 (R3)
MOVW	R3, #2048
MOVT	R3, #16385
;Ejercicio3_DABS.c,50 :: 		volatile GPIOX_REGISTERS_t *puertoc = ((GPIOX_REGISTERS_t *)GPIOC_BASE_ADR);
;Ejercicio3_DABS.c,51 :: 		volatile RCC_APB2_ENR_BITS_t *RCC_APB2_ENR_BITS = (RCC_APB2_ENR_BITS_t*)RCC_APB2_ENR_ADR;
; RCC_APB2_ENR_BITS start address is: 8 (R2)
MOVW	R2, #4120
MOVT	R2, #16386
;Ejercicio3_DABS.c,58 :: 		RCC_APB2_ENR_BITS->IOPAEN=1;
MOVS	R1, #1
LDRB	R0, [R2, #0]
BFI	R0, R1, #2, #1
STRB	R0, [R2, #0]
; RCC_APB2_ENR_BITS end address is: 8 (R2)
;Ejercicio3_DABS.c,62 :: 		puertoa->CRL  &=~(15UL<<((5-0)*4));
LDR	R1, [R3, #0]
MVN	R0, #15728640
AND	R0, R1, R0, LSL #0
STR	R0, [R3, #0]
;Ejercicio3_DABS.c,63 :: 		puertoa->CRL  |= (1UL<<((5-0)*4));
LDR	R0, [R3, #0]
ORR	R0, R0, #1048576
STR	R0, [R3, #0]
;Ejercicio3_DABS.c,65 :: 		puertoa->ODR|=1<<5;
ADDW	R1, R3, #12
LDR	R0, [R1, #0]
ORR	R0, R0, #32
STR	R0, [R1, #0]
;Ejercicio3_DABS.c,66 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_config_maq4:
SUBS	R7, R7, #1
BNE	L_config_maq4
NOP
NOP
NOP
NOP
;Ejercicio3_DABS.c,67 :: 		puertoa->ODR&=~(1<<5);
ADDW	R2, R3, #12
; puertoa end address is: 12 (R3)
LDR	R1, [R2, #0]
MVN	R0, #32
AND	R0, R1, R0, LSL #0
STR	R0, [R2, #0]
;Ejercicio3_DABS.c,68 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_config_maq6:
SUBS	R7, R7, #1
BNE	L_config_maq6
NOP
NOP
NOP
NOP
;Ejercicio3_DABS.c,69 :: 		GPIOA_ODRX->ODR5=1;//~GPIOA_ODRX->ODR5;
MOVS	R2, #1
MOVW	R0, #lo_addr(_GPIOA_ODRX+0)
MOVT	R0, #hi_addr(_GPIOA_ODRX+0)
LDR	R1, [R0, #0]
LDRB	R0, [R1, #0]
BFI	R0, R2, #5, #1
STRB	R0, [R1, #0]
;Ejercicio3_DABS.c,70 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_config_maq8:
SUBS	R7, R7, #1
BNE	L_config_maq8
NOP
NOP
NOP
NOP
;Ejercicio3_DABS.c,71 :: 		GPIOA_ODRX->ODR5=0;//~GPIOA_ODRX->ODR5;
MOVS	R2, #0
MOVW	R0, #lo_addr(_GPIOA_ODRX+0)
MOVT	R0, #hi_addr(_GPIOA_ODRX+0)
LDR	R1, [R0, #0]
LDRB	R0, [R1, #0]
BFI	R0, R2, #5, #1
STRB	R0, [R1, #0]
;Ejercicio3_DABS.c,72 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_config_maq10:
SUBS	R7, R7, #1
BNE	L_config_maq10
NOP
NOP
NOP
NOP
;Ejercicio3_DABS.c,74 :: 		}
L_end_config_maq:
BX	LR
; end of _config_maq
