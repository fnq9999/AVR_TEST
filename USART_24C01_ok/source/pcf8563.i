#line 35 "D:\iccv7avr\include\AVRdef.h"
unsigned char FlashReadByte(unsigned char ramp, unsigned addr);
unsigned FlashReadWord(unsigned char ramp, unsigned addr);
unsigned long FlashReadLWord(unsigned char ramp, unsigned addr);
void FlashReadBytes(unsigned char ramp, unsigned addr, unsigned char *buf, int n);



unsigned char EDataReadByte(unsigned char ramp, unsigned addr);
unsigned EDataReadWord(unsigned char ramp, unsigned addr);
unsigned long EDataReadLWord(unsigned char ramp, unsigned addr);
void EDataReadBytes(unsigned char ramp, unsigned addr, unsigned char *buf, int n);

void EDataWriteByte(unsigned char ramp, unsigned addr);
void EDataWriteWord(unsigned char ramp, unsigned addr);
void EDataWriteLWord(unsigned char ramp, unsigned addr);
void EDataWriteBytes(unsigned char ramp, unsigned addr, unsigned char *buf, int n);






















void _StackCheck(void);
void _StackOverflowed(char);

#line 12 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\TWI.h"
extern void twi_init(void);
extern void i2cstart(void);
extern unsigned char i2cwt(unsigned char data);
extern unsigned char i2crd(void);
extern void i2cstop(void);

#line 12 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\delay.h"
extern void delay_1us(void);
extern void delay_nus(unsigned int n);
extern void delay_1ms(void);
extern void delay_nms(unsigned int n);

#line 61 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\AT24C01.h"
extern unsigned char * wt24c_fc(unsigned char *p, unsigned int ad, unsigned char n);
extern void wt24c(unsigned char *p_rsc, unsigned int ad_dst, unsigned int num);
extern void rd24c(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num);




extern unsigned char * pcfset(unsigned char *p, unsigned int ad, unsigned char n);
extern void pcfread(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num);
extern void pcf_init();
extern void pcf_start(void);
void pcf_stop(void);

void pcf_set_byte(unsigned char p, unsigned int ad);


#line 17 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\sio.h"
typedef struct{
unsigned char R_front;
unsigned char R_rear;
unsigned char R_count;
unsigned char R_overflow;
unsigned char R_buf[100];
unsigned char T_front;
unsigned char T_rear;
unsigned char T_count;
unsigned char T_buf[100];
unsigned char T_disabled;
}siocirqueue;


extern siocirqueue RTbuf_UART0;



































































extern void Rbuf_init(siocirqueue *RTbuf);










extern unsigned char Rbuf_empty(siocirqueue *RTbuf);
































extern unsigned char Rbuf_getchar(siocirqueue *RTbuf);





















extern void Tbuf_init(siocirqueue *RTbuf);





















extern unsigned char Tbuf_full(siocirqueue *RTbuf);










extern void Tbuf_putchar(unsigned char x,siocirqueue *RTbuf);
































extern void Com_init (void); 









extern void Com_baudrate (unsigned int baudrate); 









extern unsigned char Com_putchar (unsigned char c,siocirqueue *RTbuf); 










extern unsigned char Com_getchar (unsigned char mode,siocirqueue *RTbuf); 











extern unsigned char Com_R_count(siocirqueue *RTbuf);










extern void Com_putstring (unsigned char *p,unsigned char len,siocirqueue *RTbuf);










extern unsigned char Com_getstring (unsigned char *p,unsigned char len,siocirqueue *RTbuf);
extern void Com_Rbuf_Clear(siocirqueue *RTbuf);


#line 37 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\hc595.h"
extern volatile unsigned char Seg7_Led_Buf[4];

extern void HC_595_init(void);
extern void HC_595_OUT(unsigned char data);
extern void Seg7_Led_Update(void);
extern void Seg7_Led_display(unsigned int data);
extern void Seg7_Led_float(float data);

#line 21 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\key.h"
extern void Key_init(void);
extern unsigned char get_key(void);

#line 18 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\buzz.h"
extern void Buzz_init(void);
extern void Beep(unsigned int H_time,unsigned int L_time);

#line 36 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\pcf8563.c"
unsigned char i2c_write_n_bytes(unsigned char SLA_W, unsigned int ADDR,
 unsigned int N, unsigned char *DAT)
{
unsigned int i;
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (5));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x08)) return 0;};

(*(volatile unsigned char *)0x73) = (SLA_W);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x18)) return 0;};

if(SLA_W!=0xA2)
{
 (*(volatile unsigned char *)0x73) = ((unsigned char)(ADDR>>8));
 (*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
 {while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x28)) return 0;};
}
(*(volatile unsigned char *)0x73) = ((unsigned char)ADDR);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x28)) return 0;};

for(i=0;i<N;i++)
{
 (*(volatile unsigned char *)0x73) = (DAT[i]);
 (*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
 {while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x28)) return 0;};
}

(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (4));
return 1;
}



unsigned char i2c_read_n_bytes(unsigned char SLA_R, unsigned int ADDR,
 unsigned int N, unsigned char *DAT){



unsigned int i;

(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (5));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x08)) return 0;};

(*(volatile unsigned char *)0x73) = ((SLA_R)-1);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x18)) return 0;};

if(SLA_R!=0xA3)
{
 (*(volatile unsigned char *)0x73) = ((unsigned char)(ADDR>>8));
 (*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
 {while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x28)) return 0;};
}
(*(volatile unsigned char *)0x73) = ((unsigned char)ADDR);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x28)) return 0;};

(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (5));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x10)) return 0;};

(*(volatile unsigned char *)0x73) = (SLA_R);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x40)) return 0;};

if(N>1)
{
 for(i=0;i<N-1;i++)
 {
 (*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (6));
 {while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x50)) return 0;};
 (DAT[i]) = (*(volatile unsigned char *)0x73);
 }
}
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x58)) return 0;};
DAT[N-1]=(*(volatile unsigned char *)0x73);

(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (4));
return 1;
}


unsigned char i2c_check_busy(unsigned char SLA_W)
{
unsigned char retv=0;
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (5));
{while(!((*(volatile unsigned char *)0x74)&(1 << (7)))); if(((*(volatile unsigned char *)0x71)&0xF8)!=(0x08)) return 0;};
(*(volatile unsigned char *)0x73) = (SLA_W);
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2));
while(!((*(volatile unsigned char *)0x74)&(1 << (7))));
if(((*(volatile unsigned char *)0x71)&0xF8)!=0x18) retv=1;
(*(volatile unsigned char *)0x74) = (1 << (7))|(1 << (2))|(1 << (4));
return retv;
}

void PCF8563_stop(void)
{
unsigned char stopcode=0x20;
i2c_write_n_bytes(0xA2,0,1,&stopcode);
}

void PCF8563_start(void)
{
unsigned char startcode=0x00;
i2c_write_n_bytes(0xA2,0,1,&startcode);
}

void pcfset(unsigned char *time){










 PCF8563_stop();
 i2c_write_n_bytes(0xA2,2,7,time);
 PCF8563_start();
}
void pcfread(unsigned char *time){
 i2c_read_n_bytes(0xA3,2,7,time);










}
