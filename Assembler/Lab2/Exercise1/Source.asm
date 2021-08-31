.586
.model flat, stdcall
option casemap :none
.stack 4096
ExitProcess proto,dwExitCode:dword

.data	
	;PUT ANY DATA YOUR PROGRAM NEEDS HERE
	;i.e define your variables.
	
.code
main proc
	
	mov cx,ax
	sub ax,bx
	jz ITSAMATCH
	mov dx,0
	jmp RESETAX

ITSAMATCH:
	mov dx,1

RESETAX:
	mov cx,ax
		
	
finish:
	invoke ExitProcess,0
main endp

end main