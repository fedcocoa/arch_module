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

	bufSize = 8
	inputHandle DWORD ?
	outputHandle DWORD ?
	buffer db bufSize dup(?)
	bytes_read DWORD ?
	bytes_written DWORD ?
	
.code
main proc
	
	invoke GetStdHandle, STD_INPUT_HANDLE	;get the handle for input
	mov inputHandle,eax						;store the handle in the variable inputHandle
	invoke GetStdHandle, STD_OUTPUT_HANDLE	;get the handle for output
	mov outputHandle,eax					;store the handle in the variable outputHandle

testLabel:
	invoke ReadConsoleA, inputHandle, addr buffer, bufSize, addr bytes_read,0	;read from the console
	invoke WriteConsoleA, outputHandle, addr buffer, bytes_read, addr bytes_written, 0
	jmp testLabel
	
finish:
	invoke ExitProcess, 0
main endp

end main