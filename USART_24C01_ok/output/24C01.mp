NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   008C   001C =     28. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       008C  __lit_start
       00A8  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   00A8   016C =    364. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00A8  __idata_start
       0214  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0214   1CCE =   7374. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       010A  __text_start
       010A  __start
       012C  _exit
       012D  _val_pc_to_msc
       017E  _time_init
       01B1  _pre_transfer
       01DB  _val_msc_to_pc
       023E  _len
       0250  _msc_to_pc
       0262  _pc_to_msc
       0272  _out_to_user
       03D5  _main
       04FF  _wt24c_fc
       052B  _pcf_set_byte
       053F  _wt24c_fc_pcf
       056B  _wt24c
       05CF  _rd24c
       05FE  _rd24c_pcf
       062D  _pcf_stop
       063A  _pcf_start
       0647  _pcfset
       0657  _pcfread
       0666  _Buzz_init
       0671  _Beep
       0687  _delay_nus
       068E  _delay_1ms
       0691  _delay_nms
       06A1  _HC_595_init
       06B3  _HC_595_OUT
       06BC  _Seg7_Led_Update
       0737  _Seg7_Led_display
       07D5  _Seg7_Led_float
       08BF  _Key_init
       08C4  _get_key
       08E3  _Com_init
       08F5  _Com_disable
       08FB  _Com_baudrate
       0929  _Com_putchar
       0939  _Com_putstring
       095D  _Com_getchar
       097E  _Com_Rbuf_Clear
       0986  _Com_getstring
       09C4  _Com_R_count
       09C7  _Rbuf_init
       09CE  _Tbuf_init
       09E4  _Rbuf_empty
       09F3  _Tbuf_full
       0A04  _Tbuf_putchar
       0A3B  _Rbuf_getchar
       0A5E  _uart0_rx_isr
       0AA1  _getstr
       0ACF  _uart0_tx_isr
       0B18  _twi_init
       0B26  _i2cstart
       0B2E  _i2cwt
       0B3C  _i2crd
       0B46  _i2cstop
       0B4A  _spi_init
       0B50  _SPI_MasterTransmit
       0B54  _init_ds18b20
       0B84  _readonebyte
       0BB2  _writeonebyte
       0BE2  _read_temperature
       0C02  _convert_temp_data
       0C88  push_arg4
       0C8A  push_arg2
       0C8D  mod16u
       0C8F  div16u
       0C90  xdiv16u
       0CA9  div32u
       0CAB  mod32u
       0CAF  div32s
       0CB1  mod32s
       0CDD  long_div_prolog
       0CF0  long_div_epilog
       0D00  tst_R16_R19
       0D05  tst_R24_R27
       0D0A  neg_R24_R27
       0D13  mod8u
       0D15  div8u
       0D16  xdiv8u
       0D2B  elpm32
       0D3F  empy16s
       0D4F  pop_xgset003C
       0D54  pop_xgset00FC
       0D5B  pop_xgset30FC
       0D64  pop_xgsetF0FC
       0D6F  push_xgsetF0FC
       0D71  push_xgset30FC
       0D73  push_xgset00FC
       0D75  push_xgset003C
       0D7A  push_xgset300C
       0D7F  pop_xgset300C
       0D84  push_xgsetF000
       0D89  pop_xgsetF000
       0D8E  push_xgsetF00C
       0D95  pop_xgsetF00C
       0D9C  push_xgsetF03C
       0DA5  pop_xgsetF03C
       0DAE  neg32
       0DB7  lsl32
       0DC3  lsl8
       0DC9  fpsub
       0DCB  fpadd
       0DCC  fpadd_alt
       0E33  fpadd2
       0E3E  fpint
       0E70  unpacks
       0E78  tstR16_R19
       0E80  unpacku
       0E99  normalize_and_pack
       0ECE  pack
       0EDE  saveFPRegs
       0EED  restoreFPRegs
       0EFC  fpmule
       0F4F  fpmule1
       0F59  fpcmp
       0F66  fpcmp1
       0F71  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   016C =    364. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _read_buf
       0114  _out_buf
       0146  _ind
       0228  _Seg7_Data
       0239  _point
       023A  _point_pos
       0245  _current_temp_display_buffer
       0254  _currentT
       0255  _df_table
       0265  _ds18b20_error
       0266  _temp_value
       0268  _display_digit
       026C  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   026C   00FD =    253. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       026C  _tem2
       026C  __bss_start
       0280  _tem
       0294  _syserr
       0295  _Seg7_Led_Buf
       0299  _RTbuf_UART0
       0369  __bss_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                          vector   0000   0054 =     84. bytes (abs,ovr,rom)

Files Linked      [ module(s) ]

D:\iccv7avr\lib\crtatmega.o	[ crtatmega.s ]
main.o	[ main.c ]
AT24C01.o	[ AT24C01.c ]
buzz.o	[ buzz.c ]
delay.o	[ delay.c ]
hc595.o	[ hc595.c ]
key.o	[ key.c ]
sio.o	[ sio.c ]
TWI.o	[ TWI.c ]
spi.o	[ spi.c ]
DS18B20.o	[ DS18B20.c ]
<library>	[ asave.s, div16u.s, div32.s, div8u.s, elpm32.s, emul16s.s, gpop2.s, gpop3.s, gpop4.s, gpop5.s, gpush.s ]
[ gpushx.s, gpushy.s, gpushz.s, gpushb.s, lneg.s, lsl32.s, lsl8.s, fpadd.s, fpadd2.s, fpint.s, fputil.s ]
[ fpmule.s, fpmule1.s, fpcmp.s, fpcmp1.s ]

User Global Definitions

ram_end = 0x10ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0x8c
data = 0x100
eeprom:0.4096

