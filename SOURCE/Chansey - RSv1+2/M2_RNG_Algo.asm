movs r0, r0
push {lr}
push {r0, r1, r2, r3, r4, r5, r6, r7}
ldr r2, gRNGValue
ldr r1, [r2]
ldr r0, TempLocation
ldr r3, gMult
ldr r4, gAdd
muls r1, r3, r1 @rng pid low
add r1, r4
lsrs r2, r1, #0x10 @shift right by 16 bits and store in r1
muls r1, r3, r1 @ rng pid high
add r1, r4
lsrs r5, r1, #0x10 @shift right
strh r2, [r0]
strh r5, [r0, #2] @ store pid high opposite of pid low
ldr r6, r0 @copy pid to r5 for backup
muls r1, r3, r1 @blank
add r1, r4 
muls r1, r3, r1 @rng iv 1
add r1, r4
lsls r2, r1, #1 @ bitshift and store into r2
lsrs r2, r2, #0x11
muls r1, r3, r1 @ rng iv 2
add r1, r4
lsls r5, r1, #1
lsrs r5, r5, #0x11
lsls r5, r5, #0xf
orrs r2, r5 @ combine ivs at r2 and r5
lsls r6, 31 @ calcing ability with pid copy stored in r6
orrs r2, r6
str r2, [r0, #0x48] @ store at iv location
ldr r5, [pc, #0xd4] @ what pointer is this?
ldr r6, [r5]
lsrs r6, r6, #0x10
strh r6, [r0, #4]
adds r5, #4
ldr r6, [r5]
ldr r0, SubstructureTable @ is this the right pointer?
ldr r3, CalculateBoxMonChecksum @ ^ same question
movs r0, r0

.alignment
gRNGValue:
    .long 0x03004818
gMult:
    .long 0x41c64e6d
gAdd:
    .long 0x00006073
TempLocation:
    .long 0x020253A0
SubstructureTable:
    .long $02024FF0
PartyRam:
    .long 0x03004360
EnemyRam:
    .long 0x030045C0
CopyLenPresubstructInfo:
    .long 0x04000008
CopyLenOneSubstruct:
    .long 0x04000003
CalculateBoxMonChecksum:
    .long 0x0803b125
EncryptBoxMon:
    .long 0x0803c5f1
CalculateMonStats:
    .long 0x0803b1b9
TrainerGender:
    .long 0x02024EAF
gSpecialVar_Result:
    .long 0x0202e8dc
Setboxmondata:
    .long 0x0803d2ed
