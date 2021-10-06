void main() {
   unsigned int duty;
  //PUERTO B BIT 8 y BIT 9 COMO SALIDA ALTERNATIVA CON PUSH PULL 50MHZ
  RCC_APB2ENRbits.IOPBEN=1;
  GPIOB_CRH &=~( (15<<(0*4))|(15<<(1*4)) );
  GPIOB_CRH |= ( (11<<(0*4))|(11<<(1*4)) );    //CANAL 3 Y CANAL 4 TIMER4
   //---CONFIGURANDO EL TIMER 4 FRECUENCIA Y MODO DE CONTEO
   RCC_APB1ENRbits.TIM4EN=1;            //ACTIVA EL RELOJ PARA EL TIMER 2
   TIM4_CR1bits.CEN=0;                  //CONTADOR DETENIDO
   TIM4_PSC=7;                         //FRECUENCIA DE CONTEO 8MHZ/(7+1)=1MHZ
   TIM4_ARR=1000;                       //FRECUENCIA DEL PWM =1MHZ/(1000) =1KHZ
   TIM4_CR1bits.CMS=0;                  //ALINEADO A LA IZQUIERDA
   TIM4_CR1bits.DIR_=0;                 //CONTEO ASCENDENTE
   //TIM4_CR1bits.ARPE=1;                 //ARR
   //---CONFIGURA EL CANAL 3
   TIM4_CCMR2_Outputbits.OC3M=6;        //PWM1
   TIM4_CCMR2_Outputbits.OC3PE=1;       //PRECARGA ACTIVADA
   TIM4_CCMR2_Outputbits.CC3S=0;        //PIN MODO SALIDA
   TIM4_CCERbits.CC3P=0;                //ACTIVO EN ALTO 0, ACTIVO EN BAJO 1
   TIM4_CCERbits.CC3E=1;                //SALIDA HABILITADA
   TIM4_CCR3=100;                       //DUTY 10%   1000/100;
   //---CONFIGURA EL CANAL 4
   TIM4_CCMR2_Outputbits.OC4M=6;        //PWM1
   TIM4_CCMR2_Outputbits.OC4PE=1;       //PRECARGA ACTIVADA
   TIM4_CCMR2_Outputbits.CC4S=0;        //PIN MODO SALIDA
   TIM4_CCERbits.CC4P=1;                //ACTIVO EN ALTO 0, ACTIVO EN BAJO 1
   TIM4_CCERbits.CC4E=1;                //SALIDA HABILITADA
   TIM4_CCR4=100;                       //DUTY 10%   1000/100;
   //---INICIALIZA LOS REGISTROS
   TIM4_EGRbits.UG=1;                   //INICIALIZA TODOS LOS REGISTROS
   TIM4_EGRbits.UG=0;
   TIM4_CR1bits.CEN=1;                  //arranca el contador
   duty=100;
   while(1){
       delay_ms(100);
       duty+=50;                      //COMENTAR PARA DEJAR CICLO FIJO
       if(duty==1000)
          duty=0;
       TIM4_CCR3=duty;               //INCREMENTOS DEL 10%
       TIM4_CCR4=duty;               //INCREMENTOS DEL 10%
   }


}