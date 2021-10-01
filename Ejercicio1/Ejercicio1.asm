_main:
;Ejercicio1.c,22 :: 		void main() {
;Ejercicio1.c,24 :: 		configurar_maquina();
BL	_configurar_maquina+0
;Ejercicio1.c,25 :: 		iniciar_variables();
BL	_iniciar_variables+0
;Ejercicio1.c,26 :: 		while(1)
L_main0:
;Ejercicio1.c,28 :: 		proceso();
BL	_proceso+0
;Ejercicio1.c,29 :: 		}
IT	AL
BAL	L_main0
;Ejercicio1.c,30 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_iniciar_variables:
;Ejercicio1.c,32 :: 		void iniciar_variables()
;Ejercicio1.c,34 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio1.c,35 :: 		}
L_end_iniciar_variables:
BX	LR
; end of _iniciar_variables
_configurar_maquina:
;Ejercicio1.c,36 :: 		void configurar_maquina()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Ejercicio1.c,39 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Ejercicio1.c,40 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Ejercicio1.c,42 :: 		}
L_end_configurar_maquina:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _configurar_maquina
_proceso:
;Ejercicio1.c,43 :: 		void proceso()
;Ejercicio1.c,45 :: 		if(BOTON==PRESIONADO)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_proceso2
;Ejercicio1.c,47 :: 		LED=!LED;
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_LX	[R0, ByteOffset(GPIOA_ODR+0)]
EOR	R1, R0, #1
UXTB	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
_SX	[R0, ByteOffset(GPIOA_ODR+0)]
;Ejercicio1.c,48 :: 		Delay_ms(1000);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_proceso3:
SUBS	R7, R7, #1
BNE	L_proceso3
NOP
NOP
;Ejercicio1.c,49 :: 		}
L_proceso2:
;Ejercicio1.c,50 :: 		}
L_end_proceso:
BX	LR
; end of _proceso
