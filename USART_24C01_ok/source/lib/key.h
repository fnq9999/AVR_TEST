/************************************************
�ļ���key.h
��;��
ע�⣺�ڲ�8M����
������2008.4.1
�޸ģ�2008.4.1
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#ifndef __KEY_H__
#define __KEY_H__

#define KEY_PORT PORTD
#define KEY_PIN PIND
#define KEY_DDR DDRD

#define S1 4
#define S2 5
#define S3 6
#define S4 7

extern void Key_init(void);
extern unsigned char get_key(void);

#endif