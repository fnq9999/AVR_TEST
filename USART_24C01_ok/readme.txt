实验名称：AT24C01读写实验
功能描述：实现AT24C01的读写，结果发送到计算机串口。
实验目的：熟悉TWI（I2C）通信协议
	  学习TWI（I2C）器件的使用
	  熟悉串口通信
实验说明：MCU--M128
          内部8M晶振	  
连接方式：插上JMP13的跳线帽，利用串口线将开发板和计算机相连。
		  
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器

创建时间：2008.1.25
最后修改：2008.1.25
修改说明：无

文件结构：

--source
  --lib
    --AT24C01.c
    --AT24C01.h
    --TWI.c
    --TWI.h
    --sio.c
    --sio.h
    --delay.c
    --delay.h
  --config.h
  --24C01.prj
  --main.c
--output
  --24C01.cof
  --24C01.hex
  --24C01_cof.aps
--sch

--datasheet
  --AT24C01.pdf
--readme.txt
