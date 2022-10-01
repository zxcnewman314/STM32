 AREA DATA
	
 AREA EXAMPLE, CODE
	ENTRY
	EXPORT __main

__main
	
    MOV R0,#9; SORT number
 LDR R2,=0x40000000 ;  start address
 
 SUB R1,R0,#1; r1 <- 8
 MOV R4,#4  ;r4 <- 4
 MLA R3,R1,R4,R2   ;r3<- r1*r4+r2 = r2+32
 SUB R4,R3,#4 ;r4 <- r2+28
LOOPA
 ADD R5,R2,#4  ;r5 <- r2+4
LOOPB
      LDR R6,[R2]
      LDR R7,[R5]
	  CMP R6,R7
	  STR R6,[R5]
	  STR R7,[R2]   ;swap
	  ADD R5,R5,#4   ; change inner address to next one
	  CMP R5,R3
	  BLS LOOPB
	  ADD R2,R2,#4   ;change outter address to next one
	  CMP R2,R4
	  BLS LOOPA	    
	  LDR R2,=0x40000000
	  MOV R0,R0,LSR #1 ;R0 <- R0>>1
	  MOV R4,#4  ; R4 <- 4
	  MLA R3,R0,R4,R2	;r3<- r1*r4+r2
LOOPC
      
      LDR R1,[R3]
	  MOV R0,#100
	B .
		



