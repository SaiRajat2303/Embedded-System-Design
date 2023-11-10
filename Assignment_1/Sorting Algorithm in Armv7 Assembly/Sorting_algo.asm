    AREA RESET, CODE, READONLY
	
START
    
	LDR R1,=0x40000000 ; R1 contains the starting address
	LDR R2,=25
	STR R2,[R1],#4 ; post indexing , address gets updated after storing
	LDR R2,=30
	STR R2,[R1],#4
	LDR R2,=15
	STR R2,[R1],#4
	LDR R2,=35
	STR R2,[R1],#4
	LDR R2,=10
	STR R2,[R1],#4
	; To increase Code density , one can make use of STM (store multiple) 
	; Using 5 stores to increase readability

	LDR R2,=0x04 ; storing the number of elements in R2 (storing n-1)
	LDR R3,=0x00 ; outer loop variable
	LDR R4,=0x00 ; inner loop variable
	LDR R1,=0x40000000 ; Resetting the base memory address




; Using the Bubble sort algorithm
L1
	CMP R2,R3 ; if n-1 and i are equal : then end the outer loop
	BEQ EXIT
	SUB R5,R2,R3 ; storing n-i-1 in R5
	
L2
	LDR R6,[R1],#4
	LDR R7,[R1]
	CMP R6,R7
	BGT SWAP
	ADD R4,R4,#1
	CMP R4,R5
	BLT L2

L3
	ADD R3,R3,#1
	LDR R4,=0x00
	LDR R1,=0x40000000 ; Resetting the base memory address
	CMP R2,R3
	BGT L1	

SWAP
	STR R6,[R1]
	STR R7,[R1,#-4]
	; NOT CHANGING THE VALUE OF R1
	ADD R4,R4,#1
	CMP R4,R5
	BLT L2
	BEQ L3
	
EXIT
	NOP
  END
