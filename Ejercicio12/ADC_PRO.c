#define LED         GPIOA_ODR.B5
const char msn[]={" Hola CPU"};
   unsigned short int dato;

void main() {
   const char *app;

   //PUERTO B BIT 0 COMO ANALÓGICO
   RCC_APB2ENR|=1<<IOPBEN;
   GPIOB_CRL &=~(15<<(0*4)); //0 ES MODO ANALÓGICO
   //---CONFIGURACION DEL ADC
   RCC_APB2ENRbits.ADC1EN=1;
   ADC1_CR1bits.DISCEN=0;
   ADC1_CR1bits.SCAN=0;
   ADC1_CR2bits.CONT=0;
   ADC1_SMPR2 |= 6<<(8*3);       //T CONV 21US  (71.5+12.5)/4MHZ
   ADC1_SQR3 |= 8<<(0*4);        //PRIMERA CONVERSION CANAL 8
   ADC1_CR2bits.ADON=1;          //ENCIENDE EL ADC
   ADC1_CR2bits.CAL=1;           //EMPIEZA LA AUTO CALIBRACIÓN
   while( ADC1_CR2bits.CAL);     //ESPERA A QUE EL HARDWARE APAGUE ESTE BIT
   
   
   
   //PUERTO A BIT 5 COMO SALIDA PUSH-PULL
   //PUERTO A2 TX COMO FUNCION ALTERNATIVA PUSHPULL 50MHZ
   //PUERTO A3 RX COMO ENTRADA FLOTANTE
   RCC_APB2ENR|=1<<IOPAEN;
   GPIOA_CRL &=  ~( (15<<(2*4))|(15<<(3*4))|(15<<(5*4)) );
   GPIOA_CRL |=  ( (11<<(2*4))| (4<<(3*4))|(2<<(5*4)));
   LED=1;


          //---CONFIGURA UNIDAD FUNCIONAL USART2
       RCC_APB1ENRbits.USART2EN=1;
       USART2_CR1bits.UE=1;       //hABILITA LA USART2
       USART2_CR1bits.M=0;        //8 BITS DE PALABRA
       USART2_CR1bits.PCE=0;      //SIN PARIDAD
       USART2_CR2bits.STOP=0;     //1 BIT DE STOP
       USART2_BRR=0X9C4;          //9600 @ 24MHZ   BAUD=24MHZ/(16*9600)
       USART2_CR1bits.RE=1;       //HABILITA RECEPCIÓN
       USART2_CR1bits.TE=1;       //HABILITA TRANSMISIÓN
       //---CONFIGURACIÓN DE INTERRUPCIÓN USART1 POR RECEPCIÓN
       USART2_CR1bits.RXNEIE=1;
       //USART2_CR1.B5=1;   //Pide la interrupción por recepción RXNEIE =1
       NVIC_IntEnable(IVT_INT_USART2);

       Delay_ms(500);
       app=msn;
       while(*app!=0)
       {
             USART2_DR=*app;
             while(USART2_SRBITS.TXE==0);
             USART2_SRBITS.TXE=0;
             app++;
       }
       USART2_DR=0X20;

       while(1)
       {
          LED=~LED;
          Delay_ms(500);
       }

}
void recepcion() iv IVT_INT_USART2 ics ICS_AUTO {
     dato=USART2_DR;
     USART2_DR=dato;
     ADC1_CR2bits.SWSTART=1;
     while(!ADC1_SRbits.EOC);
     ADC1_SRbits.EOC=0;
     DAC_DHR12R2=ADC1_DR;

}