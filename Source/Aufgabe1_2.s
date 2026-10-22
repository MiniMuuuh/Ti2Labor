/*
 * Aufgabe_1_2.S
 *
 * SoSe 2026
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : 64 Bit AdditioAddition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
	//A = R1:R0 = 0xFFFFFFFF_FFFFFFFF (2⁶⁴ − 1)
//B = R3:R2 = 0x00000000_00000001
//Werte: A = 0xFFFFFFFF_FFFFFFFF; B = 0x00000000_00000001
// R6:R5:R4 = 1 : 0x00000000 : 0x00000000
//Test: A = B = 0x80000000_00000000 -> 1 : 0 : 0

ldr r0, = 0xFFFFFFFF    //A low
ldr r1, = 0xFFFFFFFF    //A high    
ldr r2, = 0x00000001    //B low
ldr r3, = 0x00000000    //B high

mov r7, #0          //low Überlauf initialisieren
mov r6, #0          //high Überlauf initialisieren
adds r4, r0, r2     //low wörter addieren
movcs r6, #1        //low überlauf merken
adds r5, r1, r3     //high wörter addieren
movcs r6, #1        //high überlauf merken
adds r5, r5, r7     //low überlauf in high wort
movcs r6, #1        //neuer High Überlauf

stop:
	nop
	bal stop

.end
