/************************************************
�ļ���buzz.h
��;��
ע�⣺�ڲ�8M����
������2008.4.1
�޸ģ�2008.4.1
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#ifndef __BUZZ_H__
#define __BUZZ_H__

#define BUZZ_PORT PORTG
#define BUZZ_PIN PING
#define BUZZ_DDR DDRG

#define SPK 4

extern void Buzz_init(void);
extern void Beep(unsigned int H_time,unsigned int L_time);

#endif