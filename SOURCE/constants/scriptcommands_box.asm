LASTRESULT EQU $800D
end: MACRO
	db $02
	ENDM
return: MACRO
	db $03
	ENDM
goto: MACRO
	db $05
	dd \1
	ENDM
goto_if: MACRO
	db $06
	db \1
	dd \2
	ENDM
call_if: MACRO
	db $07
	db \1
	dd \2
	ENDM
gotostd: MACRO
	db $08
	db \1
	ENDM
callstd: MACRO
	db $09, \1
	ENDM
gotostd_if: MACRO
	db $0A
	db \1
	db \2
	ENDM
callstd_if: MACRO
	db $0B
	db \3
	db \2
	ENDM
returnram: MACRO
	db $0C
	ENDM
killscript: MACRO
	db $0D
	ENDM
setbyte: MACRO
	db $0E, \1
	ENDM
loadword: MACRO
	db $0F
	db \1
	dd \2
	ENDM
callasm: MACRO
	db $23
	dd \1
	ENDM
loadbyte: MACRO
	db $10
	db \1
	db \2
	ENDM
writebytetoaddr: MACRO
	db $11
	db \1
	dd \2
	ENDM
loadbytefromaddr: MACRO
	db $12
	db \1
	dd \2
	ENDM
setptrbyte: MACRO
	db $13
	db \1
	dd \2
	ENDM
copylocal: MACRO
	db $14
	db \1
	db \2
	ENDM
copybyte: MACRO
	db $15
	dd \1
	dd \2
	ENDM
setvar: MACRO
	db $16
	dw \1
	dw \2
	ENDM
addvar: MACRO
	db $17
	dw \1
	dw \2
	ENDM
subvar: MACRO
	db $18
	dw \1
	dw \2
	ENDM
copyvar: MACRO
	db $19
	dw \1
	dw \2
	ENDM
copyvarifnotzero: MACRO
	db $1A
	dw \1, \2
	ENDM
comparefarbytetobyte: MACRO
	db $1F
	dd \1
	db \2
	ENDM
comparefarbytes: MACRO
	db $20
	dd \1
	dd \2
	ENDM
compare: MACRO
	db $21
	dw \1, \2
	ENDM
comparevar: MACRO
	db $22
	dw \1, \2
	ENDM
setflag: MACRO
	db $29
	dw \1
	ENDM
clearflag: MACRO
	db $2A
	dw \1
	ENDM
checkflag: MACRO
	db $2B
	dw \1
	ENDM
playfanfare: MACRO
	db $31
	dw \1
	ENDM
waitfanfare: MACRO
	db $32
	ENDM
getpartysize: MACRO
	db $43
	ENDM
fadesong: MACRO
	db $36
        dw \1
	ENDM
fadeout: MACRO
	db $37
        dw \1
	ENDM
additem: MACRO
	db $44
	dw \1, \2
	ENDM
checkitemroom: MACRO
	db $46
	dw \1, \2
	ENDM
checkitem: MACRO
	db $47
	dw \1, \2
	ENDM
checkitemtype: MACRO
	db $48
	dw \1
	ENDM
checkpcitem: MACRO
	db $4A
	dw \1, \2
	ENDM
adddecoration: MACRO
	db $4b
	dw \1
	ENDM
faceplayer: MACRO
	db $5A
	ENDM
waitmsg: MACRO
	db $66
	ENDM
lock: MACRO
	db $6A
	ENDM
release: MACRO
	db $6C
	ENDM
waitkeypress: MACRO
	db $6D
	ENDM
showmonpic: MACRO
	db $75
	dw \1
	db \2
	db \3
	ENDM
hidemonpic: MACRO
	db $76
	ENDM
hidesprite: MACRO
	db $53
	dw \1
	ENDM
hidebox: MACRO
	db $73
	db \1
	db \2
	db \3
	db \4
	ENDM
showcontestpainting: MACRO
	db $77
	db \1
	ENDM
braillemessage: MACRO
	db $78
	dd \1
	ENDM
brailleformat: MACRO
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	ENDM
givemon: MACRO
	db $79
	dw \1
	db \2
	dw \3
	dd \4
	dd \5
	db \6
	ENDM
giveegg: MACRO
	db $7A
	dw \1
	ENDM
setmonmove: MACRO
	db $7b
	db \1
	db \2
	dw \3
	ENDM
checkpartymove: MACRO
	db $7c
	dw \1
	ENDM
bufferspeciesname: MACRO
	db $7d
	db \1
	dw \2
	ENDM
bufferleadmonspeciesname: MACRO
	db $7E
	db \1
	ENDM
bufferpartymonnick: MACRO
	db $7f
	db \1
	dw \2
	ENDM
bufferitemname: MACRO
	db $80
	db \1
	dw \2
	ENDM
