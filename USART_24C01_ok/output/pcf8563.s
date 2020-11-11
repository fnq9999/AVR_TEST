	.module pcf8563.c
	.area text(rom, con, rel)
	.dbfile D:\desk_station\LM041L\AVR_licheng\USART_24C01_ok\source\lib\pcf8563.c
	.dbfunc e i2c_write_n_bytes _i2c_write_n_bytes fc
;              i -> R20,R21
;            DAT -> R10,R11
;              N -> R12,R13
;           ADDR -> R18,R19
;          SLA_W -> R16
	.even
_i2c_write_n_bytes::
	xcall push_xgset303C
	ldd R12,y+6
	ldd R13,y+7
	ldd R10,y+8
	ldd R11,y+9
	.dbline -1
	.dbline 38
; /************************************************
; 文件：AT24C01.c
; 用途：AT24C01操作函数
; 注意：
; 创建：2008.1.26
; 修改：2008.1.26
; Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
; ************************************************/
; #include "..\config.h"
; 
; #define I2C_START()                            TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWSTA)
; #define I2C_STOP()                          TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWSTO)
; #define I2C_ACK()                          TWCR = BIT(TWINT)|BIT(TWEN)|BIT(TWEA)
; #define I2C_NAK()                          TWCR = BIT(TWINT)|BIT(TWEN)
; #define I2C_CHECK_STATUS(X)          {while(!(TWCR&BIT(TWINT))); if((TWSR&0xF8)!=(X)) return 0;}
; #define I2C_WRITE(X)                  TWDR = (X)
; #define I2C_READ(X)                          (X) = TWDR
; 
; //TWSR&0xF8 状态码
; #define START                                  0x08
; #define RE_START                          0x10
; #define MT_SLA_ACK                          0x18
; #define MT_SLA_NAK                          0x20
; #define MT_DATA_ACK                          0x28
; #define MT_DATA_NAK                          0x30
; #define SLA_DATA_FAIL                  0x38
; #define MR_SLA_ACK                          0x40
; #define MR_SLA_NAK                          0x48
; #define MR_DATA_ACK                          0x50
; #define MR_DATA_NAK                          0x58
; #define SLA_R_PCF8563                  0xA3
; #define SLA_W_PCF8563                  0xA2
; 
; 
; 
; unsigned char i2c_write_n_bytes(unsigned char SLA_W, unsigned int ADDR,
;                                 unsigned int N, unsigned char *DAT)
; {
	.dbline 40
; unsigned int i;
; I2C_START();
	ldi R24,164
	sts 116,R24
	.dbline 41
; I2C_CHECK_STATUS(START);
L3:
	.dbline 41
L4:
	.dbline 41
	lds R2,116
	sbrs R2,7
	rjmp L3
X0:
	.dbline 41
	lds R24,113
	andi R24,248
	cpi R24,8
	breq L6
X1:
	.dbline 41
	clr R16
	xjmp L2
L6:
	.dbline 41
	.dbline 41
	.dbline 43
; 
; I2C_WRITE(SLA_W);
	sts 115,R16
	.dbline 44
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 45
; I2C_CHECK_STATUS(MT_SLA_ACK);
L8:
	.dbline 45
L9:
	.dbline 45
	lds R2,116
	sbrs R2,7
	rjmp L8
X2:
	.dbline 45
	lds R24,113
	andi R24,248
	cpi R24,24
	breq L11
X3:
	.dbline 45
	clr R16
	xjmp L2
L11:
	.dbline 45
	.dbline 45
	.dbline 47
; 
; if(SLA_W!=SLA_W_PCF8563)
	cpi R16,162
	breq L13
X4:
	.dbline 48
; {
	.dbline 49
;   I2C_WRITE((unsigned char)(ADDR>>8));
	movw R2,R18
	mov R2,R3
	clr R3
	sts 115,R2
	.dbline 50
;   I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 51
;   I2C_CHECK_STATUS(MT_DATA_ACK);
L15:
	.dbline 51
L16:
	.dbline 51
	lds R2,116
	sbrs R2,7
	rjmp L15
X5:
	.dbline 51
	lds R24,113
	andi R24,248
	cpi R24,40
	breq L18
X6:
	.dbline 51
	clr R16
	xjmp L2
L18:
	.dbline 51
	.dbline 51
	.dbline 52
; }
L13:
	.dbline 53
; I2C_WRITE((unsigned char)ADDR);
	sts 115,R18
	.dbline 54
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 55
; I2C_CHECK_STATUS(MT_DATA_ACK);
L20:
	.dbline 55
L21:
	.dbline 55
	lds R2,116
	sbrs R2,7
	rjmp L20
X7:
	.dbline 55
	lds R24,113
	andi R24,248
	cpi R24,40
	breq L23
X8:
	.dbline 55
	clr R16
	xjmp L2
L23:
	.dbline 55
	.dbline 55
	.dbline 57
; 
; for(i=0;i<N;i++)
	clr R20
	clr R21
	xjmp L28
L25:
	.dbline 58
; {
	.dbline 59
;   I2C_WRITE(DAT[i]);
	movw R30,R20
	add R30,R10
	adc R31,R11
	ldd R2,z+0
	sts 115,R2
	.dbline 60
;   I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 61
;   I2C_CHECK_STATUS(MT_DATA_ACK);
L29:
	.dbline 61
L30:
	.dbline 61
	lds R2,116
	sbrs R2,7
	rjmp L29
X9:
	.dbline 61
	lds R24,113
	andi R24,248
	cpi R24,40
	breq L32
X10:
	.dbline 61
	clr R16
	xjmp L2
L32:
	.dbline 61
	.dbline 61
	.dbline 62
; }
L26:
	.dbline 57
	subi R20,255  ; offset = 1
	sbci R21,255
L28:
	.dbline 57
	cp R20,R12
	cpc R21,R13
	brlo L25
X11:
	.dbline 64
; 
; I2C_STOP();
	ldi R24,148
	sts 116,R24
	.dbline 65
; return 1;
	ldi R16,1
	.dbline -2
L2:
	.dbline 0 ; func end
	xjmp pop_xgset303C
	.dbsym r i 20 i
	.dbsym r DAT 10 pc
	.dbsym r N 12 i
	.dbsym r ADDR 18 i
	.dbsym r SLA_W 16 c
	.dbend
	.dbfunc e i2c_read_n_bytes _i2c_read_n_bytes fc
;              i -> R22,R23
;            DAT -> R10,R11
;              N -> R20,R21
;           ADDR -> R18,R19
;          SLA_R -> R16
	.even
_i2c_read_n_bytes::
	xcall push_xgsetF00C
	ldd R20,y+6
	ldd R21,y+7
	ldd R10,y+8
	ldd R11,y+9
	.dbline -1
	.dbline 71
; }
; 
; 
; 
; unsigned char i2c_read_n_bytes(unsigned char SLA_R, unsigned int ADDR,
;                                unsigned int N, unsigned char *DAT){
	.dbline 77
; 
; 
; 
; unsigned int i;
; 
; I2C_START();
	ldi R24,164
	sts 116,R24
	.dbline 78
; I2C_CHECK_STATUS(START);
L35:
	.dbline 78
L36:
	.dbline 78
	lds R2,116
	sbrs R2,7
	rjmp L35
X12:
	.dbline 78
	lds R24,113
	andi R24,248
	cpi R24,8
	breq L38
X13:
	.dbline 78
	clr R16
	xjmp L34
L38:
	.dbline 78
	.dbline 78
	.dbline 80
; 
; I2C_WRITE((SLA_R)-1);
	mov R24,R16
	subi R24,1
	sts 115,R24
	.dbline 81
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 82
; I2C_CHECK_STATUS(MT_SLA_ACK);
L40:
	.dbline 82
L41:
	.dbline 82
	lds R2,116
	sbrs R2,7
	rjmp L40
X14:
	.dbline 82
	lds R24,113
	andi R24,248
	cpi R24,24
	breq L43
X15:
	.dbline 82
	clr R16
	xjmp L34
L43:
	.dbline 82
	.dbline 82
	.dbline 84
; 
; if(SLA_R!=SLA_R_PCF8563)
	cpi R16,163
	breq L45
X16:
	.dbline 85
; {
	.dbline 86
;   I2C_WRITE((unsigned char)(ADDR>>8));
	movw R2,R18
	mov R2,R3
	clr R3
	sts 115,R2
	.dbline 87
;   I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 88
;   I2C_CHECK_STATUS(MT_DATA_ACK);
L47:
	.dbline 88
L48:
	.dbline 88
	lds R2,116
	sbrs R2,7
	rjmp L47
X17:
	.dbline 88
	lds R24,113
	andi R24,248
	cpi R24,40
	breq L50
X18:
	.dbline 88
	clr R16
	xjmp L34
L50:
	.dbline 88
	.dbline 88
	.dbline 89
; }
L45:
	.dbline 90
; I2C_WRITE((unsigned char)ADDR);
	sts 115,R18
	.dbline 91
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 92
; I2C_CHECK_STATUS(MT_DATA_ACK);
L52:
	.dbline 92
L53:
	.dbline 92
	lds R2,116
	sbrs R2,7
	rjmp L52
X19:
	.dbline 92
	lds R24,113
	andi R24,248
	cpi R24,40
	breq L55
X20:
	.dbline 92
	clr R16
	xjmp L34
L55:
	.dbline 92
	.dbline 92
	.dbline 94
; 
; I2C_START();
	ldi R24,164
	sts 116,R24
	.dbline 95
; I2C_CHECK_STATUS(RE_START);
L57:
	.dbline 95
L58:
	.dbline 95
	lds R2,116
	sbrs R2,7
	rjmp L57
X21:
	.dbline 95
	lds R24,113
	andi R24,248
	cpi R24,16
	breq L60
X22:
	.dbline 95
	clr R16
	xjmp L34
L60:
	.dbline 95
	.dbline 95
	.dbline 97
; 
; I2C_WRITE(SLA_R);
	sts 115,R16
	.dbline 98
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 99
; I2C_CHECK_STATUS(MR_SLA_ACK);
L62:
	.dbline 99
L63:
	.dbline 99
	lds R2,116
	sbrs R2,7
	rjmp L62
X23:
	.dbline 99
	lds R24,113
	andi R24,248
	cpi R24,64
	breq L65
X24:
	.dbline 99
	clr R16
	xjmp L34
L65:
	.dbline 99
	.dbline 99
	.dbline 101
; 
; if(N>1)
	ldi R24,1
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brsh L67
X25:
	.dbline 102
; {
	.dbline 103
;   for(i=0;i<N-1;i++)
	clr R22
	clr R23
	xjmp L72
L69:
	.dbline 104
;   {
	.dbline 105
;    I2C_ACK();
	ldi R24,196
	sts 116,R24
	.dbline 106
;    I2C_CHECK_STATUS(MR_DATA_ACK);
L73:
	.dbline 106
L74:
	.dbline 106
	lds R2,116
	sbrs R2,7
	rjmp L73
X26:
	.dbline 106
	lds R24,113
	andi R24,248
	cpi R24,80
	breq L76
X27:
	.dbline 106
	clr R16
	xjmp L34
L76:
	.dbline 106
	.dbline 106
	.dbline 107
;    I2C_READ(DAT[i]);
	movw R30,R22
	add R30,R10
	adc R31,R11
	lds R2,115
	std z+0,R2
	.dbline 108
;   }
L70:
	.dbline 103
	subi R22,255  ; offset = 1
	sbci R23,255
L72:
	.dbline 103
	movw R24,R20
	sbiw R24,1
	cp R22,R24
	cpc R23,R25
	brlo L69
X28:
	.dbline 109
; }
L67:
	.dbline 110
; I2C_NAK();
	ldi R24,132
	sts 116,R24
	.dbline 111
; I2C_CHECK_STATUS(MR_DATA_NAK);
L78:
	.dbline 111
L79:
	.dbline 111
	lds R2,116
	sbrs R2,7
	rjmp L78
X29:
	.dbline 111
	lds R24,113
	andi R24,248
	cpi R24,88
	breq L81
X30:
	.dbline 111
	clr R16
	xjmp L34
L81:
	.dbline 111
	.dbline 111
	.dbline 112
; DAT[N-1]=TWDR;
	movw R30,R20
	sbiw R30,1
	add R30,R10
	adc R31,R11
	lds R2,115
	std z+0,R2
	.dbline 114
; 
; I2C_STOP();
	ldi R24,148
	sts 116,R24
	.dbline 115
; return 1;
	ldi R16,1
	.dbline -2
L34:
	.dbline 0 ; func end
	xjmp pop_xgsetF00C
	.dbsym r i 22 i
	.dbsym r DAT 10 pc
	.dbsym r N 20 i
	.dbsym r ADDR 18 i
	.dbsym r SLA_R 16 c
	.dbend
	.dbfunc e i2c_check_busy _i2c_check_busy fc
;           retv -> R20
;          SLA_W -> R16
	.even
_i2c_check_busy::
	st -y,R20
	.dbline -1
	.dbline 120
; }
; 
; 
; unsigned char i2c_check_busy(unsigned char SLA_W)
; {
	.dbline 121
; unsigned char retv=0;
	clr R20
	.dbline 122
; I2C_START();
	ldi R24,164
	sts 116,R24
	.dbline 123
; I2C_CHECK_STATUS(START);
L84:
	.dbline 123
L85:
	.dbline 123
	lds R2,116
	sbrs R2,7
	rjmp L84
X31:
	.dbline 123
	lds R24,113
	andi R24,248
	cpi R24,8
	breq L87
X32:
	.dbline 123
	clr R16
	xjmp L83
L87:
	.dbline 123
	.dbline 123
	.dbline 124
; I2C_WRITE(SLA_W);
	sts 115,R16
	.dbline 125
; I2C_NAK();
	ldi R24,132
	sts 116,R24
L89:
	.dbline 126
; while(!(TWCR&BIT(TWINT)));
L90:
	.dbline 126
	lds R2,116
	sbrs R2,7
	rjmp L89
X33:
	.dbline 127
; if((TWSR&0xF8)!=MT_SLA_ACK)  retv=1;
	lds R24,113
	andi R24,248
	cpi R24,24
	breq L92
X34:
	.dbline 127
	ldi R20,1
L92:
	.dbline 128
; I2C_STOP();
	ldi R24,148
	sts 116,R24
	.dbline 129
; return retv;
	mov R16,R20
	.dbline -2
L83:
	.dbline 0 ; func end
	ld R20,y+
	ret
	.dbsym r retv 20 c
	.dbsym r SLA_W 16 c
	.dbend
	.dbfunc e PCF8563_stop _PCF8563_stop fV
;       stopcode -> y+4
	.even
_PCF8563_stop::
	sbiw R28,5
	.dbline -1
	.dbline 133
; }
; 
; void PCF8563_stop(void)
; {
	.dbline 134
; unsigned char stopcode=0x20;
	ldi R24,32
	std y+4,R24
	.dbline 135
; i2c_write_n_bytes(SLA_W_PCF8563,0,1,&stopcode);
	movw R24,R28
	adiw R24,4
	std y+3,R25
	std y+2,R24
	ldi R24,1
	ldi R25,0
	std y+1,R25
	std y+0,R24
	clr R18
	clr R19
	ldi R16,162
	xcall _i2c_write_n_bytes
	.dbline -2
L94:
	.dbline 0 ; func end
	adiw R28,5
	ret
	.dbsym l stopcode 4 c
	.dbend
	.dbfunc e PCF8563_start _PCF8563_start fV
;      startcode -> y+4
	.even
_PCF8563_start::
	sbiw R28,5
	.dbline -1
	.dbline 139
; }
; 
; void PCF8563_start(void)
; {
	.dbline 140
; unsigned char startcode=0x00;
	clr R2
	std y+4,R2
	.dbline 141
; i2c_write_n_bytes(SLA_W_PCF8563,0,1,&startcode);
	movw R24,R28
	adiw R24,4
	std y+3,R25
	std y+2,R24
	ldi R24,1
	ldi R25,0
	std y+1,R25
	std y+0,R24
	clr R18
	clr R19
	ldi R16,162
	xcall _i2c_write_n_bytes
	.dbline -2
L95:
	.dbline 0 ; func end
	adiw R28,5
	ret
	.dbsym l startcode 4 c
	.dbend
	.dbfunc e pcfset _pcfset fV
;           time -> R0,R1
	.even
_pcfset::
	.dbline 0 ; func end
	ret
	.dbsym l time 0 pc
	.dbend
	.dbfunc e pcfread _pcfread fV
;           time -> R0,R1
	.even
_pcfread::
	.dbline 0 ; func end
	ret
	.dbsym l time 0 pc
	.dbend
; }
; 
; void pcfset(unsigned char *time){
; //	 unsigned char time[7];
; /*
; 	 time[6]=yy;//年
; 	 time[5]=mm;//月
; 	 time[4]=da;//星期
; 	 time[3]=dd;//日
; 	 time[2]=hh;//时
; 	 time[1]=mi;//分
; 	 time[0]=ss;//秒
; */
; 	 PCF8563_stop();
; 	 i2c_write_n_bytes(SLA_W_PCF8563,2,7,time);
; 	 PCF8563_start();
; }
; void pcfread(unsigned char *time){
; 	i2c_read_n_bytes(SLA_R_PCF8563,2,7,time);
; //time[6]       //年
; 	
; 	/*
; 	time[5] &= 0x1F;//月
; 	time[4] &= 0x07;//星期
; 	time[3] &= 0x3F;//日
; 	time[2] &= 0x3F;//时
; 	time[1] &= 0x7F;//分
; 	time[0] &= 0x7F;//秒
; 		*/
; }
