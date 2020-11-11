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

#line 55 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\AT24C01.h"
extern unsigned char * wt24c_fc(unsigned char *p, unsigned int ad, unsigned char n);
extern void wt24c(unsigned char *p_rsc, unsigned int ad_dst, unsigned int num);
extern void rd24c(unsigned char *p_dst, unsigned int ad_rsc, unsigned int num);

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


#line 38 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\cf8563.h"
typedef struct {
 unsigned char minute;
 unsigned char hour;
 unsigned char day;
 unsigned char weekday;
} PCF_Alarm;

typedef struct {
 unsigned char second;
 unsigned char minute;
 unsigned char hour;
 unsigned char day;
 unsigned char weekday;
 unsigned char month;
 unsigned int year;
} PCF_DateTime;


void PCF_Write(unsigned char addr, unsigned char *data, unsigned char count);
void PCF_Read(unsigned char addr, unsigned char *data, unsigned char count);

void PCF_Init(unsigned char mode);
unsigned char PCF_GetAndClearFlags(void);

void PCF_SetClockOut(unsigned char mode);

void PCF_SetTimer(unsigned char mode, unsigned char count);
unsigned char PCF_GetTimer(void);

unsigned char PCF_SetAlarm(PCF_Alarm *alarm);
unsigned char PCF_GetAlarm(PCF_Alarm *alarm);

unsigned char PCF_SetDateTime(PCF_DateTime *dateTime);
unsigned char PCF_GetDateTime(PCF_DateTime *dateTime);


#line 15 "D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\cf8563.c"
void TWI_Init()
{

 (*(volatile unsigned char *)0x70) = 0; 
 (*(volatile unsigned char *)0x71) &= ~((1<<1) | (1<<0)); 
}

void TWI_Start()
{
 (*(volatile unsigned char *)0x74) = (1<<7) | (1<<2) | (1<<5);
 while (!((*(volatile unsigned char *)0x74) & (1<<7)));
}

void TWI_Stop()
{
 (*(volatile unsigned char *)0x74) = (1<<7) | (1<<2) | (1<<4);
 while (((*(volatile unsigned char *)0x74) & (1<<4)));
}

unsigned char TWI_Read(unsigned char ack)
{
 (*(volatile unsigned char *)0x74) = (1<<7) | (1<<2) | (((ack ? 1 : 0)<<6));
 while (!((*(volatile unsigned char *)0x74) & (1<<7)));
 return (*(volatile unsigned char *)0x73);
}

void TWI_Write(unsigned char byte)
{
 (*(volatile unsigned char *)0x73) = byte;
 (*(volatile unsigned char *)0x74) = (1<<7) | (1<<2);
 while (!((*(volatile unsigned char *)0x74) & (1<<7)));
}




void PCF_Write(unsigned char addr, unsigned char *data, unsigned char count) {
 TWI_Start();

 TWI_Write(0xA2);
 TWI_Write(addr);

 while (count) {
 count--;

 TWI_Write(*data);
 data++;
 }

 TWI_Stop();

}

void PCF_Read(unsigned char addr, unsigned char *data, unsigned char count) {
 TWI_Start();

 TWI_Write(0xA2);
 TWI_Write(addr);

 TWI_Stop();
 TWI_Start();

 TWI_Write(0xA3);

 while (count)
 {
 count--;

 *data = TWI_Read(count);
 data++;
 }

 TWI_Stop();

}








void PCF_Init(unsigned char mode)
{
 TWI_Init();

 unsigned char tmp = 0b00000000;
 PCF_Write(0x00, &tmp, 1); 

 mode &= 0b00010011; 
 PCF_Write(0x01, &mode, 1); 
}

unsigned char PCF_GetAndClearFlags()
{
 unsigned char flags;
 PCF_Read(0x01, &flags, 1); 

 unsigned char cleared = flags & 0b00010011; 
 PCF_Write(0x01, &cleared, 1); 

 return flags & 0x0C; 
}

void PCF_SetClockOut(unsigned char mode)
{
 mode &= 0b10000011;
 PCF_Write(0x0D, &mode, 1); 
}

void PCF_SetTimer(unsigned char mode, unsigned char count)
{
 mode &= 0b10000011;
 PCF_Write(0x0E, &mode, 1); 

 PCF_Write(0x0F, &count, 1); 
}

unsigned char PCF_GetTimer()
{
 unsigned char count;
 PCF_Read(0x0F, &count, 1); 

 return count;
}