bufferdecorationname: MACRO
	db $81
	db \1
	dw \2
	ENDM
buffermovename: MACRO
	db $82
	db \1
	dw \2
	ENDM
random: MACRO
	db $8F
	dw \1
	ENDM
sound: MACRO
       db $2F
       dw \1
       ENDM
special: MACRO
       db $25
       dw \1
       ENDM
special2: MACRO
       db $26
       dw \1
       dw \2
       ENDM
pause: MACRO
       db $28
       dw \1
       ENDM
setrespawn: MACRO
	db $9F
	dw \1
	ENDM
checkplayergender: MACRO
	db $A0
	ENDM
applymovement: MACRO
        db $4F
        dw \1 
        dd \2
        ENDM
waitmovement: MACRO
        db $51
        db \1 
        ENDM
playmoncry: MACRO
	db $A1
	dw \1
	dw \2
	ENDM
playsong: MACRO
	db $33
	dw \1
	db \2
	ENDM
setwildbattle: MACRO
	db $B6
	dw \1
	db \2
	dw \3
	ENDM
dowildbattle: MACRO
	db $B7
	ENDM
setvirtualaddress: MACRO
	db $B8
	GBAPTR \1
	ENDM
waitstate: MACRO
           db $27
           ENDM
virtualgotoif: MACRO
	db $BB
	db \1
	GBAPTR \2
	ENDM
virtualmsgbox: MACRO
	db $BD
	GBAPTR \1
	ENDM
virtualloadpointer: MACRO
	db $BE
	GBAPTR \1
	ENDM
waitmoncry: MACRO
	db $C5
	ENDM
setmoneventlegal: MACRO
	db $CD
	dw \1
	ENDM
checkmoneventlegal: MACRO
	db $CE
	dw \1
	ENDM
setmonmetlocation: MACRO
	db $D2
	dw \1
	db \2
	ENDM
warp: MACRO
	db $3F
	db \1
	db \2
	db \3
	db \4
        db \5
	ENDM
buffernumber: MACRO
	db $83
	db \1
	dw \2
	ENDM
closeonkeypress: MACRO
	db $68
	ENDM
EVENTLEGAL: MACRO
	db $02
	db $48
	db $4F
	db $21
	db $03
	db $4B
	db $03
	db $A2
	db $18
	db $47
	db $70
	db $47
	db $C0
	db $45
	db $00
	db $03
	db $ED
	db $D2
	db $03
	db $08
	db $10
	db $00
	db $00
	db $00
	ENDM
EVENTLEGAL2: MACRO
	db $00
	db $02
	db $48
	db $4F
	db $21
	db $02
	db $4B
	db $03
	db $A2
	db $18
	db $47
	db $00
	db $00
	db $C0
	db $45
	db $00
	db $03
	db $ED
	db $D2
	db $03
	db $08
	db $10 ;?
	db $00
	db $00
	db $00
	ENDM
METLOCATION: MACRO
        db $02
        db $48
        db $23
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $5C ; Met area
        db $00
        db $00
        db $00
        ENDM
GAMEORIGIN: MACRO
        db $02
        db $48
        db $25 ;id game origin
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $04 ; game
        db $00
        db $00
        db $00
        ENDM
GAMELANG: MACRO
        db $02
        db $48
        db $03
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $01
        db $00
        db $00
        db $00
        ENDM
METLEVEL: MACRO
        db $02
        db $48
        db $24 ;ID for met level 
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $00 ; Met level
        db $00
        db $00
        db $00
        ENDM
MOVE1: MACRO
        db $02
        db $48
        db $0E ;ID move slot 1 
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $11 ; Move id
        db $01
        db $00
        db $00
        ENDM
MOVE2: MACRO
        db $02
        db $48
        db $0F ;ID move slot 1 
        db $21
        db $02
        db $4B
        db $03
        db $A2
        db $18
        db $47
        db $00
        db $00
        db $C0
        db $45
        db $00
        db $03
        db $ED
        db $D2
        db $03
        db $08
        db $E6 ; Move id
        db $00
        db $00
        db $00
        ENDM
		
BALL: MACRO
	dw $4804 ; party ram
    dw $4905 
    dw $7809 
    dw $2264 
    dw $4351 
    dw $4408 
    dw $2126 
    dw $A203 
    dw $4B03 
    dw $4718 ; does setboxmondata
	dd $03004360
	dd $0202e8da
	dd $00000004 ; id of pokeball
	dd $0803d2ed
	ENDM

TID: MACRO
	db $00
	db $02
	db $49
	db $00
	db $20
	db $08
	db $80
	db $70
	db $47
	db $00
	db $00
	db $AE
	db $4E
	db $02
	db $02
	ENDM
fadescreen: MACRO
	db $97
	db \1
	ENDM
doanimation: MACRO
	db $9C
	dw \1
	ENDM
