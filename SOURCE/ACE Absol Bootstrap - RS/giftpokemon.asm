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
	Text_EN "          "10
	Language $0202	;Language $0201=JP $0202=EN $0203=FR $0204=IT $0205=DE $0206=KR $0207=ES $0601=EGG
	Text_EN "       "7
	Markings 0 ;markings
	dw 0 ;Checksum, computed later
	dw 0 ;Unknown

;Substruct1
	Pokemon ABSOL
	Holds ITEM_NONE
	dd 0 ;Experience
	PP_Ups 0,0,0,0 ;PP_Ups
	Friendship 70 ;Friendship
	dw 0 ;Unknown

;Substruct2
	Moves $0, $0, $0, $0
	PP 0, 0, 0, 0

;Substruct3
	EVs 0,0,0,0,0,0
	Condition 0,0,3,68,131,3    ;i.e. Contest Condition

;Substruct4
	PokerusStatus 2
	MetLocation $FF
	Origins 0,0,1,0  ;Lv met, Game of Origin, Ball, OT Gender
	IVs 0,0,0,0,0,0, ABILITY1
	Ribbons 0

	dd 0  ;Status condition
	db 0  ;Lv
	db 0  ;pokerus remaining
	dw 10 ;Current HP
	dw 10 ;Total HP
	dw 5 ;Attack
	dw 5 ;Def
	dw 5  ;Speed
	dw 5 ;Sp Atk
	dw 5 ;Sp Def

	End_GiftPokemon ;Use End_GiftEgg if sending egg

DataEnd:
	EOF