#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 2_apps/Ejercicio3_1_APPS.c"
#line 31 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 2_apps/Ejercicio3_1_APPS.c"
void config_maq();
void ini_var();
void proceso();

void main() {

 config_maq();

 ini_var();

 while(1)
 {

 proceso();
 }
}
void proceso()
{
 if( GPIOC_IDR.B13 == 0 )
 {
  GPIOA_ODR.B5 = ! GPIOA_ODR.B5 ;
 Delay_ms(1000);
 }
}
void ini_var()
{
  GPIOA_ODR.B5 = 1 ;
 Delay_ms(1000);
  GPIOA_ODR.B5 = 0 ;
}
void config_maq()
{
 volatile unsigned long int *app;




 app= ( 0X40021000UL + 0X18UL ) ;
 *app &=~(1UL<<4);
 *app |= (1UL<<4);



 app= ( 0X40011000UL + 0X04UL ) ;
 *app &=~(15UL<<20);
 *app |= ( 0X04UL <<((13-8)*4));




 app=(unsigned long int*) ( 0X40021000UL + 0X18UL ) ;
 *app &=~(1UL<<2);
 *app |= (1UL<<2);



 app= ( 0X40010800UL + 0x00UL ) ;
 *app &=~(15UL<<20);
 *app |= ( 0X01UL <<((5-0)*4));
}