getplayerpos: MACRO
	db $42
	dw \1
	dw \2
	ENDM
settrainer: MACRO
	db $00
	dw $2001
	dw $2001
	dw $2200
	dw $4B01
	dw $4718
        dw $0000
	dd $080b0805
	ENDM
calcscriptchecksum: MACRO
	dw $B5FF
	dw $480B
	dw $490C
	dw $4A0C
	dw $4B0D
	dw $4C0D
	dw $7800
	dw $4401
	dw $7809
	dw $7011
	dw $4404
	dw $7824
	dw $701C
	dw $467C
	dw $3407
	dw $46A6
	dw $4802
	dw $4700
	dw $4802
	dw $8002
	dw $BDFF
	dd $08065761
	dd $2028dc4
	dd $202e8dc
	dd $2025385
	dd $202537D
	dd $2028F3E
	dd $2025392
	ENDM
GetUnownLetter: MACRO
	dw $B5FF
	dw $467C
	dw $340B
	dw $46A6
	dw $4803
	dw $4B04
	dw $6800
	dw $4718
	dw $4903
	dw $7008
	dw $BCFF
	dw $BD00
	dd $3004360
	dd $0809d475
	dd $0202e8cc
	ENDM
SPRITE: MACRO
	db $00
	db $06
	db $48
	db $07
	db $4D
	db $03
	db $4E
	db $00
	db $21
	db $00
	db $22
	db $00
	db $23
	db $02
	db $4F
	db $18
	db $24
	db $38
	db $47
	db $00
	db $00
	db $44
	db $21
	db $37
	db $08
	db $DD
	db $0B
	db $00
	db $08
	db $98	
	db $7D
	db $00
	db $03
	db $0C
	db $49
	db $00
	db $30
	ENDM
MEMCOPYJIRACHI: MACRO
        dw $B4FF
        dw $4802
        dw $4902
        dw $4A02
        dw $DF0B
        dw $4770
	dd $020001B8
	dd $030045C0
	dd $04000014
	ENDM
TEMPJIRACHI: MACRO
	dd $00000000
	dd $00009CBA
	dd $BBCCC3C4
	dd $FFC3C2BD
	dd $02020000
	dd $C8BBC2BD
	dd $00C6BFC8
	dd $0000A0DB
	dd $00000199
	dd $0002625A
	dd $00006400
	dd $005E0111
	dd $015B0007
	dd $140F0A0A
	dd $00000000
	dd $00000000
	dd $00000000
	dd $2080FF00	
	dd $00000000
	dd $00000000
	ENDM
EUISUNEMOVE: MACRO
	db $56
	db $12
	db $FE
	ENDM
EUISUNEMOVE1: MACRO
	db $09
	db $09
	db $0A
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $09
	db $FE
	ENDM
PLAYERMOVE: MACRO
	db $0B
	db $02
	db $14
	db $14
	db $FE
	ENDM
WORKING_M1R_RNG: MACRO
	dw $0000
	dw $B500
	dw $B4FF
	dw $4A36
	dw $6811
	dw $4838
	dw $4B35
	dw $4C36
	dw $4359 ; rng pid lower
	dw $4421
	dw $0c0a ; bitshift and store pid upper in r1
	dw $4359 ; rng pid upper
	dw $4421
	dw $0C0D ; bitshift and store pid lower in r5
	dw $8005 ; store PID upper. in 16 bit alignment, it's at 020253a0. In 32 bit it's at 020253a2
	dw $8042  ;store pid lower. Opposite storage of pid upper.
	dw $8042 ; nop
	dw $8042 ; nop
	dw $4359 ; rng iv1
	dw $4421
	dw $004a ; bitshift and store IV1 in r2.
	dw $0c52
	dw $4359 ; rng iv2
	dw $4421
	dw $004d ; bitshift and store IV2 r5
	dw $0c6d
	dw $03ed
	dw $432a ; combine r0 + r5
	dw $6482 ; store at iv location
	dw $4D35
	dw $682E
	dw $0C36
	dw $8086
	dw $3504
	dw $682E
	dw $0
	dw $80C6
	dw $492B
	dw $4A2B
	dw $DF0B
	dw $4826
	dw $4D27
	dw $6800
	dw $2118
	dw $7
	dw $DF06
	dw $38
	dw $2800
	dw $D503
	dw $3110
	dw $2900
	dw $D500
	dw $3118
	dw $440D
	dw $782E
	dw $481F
	dw $2703
	dw $240C
	dw $2503
	dw $3020
	dw $491F
	dw $3120
	dw $4A20
	dw $33
	dw $402B
	dw $4363
	dw $4419
	dw $DF0B
	dw $08B6
	dw $3F01
	dw $D5F4
	dw $0
	dw $467C
	dw $3409
	dw $46A6
	dw $4818
	dw $4B1A
	dw $4718
	dw $4916
	dw $8388
	dw $467C
	dw $3409
	dw $46A6
	dw $8
	dw $4B17
	dw $4718
	dw $467C
	dw $3409
	dw $46A6
	dw $4811
	dw $4B15
	dw $4718
	dw $480F
	dw $490C
	dw $4A0F
	dw $320C
	dw $0000
	dw $BDFF
	dw $0
	dw $480B
	dw $2126 ; wont do anything bc this is being applied to enemy ram but w/e
	dw $4a01 
	dw $4B11
	dw $2664
	dw $4D11
	dw $781F
	dw $4377
	dw $4438
	dw $4728
	dw $0
	dw $0
	dw $0
	dd $03004818	
	dd $41c64e6d ;mult
	dd $00006073 ;add	
	dd $020253A0	
	dd $02024FF0
	dd $03004360	
	dd $030045C0
	dd $04000008
	dd $04000003
	dd $0803b125
	dd $0803c5f1
	dd $0803b1b9	
	dd $02024EAC
	dd $0202e8da 
	dd $0803d2ed
	dd $00000000
	ENDM

