#line 1 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 1_SFR/Ejercicio3_SFR.c"
#line 16 "E:/OneDrive - Instituto Politecnico Nacional/DOCENCIA/PERIODO 20212/Computadoras Automotrices II/Ejercicio3 1_SFR/Ejercicio3_SFR.c"
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



 RCC_APB2ENR &=~(1UL<<4);
 RCC_APB2ENR |= (1UL<<4);

 GPIOC_CRH &=~(15UL<<20);
 GPIOC_CRH |= ( 0X04UL <<((13-8)*4));

 RCC_APB2ENR &=~(1UL<<2);
 RCC_APB2ENR |= (1UL<<2);

 GPIOA_CRL &=~(15UL<<((5-0)*4));
 GPIOA_CRL |= ( 0X01UL <<((5-0)*4));


}
