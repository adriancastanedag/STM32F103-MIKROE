_main:
;Ejercicio0.c,17 :: 		void main() {
;Ejercicio0.c,19 :: 		configurar_maquina();
BL	_configurar_maquina+0
;Ejercicio0.c,20 :: 		iniciar_variables();
BL	_iniciar_variables+0
;Ejercicio0.c,21 :: 		while(1)
L_main0:
;Ejercicio0.c,23 :: 		proceso();
BL	_proceso+0
;Ejercicio0.c,24 :: 		}
IT	AL
BAL	L_main0
;Ejercicio0.c,25 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_iniciar_variables:
;Ejercicio0.c,27 :: 		void iniciar_variables()
;Ejercicio0.c,29 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio0.c,30 :: 		}
L_end_iniciar_variables:
BX	LR
; end of _iniciar_variables
_configurar_maquina:
;Ejercicio0.c,31 :: 		void configurar_maquina()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio0.c,34 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Ejercicio0.c,35 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Ejercicio0.c,37 :: 		}
L_end_configurar_maquina:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _configurar_maquina
_proceso:
;Ejercicio0.c,38 :: 		void proceso()
;Ejercicio0.c,40 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio0.c,42 :: 		LED=!LED;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio0.c,43 :: 		Delay_ms(500);
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
;Ejercicio0.c,44 :: 		}
L_proceso2:
;Ejercicio0.c,45 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
