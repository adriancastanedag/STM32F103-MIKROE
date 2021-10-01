#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20221/Electronica Digital cinvestav/Ejercicio1_AA3/Ejercicio1_AA3.c"
#line 26 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20221/Electronica Digital cinvestav/Ejercicio1_AA3/Ejercicio1_AA3.c"
void iniciar_variables();
void configurar_maquina();
void proceso();


void main() {

 configurar_maquina();
 iniciar_variables();
 while(1)
 {
 proceso();
 }
}

void iniciar_variables()
{
  GPIOA_ODR.B5 =1;
}
void configurar_maquina()
{

 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
 GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);

}
#line 64 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20221/Electronica Digital cinvestav/Ejercicio1_AA3/Ejercicio1_AA3.c"
void proceso()
{
 if( GPIOC_IDR.B0 == 1 )
 {
  GPIOA_ODR.B5 =! GPIOA_ODR.B5 ;
 Delay_ms( 500 );
 }
}
