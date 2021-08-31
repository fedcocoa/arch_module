.586
.model flat, stdcall
	
GetStdHandle proto :dword
ReadConsoleA  proto :dword, :dword, :dword, :dword, :dword
ExitProcess proto :dword
 	
STD_INPUT_HANDLE equ -10
 	
.data

	bufSize = 80
 	inputHandle DWORD ?
 	buffer db bufSize dup(?)
 	bytes_read  DWORD  ?
 	
.code
main proc

 	invoke GetStdHandle, STD_INPUT_HANDLE
 	mov inputHandle, eax
 	invoke ReadConsoleA, inputHandle, addr buffer, bufSize, addr bytes_read,0

 	invoke ExitProcess, 0

main endp
 	
end main