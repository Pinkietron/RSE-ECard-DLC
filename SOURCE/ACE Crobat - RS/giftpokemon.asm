INCLUDE "./macros.asm"

	Mystery_Event

	db CHECKSUM_CRC
	dd 0 ; checksum placeholder
	GBAPTR DataStart
	GBAPTR DataEnd

DataStart:
	db GIVE_POKEMON
	GBAPTR PokemonStart
	db $02

PokemonStart:
	PV 0
	OT_ID 00000, 00000
	Text_EN "CROBAT"10
	Language $0202	;Language $0201=JP $0202=EN $0203=FR $0204=IT $0205=DE $0206=KR $0207=ES $0601=EGG
	Text_EN "Pinkie"7
	Markings 0 ;markings
	dw 0 ;Checksum, computed later
	dw 0 ;Unknown

;Substruct1
	Pokemon CROBAT
	Holds ITEM_NONE
	dd 125 ;Experience
	PP_Ups 0,0,0,0 ;PP_Ups
	Friendship 0 ;Friendship
	dw 0 ;Unknown

;Substruct2
	Moves $6d83, $0, $0, $0
	PP 127, 15, 20, 15

;Substruct3
	EVs 0,0,0,0,0,0
	Condition 0,0,0,0,0,0    ;i.e. Contest Condition

;Substruct4
	PokerusStatus 0
	MetLocation $FF
	Origins 5,0,4,1  ;Lv met, Game of Origin, Ball, OT Gender
	IVs 0,0,0,0,0,0, ABILITY1
	Ribbons 0

	dd 0  ;Status condition
	db 5  ;Lv
	db 0  ;pokerus remaining
	dw 23 ;Current HP
	dw 23 ;Total HP
	dw 14 ;Attack
	dw 13 ;Def
	dw 12  ;Speed
	dw 13 ;Sp Atk
	dw 18 ;Sp Def

	End_GiftPokemon ;Use End_GiftEgg if sending egg

DataEnd:
	EOF