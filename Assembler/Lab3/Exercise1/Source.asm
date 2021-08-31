.586
.model flat, stdcall
option casemap :none
.stack 4096

GetStdHandle proto :dword
ReadConsoleA  proto :dword, :dword, :dword, :dword, :dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword
ExitProcess proto,dwExitCode:dword

STD_INPUT_HANDLE equ -10
STD_OUTPUT_HANDLE equ -11

.data	

	inputHandle DWORD ?
	outputHandle DWORD ?
	startmessage db "Enter your name: "
	rosesmessage db "Roses are red, violets are blue, how are you: "
	inputmessage db 20 dup(?)
	bytes_read DWORD ?
	bytes_written DWORD ?
	
.code
main proc
	
	invoke GetStdHandle, STD_INPUT_HANDLE	;get the handle for input
	mov inputHandle,eax						;store the handle in the variable inputHandle
	invoke GetStdHandle, STD_OUTPUT_HANDLE	;get the handle for output
	mov outputHandle,eax					;store the handle in the variable outputHandle

	invoke WriteConsoleA, outputHandle, addr startmessage, 17, addr bytes_written,0
	invoke ReadConsoleA, inputHandle, addr inputmessage, 20, addr bytes_read,0
	invoke WriteConsoleA, outputHandle, addr rosesmessage, 45, addr bytes_written,0
	invoke WriteConsoleA, outputHandle, addr inputmessage, bytes_read, addr bytes_written,0

finish:
	invoke ExitProcess, 0
main endp

end main