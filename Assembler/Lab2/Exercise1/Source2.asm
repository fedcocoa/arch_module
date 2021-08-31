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
	
	add ax,bx
	sub ax,cx
	jz ITSAMATCH
	mov dx,'N'

ITSAMATCH:
	mov dx,'Y'

	mov ax,0
	mov bx,0
	mov cx,0
		
	
finish:
	invoke ExitProcess,0
main endp

end main