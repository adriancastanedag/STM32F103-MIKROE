#define LED     GPIOA_ODR.B5

// declarar solo la cabecera de las funciones
void Conf_maq();
void Ini_var();


void main() {
  Conf_maq();
  Ini_var();
  while(1)  // Bucle principal
  {
    //Proceso();
  }

}
void Conf_maq()
{
  //PUERTO B BIT 8 COMO SALIDA ALTERNATIVA CON PUSH PULL 50MHZ
  RCC_APB2ENRbits.IOPAEN=1;
  GPIOA_CRL &=~(15<<(5*4));
  GPIOA_CRL |= (2<<(5*4));
  LED=1;

  //Configuración del timer
  RCC_APB1ENRbits.TIM4EN=1;
  TIM4_CR1.CEN=0;//DETIENE EL CONTADOR
  TIM4_PSC=7999; //prescalador FrecContador= Frec APB1/(prescalador+1)
  TIM4_ARR=500; //ARR=tiempo deseado* FrecContador (500 ms de retardo)
  TIM4_DIER.UIE=1; //pedir atención por interrupción la bandera de interrupción
  NVIC_IntEnable(IVT_INT_TIM4);//Configura la interrupción en el NVIC
  TIM4_CR1.CEN=1;//Empieza a contar

}
void Ini_var()
{
  LED = 0;
}
void conmutar() iv IVT_INT_TIM4 ics ICS_AUTO {
  TIM4_SRbits.UIF=0;
  LED=~LED;
}