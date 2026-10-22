/*
 * Aufgabe_1_1.S
 *
 * SoSe 2026
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe :  Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
	ldr r0, = 15    // value x
ldr r1, = y     // threshold y

cmp r0, r1      // r0 - r1
bls if_else     // LS -> Vorzeichenlos kleiner oder gleich; x<=y -> else
mov ro, #255    // x = 255        
b endif

if_else:
    mov ro, #0

endif::

/*
/// LÖSUNGSANSATZ 2 ///

ldr r0, = y

// Test 1   Erg:0
ldr r1, y-1
cmp r1, r0
movhi r1, #255
movls r1, #0

// Test 2   Erg:0
ldr r2, y
cmp r2, r0
movhi r2, #255
movls r2, #0

// Test 3   Erg:255
ldr r3, y+1
cmp r3, r0
movhi r3, #255
movls r3, #0

// Test 4   Erg:0
ldr r4, =0
cmp r4, r0
movhi r4, #255
movls r4, #0

// Test 5   Erg:255
ldr r5, 0xFFFFFFFF
cmp r5, r0
movhi r5, #255
movls r5, #0
*/
stop:
	nop
	bal stop

.end
