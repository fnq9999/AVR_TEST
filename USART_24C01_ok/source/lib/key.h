/************************************************
文件：key.h
用途：
注意：内部8M晶振
创建：2008.4.1
修改：2008.4.1
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
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