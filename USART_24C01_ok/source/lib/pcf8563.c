/************************************************
文件：AT24C01.c
用途：AT24C01操作函数
注意：
创建：2008.1.26
修改：2008.1.26
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#include "..\config.h"

#define I2C_START()                            TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWSTA)
#define I2C_STOP()                          TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWSTO)
#define I2C_ACK()                          TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWEA)
#define I2C_NAK()                          TWCR = BIT(TWINT)|BIT(TWEN)
#define I2C_CHECK_STATUS(X)          {while(!(TWCR&BIT(TWINT))); if((TWSR&0xF8)!=(X)) return 0;}
#define I2C_WRITE(X)                  TWDR = (X)
#define I2C_READ(X)                          (X) = TWDR

//TWSR&0xF8 状态码
#define START                                  0x08
#define RE_START                          0x10
#define MT_SLA_ACK                          0x18
#define MT_SLA_NAK                          0x20
#define MT_DATA_ACK                          0x28
#define MT_DATA_NAK                          0x30
#define SLA_DATA_FAIL                  0x38
#define MR_SLA_ACK                          0x40
#define MR_SLA_NAK                          0x48
#define MR_DATA_ACK                          0x50
#define MR_DATA_NAK                          0x58
#define SLA_R_PCF8563                  0xA3
#define SLA_W_PCF8563                  0xA2



unsigned char i2c_write_n_bytes(unsigned char SLA_W, unsigned int ADDR,
                                unsigned int N, unsigned char *DAT)
{
unsigned int i;
I2C_START();
I2C_CHECK_STATUS(START);

I2C_WRITE(SLA_W);
I2C_NAK();
I2C_CHECK_STATUS(MT_SLA_ACK);

if(SLA_W!=SLA_W_PCF8563)
{
  I2C_WRITE((unsigned char)(ADDR>>8));
  I2C_NAK();
  I2C_CHECK_STATUS(MT_DATA_ACK);
}
I2C_WRITE((unsigned char)ADDR);
I2C_NAK();
I2C_CHECK_STATUS(MT_DATA_ACK);

for(i=0;i<N;i++)
{
  I2C_WRITE(DAT[i]);
  I2C_NAK();
  I2C_CHECK_STATUS(MT_DATA_ACK);
}

I2C_STOP();
return 1;
}



unsigned char i2c_read_n_bytes(unsigned char SLA_R, unsigned int ADDR,
                               unsigned int N, unsigned char *DAT){



unsigned int i;

I2C_START();
I2C_CHECK_STATUS(START);

I2C_WRITE((SLA_R)-1);
I2C_NAK();
I2C_CHECK_STATUS(MT_SLA_ACK);

if(SLA_R!=SLA_R_PCF8563)
{
  I2C_WRITE((unsigned char)(ADDR>>8));
  I2C_NAK();
  I2C_CHECK_STATUS(MT_DATA_ACK);
}
I2C_WRITE((unsigned char)ADDR);
I2C_NAK();
I2C_CHECK_STATUS(MT_DATA_ACK);

I2C_START();
I2C_CHECK_STATUS(RE_START);

I2C_WRITE(SLA_R);
I2C_NAK();
I2C_CHECK_STATUS(MR_SLA_ACK);

if(N>1)
{
  for(i=0;i<N-1;i++)
  {
   I2C_ACK();
   I2C_CHECK_STATUS(MR_DATA_ACK);
   I2C_READ(DAT[i]);
  }
}
I2C_NAK();
I2C_CHECK_STATUS(MR_DATA_NAK);
DAT[N-1]=TWDR;

I2C_STOP();
return 1;
}


unsigned char i2c_check_busy(unsigned char SLA_W)
{
unsigned char retv=0;
I2C_START();
I2C_CHECK_STATUS(START);
I2C_WRITE(SLA_W);
I2C_NAK();
while(!(TWCR&BIT(TWINT)));
if((TWSR&0xF8)!=MT_SLA_ACK)  retv=1;
I2C_STOP();
return retv;
}

void PCF8563_stop(void)
{
unsigned char stopcode=0x20;
i2c_write_n_bytes(SLA_W_PCF8563,0,1,&stopcode);
}

void PCF8563_start(void)
{
unsigned char startcode=0x00;
i2c_write_n_bytes(SLA_W_PCF8563,0,1,&startcode);
}

void pcfset(unsigned char *time){
//	 unsigned char time[7];
/*
	 time[6]=yy;//年
	 time[5]=mm;//月
	 time[4]=da;//星期
	 time[3]=dd;//日
	 time[2]=hh;//时
	 time[1]=mi;//分
	 time[0]=ss;//秒
*/
	 PCF8563_stop();
	 i2c_write_n_bytes(SLA_W_PCF8563,2,7,time);
	 PCF8563_start();
}
void pcfread(unsigned char *time){
	i2c_read_n_bytes(SLA_R_PCF8563,2,7,time);
//time[6]       //年
	
	/*
	time[5] &= 0x1F;//月
	time[4] &= 0x07;//星期
	time[3] &= 0x3F;//日
	time[2] &= 0x3F;//时
	time[1] &= 0x7F;//分
	time[0] &= 0x7F;//秒
		*/
}
