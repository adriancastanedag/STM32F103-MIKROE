//1.- incluir nuestra biblioteca del mcu
      //--ya esta listo desde el asistente del ide
  //---Incluir bibliotecas adicionales
	//---por ejemplo #include <lcd.h>

//2.- Incluir nuestras definiciones del programa
 	//--define particularidades de cada micro
	//--define constantes del programa

//3.-Definir nuestras variables globales

   //const unsigned short int var1=123;   //crea una variable en la memoria flash
   //unsigned short int var2;             //crea una variable en la memoria ram

//4.-Definir nuestras funciones globales
	//void configurar_maq();
	//void iniciar_vars();
	//void Proceso();
	//int ProcesoN(int contador);

//5.-Nuestra funcion principal (main)
void main() {
   //5a.- configurar la máquina
   configurar_maq();
   //5b.- Iniciar nuestras variables
   iniciar_vars();
   //5c.- El ciclo o bucle principal del programa
   while(1)
   {
      Proceso();
      //ProcesoN(var1);
   }
}
//---Cuerpos de mis funciones
void Proceso()
{
    //Algoritmo del Proceso N
}
void iniciar_vars()
{
   //inicio de var principales
}
void configurar_maq()
{
   //Configuración de nuestras unidades funcionales
}