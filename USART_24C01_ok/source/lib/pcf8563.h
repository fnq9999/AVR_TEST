/************************************************
�ļ���AT24C01.h
��;��AT24C01ͷ�ļ�
ע�⣺
������2008.1.26
�޸ģ�2008.1.26
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#ifndef __PCF8563_H__
#define __PCF8563_H__

//------�ڴ��趨оƬ�ͺ�------

#define SLAW 0x18

//--------�ڴ��趨оƬ��ַ-------

#define ERR_SLAW	1	//д�ֽ����������ַ��, �ڴ�Ҳ���Ƕ�д������!!

extern void pcfset(unsigned char *);
extern void pcfread(unsigned char *time);

#endif