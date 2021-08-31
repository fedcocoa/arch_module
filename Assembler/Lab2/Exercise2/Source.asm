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
	
		mov ax,3H
		mov bx,4H
		mov cx,0
again:
		add cx,ax
		dec bx
		jz done
		jmp again
done:
		mov ax,0
		mov bx,0
		
	
finish:
	invoke ExitProcess,0
main endp

end main