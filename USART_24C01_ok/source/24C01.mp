NOTE: AVR Code addresses are word addresses
All other addresses (including ones in FLASH) are byte addresses

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   00E4   001C =     28. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00E4  __lit_start
       0100  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                           idata   0100   00D5 =    213. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       0100  __idata_start
       01D5  __idata_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   01D6   1828 =   6184. bytes (rel,con,rom)

       Addr  Global Symbol
      -----  --------------------------------
       00EB  __start
       00EB  __text_start
       010D  _exit
       010E  _val_pc_to_msc
       015F  _time_init
       0192  _pre_transfer
       01BC  _val_msc_to_pc
       021F  _len
       0231  _msc_to_pc
       0243  _pc_to_msc
       0253  _out_to_user
       02CE  _main
       03CD  _wt24c_fc
       03F9  _pcf_set_byte
       040D  _wt24c_fc_pcf
       0439  _wt24c
       049D  _rd24c
       04CC  _rd24c_pcf
       04FB  _pcf_stop
       0508  _pcf_start
       0515  _pcfset
       0525  _pcfread
       0534  _Buzz_init
       053F  _Beep
       0555  _delay_1us
       0557  _delay_nus
       0565  _delay_1ms
       056F  _delay_nms
       057D  _HC_595_init
       058F  _HC_595_OUT
       0598  _Seg7_Led_Update
       0613  _Seg7_Led_display
       06A3  _Seg7_Led_float
       078D  _Key_init
       0792  _get_key
       07B1  _Com_init
       07C3  _Com_baudrate
       07F1  _Com_putchar
       0801  _Com_putstring
       0825  _Com_getchar
       0846  _Com_Rbuf_Clear
       084E  _Com_getstring
       088C  _Com_R_count
       088F  _Rbuf_init
       0896  _Tbuf_init
       08AC  _Rbuf_empty
       08BB  _Tbuf_full
       08CC  _Tbuf_putchar
       0903  _Rbuf_getchar
       0926  _uart0_rx_isr
       0969  _getstr
       0997  _uart0_tx_isr
       09E0  _twi_init
       09EE  _i2cstart
       09F6  _i2cwt
       0A04  _i2crd
       0A0E  _i2cstop
       0A12  _spi_init
       0A18  _SPI_MasterTransmit
       0A1C  push_arg4
       0A1E  push_arg2
       0A21  mod16u
       0A23  div16u
       0A24  xdiv16u
       0A3D  div32u
       0A3F  mod32u
       0A43  div32s
       0A45  mod32s
       0A71  long_div_prolog
       0A84  long_div_epilog
       0A94  tst_R16_R19
       0A99  tst_R24_R27
       0A9E  neg_R24_R27
       0AA7  mod8u
       0AA9  div8u
       0AAA  xdiv8u
       0ABF  elpm32
       0AD3  empy16s
       0AE3  pop_xgset003C
       0AE8  pop_xgset00FC
       0AEF  pop_xgset30FC
       0AF8  pop_xgsetF0FC
       0B03  push_xgsetF0FC
       0B05  push_xgset30FC
       0B07  push_xgset00FC
       0B09  push_xgset003C
       0B0E  push_xgset300C
       0B13  pop_xgset300C
       0B18  push_xgsetF000
       0B1D  pop_xgsetF000
       0B22  push_xgsetF00C
       0B29  pop_xgsetF00C
       0B30  push_xgsetF03C
       0B39  pop_xgsetF03C
       0B42  neg32
       0B4B  lsl32
       0B57  fpsub
       0B59  fpadd
       0B5A  fpadd_alt
       0BC1  fpadd2
       0BCC  fpint
       0BFE  unpacks
       0C06  tstR16_R19
       0C0E  unpacku
       0C27  normalize_and_pack
       0C5C  pack
       0C6C  saveFPRegs
       0C7B  restoreFPRegs
       0C8A  fpmule
       0CDD  fpmule1
       0CE7  fpcmp
       0CF4  fpcmp1
       0CFF  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            data   0200   00D5 =    213. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0200  __data_start
       0200  _read_buf
       0214  _out_buf
       0246  _ind
       02B8  _Seg7_Data
       02C9  _point
       02CA  _point_pos
       02D5  __data_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             bss   02D5   00FD =    253. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       02D5  _tem2
       02D5  __bss_start
       02E9  _tem
       02FD  _syserr
       02FE  _Seg7_Led_Buf
       0302  _RTbuf_UART0
       03D2  __bss_end

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
<library>	[ asave.s, div16u.s, div32.s, div8u.s, elpm32.s, emul16s.s, gpop2.s, gpop3.s, gpop4.s, gpop5.s, gpush.s ]
[ gpushx.s, gpushy.s, gpushz.s, gpushb.s, lneg.s, lsl32.s, fpadd.s, fpadd2.s, fpint.s, fputil.s, fpmule.s ]
[ fpmule1.s, fpcmp.s, fpcmp1.s ]

User Global Definitions

ram_end = 0x21ff
hwstk_size = 0x1e

User Base Address Definitions

func_lit = 0xe4
data = 0x200
eeprom:0.4096

