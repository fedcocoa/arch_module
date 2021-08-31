.586p
.model flat,stdcall
.data
	VarA DB ?
	VarB DB ?
	VarX DB ?
	Temp1 DB ?
	Temp2 DB ?
.stack
.code
main proc
	mov VarA,4
	mov VarB,5
	mov AL,VarA
	add AL,VarB
	mov Temp1,AL
	mov Temp2,AL
	add Temp2,2
	mov AL,VarA
	mov BL,10
	mul BL
	sub AL,Temp2
	mov BL,3
	mul BL
	mov BL,Temp1
	mov AH,0
	div BL
	sub AL,Temp2
	mov VarX,AL
	NOP
	NOP
main endp
end main