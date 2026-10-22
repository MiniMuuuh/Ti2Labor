/*
 * Aufgabe_1_3.S
 *
 * SoSe 2026
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : 64 Bit Addition mit Sättigung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
/// KEIN ÜBERLAUF ///

//Werte: A = 0x7FFFFFFF_FFFFFFFF + 1 = 0x00000000_00000000; C = 0

ldr r0, = 0xFFFFFFFF    //A low
ldr r1, = 0x7FFFFFFF    //A high    
ldr r1, = 0x00000001    //B low
ldr r1, = 0x00000000    //B high
bl add64_sat
nop

/// ÜBERLAUF -> SÄTTIGUNG ///

//Werte: 0xFFFFFFFF_00000000 + 0x00000001_00000000 -> Überlauf

ldr r0, = 0x00000000  
ldr r1, = 0x7FFFFFFF        
ldr r2, = 0x00000001    
ldr r3, = 0x00000000 

mov r7, #0
mov r6, #0
adds r4, r0, r2
movcs r6, #1
adds r5, r1, r3
movcs r6, #1
adds r5, r5, r7
movcs r6, #1

cmp r6, #1
mvncs r4, #0
mvncs r5, #0

bx lr

stop:
	nop
	bal stop


.end
