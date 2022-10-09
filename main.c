#include <stm32f10x.h> 
#include "NewPro.h"


void  Delay_Time( volatile  unsigned  int  t)
{
    
     unsigned  int  i;
     while(t--)
         for (i=0;i<400;i++);
}
int main()
    {
			int t=9000;
			RCC_AP2ENR|=1<<2|1<<3|1<<4;
    GPIOA_CRL&=0XFF0FFFFF;				
    GPIOA_CRL|=0X00200000;
			GPIOB_CRH&=0XFFFFFF0F;
			GPIOB_CRH|=0X00000020;
        GPIOC_CRH&=0XF0FFFFFF;
			GPIOC_CRH|=0X02000000;  
			GPIOA_ODR&=~(1<<5);
			GPIOB_ODR&=~(1<<9);
			GPIOC_ODR&=~(1<<14);
   while(t)
		 {
			 GPIOA_ODR=1<<5;
	      Delay_Time(t);
			  GPIOA_ODR&=~(1<<5);
			 GPIOB_ODR=1<<9;
	      Delay_Time(t);
			  GPIOB_ODR&=~(1<<9);
			  GPIOC_ODR=1<<14;
	      Delay_Time(t);
			  GPIOC_ODR&=~(1<<14);
    }		
   

         return 0;             
    }
