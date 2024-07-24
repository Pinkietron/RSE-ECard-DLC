# RSE-ECard-DLC
Adding more content to Pokemon Ruby, Sapphire, and (maybe) Emerald

This project focuses on adding special encounters not available in Ruby or Sapphire to the game.

Specific Pokemon not listed under the to-do may be done upon request

I won't add content to any language other than ENG for now because it is just a giant pain.

The E-Reader Cards folder contains printable .raw files which you print with the dot code print tool made by Firefly or can be sent to games via mGBA's link mode with an e-Reader ROM. https://www.caitsith2.com/ereader/devtools.htm

E-Reader Save Injections is for injecting a save to an E-Reader or Flashcart for use on original hardware.


# Credits
ImABlisy - Programming assistance and providing a foundation to build from

Shao - Programming assistance

# Building - WSL

The source folders already contain all of the required bash script files for building

Depends on: ```python2.7```

After making any changes:

```make```

```./nedcenc -d -i 00-C000-EN.raw-01.raw -o strip-01.bin```

```./nedcenc -d -i 00-C000-EN.raw-02.raw -o strip-02.bin```

In a hex editor remove the header from strip1 (the file should start with 76 70 6B...) then in strip2,
copy from offset 0x51 to the end of the file and paste that into the end of strip1 and save the file

```./nevpk -d -i strip-01.bin -o strip-01.z80```

```./nedcmake -i strip-01.z80 -type 1 -region 1```

# TO-DO:


# POKEMON WITH EVENT ONLY MOVES:

SWABLU - FALSE SWIPE (BOX)

ZIGZAGOON - EXTREME SPEED (BOX)

SKITTY - PAY DAY (BOX)

PICHU - SURF (BOX)

PIKACHU - FLY (JP)

PICHU - FOLLOW ME (POKEPARK JP)

ODDISH - LEECH SEED (JP)

MEOWTH - PETAL DANCE (JP)

POLIWAG - SWEET KISS (JP)

BELLSPROUT - TEETER DANCE (JP)

ABSOL - WISH (JP)

PICHU - WISH (JP)

RALTS - WISH (JP)

BAGON - WISH (JP)

# COLOSSEUM SHADOWS:

NOCTOWL

FLAFFY

SKIPLOOM

QUAGSIRE

MISDREAVUS

FURRET

YANMA

REMORAID

MANTINE

QWILFISH

MEDITITE

DUNSPARCE

SWABLU

SUDOWOODO

HITMONTOP

LEDIAN

GLIGAR

STANTLER

PILOSWINE

SNEASEL

AIPOM

MURKOW

FORRETRESS

ARIADOS

GRANBULL

VIBRAVA

SUNFLORA

DELIBIRD

HERACROSS

SKARMORY

MILTANK

ABSOL

HOUNDOOM

TROPIUS

METAGROSS - COMPLETED

TYRANITAR

SMEARGLE

URSARING

SHUCKLE

SCIZOR (JP)

# XD SHADOWS:

TEDDIURSA

LEDYBA

POOCHYENA

HOUNDOUR

BALTOY

MAREEP

SEEDOT

SPHEAL

GULPIN

SPINARAK

NUMEL

CARVANHA

SHROOMISH

DELCATTY

VOLTORB

VULPIX

DUSKULL

RALTS

MAWILE

SNORUNT

PINECO

NATU

ROSELIA

MEOWTH

SWINUB

SPEAROW

GRIMER

SEEL

LUNATONE

TOGEPI

NOSEPASS

ZANGOOSE

PARAS

GROWLITHE

SHELLDER

BEEDRILL

PIDGEOTTO

TANGELA

BUTTERFREE

MAGNETON

VENOMOTH

WEEPINBELL

ARBOK

PRIMAPE

HYPNO

GOLDUCK

SABLEYE

DODRIO

RATICATE

FARFETCH'D

ALTARIA

KANGASKHAN

BANETTE

MAGMAR

PINSIR

RAPIDASH

MAGCARGO

HITMONCHAN

HITMONLEE

LICKITUNG

SCYTHER

CHANSEY

SOLROCK

STARMIE

SWELLOW

ELECTABUZZ

SNORLAX

POLIWRATH

MR. MIME

DUGTRIO

MANETRIC

SALAMENCE

MAROWAK

LAPRAS

LUGIA

RHYDON

MOLTRES - COMPLETED

EXEGGUTOR

TAUROS

ARTICUNO - COMPLETED

ZAPDOS - COMPLETED

DRAGONITE

# XD NON-SHADOWS:

CHIKORITA (MT. BATTLE)

CYNDAQUIL (MT. BATTLE)

TOTODILE (MT. BATTLE)

# MISC:

CHARMANDER

BULBASAUR

SQUIRTLE

EEVEE 

MEWTWO

KABUTO

OMANYTE

AERODACTYL

PORYGON
