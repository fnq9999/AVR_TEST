/************************************************
文件：hc595.h
用途：
注意：内部8M晶振
创建：2008.4.1
修改：2008.4.1
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#ifndef __HC595_H__
#define __HC595_H__

#define OE_PORT PORTC
#define OE_PIN PINC
#define OE_DDR DDRC
#define OE 7

#define Seg7_Bitselect_PORT PORTB
#define Seg7_Bitselect_PIN PINB
#define Seg7_Bitselect_DDR DDRB

#define Seg7_Bit0 4
#define Seg7_Bit1 5
#define Seg7_Bit2 6
#define Seg7_Bit3 7

#define dp 7

#define Seg7_Bit0_En()  {Seg7_Bitselect_DDR|=(1<<Seg7_Bit0);Seg7_Bitselect_PORT|=(1<<Seg7_Bit0);}    
#define Seg7_Bit0_Dis() {Seg7_Bitselect_DDR|=(1<<Seg7_Bit0);Seg7_Bitselect_PORT&=~(1<<Seg7_Bit0);}
#define Seg7_Bit1_En()  {Seg7_Bitselect_DDR|=(1<<Seg7_Bit1);Seg7_Bitselect_PORT|=(1<<Seg7_Bit1);}
#define Seg7_Bit1_Dis() {Seg7_Bitselect_DDR|=(1<<Seg7_Bit1);Seg7_Bitselect_PORT&=~(1<<Seg7_Bit1);}
#define Seg7_Bit2_En()  {Seg7_Bitselect_DDR|=(1<<Seg7_Bit2);Seg7_Bitselect_PORT|=(1<<Seg7_Bit2);}
#define Seg7_Bit2_Dis() {Seg7_Bitselect_DDR|=(1<<Seg7_Bit2);Seg7_Bitselect_PORT&=~(1<<Seg7_Bit2);}
#define Seg7_Bit3_En()  {Seg7_Bitselect_DDR|=(1<<Seg7_Bit3);Seg7_Bitselect_PORT|=(1<<Seg7_Bit3);}
#define Seg7_Bit3_Dis() {Seg7_Bitselect_DDR|=(1<<Seg7_Bit3);Seg7_Bitselect_PORT&=~(1<<Seg7_Bit3);}

extern volatile unsigned char Seg7_Led_Buf[4];

extern void HC_595_init(void);
extern void HC_595_OUT(unsigned char data);
extern void Seg7_Led_Update(void);
extern void Seg7_Led_display(unsigned int data);
extern void Seg7_Led_float(float data);

#endif