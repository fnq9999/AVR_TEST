/************************************************
文件：config.h
用途：系统配置函数
注意：
创建：2008.1.26
修改：2008.1.26
Copy Right  (c)  www.avrvi.com  AVR与虚拟仪器
************************************************/
#ifndef __config_H__
#define __config_H__

/*********************************************/
#define M8    1
#define M16   2
#define M32   3
#define M64   4
#define M128  5
/*********************************************/
#define CPU_TYPE  M128

#define F_CPU 8000000

#if CPU_TYPE == M128
#include <iom128v.h>
#endif
#if CPU_TYPE == M64
#include <iom64v.h>
#endif
#if CPU_TYPE == M32
#include <iom32v.h>
#endif
#if CPU_TYPE == M16
#include <iom16v.h>
#endif
#if CPU_TYPE == M8
#include <iom8v.h>
#endif

#include <macros.h>

#ifndef TRUE
#define TRUE  1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#ifndef NULL
#define NULL 0
#endif

#include "lib\TWI.h"
#include "lib\delay.h"
#include "lib\AT24C01.h"
#include "lib\sio.h"
//#include "lib\pcf8563.h"
#include "lib\hc595.h"
#include "lib\key.h"
#include "lib\buzz.h"
#include "lib\spi.h"
#include "lib\DS18B20.h"





#endif