opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Initializations
	FNCALL	_main,_dispdata
	FNCALL	_main,_UpdateData
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_arr
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	20
_arr:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	067h
	global	_arr
	global	_data2segdisp
	global	_option_select_time
	global	_display_toggle
	global	_exit_modification_time
	global	_option
	global	_switch_press_time
	global	_timecounter
	global	_ACCESSDISP
	global	_LCD_BLINK
	global	_MODIFYDATA
	global	_UPDATEDATA
	global	_second
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_CCP1IF
_CCP1IF	set	98
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RB4
_RB4	set	52
	global	_RC0
_RC0	set	56
	global	_RE0
_RE0	set	72
	global	_TMR1ON
_TMR1ON	set	128
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_CCP1IE
_CCP1IE	set	1122
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISE0
_TRISE0	set	1096
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"Real Time Clock.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_ACCESSDISP:
       ds      1

_LCD_BLINK:
       ds      1

_MODIFYDATA:
       ds      1

_UPDATEDATA:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_display_toggle:
       ds      1

_exit_modification_time:
       ds      1

_option:
       ds      1

_switch_press_time:
       ds      1

_timecounter:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_data2segdisp:
       ds      4

_option_select_time:
       ds      1

_second:
       ds      2

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_dispdata
?_dispdata:	; 0 bytes @ 0x0
	global	?_UpdateData
?_UpdateData:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_Initializations
?_Initializations:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 2 bytes @ 0x0
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_dispdata
??_dispdata:	; 0 bytes @ 0x0
	global	??_UpdateData
??_UpdateData:	; 0 bytes @ 0x0
	global	??_Initializations
??_Initializations:	; 0 bytes @ 0x0
	ds	1
	global	dispdata@i
dispdata@i:	; 1 bytes @ 0x1
	global	UpdateData@rec_data
UpdateData@rec_data:	; 1 bytes @ 0x1
	ds	1
	global	UpdateData@i
