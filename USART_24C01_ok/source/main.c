/************************************************
文件：main.c
用途：
注意：内部8M晶振
创建：2008.4.1
修改：2008.4.1
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/

#include "config.h"
#include<time.h>

unsigned char tem[20];
unsigned char tem2[20];
unsigned char read_buf[20]="201110123000";
unsigned char out_buf[50]="201110095000";
unsigned char ind=0;
#define uint8 unsigned char

void val_pc_to_msc(unsigned char *t){/// string to bcd
	 unsigned char i=0;
	 for(ind=0;ind<6;++ind){  
	 	tem[ind]=(0xf0)&((t[2*ind]-'0'))<<4;
		tem[ind]|=(0x0f)&(t[2*ind+1]-'0');
	 }
	 for(i=0;i<6;++i){
	 	t[i]=tem[5-i];
	 }
}




void time_init(uint8 *s)// s is a string 
{

     	val_pc_to_msc(s);
         pcf_set_byte(0x02,s[0]);         //秒
         pcf_set_byte(0x03,s[1]);         //分钟    
         pcf_set_byte(0x04,s[2]);          //时             
         pcf_set_byte(0x05,s[3]);          //日
         pcf_set_byte(0x06,0x00);          //星期
         pcf_set_byte(0x07,s[4]);          //月
         pcf_set_byte(0x08,s[5]);          //年
		 pcf_start();
}



void pre_transfer(unsigned char *t){
	 t[0]&=0x7f;	 t[1]&=0x7f;
	 t[2]&=0x3f;	 t[3]&=0x3f;
 	 t[4]&=0x07;	 t[5]&=0x1f;
}


///use_to_display_val_to_com_string_ok
void val_msc_to_pc(unsigned char *t){
	 unsigned char i=0;
	 ind=0;
	 for(i=0;i<7;++i){  
	 	tem[ind++]='0'+(t[i]/16);
		tem[ind++]='0'+(t[i]%16);
	 }
	 tem[ind]='\0';
	 for(i=0;tem[i];++i){
	 	t[i]=tem[i];
	 }
	 t[i]='\0';
	 
}

#define uint8 unsigned char
unsigned char len(unsigned char *s){
		 uint8 i=0,cnt=0;
		 for(;s[i];++i){
		 	++cnt;
		 }
		 return cnt;
}


/// com_packet
void msc_to_pc(unsigned char *s){
	 Com_putstring (s,len(s),&RTbuf_UART0);
}
void pc_to_msc(unsigned char *p,uint8 len){
	 Com_getstring (p,len,&RTbuf_UART0);
}/// com_packet_end

void out_to_user(uint8 *s){
	 ind=0;
     out_buf[ind++]='2';
	 out_buf[ind++]='0';
     out_buf[ind++]=s[12];
	 out_buf[ind++]=s[13];
	 out_buf[ind++]='-';
     
     out_buf[ind++]=s[10];
	 out_buf[ind++]=s[11];
	 out_buf[ind++]='-';
     
     out_buf[ind++]=s[6];
	 out_buf[ind++]=s[7];
	 out_buf[ind++]=' ';out_buf[ind++]=' ';
     
     out_buf[ind++]=s[4];
	 out_buf[ind++]=s[5];
	 out_buf[ind++]=':';
	 out_buf[ind++]=s[2];
	 out_buf[ind++]=s[3];
	 out_buf[ind++]=':';
	 out_buf[ind++]=s[0];
	 out_buf[ind++]=s[1];
	 out_buf[ind++]='\n';
	 out_buf[ind]='\0';
   	 msc_to_pc(out_buf);	
}

void main(void)
{
     unsigned char *W_Buff="www.avrvi.com",*R_Buff="\0",i=0,j=0,Key,key_brk,ng;
	 
	 //// init_process
	 CLI();
	 Com_init();
	 twi_init();
     CLI();
     ng= read_temperature();
     delay_nms(500);
     delay_nms(1000);
     ng= read_temperature();
     SEI();
//         ng= read_temperature();
 	 //// init_process_end
	 
	 //pcf 
//	 msc_to_pc("Plead write the time to the msc now!\n\n");
//     while(1);
// msc_to_pc("24C01 Write: www.avrvi.com\n\n");
//	 time_init(read_buf);
//	 pcf_start();
	//pcf_init_end	
//	 delay_nms(5000);	 

//////////////////////////////////////////////exp_process

/////////////////////////led_test


   	 msc_to_pc("led_test\n");
     delay_nms(500);
     Com_disable();
 PORTE = 0xFF;
 DDRE  = 0xFF;

 	   for(i=0;i<3;i++)
	 	 {
		  PORTE = 0;
		  delay_nms(300);
		  PORTE = 0xff;
		  delay_nms(300);
		 }
         Com_init();
//.///////////////////////led_test_end



//8.ds18b20
    

    msc_to_pc("DS18B20\n");
    convert_temp_data();
    msc_to_pc(current_temp_display_buffer);
    
//8.ds18b20_end
    



/////////////////////////seg7

   	 msc_to_pc("\nSEG7_test\n");
		HC_595_init();
		//  Seg7_Led_display(111*i)
		 for(i=0;i<10;i++)
	 	 {
		  for(j=0;j<200;++j){
		  	Seg7_Led_display(1111*i);
     		  delay_nms(1);
		  }  
		 }


/////////////////////////seg7_test_end



/////////////////////////BUZZ_KEY_test

   	 msc_to_pc("BUZZ_KEY_test\n");
      DDRE = 0xFF;
       PORTE = 0xFF;
    Key_init();
    Buzz_init();
	key_brk=0;
	while(1) {
		if(key_brk)break;
        Key=get_key();
        switch(Key) {
            case ( ((1<<S4)^0xF0) ): {
                PORTE =~ (1<<3);
                Beep(100,50);
                Beep(100,50);
                Beep(100,50);
                Beep(100,50);
				break;
            }
            case ( ((1<<S3)^0xF0) ): {
                PORTE =~ (1<<2);
                Beep(100,50);
                Beep(100,50);
                Beep(100,50);
				break;
            }
            case ( ((1<<S2)^0xF0) ): {
                PORTE =~ (1<<1);
                Beep(100,50);
                Beep(100,50);
				break;
            }
            case ( ((1<<S1)^0xF0) ): {
                PORTE =~ (1<<0);
                Beep(100,50);
				key_brk=1;
                break;
            }
            default: {
                break;
            }
        }

    }
	


/////////////////////////BUZZ_KEY_test_end
// 1.read the pcf_init_data

   	 msc_to_pc("read the pcf_init_data\n");
	 pcfread(tem2,2,7);/// get the bcd_to_year
	 pre_transfer(tem2);///and op
     val_msc_to_pc(tem2);/// bcd to string
   	 msc_to_pc("read the pcf_init_data_end\n");
// 2.pcf_init_data_read to pc
   out_to_user(tem2);
//3. update the pcf data_to now time
   	 msc_to_pc("update the pcf data_to now time\n");	 
     time_init(read_buf);
// 4.read the pcd_now_data
    pcfread(tem2,2,7);/// get the bcd_to_year
	pre_transfer(tem2);///and op
	val_msc_to_pc(tem2);/// bcd to string
	
// 5.pcf_now_data_read to pc
	out_to_user(tem2);
// 6.write_to_at24c01
   	msc_to_pc("The string written to the AT24C01 is: \"GOOD_EXP\"\n");
	 //wt24c(W_Buff,0x00,13);
	 wt24c("GOOD_EXP\n\0",0x00,10);
//7.at24c01_to_pc
   	msc_to_pc("GET THE STRING:\n");
	rd24c(R_Buff,0x00,10);
	msc_to_pc(R_Buff);

    
while(1);
////////////////////////////////////////exp_process_end

	 wt24c(W_Buff,0x00,13);
	 delay_nms(500);
	 //Com_putstring ("24C01 Read: ",12,&RTbuf_UART0);
	 rd24c(R_Buff,0x00,13);Com_putstring (R_Buff,13,&RTbuf_UART0);
	 //Com_putstring ("\n\n",2,&RTbuf_UART0);
     delay_nms(500);
	 while(1)
	 {
	  ;
	 }
}

