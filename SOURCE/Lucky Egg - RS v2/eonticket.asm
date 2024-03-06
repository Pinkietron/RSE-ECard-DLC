INCLUDE "../macros.asm"
INCLUDE "../constants/items.asm"
INCLUDE "../constants/scriptcommands.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db IN_GAME_SCRIPT
	db 8,1 ; Petalburg Gym
	db 1   ; Norman
	GBAPTR NormanScriptStart
	GBAPTR NormanScriptEnd


	db MIX_RECORDS_ITEM
	db 1  ; ???
IF REGION == REGION_DE
	db 5  ; distribution limit from German debug ROM
ELSE
	db 30 ; distribution limit from English release
ENDC
	dw LUCKY_EGG


	db PRELOAD_SCRIPT
	GBAPTR PreloadScriptStart


	db END_OF_CHUNKS


GoSeeYourFather:
	Text_EN "Go see your father at the GYM in\n"
	Text_EN "PETALBURG.@"


NormanScriptStart:
	setvirtualaddress NormanScriptStart
	
	checkitem LUCKY_EGG, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkpcitem LUCKY_EGG, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .delete_script
	checkflag $00CE
	virtualgotoif 1, .delete_script
	
	lock
	faceplayer
	virtualmsgbox GoodToSeeYou
	waitmsg
	waitkeypress

	checkitemroom LUCKY_EGG, 1
	compare LASTRESULT, 0
	virtualgotoif 1, NoRoomToGive

	copyvarifnotzero $8000, LUCKY_EGG
	copyvarifnotzero $8001, 1
	callstd 0
	setflag $0853
	virtualmsgbox AppearsToBeAFerryTicket
	waitmsg
	waitkeypress
	release
.delete_script
	killscript

NoRoomToGive:
	virtualmsgbox KeyItemsPocketIsFull
	waitmsg
	waitkeypress
	release
	end

GoodToSeeYou:
	Text_EN "DAD: \v1! Good to see you!\n"
	Text_EN "There’s a letter here for you.@"


AppearsToBeAFerryTicket:
	Text_EN "DAD: \v1! It appears to be a LUCKY EGG.\n"
	Text_EN "They are quite special.@"

KeyItemsPocketIsFull:
	Text_EN "DAD“\v1’ the ITEMS POCKET in\n"
	Text_EN "your BAG is full.\p"
	Text_EN "Move some items for safekeeping\n"
	Text_EN "in your PC then come see me.@"

; whoever wrote the English text obviously wasn’t
; familiar with R/S’s character set…
NormanScriptEnd:


PreloadScriptStart:
	setvirtualaddress PreloadScriptStart
	
	checkitem LUCKY_EGG, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkpcitem LUCKY_EGG, 1
	compare LASTRESULT, 1
	virtualgotoif 1, .ineligible
	checkflag $00CE
	virtualgotoif 1, .ineligible

	checkitemroom LUCKY_EGG, 1
	compare LASTRESULT, 0
	virtualgotoif 1, .no_room

	virtualloadpointer GoSeeYourFather
	setbyte 2
	end

.ineligible
	virtualloadpointer MayBeplayedOnlyOnce
	setbyte 3
	end

.no_room
	virtualloadpointer BagsKeyItemsPocketFull
	setbyte 3
	end

MayBeplayedOnlyOnce:
; …or with the English language.
	Text_EN "This EVENT may be played only once.@"


BagsKeyItemsPocketFull:
	Text_EN "Your BAG’s ITEMS POCKET is full.@"

DataEnd:
	EOF