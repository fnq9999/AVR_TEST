	.module cf8563.c
	.area text(rom, con, rel)
	.dbfile D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\cf8563.c
	.dbfunc e TWI_Init _TWI_Init fV
	.even
_TWI_Init::
	.dbline -1
	.dbline 16
; /*
;  * PCF8563.c
;  *
;  * Created: 2014-11-18 20:00:32
;  *  Author: Jakub Pachciarek
;  *
;  * Not implemented:
;  * - TEST1, STOP, TESTC, TI_TP bits - can be accessed trough raw PCF_Write and PCF_Read
;  */ 
; #include "..\config.h"
; #include <iom128v.h>
; #include "cf8563.h"
; //PHYSICAL LAYER
; 
; void TWI_Init()
; {
	.dbline 18
; 	//About 100kHz for 1.6MHz clock
; 	TWBR = 0;										//Set bitrate factor to 0
	clr R2
	sts 112,R2
	.dbline 19
; 	TWSR &= ~((1<<TWPS1) | (1<<TWPS0));				//Set prescaler to 1
	lds R24,113
	andi R24,252
	sts 113,R24
	.dbline -2
L4:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e TWI_Start _TWI_Start fV
	.even
_TWI_Start::
	.dbline -1
	.dbline 23
; }
; 
; void TWI_Start()
; {
	.dbline 24
; 	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWSTA);
	ldi R24,164
	sts 116,R24
L6:
	.dbline 25
; 	while (!(TWCR & (1<<TWINT)));
L7:
	.dbline 25
	lds R2,116
	sbrs R2,7
	rjmp L6
X0:
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e TWI_Stop _TWI_Stop fV
	.even
_TWI_Stop::
	.dbline -1
	.dbline 29
