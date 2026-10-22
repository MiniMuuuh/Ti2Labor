/*
 * Aufgabe_1_4.S
 *
 * SoSe 2026
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
//Essen
        .equ BREAD_bm,      (1 << 0)               
        .equ BUTTER_bm,     (BREAD_bm     << 1)    
        .equ CHEESE_bm,     (BUTTER_bm    << 1)    
        .equ JAM_bm,        (CHEESE_bm    << 1)    
//Getränke
        .equ TEQUILA_bm,    (JAM_bm       << 1)    
        .equ MILK_bm,       (TEQUILA_bm   << 1)    
        .equ RUM_bm,        (MILK_bm      << 1)    
        .equ WINE_bm,       (RUM_bm       << 1)    
        .equ VODKA_bm,      (WINE_bm      << 1)    
//Nüsse
        .equ ALMOND_bm,     (VODKA_bm     << 1)    
        .equ PEANUT_bm,     (ALMOND_bm    << 1)    
        .equ CHESTNUTS_bm,  (PEANUT_bm    << 1)    
//Früchte
        .equ ANANAS_bm,     (CHESTNUTS_bm << 1)       
        .equ BANANA_bm,     (ANANAS_bm    << 1)    
        .equ LEMON_bm,      (BANANA_bm    << 1)    

        .equ FOOD_bm,    (BREAD_bm & BUTTER_bm & CHEESE_bm & JAM_bm)           
        .equ DRINKS_bm,  (TEQUILA_bm & MILK_bm & RUM_bm & WINE_bm & VODKA_bm)  
        .equ NUTS_bm,    (ALMOND_bm & PEANUT_bm & CHESTNUTS_bm)                
        .equ FRUITS_bm,  (ANANAS_bm & BANANA_bm & LEMON_bm)

.equ BREAKFAST_bm, (BREAD_bm & BUTTER_bm & CHEESE_bm & MILK_bm & PEANUT_bm & LEMON_bm) 

LDR R0, = Breakfast_bm   // Tagesfrühstück                                 
LDR R1, = (Breakfast_bm & FRUITS_bm)                    
LDR R2, = ((Breakfast_bm & ~MILK_bm) | VODKA_bm)         
LDR R3, = (FRUITS_bm | (FRUITS_bm << 16 ) )            
LDR R4, = ((FOOD_bm & ~CHEESE_bm & ~BUTTER_bm) | (DRINKS_bm  & ~MILK_bm) | BANANA_bm | PEANUT_bm)
LDR R5, = ((Breakfast_bm & ~PEANUT_bm) | CHESTNUTS_bm)                   



stop:
	nop
	bal stop

.end
