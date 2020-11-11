#include "..\config.h"

char current_temp_display_buffer[]={"Temp:         "};
unsigned char currentT=0;
const unsigned char df_table[]={0,1,1,2,2,3,4,4,5,6,6,7,7,8,9,9};
unsigned char ds18b20_error=0;
unsigned char temp_value[]={0x00,0x00};
unsigned char display_digit[]={0,0,0,0};




//��ʼ��DS18B20
unsigned char init_ds18b20(void)
{
 unsigned char status;
 DQ_DDR_1();
 DQ_0();
 delay_nus(540); //�����������ߣ�ռ����
 
 DQ_DDR_0();
 delay_nus(65); //PA4��Ϊ����
 
 status=RD_DQ_VAL(); //�����ߣ�Ϊ0ʱ��������
 delay_nus(500);
 DQ_1();        //�ͷ�����
 return status;
 
}

unsigned char readonebyte(void) //��һ�ֽ�
{
  unsigned char i=0,dat=0;
   for(i=0;i<8;i++)
   {  
     
      DQ_DDR_1();
      DQ_0();      //��������
	  delay_nus(2);
      DQ_DDR_0();  //��PA4����
	  if(RD_DQ_VAL())
	  dat|=(1<<i); //���ݴ����dat��
	  delay_nus(80);
   }
   return dat;
}



void writeonebyte(unsigned char dat) //дһ�ֽ�
{
   unsigned char i=0x01;
   for(i=0x01;i!=0x00;i<<=1)
   {
      DQ_DDR_1();
      DQ_0();      //����,ռ����
	  if(dat&i)
	    DQ_1(); 
	  else
	    DQ_0(); 
	  delay_nus(80);
	  DQ_1(); 
   }
}


unsigned char read_temperature(void)
{
  unsigned char temp;
  if(init_ds18b20()!=0x00)
     ds18b20_error=1;            //DS18B20��������
 else
 {

   writeonebyte(0xCC);           //�������к�ƥ��
   writeonebyte(0x44);           //��������
   init_ds18b20();
   writeonebyte(0xCC);
   writeonebyte(0xBE);           //��ȡ�¶ȼĴ���
   temp_value[0]=readonebyte();  //�¶ȵ�8λ
   temp_value[1]=readonebyte();  //�¶ȸ�8λ
   ds18b20_error=0;
   
 }
 temp=temp_value[1];
 return temp;
}

//�¶�ת��
void convert_temp_data(void)
{
   unsigned char ng=0;
          
  if((temp_value[1]&0xF8)==0xF8) //�ж��¶ȵ�����
  {
    temp_value[1]=~temp_value[1];
	temp_value[0]=~temp_value[0]+1;
	if(temp_value[0]==0x00) temp_value[1]++;
	ng=1;                        //������־
  }
  
  display_digit[0]=df_table[temp_value[0]&0x0F];    //�¶�С������
  currentT=(temp_value[0]>>4)|(temp_value[1]<<4); //�¶���ֵ
  
  display_digit[3]=currentT/100;                    //�¶Ȱ�λ
  display_digit[2]=currentT%100/10;                 //�¶�ʮλ
  display_digit[1]=currentT%10;                     //�¶ȸ�λ
  
  //�¶���ʾԤ����
  current_temp_display_buffer[11]=display_digit[0]+'0';
  current_temp_display_buffer[10]='.';
  current_temp_display_buffer[9]=display_digit[1]+'0';
  current_temp_display_buffer[8]=display_digit[2]+'0';
  if(display_digit[3]!=0)
  current_temp_display_buffer[7]=display_digit[3]+'0';
  else
  current_temp_display_buffer[7]=' ';
  if(display_digit[2]==0 && display_digit[1]==0)
  current_temp_display_buffer[8]=' ';
  if(ng)                                       //�¶�Ϊ��
  {
    if(current_temp_display_buffer[8]==' ')
	   current_temp_display_buffer[8]='-';
	else  
    if(current_temp_display_buffer[7]==' ')
	   current_temp_display_buffer[7]='-';
	else  
	   current_temp_display_buffer[6]='-';
  }
}

