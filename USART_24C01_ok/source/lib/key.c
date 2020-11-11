/************************************************
文件：key.c
用途：
注意：内部8M晶振
创建：2008.4.1
修改：2008.4.1
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#include "..\config.h"
/*************************************************************************
** 函数名称:键盘初始化
** 功能描述:
** 输　入:
** 输出	 :
** 全局变量:
** 调用模块:
** 说明：
** 注意：
**************************************************************************/
void Key_init(void)
{
 KEY_DDR &=~ (1<<S1)|(1<<S2)|(1<<S3)|(1<<S4);
 KEY_PORT |= (1<<S1)|(1<<S2)|(1<<S3)|(1<<S4);
}
/*************************************************************************
** 函数名称:键盘扫描
** 功能描述:
** 输　入:
** 输出	 :
** 全局变量:
** 调用模块:
** 说明：
** 注意：
**************************************************************************/
unsigned char get_key(void)
{
 unsigned char Key_Value=0xFF,tmp;

 Key_Value=KEY_PIN & ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4));
 if( Key_Value != ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4)) )
 	 {
	  delay_nms(2);
	  if( (KEY_PIN & ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4))) == Key_Value )
		 {
		  Key_Value=KEY_PIN & ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4));
		  //NOP();
	  	  while(( KEY_PIN & ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4)) )!= ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4)));
		  delay_nms(1);
		  while(( KEY_PIN & ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4)) )!= ((1<<S1)|(1<<S2)|(1<<S3)|(1<<S4)));
		 }
	 }
	 
 return Key_Value;
}