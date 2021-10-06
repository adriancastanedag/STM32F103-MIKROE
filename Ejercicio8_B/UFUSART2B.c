#define LED         GPIOA_ODR.B5
const char msn[]={" Hola CPU"};

void main() {
   unsigned short int dato;
   const char *app;

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

          if(USART2_SRbits.RXNE==1)
          {
             dato=USART2_DR;
             USART2_DR=dato;
             while(USART2_SRBITS.TC==0);
          }

       }

}