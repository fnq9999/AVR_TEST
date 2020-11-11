/************************************************
文件：AT24C01.h
用途：AT24C01头文件
注意：
创建：2008.1.26
修改：2008.1.26
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#ifndef __PCF8563_H__
#define __PCF8563_H__

//------在此设定芯片型号------

#define SLAW 0x18

//--------在此设定芯片地址-------

#define ERR_SLAW	1	//写字节命令及器件地址错, 在此也就是读写器件错!!

extern void pcfset(unsigned char *);
extern void pcfread(unsigned char *time);

#endif