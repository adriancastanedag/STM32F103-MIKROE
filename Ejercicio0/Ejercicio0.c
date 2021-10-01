//1.-Incluir bibliotecas
//---#include <stm32, ya esta incluida al seleccionar el micro en el wizard del ide

//--2.-Declaraci�n de definiciones importantes para tu programa
#define PRESIONADO                 0
#define LED                    GPIOA_ODR.B5
#define BOTON                  GPIOC_IDR.B13

//--3.-Varaibles globales

//--4.-Cabeceras de las funciones globales
void iniciar_variables();
void configurar_maquina();
void proceso();

//--5.-Estructura principal
void main() {
    //---5a
    configurar_maquina();
    iniciar_variables();
    while(1)
    {
       proceso();
    }
}
//--Aqui van los cuerpos de las cabeceras de las funciones
void iniciar_variables()
{
  LED=1;
}
void configurar_maquina()
{
   //---es la unica funcion que cambia con respecto al microcontrolador
   GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5 );
   GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);

}
void proceso()
{
   if(BOTON==PRESIONADO)
   {
      LED=!LED;
      Delay_ms(500);
   }
}