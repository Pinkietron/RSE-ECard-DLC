INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands_box.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 0,42 ;
	db 3     ; North ball
	GBAPTR NormanScriptStart
	GBAPTR NormanScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS


GoSeeYourFather:
	Text_EN "A PICHU was lost off the coast\n"
	Text_EN "of MOSSDEEP CITY!@"



NormanScriptStart:
	setvirtualaddress NormanScriptStart



	           db $43                  ;This checks if your party is bigger than 0

		   compare LASTRESULT, 0   ;It's so I can store thumb code in static spot. 

		   virtualgotoif 2, Start  ;It should never fail.

			dw $0000
			db $00

			WORKING_M1R_RNG
		    BALL
		   




		      
Start:
		   db $43 ;check party size

		   compare LASTRESULT, 5

		   virtualgotoif 2, NoRoom

		   copyvar $800B, $800D ; allows for flew to trigger later

		   checkflag $20 ; check if challenge accepted

		   		virtualgotoif 1, SaidYes

		   pause $10

		   sound $15	

 		   pause $10
       
   		   faceplayer

		   virtualmsgbox Hello           

		   waitmsg
		
		   waitkeypress

		   virtualmsgbox Care           

		   waitmsg
		
		   waitkeypress

		   writebytetoaddr $01, $0202886B

		   db $6E, $17, $8 ; y/n box $1 = y $0 = n 
		
		   compare LASTRESULT, 0

		   		virtualgotoif 5, SaidYes

		   release

		   end




SaidYes:

		setflag $20 ; accepted the battle		

		sound $15 ; ! sound

		pause $3C

		virtualmsgbox Released

		waitmsg

		waitkeypress

		compare LASTRESULT, 0

		   	virtualgotoif 5, Battle
		
		release

		end


Retry:

	faceplayer

	virtualmsgbox Released

	waitmsg

	waitkeypress

	release

	comparefarbytetobyte $0202886B, $1

	           virtualgotoif 1, Battle

	end
		

Battle:

		   playmoncry $AC, $0

                   waitmoncry

		   setwildbattle $AC, $19, $C5

		   callasm $02028DE1 ;m1r rng

		   special $138

		   waitstate

		   writebytetoaddr $00, $2028230

		   db $43 ;fade

		   comparevar LASTRESULT, $800B	; compares between current party size and previous party size	   
		   
		   virtualgotoif 3, FlewAway

				   callasm $02028F01 ;Ball

				   setflag $040A ; item ball disappear

			virtualmsgbox Caught

			waitmsg
			
			waitkeypress

		   release

		   killscript


NoRoomTXT:
			Text_EN "-No room in party-@"


NoRoom:
		   virtualmsgbox NoRoomTXT

		   waitmsg

		   waitkeypress

		   release

 	   	   end

