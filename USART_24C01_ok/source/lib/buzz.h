/************************************************
文件：buzz.h
用途：
注意：内部8M晶振
创建：2008.4.1
修改：2008.4.1
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
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