UpdateData@i:	; 1 bytes @ 0x2
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x3
;;Data sizes: Strings 0, constant 10, data 0, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      11
;; BANK0           80      3      10
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; UpdateData@rec_data	PTR unsigned int  size(1) Largest target is 2
;;		 -> second(BANK0[2]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_UpdateData
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     399
;;                    _Initializations
;;                           _dispdata
;;                         _UpdateData
;; ---------------------------------------------------------------------------------
;; (1) _dispdata                                             2     2      0     263
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _UpdateData                                           3     3      0     136
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Initializations                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Initializations
;;   _dispdata
;;   _UpdateData
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      5       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      15       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      3       A       5       12.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      17      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 113 in file "D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Initializations
;;		_dispdata
;;		_UpdateData
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	113
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	115
	
l3045:	
;Real Time Clock.c: 115: Initializations();
	fcall	_Initializations
	line	117
	
l3047:	
;Real Time Clock.c: 117: GIE = 1; PEIE = 1;
	bsf	(95/8),(95)&7
	
l3049:	
	bsf	(94/8),(94)&7
	goto	l3051
	line	121
;Real Time Clock.c: 120: for(;;)
	
l731:	
	line	122
	
l3051:	
;Real Time Clock.c: 121: {
;Real Time Clock.c: 122: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(128/8),(128)&7
	line	124
	
l3053:	
;Real Time Clock.c: 124: if(0 != ACCESSDISP)
	btfss	(_ACCESSDISP/8),(_ACCESSDISP)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l733
u2770:
	line	125
	
l3055:	
;Real Time Clock.c: 125: dispdata();
	fcall	_dispdata
	goto	l733
	line	126
	
l732:	
	line	127
;Real Time Clock.c: 126: else
;Real Time Clock.c: 127: ;
	
l733:	
	line	129
;Real Time Clock.c: 129: if(0 != UPDATEDATA)
	btfss	(_UPDATEDATA/8),(_UPDATEDATA)&7
	goto	u2781
	goto	u2780
u2781:
	goto	l3051
u2780:
	line	130
	
l3057:	
;Real Time Clock.c: 130: UpdateData(&second);
	movlw	(_second)&0ffh
	fcall	_UpdateData
	goto	l3051
	line	131
	
l734:	
	goto	l3051
	line	132
;Real Time Clock.c: 131: else
;Real Time Clock.c: 132: ;
	
l735:	
	line	133
;Real Time Clock.c: 133: }
	goto	l3051
	
l736:	
	line	135
	
l737:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_dispdata
psect	text220,local,class=CODE,delta=2
global __ptext220
__ptext220:

;; *************** function _dispdata *****************
;; Defined at:
;;		line 138 in file "D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text220
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	138
	global	__size_of_dispdata
	__size_of_dispdata	equ	__end_of_dispdata-_dispdata
	
_dispdata:	
	opt	stack 6
; Regs used in _dispdata: [wreg-fsr0h+status,2+status,0]
	line	140
	
l2981:	
;Real Time Clock.c: 140: ACCESSDISP = 0;
	bcf	(_ACCESSDISP/8),(_ACCESSDISP)&7
	line	141
;Real Time Clock.c: 141: U1 i = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(dispdata@i)
	line	145
	
l2983:	
;Real Time Clock.c: 145: if(display_toggle <= 20)
	movlw	(015h)
	subwf	(_display_toggle),w
	skipnc
	goto	u2681
	goto	u2680
u2681:
	goto	l3015
u2680:
	line	148
	
l2985:	
;Real Time Clock.c: 146: {
;Real Time Clock.c: 148: for(i = 0 ; i < 4 ; i++)
	clrf	(dispdata@i)
	
l2987:	
	movlw	(04h)
	subwf	(dispdata@i),w
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l2991
u2690:
	goto	l747
	
l2989:	
	goto	l747
	line	149
	
l741:	
	line	150
	
l2991:	
;Real Time Clock.c: 149: {
;Real Time Clock.c: 150: PORTB = 1 << i;
	movlw	(01h)
	movwf	(??_dispdata+0)+0
	incf	(dispdata@i),w
	goto	u2704
u2705:
	clrc
	rlf	(??_dispdata+0)+0,f
u2704:
	addlw	-1
	skipz
	goto	u2705
	movf	0+(??_dispdata+0)+0,w
	movwf	(6)	;volatile
	line	151
	
l2993:	
;Real Time Clock.c: 151: PORTD = data2segdisp[i];
	movf	(dispdata@i),w
	addlw	_data2segdisp&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	152
	
l2995:	
;Real Time Clock.c: 152: _nop();
	nop
	line	153
	
l2997:	
;Real Time Clock.c: 153: _nop();
	nop
	line	154
	
l2999:	
;Real Time Clock.c: 154: _nop();
	nop
	line	155
	
l3001:	
;Real Time Clock.c: 155: _nop();
	nop
	line	156
	
l3003:	
;Real Time Clock.c: 156: _nop();
	nop
	line	157
	
l3005:	
;Real Time Clock.c: 157: _nop();
	nop
	line	158
	
l3007:	
;Real Time Clock.c: 158: _nop();
	nop
	line	159
	
l3009:	
;Real Time Clock.c: 159: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	148
	
l3011:	
	movlw	(01h)
	movwf	(??_dispdata+0)+0
	movf	(??_dispdata+0)+0,w
	addwf	(dispdata@i),f
	
l3013:	
	movlw	(04h)
	subwf	(dispdata@i),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l2991
u2710:
	goto	l747
	
l742:	
	line	163
;Real Time Clock.c: 160: }
;Real Time Clock.c: 163: }
	goto	l747
	line	165
	
l740:	
	
l3015:	
;Real Time Clock.c: 165: else if(display_toggle >= 20 && display_toggle <= 40)
	movlw	(014h)
	subwf	(_display_toggle),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l747
u2720:
	
l3017:	
	movlw	(029h)
	subwf	(_display_toggle),w
	skipnc
	goto	u2731
	goto	u2730
u2731:
	goto	l747
u2730:
	line	167
	
l3019:	
;Real Time Clock.c: 166: {
;Real Time Clock.c: 167: display_toggle = 0;
	clrf	(_display_toggle)
	line	168
	
l3021:	
;Real Time Clock.c: 168: data2segdisp[option] = 0x00;
	movf	(_option),w
	addlw	_data2segdisp&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	170
	
l3023:	
;Real Time Clock.c: 170: for(i = 0 ; i < 4 ; i++)
	clrf	(dispdata@i)
	
l3025:	
	movlw	(04h)
	subwf	(dispdata@i),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l3029
u2740:
	goto	l747
	
l3027:	
	goto	l747
	line	171
	
l745:	
	line	172
	
l3029:	
;Real Time Clock.c: 171: {
;Real Time Clock.c: 172: PORTD = 0x00;
	clrf	(8)	;volatile
	line	173
	
l3031:	
;Real Time Clock.c: 173: _nop();
	nop
	line	174
	
l3033:	
;Real Time Clock.c: 174: _nop();
	nop
	line	175
	
l3035:	
;Real Time Clock.c: 175: _nop();
	nop
	line	177
	
l3037:	
;Real Time Clock.c: 177: PORTB = 1 << i;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_dispdata+0)+0
	incf	(dispdata@i),w
	goto	u2754
u2755:
	clrc
	rlf	(??_dispdata+0)+0,f
u2754:
	addlw	-1
	skipz
	goto	u2755
	movf	0+(??_dispdata+0)+0,w
	movwf	(6)	;volatile
	line	178
	
l3039:	
;Real Time Clock.c: 178: PORTD = data2segdisp[i];
	movf	(dispdata@i),w
	addlw	_data2segdisp&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	line	170
	
l3041:	
	movlw	(01h)
	movwf	(??_dispdata+0)+0
	movf	(??_dispdata+0)+0,w
	addwf	(dispdata@i),f
	
l3043:	
	movlw	(04h)
	subwf	(dispdata@i),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l3029
u2760:
	goto	l747
	
l746:	
	goto	l747
	line	180
	
l744:	
	goto	l747
	line	181
	
l743:	
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_dispdata
	__end_of_dispdata:
;; =============== function _dispdata ends ============

	signat	_dispdata,88
	global	_UpdateData
psect	text221,local,class=CODE,delta=2
global __ptext221
__ptext221:

;; *************** function _UpdateData *****************
;; Defined at:
;;		line 185 in file "D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
;; Parameters:    Size  Location     Type
;;  rec_data        1    wreg     PTR unsigned int 
;;		 -> second(2), 
;; Auto vars:     Size  Location     Type
;;  rec_data        1    1[BANK0 ] PTR unsigned int 
;;		 -> second(2), 
;;  i               1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    2
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text221
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	185
	global	__size_of_UpdateData
	__size_of_UpdateData	equ	__end_of_UpdateData-_UpdateData
	
_UpdateData:	
	opt	stack 5
; Regs used in _UpdateData: [wreg-fsr0h+status,2+status,0+pclath]
;UpdateData@rec_data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(UpdateData@rec_data)
	line	186
	
l2967:	
;Real Time Clock.c: 186: UPDATEDATA = 0;
	bcf	(_UPDATEDATA/8),(_UPDATEDATA)&7
	line	187
;Real Time Clock.c: 187: U1 i = 0;
	clrf	(UpdateData@i)
	line	189
;Real Time Clock.c: 189: for(i = 0 ; i < 4 ; i++)
	clrf	(UpdateData@i)
	
l2969:	
	movlw	(04h)
	subwf	(UpdateData@i),w
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l2973
u2660:
	goto	l752
	
l2971:	
	goto	l752
	line	190
	
l750:	
	line	191
	
l2973:	
;Real Time Clock.c: 190: {
;Real Time Clock.c: 191: data2segdisp[i] = arr[*rec_data];
	movf	(UpdateData@rec_data),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	low((_arr-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_UpdateData+0)+0
	movf	(UpdateData@i),w
	addlw	_data2segdisp&0ffh
	movwf	fsr0
	movf	(??_UpdateData+0)+0,w
	movwf	indf
	line	192
	
l2975:	
;Real Time Clock.c: 192: rec_data++;
	movlw	(02h)
	movwf	(??_UpdateData+0)+0
	movf	(??_UpdateData+0)+0,w
	addwf	(UpdateData@rec_data),f
	line	189
	
l2977:	
	movlw	(01h)
	movwf	(??_UpdateData+0)+0
	movf	(??_UpdateData+0)+0,w
	addwf	(UpdateData@i),f
	
l2979:	
	movlw	(04h)
	subwf	(UpdateData@i),w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l2973
u2670:
	goto	l752
	
l751:	
	line	195
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateData
	__end_of_UpdateData:
;; =============== function _UpdateData ends ============

	signat	_UpdateData,4216
	global	_Initializations
psect	text222,local,class=CODE,delta=2
global __ptext222
__ptext222:

;; *************** function _Initializations *****************
;; Defined at:
;;		line 93 in file "D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text222
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	93
	global	__size_of_Initializations
	__size_of_Initializations	equ	__end_of_Initializations-_Initializations
	
_Initializations:	
	opt	stack 6
; Regs used in _Initializations: [wreg+status,2]
	line	94
	
l2945:	
;Real Time Clock.c: 94: TRISD = 0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	95
;Real Time Clock.c: 95: TRISB = 0x00;
	clrf	(134)^080h	;volatile
	line	96
	
l2947:	
;Real Time Clock.c: 96: TRISC0 = 1;
	bsf	(1080/8)^080h,(1080)&7
	line	98
	
l2949:	
;Real Time Clock.c: 98: TRISE0 = 0;
	bcf	(1096/8)^080h,(1096)&7
	line	99
	
l2951:	
;Real Time Clock.c: 99: RE0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	line	101
;Real Time Clock.c: 101: PORTD = 0X00;
	clrf	(8)	;volatile
	line	102
	
l2953:	
;Real Time Clock.c: 102: PORTB = 0xff;
	movlw	(0FFh)
	movwf	(6)	;volatile
	line	104
	
l2955:	
;Real Time Clock.c: 104: T1CON = 0x20;
	movlw	(020h)
	movwf	(16)	;volatile
	line	105
;Real Time Clock.c: 105: TMR1H = 0; TMR1L = 0;
	clrf	(15)	;volatile
	clrf	(14)	;volatile
	line	107
	
l2957:	
;Real Time Clock.c: 107: CCP1CON = 0x0B;
	movlw	(0Bh)
	movwf	(23)	;volatile
	line	108
	
l2959:	
;Real Time Clock.c: 108: CCP1IE = 1; CCP1IF = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1122/8)^080h,(1122)&7
	
l2961:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7
	line	109
	
l2963:	
;Real Time Clock.c: 109: CCPR1H = 0x61; CCPR1L = 0xA8;
	movlw	(061h)
	movwf	(22)	;volatile
	
l2965:	
	movlw	(0A8h)
	movwf	(21)	;volatile
	line	110
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_Initializations
	__end_of_Initializations:
;; =============== function _Initializations ends ============

	signat	_Initializations,88
	global	_ISR
psect	text223,local,class=CODE,delta=2
global __ptext223
__ptext223:

;; *************** function _ISR *****************
;; Defined at:
;;		line 35 in file "D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  716[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text223
	file	"D:\embedded projects\PIC_PROJECTS\Real Time Clock\Real Time Clock.c"
	line	35
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+1)
	movf	fsr0,w
	movwf	(??_ISR+2)
	movf	pclath,w
	movwf	(??_ISR+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+4)
	ljmp	_ISR
psect	text223
	line	36
	
i1l2801:	
;Real Time Clock.c: 36: if(0 != CCP1IF)
	btfss	(98/8),(98)&7
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l725
u244_20:
	line	38
	
i1l2803:	
;Real Time Clock.c: 37: {
;Real Time Clock.c: 38: RB4 = ~RB4;
	movlw	1<<((52)&7)
	xorwf	((52)/8),f
	line	39
	
i1l2805:	
;Real Time Clock.c: 39: timecounter++;
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(_timecounter),f
	line	40
	
i1l2807:	
;Real Time Clock.c: 40: ACCESSDISP = 1;
	bsf	(_ACCESSDISP/8),(_ACCESSDISP)&7
	line	41
	
i1l2809:	
;Real Time Clock.c: 41: if(timecounter >= 40)
	movlw	(028h)
	subwf	(_timecounter),w
	skipc
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l718
u245_20:
	line	43
	
i1l2811:	
;Real Time Clock.c: 42: {
;Real Time Clock.c: 43: timecounter = 0;
	clrf	(_timecounter)
	line	44
;Real Time Clock.c: 44: UPDATEDATA = 1;
	bsf	(_UPDATEDATA/8),(_UPDATEDATA)&7
	line	45
;Real Time Clock.c: 45: if(0 != RC0 && 1 != MODIFYDATA)
	btfss	(56/8),(56)&7
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l719
u246_20:
	
i1l2813:	
	btfsc	(_MODIFYDATA/8),(_MODIFYDATA)&7
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l719
u247_20:
	line	47
	
i1l2815:	
;Real Time Clock.c: 46: {
;Real Time Clock.c: 47: switch_press_time++;
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(_switch_press_time),f
	line	48
	
i1l2817:	
;Real Time Clock.c: 48: if((1 != MODIFYDATA) && switch_press_time >= 5)
	btfsc	(_MODIFYDATA/8),(_MODIFYDATA)&7
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l718
u248_20:
	
i1l2819:	
	movlw	(05h)
	subwf	(_switch_press_time),w
	skipc
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l718
u249_20:
	line	50
	
i1l2821:	
;Real Time Clock.c: 49: {
;Real Time Clock.c: 50: MODIFYDATA = 1;
	bsf	(_MODIFYDATA/8),(_MODIFYDATA)&7
	goto	i1l718
	line	51
	
i1l720:	
	line	52
;Real Time Clock.c: 51: }
;Real Time Clock.c: 52: }
	goto	i1l718
	line	66
	
i1l719:	
;Real Time Clock.c: 66: else if((1 != RC0) && (0 != MODIFYDATA))
	btfsc	(56/8),(56)&7
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l722
u250_20:
	
i1l2823:	
	btfss	(_MODIFYDATA/8),(_MODIFYDATA)&7
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l722
u251_20:
	line	68
	
i1l2825:	
;Real Time Clock.c: 67: {
;Real Time Clock.c: 68: exit_modification_time++;
	movlw	(01h)
	movwf	(??_ISR+0)+0
	movf	(??_ISR+0)+0,w
	addwf	(_exit_modification_time),f
	line	69
	
i1l2827:	
;Real Time Clock.c: 69: if(exit_modification_time >= 5)
	movlw	(05h)
	subwf	(_exit_modification_time),w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l718
u252_20:
	line	71
	
i1l2829:	
;Real Time Clock.c: 70: {
;Real Time Clock.c: 71: MODIFYDATA = 0;
	bcf	(_MODIFYDATA/8),(_MODIFYDATA)&7
	goto	i1l718
	line	72
	
i1l723:	
	line	73
;Real Time Clock.c: 72: }
;Real Time Clock.c: 73: }
	goto	i1l718
	line	76
	
i1l722:	
	line	78
;Real Time Clock.c: 76: else
;Real Time Clock.c: 77: {
;Real Time Clock.c: 78: switch_press_time = 0;
	clrf	(_switch_press_time)
	line	79
;Real Time Clock.c: 79: option_select_time = 0;
	clrf	(_option_select_time)
	line	80
;Real Time Clock.c: 80: exit_modification_time = 0;
	clrf	(_exit_modification_time)
	goto	i1l718
	line	81
	
i1l724:	
	goto	i1l718
	
i1l721:	
	line	83
	
i1l718:	
	line	85
;Real Time Clock.c: 81: }
;Real Time Clock.c: 83: }
;Real Time Clock.c: 85: CCP1IF = 0;
	bcf	(98/8),(98)&7
	goto	i1l725
	line	86
	
i1l717:	
	line	90
	
i1l725:	
	movf	(??_ISR+4),w
	movwf	btemp+1
	movf	(??_ISR+3),w
	movwf	pclath
	movf	(??_ISR+2),w
	movwf	fsr0
	swapf	(??_ISR+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,90
psect	text224,local,class=CODE,delta=2
global __ptext224
__ptext224:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