unsigned char PCF_SetAlarm(PCF_Alarm *alarm)
{
 if ((alarm->minute >= 60 && alarm->minute != 80) || (alarm->hour >= 24 && alarm->hour != 80) || (alarm->day > 32 && alarm->day != 80) || (alarm->weekday > 6 && alarm->weekday != 80))
 {
 return 1;
 }

 unsigned char buffer[4];

 buffer[0] = ((((alarm->minute) / 10) << 4) + ((alarm->minute) % 10)) & 0xFF;
 buffer[1] = ((((alarm->hour) / 10) << 4) + ((alarm->hour) % 10)) & 0xBF;
 buffer[2] = ((((alarm->day) / 10) << 4) + ((alarm->day) % 10)) & 0xBF;
 buffer[3] = ((((alarm->weekday) / 10) << 4) + ((alarm->weekday) % 10)) & 0x87;

 PCF_Write(0x09, buffer, sizeof(buffer));

 return 0;
}

unsigned char PCF_GetAlarm(PCF_Alarm *alarm)
{
 unsigned char buffer[4];

 PCF_Read(0x09, buffer, sizeof(buffer));

 alarm->minute = (((buffer[0] >> 4) & 0x0F) * 10) + (buffer[0] & 0x0F);
 alarm->hour = (((buffer[1] >> 4) & 0x0B) * 10) + (buffer[1] & 0x0F);
 alarm->day = (((buffer[2] >> 4) & 0x0B) * 10) + (buffer[2] & 0x0F);
 alarm->weekday = (((buffer[3] >> 4) & 0x08) * 10) + (buffer[3] & 0x07);

 return 0;
}

unsigned char PCF_SetDateTime(PCF_DateTime *dateTime)
{
 if (dateTime->second >= 60 || dateTime->minute >= 60 || dateTime->hour >= 24 || dateTime->day > 32 || dateTime->weekday > 6 || dateTime->month > 12 || dateTime->year < 1900 || dateTime->year >= 2100)
 {
 return 1;
 }

 unsigned char buffer[7];

 buffer[0] = ((((dateTime->second) / 10) << 4) + ((dateTime->second) % 10)) & 0x7F;
 buffer[1] = ((((dateTime->minute) / 10) << 4) + ((dateTime->minute) % 10)) & 0x7F;
 buffer[2] = ((((dateTime->hour) / 10) << 4) + ((dateTime->hour) % 10)) & 0x3F;
 buffer[3] = ((((dateTime->day) / 10) << 4) + ((dateTime->day) % 10)) & 0x3F;
 buffer[4] = ((((dateTime->weekday) / 10) << 4) + ((dateTime->weekday) % 10)) & 0x07;
 buffer[5] = ((((dateTime->month) / 10) << 4) + ((dateTime->month) % 10)) & 0x1F;

 if (dateTime->year >= 2000)
 {
 buffer[5] |= 0x80;
 buffer[6] = ((((dateTime->year - 2000) / 10) << 4) + ((dateTime->year - 2000) % 10));
 }
 else
 {
 buffer[6] = ((((dateTime->year - 1900) / 10) << 4) + ((dateTime->year - 1900) % 10));
 }

 PCF_Write(0x02, buffer, sizeof(buffer));

 return 0;
}

unsigned char PCF_GetDateTime(PCF_DateTime *dateTime)
{
 unsigned char buffer[7];

 PCF_Read(0x02, buffer, sizeof(buffer));

 dateTime->second = (((buffer[0] >> 4) & 0x07) * 10) + (buffer[0] & 0x0F);
 dateTime->minute = (((buffer[1] >> 4) & 0x07) * 10) + (buffer[1] & 0x0F);
 dateTime->hour = (((buffer[2] >> 4) & 0x03) * 10) + (buffer[2] & 0x0F);
 dateTime->day = (((buffer[3] >> 4) & 0x03) * 10) + (buffer[3] & 0x0F);
 dateTime->weekday = (buffer[4] & 0x07);
 dateTime->month = ((buffer[5] >> 4) & 0x01) * 10 + (buffer[5] & 0x0F);
 dateTime->year = 1900 + ((buffer[6] >> 4) & 0x0F) * 10 + (buffer[6] & 0x0F);

 if (buffer[5] & 0x80)
 {
 dateTime->year += 100;
 }

 if (buffer[0] & 0x80) 
 {
 return 1;
 }

 return 0;
}
