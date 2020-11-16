/************************************************
文件：delay.c
用途：延时函数
注意：系统时钟8M
创建：2008.1.25
修改：2008.1.25
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#include <iom128v.h>

#define delay_1us(); asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");asm("nop");
//void delay_1us(void) //延时1us
//{//ret:4t+call:4t=8t,8MHz时1t为125ns,8t为1000ns=1us
//}

  void delay_nus(unsigned int n) //延时n us
{//(8+(4+4)*(n-1)+3)t=(8+8n-8+3)t=(8n+3)t=n us+0.375us,所以约等于1us,特别n越大越精确
 while(--n)
 {
//  delay_1us();
 }
}

  
  
void delay_1ms(void)                 //1ms延时函数
  {
  /*
   unsigned int i;
   for (i=0;i<1140;i++);
   */
   delay_nus(999); //为999us
   
  }
  
  
  
  void delay_nms(unsigned int n) //延时nms
{//(8+4*(n-1)+3)t+delay_nus=(7+4n)t+delay_nus
 for(;n>0;n--)
 {
  asm("nop"); //再补尝,变成了(7+5n)t+delay_nus
  delay_nus(999); /*delay_nus(m)为(8m+3)t所以delay_nus的参数只要999就可以了
                (7+5n)t+((8m+3)*n)t=(7+8n+8mn)t=7t+n us+mn us
                =7t+(m+1)n us,代入m=999约等于1000n us=n ms,误差仅为7t,不到1us
                */
 }
}