/************************************************
�ļ���TWI.h
��;��TWIͷ�ļ�
ע�⣺
������2008.1.26
�޸ģ�2008.1.26
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#ifndef __TWI_H__
#define __TWI_H__

extern void twi_init(void);
extern void i2cstart(void);
extern unsigned char i2cwt(unsigned char data);
extern unsigned char i2crd(void);
extern void i2cstop(void);

#endif