; }
; 
; void TWI_Stop()
; {
	.dbline 30
; 	TWCR = (1<<TWINT) | (1<<TWEN) | (1<<TWSTO);
	ldi R24,148
	sts 116,R24
L10:
	.dbline 31
; 	while ((TWCR & (1<<TWSTO)));
L11:
	.dbline 31
	lds R2,116
	sbrc R2,4
	rjmp L10
X1:
	.dbline -2
L9:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e TWI_Read _TWI_Read fc
;            ack -> R10
	.even
_TWI_Read::
	xcall push_xgset300C
	mov R10,R16
	.dbline -1
	.dbline 35
; }
; 
; uint8_t TWI_Read(uint8_t ack)
; {
	.dbline 36
; 	TWCR = (1<<TWINT) | (1<<TWEN) | (((ack ? 1 : 0)<<TWEA));
	tst R10
	breq L14
X2:
	ldi R20,1
	ldi R21,0
	xjmp L15
L14:
	clr R20
	clr R21
L15:
	ldi R18,6
	ldi R19,0
	movw R16,R20
	xcall lsl16
	movw R24,R16
	ori R24,132
	sts 116,R24
L16:
	.dbline 37
; 	while (!(TWCR & (1<<TWINT)));
L17:
	.dbline 37
	lds R2,116
	sbrs R2,7
	rjmp L16
X3:
	.dbline 38
; 	return TWDR;
	lds R16,115
	.dbline -2
L13:
	.dbline 0 ; func end
	xjmp pop_xgset300C
	.dbsym r ack 10 c
	.dbend
	.dbfunc e TWI_Write _TWI_Write fV
;           byte -> R16
	.even
_TWI_Write::
	.dbline -1
	.dbline 42
; }
; 
; void TWI_Write(uint8_t byte)
; {
	.dbline 43
; 	TWDR = byte;
	sts 115,R16
	.dbline 44
; 	TWCR = (1<<TWINT) | (1<<TWEN);
	ldi R24,132
	sts 116,R24
L20:
	.dbline 45
; 	while (!(TWCR & (1<<TWINT)));
L21:
	.dbline 45
	lds R2,116
	sbrs R2,7
	rjmp L20
X4:
	.dbline -2
L19:
	.dbline 0 ; func end
	ret
	.dbsym r byte 16 c
	.dbend
	.dbfunc e PCF_Write _PCF_Write fV
;          count -> R10
;           data -> R20,R21
;           addr -> R12
	.even
_PCF_Write::
	xcall push_xgset303C
	movw R20,R18
	mov R12,R16
	ldd R10,y+6
	.dbline -1
	.dbline 51
; }
; 
; 
; //COMMUNICATION LAYER
; 
; void PCF_Write(uint8_t addr, uint8_t *data, uint8_t count) {
	.dbline 52
; 	TWI_Start();
	xcall _TWI_Start
	.dbline 54
; 
; 	TWI_Write(PCF8563_WRITE_ADDR);
	ldi R16,162
	xcall _TWI_Write
	.dbline 55
; 	TWI_Write(addr);
	mov R16,R12
	xcall _TWI_Write
	xjmp L25
L24:
	.dbline 57
; 
; 	while (count) {
	.dbline 58
; 		count--;
	dec R10
	.dbline 60
; 
; 		TWI_Write(*data);
	movw R30,R20
	ldd R16,z+0
	xcall _TWI_Write
	.dbline 61
; 		data++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 62
; 	}
L25:
	.dbline 57
	tst R10
	brne L24
X5:
	.dbline 64
; 
; 	TWI_Stop();
	xcall _TWI_Stop
	.dbline -2
L23:
	.dbline 0 ; func end
	xjmp pop_xgset303C
	.dbsym r count 10 c
	.dbsym r data 20 pc
	.dbsym r addr 12 c
	.dbend
	.dbfunc e PCF_Read _PCF_Read fV
;          count -> R10
;           data -> R20,R21
;           addr -> R12
	.even
_PCF_Read::
	xcall push_xgset303C
	movw R20,R18
	mov R12,R16
	ldd R10,y+6
	.dbline -1
	.dbline 68
; 
; }
; 
; void PCF_Read(uint8_t addr, uint8_t *data, uint8_t count) {
	.dbline 69
; 	TWI_Start();
	xcall _TWI_Start
	.dbline 71
; 
; 	TWI_Write(PCF8563_WRITE_ADDR);
	ldi R16,162
	xcall _TWI_Write
	.dbline 72
; 	TWI_Write(addr);
	mov R16,R12
	xcall _TWI_Write
	.dbline 74
; 
; 	TWI_Stop();
	xcall _TWI_Stop
	.dbline 75
; 	TWI_Start();
	xcall _TWI_Start
	.dbline 77
; 
; 	TWI_Write(PCF8563_READ_ADDR);
	ldi R16,163
	xcall _TWI_Write
	xjmp L29
L28:
	.dbline 80
; 
; 	while (count)
; 	{
	.dbline 81
; 		count--;
	dec R10
	.dbline 83
; 
; 		*data = TWI_Read(count);
	mov R16,R10
	xcall _TWI_Read
	movw R30,R20
	std z+0,R16
	.dbline 84
; 		data++;
	subi R20,255  ; offset = 1
	sbci R21,255
	.dbline 85
; 	}
L29:
	.dbline 79
	tst R10
	brne L28
X6:
	.dbline 87
; 
; 	TWI_Stop();
	xcall _TWI_Stop
	.dbline -2
L27:
	.dbline 0 ; func end
	xjmp pop_xgset303C
	.dbsym r count 10 c
	.dbsym r data 20 pc
	.dbsym r addr 12 c
	.dbend
	.dbfunc e PCF_Init _PCF_Init fV
;           mode -> y+2
	.even
_PCF_Init::
	.dbline 0 ; func end
	ret
	.dbsym l mode 0 c
	.dbend
	.dbfunc e PCF_GetAndClearFlags _PCF_GetAndClearFlags fc
	.even
_PCF_GetAndClearFlags::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e PCF_SetClockOut _PCF_SetClockOut fV
;           mode -> y+2
	.even
_PCF_SetClockOut::
	.dbline 0 ; func end
	ret
	.dbsym l mode 0 c
	.dbend
	.dbfunc e PCF_SetTimer _PCF_SetTimer fV
;          count -> y+4
;           mode -> y+2
	.even
_PCF_SetTimer::
	.dbline 0 ; func end
	ret
	.dbsym l count 2 c
	.dbsym l mode 0 c
	.dbend
	.dbfunc e PCF_GetTimer _PCF_GetTimer fc
	.even
_PCF_GetTimer::
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e PCF_SetAlarm _PCF_SetAlarm fc
	.dbstruct 0 4 .2
	.dbfield 0 minute c
	.dbfield 1 hour c
	.dbfield 2 day c
	.dbfield 3 weekday c
	.dbend
;          alarm -> R0,R1
	.even
_PCF_SetAlarm::
	.dbline 0 ; func end
	ret
	.dbsym l alarm 0 pS[.2]
	.dbend
	.dbfunc e PCF_GetAlarm _PCF_GetAlarm fc
;          alarm -> R0,R1
	.even
_PCF_GetAlarm::
	.dbline 0 ; func end
	ret
	.dbsym l alarm 0 pS[.2]
	.dbend