METHOD2RNG: MACRO
	db $00
	db $B5
	db $FF
	db $B4
	db $34
	db $4A
	db $11
	db $68
	db $36
	db $48
	db $34
	db $4B
	db $34
	db $4C
	db $59
	db $43
	db $09
	db $19
	db $0A
	db $0C
	db $59
	db $43
	db $09
	db $19
	db $0D
	db $0C
	db $02
	db $80
	db $45
	db $80
	db $06
	db $1C
	db $59
	db $43
	db $09
	db $19
	db $59
	db $43
	db $09
	db $19
	db $4A
	db $00
	db $52
	db $0C
	db $59
	db $43
	db $09
	db $19
	db $4D
	db $00
	db $6D
	db $0C
	db $ED
	db $03
	db $2A
	db $43
	db $F6
	db $07
	db $32
	db $43
	db $82
	db $64
	db $32
	db $4D
	db $2E
	db $68
	db $36
	db $0C
	db $86
	db $80
	db $04
	db $35
	db $2E
	db $68
	db $00
	db $1C
	db $C6
	db $80
	db $28
	db $49
	db $27
	db $4A
	db $0B
	db $DF
	db $26
	db $48
	db $24
	db $4D
	db $00
	db $68
	db $18
	db $21
	db $07
	db $1C
	db $06
	db $DF
	db $38
	db $1C
	db $00
	db $28
	db $56
	db $D5
	db $10
	db $31
	db $00
	db $29
	db $53
	db $D5
	db $18
	db $31
	db $6D
	db $18
	db $2E
	db $78
	db $1C
	db $48
	db $03
	db $27
	db $0C
	db $24
	db $03
	db $25
	db $20
	db $30
	db $1E
	db $49
	db $20
	db $31
	db $19
	db $4A
	db $33
	db $1C
	db $2B
	db $40
	db $63
	db $43
	db $C9
	db $18
	db $0B
	db $DF
	db $B6
	db $08
	db $01
	db $3F
	db $42
	db $D5
	db $00
	db $1C
	db $7C
	db $46
	db $09
	db $34
	db $A6
	db $46
	db $15
	db $48
	db $17
	db $4B
	db $18
	db $47
	db $13
	db $49
	db $88
	db $83
	db $7C
	db $46
	db $09
	db $34
	db $A6
	db $46
	db $08
	db $1C
	db $14
	db $4B
	db $18
	db $47
	db $7C
	db $46
	db $09
	db $34
	db $A6
	db $46
	db $0B
	db $48
	db $0D
	db $4B
	db $18
	db $47
	db $0C
	db $32
	db $00
	db $1C
	db $FF
	db $BD
	db $00
	db $1C
	db $09
	db $48
	db $26
	db $21
	db $14
	db $4A
	db $10
	db $4B
	db $64
	db $26
	db $10
	db $4D
	db $1F
	db $78
	db $77
	db $43
	db $C0
	db $19
	db $28
	db $47
	db $18
	db $48
	db $00
	db $03
	db $6D
	db $4E
	db $C6
	db $41
	db $73
	db $60
	db $00
	db $00
	db $A0
	db $53
	db $02
	db $02
	db $F0
	db $4F
	db $02
	db $02
	db $60
	db $43
	db $00
	db $03
	db $C0
	db $45
	db $00
	db $03
	db $08
	db $00
	db $00
	db $04
	db $03
	db $00
	db $00
	db $04
	db $25
	db $B1
	db $03
	db $08
	db $F1
	db $C5
	db $03
	db $08
	db $B9
	db $B1
	db $03
	db $08
	db $AF
	db $4E
	db $02
	db $02
	db $DC
	db $E8
	db $02
	db $02
	db $ED
	db $D2
	db $03
	db $08
	ENDM 