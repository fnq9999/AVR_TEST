/************************************************
文件：delay.c
用途：延时函数
注意：系统时钟8M
创建：2008.1.25
修改：2008.1.25
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#include <iom128v.h>
void delay_1us(void)                 //1us延时函数
  {
   asm("nop");
  }

void delay_nus(unsigned int n)       //N us延时函数
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   delay_1us();
  }
  
void delay_1ms(void)                 //1ms延时函数
  {
   unsigned int i;
   for (i=0;i<1140;i++);
  }
  
void delay_nms(unsigned int n)       //N ms延时函数
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   delay_1ms();
  }