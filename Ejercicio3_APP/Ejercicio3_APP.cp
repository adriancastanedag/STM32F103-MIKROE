#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3_APP/Ejercicio3_APP.c"
#line 33 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3_APP/Ejercicio3_APP.c"
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
 volatile unsigned long *apuntador;





 apuntador =  ( 0X40021000UL + 0x18UL ) ;
 *apuntador &=~(1UL<< 4 );
 *apuntador |= (1UL<< 4 );



 apuntador=  ( 0x40011000ul + 0x04 ) ;
 *apuntador &=~(15UL<<20);
 *apuntador |= ( 0X04UL <<((13-8)*4));




 apuntador= 0X40021018UL ;
 *apuntador &=~ (1UL<< 2 );
 *apuntador |= (1UL<< 2 );



 apuntador =  ( 0x40010800UL + 0X00 ) ;
 *apuntador &=~(15UL<<((5-0)*4));
 *apuntador |= ( 0X01UL <<((5-0)*4));


}
