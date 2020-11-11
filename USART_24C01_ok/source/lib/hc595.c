/************************************************
�ļ���hc595.c
��;��
ע�⣺�ڲ�8M����
������2008.4.1
�޸ģ�2008.4.1
Copy Right  (c)  www.avrvi.com  AVR����������
************************************************/
#include "..\config.h"
const unsigned char Seg7_Data[]={0x3F,0x06,0x5B,0x4F,0x66,             //0,1,2,3,4
                                 0x6D,0x7D,0x07,0x7F,0x6F,             //5,6,7,8,9
						         0x77,0x7C,0x39,0x5E,0x79,0x71,0x00};  //a,b,c,d,e,f
volatile unsigned char Seg7_Led_Buf[4],point=0,point_pos=0;//point��С�����־1������С����point_pos��ʾС����λ��
/*************************************************************************
** ��������:HC595��ʼ��
** ��������:
** �䡡��:
** ���	 :
** ȫ�ֱ���:
** ����ģ��:
** ˵����
** ע�⣺
**************************************************************************/
void HC_595_init(void)
{
 OE_DDR |= (1<<OE);
 OE_PORT &= (1<<OE);
 PORTB = 0x0F;
 spi_init();
 Seg7_Led_Buf[0]=16;
 Seg7_Led_Buf[1]=16;
 Seg7_Led_Buf[2]=16;
 Seg7_Led_Buf[3]=16;
}
/*************************************************************************
** ��������:HC595������
** ��������:
** �䡡��:
** ���	 :
** ȫ�ֱ���:
** ����ģ��: 
** ˵����
** ע�⣺
**************************************************************************/
void HC_595_OUT(unsigned char data)
{
 	 SS_L();
	 SPI_MasterTransmit(data);
 	 SS_H();
}
/*************************************************************************
** ��������:HC595ˢ����ʾ
** ��������:
** �䡡��:
** ���	 :
** ȫ�ֱ���:
** ����ģ��: 
** ˵����
** ע�⣺
**************************************************************************/
void Seg7_Led_Update(void)
{
 HC_595_OUT(Seg7_Data[Seg7_Led_Buf[0]]); 
 Seg7_Bit0_En(); 
 delay_nus(60); 
 Seg7_Bit0_Dis();
 
 HC_595_OUT(Seg7_Data[Seg7_Led_Buf[1]]);
 if((point==1)&&(point_pos==1))
 HC_595_OUT((Seg7_Data[Seg7_Led_Buf[1]])|(1<<dp));
 Seg7_Bit1_En();
 delay_nus(60);
 Seg7_Bit1_Dis();
 
 HC_595_OUT(Seg7_Data[Seg7_Led_Buf[2]]); 
 if((point==1)&&(point_pos==2))
 HC_595_OUT((Seg7_Data[Seg7_Led_Buf[2]])|(1<<dp));
 Seg7_Bit2_En();
 delay_nus(60);
 Seg7_Bit2_Dis();
 
 HC_595_OUT(Seg7_Data[Seg7_Led_Buf[3]]);
 if((point==1)&&(point_pos==3))
 HC_595_OUT((Seg7_Data[Seg7_Led_Buf[3]])|(1<<dp));
 Seg7_Bit3_En();
 delay_nus(60);
 Seg7_Bit3_Dis();
}
/*************************************************************************
** ��������:Hc595��ʾ��������
** ��������:
** �䡡��:0~9999
** ���	 :
** ȫ�ֱ���:
** ����ģ��: 
** ˵����
** ע�⣺
**************************************************************************/
void Seg7_Led_display(unsigned int data)
{
if(data==0){
      Seg7_Led_Buf[3]=0;
 	 Seg7_Led_Buf[2]=0;
 	 Seg7_Led_Buf[1]=0;
 	 Seg7_Led_Buf[0]=0;
	 Seg7_Led_Update();
}
 if(data>9999) //������,������ʾ��Χ��ȫ��
 	{
	 HC_595_OUT(0xFF);
	 Seg7_Bitselect_PORT|=((1<<Seg7_Bit0)|(1<<Seg7_Bit1)|(1<<Seg7_Bit2)|(1<<Seg7_Bit3));
	}
 else if(data>999)
 	{
	 Seg7_Led_Buf[3]=data/1000;
 	 Seg7_Led_Buf[2]=(data%1000)/100;
 	 Seg7_Led_Buf[1]=(data%100)/10;
 	 Seg7_Led_Buf[0]=data%10;
	 Seg7_Led_Update();
	}
 else if(data>99)
 	{
	 Seg7_Led_Buf[3]=0;
 	 Seg7_Led_Buf[2]=(data%1000)/100;
 	 Seg7_Led_Buf[1]=(data%100)/10;
 	 Seg7_Led_Buf[0]=data%10;
	 Seg7_Led_Update();
	}
 else if(data>9)
 	{
	 Seg7_Led_Buf[3]=0;
 	 Seg7_Led_Buf[2]=0;
 	 Seg7_Led_Buf[1]=(data%100)/10;
 	 Seg7_Led_Buf[0]=data%10;
	 Seg7_Led_Update();
	}
 else
 	{
	 Seg7_Led_Buf[3]=0;
 	 Seg7_Led_Buf[2]=0;
 	 Seg7_Led_Buf[1]=0;
 	 Seg7_Led_Buf[0]=data%10;
	 Seg7_Led_Update();
	}
}
/*************************************************************************
** ��������:HC595��ʾ��������
** ��������:
** �䡡��:
** ���	 :
** ȫ�ֱ���:
** ����ģ��: 
** ˵����
** ע�⣺
**************************************************************************/
void Seg7_Led_float(float data)
{
 unsigned int temp;
 /*
 ��Ҫ˵��:data+=0.00001;����0.00001Ϊ�ݴ�ֵ
 ���float���������ڼ�����ڲ��洢��������⣬���Խ����ʾ����
 ���ǻ������µļ������������Ҫ�����0.00001��������ݴ�ֵ���߽��˴�ע�͵� 
 */
 data+=0.00001;
 point=1;
 if(data>999) //������,������ʾ��Χ��ȫ��
 	{
	 HC_595_OUT(0xFF);
	 Seg7_Bitselect_PORT|=((1<<Seg7_Bit0)|(1<<Seg7_Bit1)|(1<<Seg7_Bit2)|(1<<Seg7_Bit3));
	}
 else if(data>99)
 	{
	 temp=data*10;
	 point_pos=1;
	 Seg7_Led_Buf[3]=temp/1000;
 	 Seg7_Led_Buf[2]=(temp%1000)/100;
 	 Seg7_Led_Buf[1]=(temp%100)/10;
 	 Seg7_Led_Buf[0]=temp%10;
	 Seg7_Led_Update();
	}
 else if(data>9)
 	{
	 temp=data*100;
	 point_pos=2;
	 Seg7_Led_Buf[3]=temp/1000;
 	 Seg7_Led_Buf[2]=(temp%1000)/100;
 	 Seg7_Led_Buf[1]=(temp%100)/10;
 	 Seg7_Led_Buf[0]=temp%10;
	 Seg7_Led_Update();
	}
 else
 	{
	 temp=data*1000;
	 point_pos=3;
	 Seg7_Led_Buf[3]=temp/1000;
 	 Seg7_Led_Buf[2]=(temp%1000)/100;
 	 Seg7_Led_Buf[1]=(temp%100)/10;
 	 Seg7_Led_Buf[0]=temp%10;
	 Seg7_Led_Update();
	}
 point=0;
}