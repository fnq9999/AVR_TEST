/************************************************
�ļ���delay.c
��;����ʱ����
ע�⣺ϵͳʱ��8M
������2008.1.25
�޸ģ�2008.1.25
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#include <iom128v.h>
void delay_1us(void)                 //1us��ʱ����
  {
   asm("nop");
  }

void delay_nus(unsigned int n)       //N us��ʱ����
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   delay_1us();
  }
  
void delay_1ms(void)                 //1ms��ʱ����
  {
   unsigned int i;
   for (i=0;i<1140;i++);
  }
  
void delay_nms(unsigned int n)       //N ms��ʱ����
  {
   unsigned int i=0;
   for (i=0;i<n;i++)
   delay_1ms();
  }