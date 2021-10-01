_main:
;Ejercicio1_AA2.c,30 :: 		void main() {
;Ejercicio1_AA2.c,32 :: 		configurar_maquina();
BL	_configurar_maquina+0
;Ejercicio1_AA2.c,33 :: 		iniciar_variables();
BL	_iniciar_variables+0
;Ejercicio1_AA2.c,34 :: 		while(1)
L_main0:
;Ejercicio1_AA2.c,36 :: 		proceso();
BL	_proceso+0
;Ejercicio1_AA2.c,37 :: 		}
IT	AL
BAL	L_main0
;Ejercicio1_AA2.c,38 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_iniciar_variables:
;Ejercicio1_AA2.c,40 :: 		void iniciar_variables()
;Ejercicio1_AA2.c,42 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio1_AA2.c,43 :: 		}
L_end_iniciar_variables:
BX	LR
; end of _iniciar_variables
_configurar_maquina:
;Ejercicio1_AA2.c,44 :: 		void configurar_maquina()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio1_AA2.c,47 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Ejercicio1_AA2.c,48 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Ejercicio1_AA2.c,50 :: 		}
L_end_configurar_maquina:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _configurar_maquina
_proceso:
;Ejercicio1_AA2.c,63 :: 		void proceso()
;Ejercicio1_AA2.c,65 :: 		if(BOTON==NOPRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	EQ
BEQ	L_proceso2
;Ejercicio1_AA2.c,67 :: 		LED=!LED;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio1_AA2.c,68 :: 		Delay_ms(RETARDO);
MOVW	R7, #22611
MOVT	R7, #20
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
NOP
NOP
;Ejercicio1_AA2.c,69 :: 		}
L_proceso2:
;Ejercicio1_AA2.c,70 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
