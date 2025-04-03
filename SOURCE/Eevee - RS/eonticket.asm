INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands_eevee.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 4,5 ; Lavaridge PC - low npc advancements
	db 2     ; Youngster
	GBAPTR NormanScriptStart
	GBAPTR NormanScriptEnd

	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart

	db END_OF_CHUNKS


GoSeeYourFather:
	Text_EN "Chat it up at the LAVARIDGE TOWN\n"
	Text_EN "POKéMON CENTER.@"



NormanScriptStart:
	setvirtualaddress NormanScriptStart



	           db $43                  ;This checks if your party is bigger than 0

		   compare LASTRESULT, 0   ;It's so I can store thumb code in static spot. 

		   virtualgotoif 2, Start  ;It should never fail.

			db $00
			dw $0000

		   METLOCATION
		   GAMEORIGIN
		   BALL




		      
Start:
		   db $43 ;check party size

		   compare LASTRESULT, 5

		   virtualgotoif 2, NoRoom

		   copyvar $800B, $800D ; allows for flew to trigger later

		   checkflag $20 ; check if flew triggered

		   		virtualgotoif 1, Retry

		   pause $10

		   sound $15	

 		   pause $10
       
   		   faceplayer

		   virtualmsgbox Hello           

		   waitmsg
		
		   waitkeypress

		   writebytetoaddr $01, $0202886B

		   db $6E, $17, $8 ; y/n box $1 = y $0 = n 
		
		   compare LASTRESULT, 0

		   		virtualgotoif 5, SaidYes

		   virtualmsgbox NextTime

		   waitmsg

		   waitkeypress

		   release

		   end




SaidYes:

		virtualmsgbox Equipped

		waitmsg

		waitkeypress

		sound $04 ; pc on

		pause $3C

	    sound $02 ; pc login

		pause $3C

		release

		comparefarbytetobyte $0202886B, $1

	       virtualgotoif 1, Battle
	
	   db $35 ; return normal map song
		

Retry:

	faceplayer

	virtualmsgbox TryAgain

	waitmsg

	waitkeypress

	release

	comparefarbytetobyte $0202886B, $1

	           virtualgotoif 1, Battle
		

Battle:

		   playmoncry $85, $0

                   waitmoncry

		   setwildbattle $85, $19, $0

		   callasm $02028DE1 ;METLOCATION

		   callasm $02028DF9 ;GAMEORIGIN

		   special $138

		   waitstate

		   writebytetoaddr $00, $2028230

		   db $43

		   comparevar LASTRESULT, $800B	; compares between current party size and previous party size	   
		   
		   virtualgotoif 3, FlewAway

                   callasm $02028E11 ;BALL

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

Debug:
	Text_EN "passed@"


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
        Text_EN "You took off the headset.@"

		

Hello:
	Text_EN "I just got a new VR headset!\p"
	Text_EN "I’m in a giving mood. Why don’t you\n"
	Text_EN "try it out?@"

NextTime:
	Text_EN "You’re missing out.@"


TryAgain:
	Text_EN "Why don’t you give it another go?\p"

Equipped:
	Text_EN "You put on the headset...@"
	

	
NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart

	clearflag $20



		   virtualloadpointer GoSeeYourFather

		   setbyte 2


		   end




DataEnd:
	EOF
  	