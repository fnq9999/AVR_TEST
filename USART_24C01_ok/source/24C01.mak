CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -D_EE_EXTIO -DATMega1280  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0xe4.0x20000 -dram_end:0x21ff -bdata:0x200.0x21ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = main.o AT24C01.o buzz.o delay.o hc595.o key.o sio.o TWI.o spi.o 

24C01:	$(FILES)
	$(CC) -o 24C01 $(LFLAGS) @24C01.lk   -lcatm128
main.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h D:\iccv7avr\include\time.h
main.o:	main.c
	$(CC) -c $(CFLAGS) main.c
AT24C01.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
AT24C01.o:	lib\AT24C01.c
	$(CC) -c $(CFLAGS) lib\AT24C01.c
buzz.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
buzz.o:	lib\buzz.c
	$(CC) -c $(CFLAGS) lib\buzz.c
delay.o: D:\iccv7avr\include\iom128v.h
delay.o:	lib\delay.c
	$(CC) -c $(CFLAGS) lib\delay.c
hc595.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
hc595.o:	lib\hc595.c
	$(CC) -c $(CFLAGS) lib\hc595.c
key.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
key.o:	lib\key.c
	$(CC) -c $(CFLAGS) lib\key.c
sio.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
sio.o:	lib\sio.c
	$(CC) -c $(CFLAGS) lib\sio.c
TWI.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
TWI.o:	lib\TWI.c
	$(CC) -c $(CFLAGS) lib\TWI.c
spi.o: .\config.h D:\iccv7avr\include\iom128v.h D:\iccv7avr\include\macros.h D:\iccv7avr\include\AVRdef.h .\lib\TWI.h .\lib\delay.h .\lib\AT24C01.h .\lib\sio.h .\lib\hc595.h .\lib\key.h .\lib\buzz.h .\lib\spi.h
spi.o:	lib\spi.c
	$(CC) -c $(CFLAGS) lib\spi.c
