CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o AT24C01.o buzz.o delay.o hc595.o key.o sio.o TWI.o spi.o DS18B20.o 

24C01:	$(FILES)
	$(CC) -o 24C01 $(LFLAGS) @24C01.lk   -lcatm128
main.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h D:\iccv7avr\include\time.h
main.o:	..\source\main.c
	$(CC) -c $(CFLAGS) ..\source\main.c
AT24C01.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
AT24C01.o:	..\source\lib\AT24C01.c
	$(CC) -c $(CFLAGS) ..\source\lib\AT24C01.c
buzz.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
buzz.o:	..\source\lib\buzz.c
	$(CC) -c $(CFLAGS) ..\source\lib\buzz.c
delay.o: D:\iccv7avr\include\iom128v.h
delay.o:	..\source\lib\delay.c
	$(CC) -c $(CFLAGS) ..\source\lib\delay.c
hc595.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
hc595.o:	..\source\lib\hc595.c
	$(CC) -c $(CFLAGS) ..\source\lib\hc595.c
key.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
key.o:	..\source\lib\key.c
	$(CC) -c $(CFLAGS) ..\source\lib\key.c
sio.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
sio.o:	..\source\lib\sio.c
	$(CC) -c $(CFLAGS) ..\source\lib\sio.c
TWI.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
TWI.o:	..\source\lib\TWI.c
	$(CC) -c $(CFLAGS) ..\source\lib\TWI.c
spi.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
spi.o:	..\source\lib\spi.c
	$(CC) -c $(CFLAGS) ..\source\lib\spi.c
DS18B20.o: .\..\source\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\..\source\lib\TWI.h .\..\source\lib\delay.h .\..\source\lib\AT24C01.h .\..\source\lib\sio.h .\..\source\lib\hc595.h .\..\source\lib\key.h .\..\source\lib\buzz.h .\..\source\lib\spi.h .\..\source\lib\DS18B20.h
DS18B20.o:	..\source\lib\DS18B20.c
	$(CC) -c $(CFLAGS) ..\source\lib\DS18B20.c
