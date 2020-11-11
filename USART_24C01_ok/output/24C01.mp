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
                           idata   00A8   016B =    363. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00A8  __idata_start
       0213  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   0214   1C94 =   7316. bytes (rel,con,rom)

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
       04EC  _wt24c_fc
       0518  _pcf_set_byte
       052C  _wt24c_fc_pcf
       0558  _wt24c
       05BC  _rd24c
       05EB  _rd24c_pcf
       061A  _pcf_stop
       0627  _pcf_start
       0634  _pcfset
       0644  _pcfread
       0653  _Buzz_init
       065E  _Beep
       0674  _delay_1us
       0676  _delay_nus
       0684  _delay_1ms
       068E  _delay_nms
       069C  _HC_595_init
       06AE  _HC_595_OUT
       06B7  _Seg7_Led_Update
       0732  _Seg7_Led_display
       07D0  _Seg7_Led_float
       08BA  _Key_init
       08BF  _get_key
       08DE  _Com_init
       08F0  _Com_baudrate
       091E  _Com_putchar
       092E  _Com_putstring
       0952  _Com_getchar
       0973  _Com_Rbuf_Clear
       097B  _Com_getstring
       09B9  _Com_R_count
       09BC  _Rbuf_init
       09C3  _Tbuf_init
       09D9  _Rbuf_empty
       09E8  _Tbuf_full
       09F9  _Tbuf_putchar
       0A30  _Rbuf_getchar
       0A53  _uart0_rx_isr
       0A96  _getstr
       0AC4  _uart0_tx_isr
       0B0D  _twi_init
       0B1B  _i2cstart
       0B23  _i2cwt
       0B31  _i2crd
       0B3B  _i2cstop
       0B3F  _spi_init
       0B45  _SPI_MasterTransmit
       0B49  _init_ds18b20
       0B6F  _readonebyte
       0B99  _writeonebyte
       0BC5  _read_temperature
       0BE5  _convert_temp_data
       0C6B  push_arg4
       0C6D  push_arg2
       0C70  mod16u
       0C72  div16u
       0C73  xdiv16u
       0C8C  div32u
       0C8E  mod32u
       0C92  div32s
       0C94  mod32s
       0CC0  long_div_prolog
       0CD3  long_div_epilog
       0CE3  tst_R16_R19
       0CE8  tst_R24_R27
       0CED  neg_R24_R27
       0CF6  mod8u
       0CF8  div8u
       0CF9  xdiv8u
       0D0E  elpm32
       0D22  empy16s
       0D32  pop_xgset003C
       0D37  pop_xgset00FC
       0D3E  pop_xgset30FC
       0D47  pop_xgsetF0FC
       0D52  push_xgsetF0FC
       0D54  push_xgset30FC
       0D56  push_xgset00FC
       0D58  push_xgset003C
       0D5D  push_xgset300C
       0D62  pop_xgset300C
       0D67  push_xgsetF000
       0D6C  pop_xgsetF000
       0D71  push_xgsetF00C
       0D78  pop_xgsetF00C
       0D7F  push_xgsetF03C
       0D88  pop_xgsetF03C
       0D91  neg32
       0D9A  lsl32
       0DA6  lsl8
       0DAC  fpsub
       0DAE  fpadd
       0DAF  fpadd_alt
       0E16  fpadd2
       0E21  fpint
       0E53  unpacks
       0E5B  tstR16_R19
       0E63  unpacku
       0E7C  normalize_and_pack
       0EB1  pack
       0EC1  saveFPRegs
       0ED0  restoreFPRegs
       0EDF  fpmule
       0F32  fpmule1
       0F3C  fpcmp
       0F49  fpcmp1
       0F54  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0100   016B =    363. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __data_start
       0100  _read_buf
       0114  _out_buf
       0146  _ind
       0227  _Seg7_Data
       0238  _point
       0239  _point_pos
       0244  _current_temp_display_buffer
       0253  _currentT
       0254  _df_table
       0264  _ds18b20_error
       0265  _temp_value
       0267  _display_digit
       026B  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   026B   00FD =    253. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       026B  _tem2
       026B  __bss_start
       027F  _tem
       0293  _syserr
       0294  _Seg7_Led_Buf
       0298  _RTbuf_UART0
       0368  __bss_end

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

