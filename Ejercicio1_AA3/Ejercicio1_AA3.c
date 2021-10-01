/*
  Conmutar el LED de usuario (PA_5) cada segundo cada vez que se presione el bot�n de usuario
  (PC_13), con las funciones de configuraci�n en mikroc.
ACTIVIDADES DE TRABAJO AUT�NOMO.
3) Use cualquier otro pin para el BOTON (se requiere de un cable para simularlo)
   tenemos que definir que pin sera ahora el boton ,si es el bit PC_0
   #define BOTON   GPIOC_IDR.B0
   Modificar nuestra funci�n de configuracion_maquina para configurar el bit PC_0 
   como entrada digital
   GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);

*/

//1.-Incluir bibliotecas
//---#include <stm32, ya esta incluida al seleccionar el micro en el wizard del ide

//--2.-Declaraci�n de definiciones importantes para tu programa
#define PRESIONADO                 0
#define NOPRESIONADO               1
#define RETARDO                    500
#define LED                    GPIOA_ODR.B5
#define BOTON                  GPIOC_IDR.B0

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
   GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);

}
/*
   Autor
   AACG
   email: acastanedag@ipn.mx
   Descripci�n
   La funci�n proceso verifica si el boton esta presionado  y si lo esta conmuta
   el valor del led y llama a una funci�n de delay con retardo prefedinido
   Parametros
   No tienen parametros
   Retorno
   no regresa ning�n valor
*/
void proceso()
{
   if(BOTON==NOPRESIONADO)
   {
      LED=!LED;
      Delay_ms(RETARDO);
   }
}