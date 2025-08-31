# include "hardware/regs/addressmap.h"
# include "hardware/regs/sio.h"
# include "hardware/regs/io_bank0.h"
# include "hardware/regs/pads_bank0.h"
@
@
@ Assembler program to control a 7-segment display
@ using the Pico SDK .
@
@
.thumb_func @ Tell the assembler which type of ARM
.global main @ Provide program starting address to linker
.align 4
main:
@PLACE CODE HERE ********************************************
@INITIALIZATION
@
BL stdio_init_all @ Initialize UART

MOV R0, #16
BL gpioinit             @ set as output
MOV R0, #17
BL gpioinit             @ set as output
MOV R0, #18
BL gpioinit             @ set as output
MOV R0, #19
BL gpioinit             @ set as output
MOV R0, #20
BL gpioinit             @ set as output
MOV R0, #21
BL gpioinit             @ set as output
MOV R0, #22
BL gpioinit             @ set as output

loop:
@MAIN LOOP TO RUN FOREVER:
@

@ONE on
MOV R0, #16
BL gpio_off
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_off
MOV R0, #21
BL gpio_off
MOV R0, #22
BL gpio_off

MOV R1, #1 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@TWO on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_on
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_off
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_off
MOV R0, #22
BL gpio_on

MOV R1, #2 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@THREE on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_off
MOV R0, #22
BL gpio_on

MOV R1, #3 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@FOUR on
MOV R0, #16
BL gpio_off
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_off

MOV R1, #4 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@FIVE on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_off
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_on

MOV R1, #5 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@SIX on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_on
MOV R0, #18
BL gpio_off
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_on

MOV R1, #6 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@SEVEN on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_off
MOV R0, #21
BL gpio_off
MOV R0, #22
BL gpio_off

MOV R1, #7 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@EIGHT on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_on
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_on

MOV R1, #8 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@NINE on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_off
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_on
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_on

MOV R1, #9 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@ZERO on
MOV R0, #16
BL gpio_on
MOV R0, #17
BL gpio_on
MOV R0, #18
BL gpio_on
MOV R0, #19
BL gpio_on
MOV R0, #20
BL gpio_off
MOV R0, #21
BL gpio_on
MOV R0, #22
BL gpio_on

MOV R1, #0 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

@ALL off
MOV R0, #16
BL gpio_off
MOV R0, #17
BL gpio_off
MOV R0, #18  
BL gpio_off
MOV R0, #19
BL gpio_off
MOV R0, #20
BL gpio_off
MOV R0, #21
BL gpio_off
MOV R0, #22
BL gpio_off

MOV R1, #0 @Move the IO value to second parameter
LDR R0, =digital_value_string @ load address of digit_value_string
BL printf @ Call pico_printf

BL delay

B loop @ Jump back to main


@FUNCTIONS **************************************************

gpioinit:
@ initialize the GPIO
MOV R3, #1
LSL R3, R0 @ shift to pin position
LDR R2, gpiobase
STR R3, [R2, #SIO_GPIO_OE_SET_OFFSET]
STR R3, [R2, #SIO_GPIO_OUT_CLR_OFFSET]
@ enable I / O for the pin
LDR R2, padsbank0
LSL R3, R0, #2 @ pin * 4 for register address
ADD R2, R3 @ actual registers for the pin
MOV R1, #PADS_BANK0_GPIO0_IE_BITS
LDR R4, setoffset
ORR R2, R4
STR R1, [R2, #PADS_BANK0_GPIO0_OFFSET]
@ set the function to SIO
LSL R0, #3
LDR R2, iobank0
ADD R2, R0
MOV R1, #IO_BANK0_GPIO3_CTRL_FUNCSEL_VALUE_SIO_3
STR R1, [R2, #IO_BANK0_GPIO0_CTRL_OFFSET]
BX LR @ return to caller , note that the caller must have
@ jumped here using BX or BLX for this to work



gpio_on:
MOV R3, #1
LSL R3, R0
LDR R2, gpiobase
STR R3, [R2, #SIO_GPIO_OUT_SET_OFFSET]
BX LR



gpio_off:
MOV R3, #1
LSL R3, R0
LDR R2, gpiobase
STR R3, [R2, # SIO_GPIO_OUT_CLR_OFFSET]
BX LR



delay:
LDR R1, =0x00FFFFFF   @ large count (~16 million)
MOV R2, #0

indelay:
ADD R2, R2, #1        @ increment counter
CMP R2, R1            @ compare with max
BCC indelay           @ loop until done
BX LR



@ BASE ADDRESSES *******************************************************
.align 4
gpiobase: .word SIO_BASE
iobank0: .word IO_BANK0_BASE
padsbank0: .word PADS_BANK0_BASE
setoffset: .word REG_ALIAS_SET_BITS



@LARGE DATA DEFINITIONS ***********************************************
.data
.align 4 @ Necessary alignment
@DEFINE DATA HERE
digital_value_string:   .asciz "Digit value: %d \n"
