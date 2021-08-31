.586
.model flat, stdcall
option casemap :none
.stack 4096

ExitProcess proto dwExitCode:dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword

.data	
	
	string db "Hello world!",0
	
.code
main proc
	
	
	
finish:
	invoke ExitProcess,0
main endp

end main