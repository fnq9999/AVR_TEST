#ifndef tem_ds18b20_H
#define tem_ds18b20_H 1


//设置数据方向
#define DQ_DDR_0() DDRF &=~(1<< PF2)
#define DQ_DDR_1() DDRF |=(1<< PF2)

//设置管引脚定义
#define DQ_1()   PORTF |=(1<< PF2)
#define DQ_0()   PORTF &=~(1<< PF2)
#define RD_DQ_VAL()     (PINF &(1<<PF2))

extern  unsigned char currentT;
extern char current_temp_display_buffer[];
extern unsigned char display_digit[];


unsigned char  init_ds18b20(void);
unsigned char  readonebyte(void);
void writeonebyte(unsigned char dat);
unsigned char read_temperature(void);
void convert_temp_data(void);

#endif