FlewAway:
	db $97, $01 ; fade out
	db $97, $00 ; fade in

	setflag $20 ;set a temp flag (https://github.com/pret/pokeruby/blob/master/include/constants/flags.h)

	virtualmsgbox Flew
	waitmsg
	waitkeypress
	release
	end


Flew:
        Text_EN "PICHU feels dejected...@"

	
Hello:
	Text_EN "It’s a POKéBALL...\p"
	Text_EN "It’s shaking violently...@"


Care:
	Text_EN "Release the POKéMON inside?@"

Released:
	Text_EN "PICHUU!@"

Caught:
	Text_EN "The old POKéBALL was left behind.@"


	
NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	
	writebytetoaddr	$00, $0202886A

	writebytetoaddr	$00, $0202886C

	writebytetoaddr	$00, $0202886D

	writebytetoaddr	$00, $0202886E

	writebytetoaddr	$00, $0202886F

	writebytetoaddr	$00, $02028870

	writebytetoaddr	$00, $02028871

	writebytetoaddr $E4, $2024FF0
	writebytetoaddr $E4, $2025090
	writebytetoaddr $E4, $2025130
	writebytetoaddr $E4, $20251D0
	writebytetoaddr $E4, $2025270
	writebytetoaddr $E4, $2025310

	callasm $08135c45

 	
	writebytetoaddr $0, $202539F ;Temp pokemon. Starts with bit for alignment.
	writebytetoaddr $0, $20253A0 ; pid start
	writebytetoaddr $0, $20253A1
	writebytetoaddr $0, $20253A2
	writebytetoaddr $0, $20253A3 ; pid end
	writebytetoaddr $0, $20253A4 ; otid start
	writebytetoaddr $0, $20253A5
	writebytetoaddr $0, $20253A6
	writebytetoaddr $0, $20253A7 ; otid end
	writebytetoaddr $CA, $20253A8 ; nickname start
	writebytetoaddr $C3, $20253A9
	writebytetoaddr $BD, $20253AA
	writebytetoaddr $C2, $20253AB
	writebytetoaddr $CF, $20253AC
	writebytetoaddr $FF, $20253AD
	writebytetoaddr $FF, $20253AE
	writebytetoaddr $08, $20253AF
	writebytetoaddr $11, $20253B0
	writebytetoaddr $0C, $20253B1 ; nickname end
	writebytetoaddr $02, $20253B2 ; lang
	writebytetoaddr $02, $20253B3 ; egg
	writebytetoaddr $CE, $20253B4 ; otn start
	writebytetoaddr $BF, $20253B5 
	writebytetoaddr $CC, $20253B6
	writebytetoaddr $CC, $20253B7
	writebytetoaddr $BB, $20253B8 
	writebytetoaddr $FF, $20253B9 
	writebytetoaddr $C5, $20253BA ; otn end 
	writebytetoaddr $00, $20253BB  ; marking
	writebytetoaddr $49, $20253BC ; checksum start
	writebytetoaddr $F6, $20253BD ; checksum end
	writebytetoaddr $0, $20253BE ; unused 1
	writebytetoaddr $0, $20253BF ; unused 2
	writebytetoaddr $AC, $20253C0 ; growth start - species id
	writebytetoaddr $00, $20253C1
	writebytetoaddr $00, $20253C2
	writebytetoaddr $00, $20253C3
	writebytetoaddr $78, $20253C4
	writebytetoaddr $69, $20253C5
	writebytetoaddr $00, $20253C6
	writebytetoaddr $00, $20253C7
	writebytetoaddr $00, $20253C8
	writebytetoaddr $7A, $20253C9 
	writebytetoaddr $00, $20253CA 
	writebytetoaddr $00, $20253CB ; growth end
	writebytetoaddr $39, $20253CC ; attacks start
	writebytetoaddr $00, $20253CD 
	writebytetoaddr $CC, $20253CE
	writebytetoaddr $00, $20253CF
	writebytetoaddr $54, $20253D0
	writebytetoaddr $00, $20253D1
	writebytetoaddr $BA, $20253D2
	writebytetoaddr $00, $20253D3
	writebytetoaddr $0F, $20253D4
	writebytetoaddr $14, $20253D5 
	writebytetoaddr $1E, $20253D6 
	writebytetoaddr $0A, $20253D7 ; attacks end
	writebytetoaddr $0, $20253D8 ; ev and condition
	writebytetoaddr $0, $20253D9
	writebytetoaddr $0, $20253DA
	writebytetoaddr $0, $20253DB
	writebytetoaddr $0, $20253DC
	writebytetoaddr $0, $20253DD
	writebytetoaddr $0, $20253DE
	writebytetoaddr $0, $20253DF
	writebytetoaddr $0, $20253E0
	writebytetoaddr $0, $20253E1  
	writebytetoaddr $0, $20253E2 
	writebytetoaddr $0, $20253E3 ; ev and condition end
	writebytetoaddr $00, $20253E4 ; misc start
	writebytetoaddr $03, $20253E5
	writebytetoaddr $80, $20253E6
	writebytetoaddr $A1, $20253E7
	writebytetoaddr $E0, $20253E8
	writebytetoaddr $1C, $20253E9
	writebytetoaddr $85, $20253EA
	writebytetoaddr $30, $20253EB
	writebytetoaddr $00, $20253EC
	writebytetoaddr $00, $20253ED
	writebytetoaddr $00, $20253EE 
	writebytetoaddr $00, $20253EF ; misc end

	writebytetoaddr $E4, $2024FF0	;Substructure Copy Table
	writebytetoaddr $B4, $2024FF1	
	writebytetoaddr $D8, $2024FF2	
	writebytetoaddr $9C, $2024FF3	
	writebytetoaddr $78, $2024FF4	
	writebytetoaddr $6C, $2024FF5	
	writebytetoaddr $E1, $2024FF6	
	writebytetoaddr $B1, $2024FF7	
	writebytetoaddr $D2, $2024FF8	
	writebytetoaddr $93, $2024FF9	
	writebytetoaddr $72, $2024FFA	
	writebytetoaddr $63, $2024FFB	
	writebytetoaddr $C9, $2024FFC	
	writebytetoaddr $8D, $2024FFD	
	writebytetoaddr $C6, $2024FFE	
	writebytetoaddr $87, $2024FFF	
	writebytetoaddr $4E, $2025000	
	writebytetoaddr $4B, $2025001	
	writebytetoaddr $39, $2025002	
	writebytetoaddr $2D, $2025003	
	writebytetoaddr $36, $2025004	
	writebytetoaddr $27, $2025005	
	writebytetoaddr $1E, $2025006	
	writebytetoaddr $1B, $2025007

	writebytetoaddr $FF, $2025008 ;Calc RamScript Checksum
	writebytetoaddr $B5, $2025009
	writebytetoaddr $0C, $202500A
	writebytetoaddr $48, $202500B
	writebytetoaddr $0C, $202500C
	writebytetoaddr $49, $202500D
	writebytetoaddr $0D, $202500E
	writebytetoaddr $4A, $202500F
	writebytetoaddr $0D, $2025010
	writebytetoaddr $4B, $2025011
	writebytetoaddr $0E, $2025012
	writebytetoaddr $4C, $2025013
	writebytetoaddr $00, $2025014
	writebytetoaddr $78, $2025015
	writebytetoaddr $01, $2025016
	writebytetoaddr $44, $2025017
	writebytetoaddr $09, $2025018
	writebytetoaddr $78, $2025019
	writebytetoaddr $11, $202501A
	writebytetoaddr $70, $202501B
	writebytetoaddr $04, $202501C
	writebytetoaddr $44, $202501D
	writebytetoaddr $24, $202501E
	writebytetoaddr $78, $202501F
	writebytetoaddr $1C, $2025020
	writebytetoaddr $70, $2025021
	writebytetoaddr $7C, $2025022
	writebytetoaddr $46, $2025023
	writebytetoaddr $07, $2025024
	writebytetoaddr $34, $2025025
	writebytetoaddr $A6, $2025026
	writebytetoaddr $46, $2025027
	writebytetoaddr $02, $2025028
	writebytetoaddr $48, $2025029
	writebytetoaddr $00, $202502A
	writebytetoaddr $47, $202502B
	writebytetoaddr $02, $202502C
	writebytetoaddr $48, $202502D
	writebytetoaddr $02, $202502E
	writebytetoaddr $80, $202502F
	writebytetoaddr $FF, $2025030
	writebytetoaddr $BD, $2025031
	writebytetoaddr $00, $2025032
	writebytetoaddr $00, $2025033
	writebytetoaddr $61, $2025034 ; 81 in v1+2, 61 in v0
	writebytetoaddr $57, $2025035
	writebytetoaddr $06, $2025036
	writebytetoaddr $08, $2025037
	writebytetoaddr $C4, $2025038
	writebytetoaddr $8D, $2025039
	writebytetoaddr $02, $202503A
	writebytetoaddr $02, $202503B
	writebytetoaddr $DC, $202503C
	writebytetoaddr $E8, $202503D
	writebytetoaddr $02, $202503E
	writebytetoaddr $02, $202503F
	writebytetoaddr $85, $2025040
	writebytetoaddr $53, $2025041
	writebytetoaddr $02, $2025042
	writebytetoaddr $02, $2025043
	writebytetoaddr $7D, $2025044
	writebytetoaddr $53, $2025045
	writebytetoaddr $02, $2025046
	writebytetoaddr $02, $2025047
	writebytetoaddr $DA, $2025048
	writebytetoaddr $8F, $2025049
	writebytetoaddr $02, $202504A
	writebytetoaddr $02, $202504B
	writebytetoaddr $92, $202504C
	writebytetoaddr $53, $202504D
	writebytetoaddr $02, $202504E
	writebytetoaddr $02, $202504F

	writebytetoaddr $01, $202508D ;No Room in Party
	writebytetoaddr $07, $202508E
	writebytetoaddr $1C, $202508F
	writebytetoaddr $0A, $2025090
	writebytetoaddr $02, $2025091
	writebytetoaddr $08, $2025092
	writebytetoaddr $17, $2025093
	writebytetoaddr $01, $2025094
	writebytetoaddr $1D, $2025095
	writebytetoaddr $1E, $2025096
	writebytetoaddr $3B, $2025097
	writebytetoaddr $00, $2025098
	writebytetoaddr $06, $2025099
	writebytetoaddr $16, $202509A
	writebytetoaddr $00, $202509B
	writebytetoaddr $07, $202509C
	writebytetoaddr $31, $202509D
	writebytetoaddr $15, $202509E
	writebytetoaddr $15, $202509F
	writebytetoaddr $FF, $20250A0

	writebytetoaddr $00, $20250A1 ;ADVENTURE CONTINUE
	writebytetoaddr $02, $20250A2
	writebytetoaddr $1D, $20250A3
	writebytetoaddr $11, $20250A4
	writebytetoaddr $01, $20250A5
	writebytetoaddr $03, $20250A6
	writebytetoaddr $3B, $20250A7
	writebytetoaddr $19, $20250A8
	writebytetoaddr $31, $20250A9
	writebytetoaddr $1D, $20250AA
	writebytetoaddr $00, $20250AB
	writebytetoaddr $01, $20250AC
	writebytetoaddr $0B, $20250AD
	writebytetoaddr $35, $20250AE
	writebytetoaddr $09, $20250AF
	writebytetoaddr $1B, $20250B0
	writebytetoaddr $1E, $20250B1
	writebytetoaddr $31, $20250B2
	writebytetoaddr $1D, $20250B3
	writebytetoaddr $09, $20250B4
	writebytetoaddr $FE, $20250B5
	writebytetoaddr $2E, $20250B6
	writebytetoaddr $06, $20250B7
	writebytetoaddr $15, $20250B8
	writebytetoaddr $15, $20250B9
	writebytetoaddr $00, $20250BA
	writebytetoaddr $03, $20250BB
	writebytetoaddr $19, $20250BC
	writebytetoaddr $1B, $20250BD
	writebytetoaddr $1E, $20250BE
	writebytetoaddr $06, $20250BF
	writebytetoaddr $1B, $20250C0
	writebytetoaddr $31, $20250C1
	writebytetoaddr $09, $20250C2
	writebytetoaddr $FE, $20250C3
	writebytetoaddr $19, $20250C4
	writebytetoaddr $1B, $20250C5
	writebytetoaddr $00, $20250C6
	writebytetoaddr $1E, $20250C7
	writebytetoaddr $0D, $20250C8
	writebytetoaddr $09, $20250C9
	writebytetoaddr $00, $20250CA
	writebytetoaddr $1B, $20250CB
	writebytetoaddr $09, $20250CC
	writebytetoaddr $33, $20250CD
	writebytetoaddr $1E, $20250CE
	writebytetoaddr $FE, $20250CF
	writebytetoaddr $09, $20250D0
	writebytetoaddr $00, $20250D1
	writebytetoaddr $03, $20250D2
	writebytetoaddr $01, $20250D3
	writebytetoaddr $1D, $20250D4
	writebytetoaddr $0B, $20250D5
	writebytetoaddr $FF, $20250D6

	clearflag $20
	clearflag $040A ; item ball



		   virtualloadpointer GoSeeYourFather

		   setbyte 2


		   end




DataEnd:
	EOF
  	