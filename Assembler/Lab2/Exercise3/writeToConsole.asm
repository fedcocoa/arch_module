.586
.model flat, stdcall
	
GetStdHandle proto :dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword
ExitProcess proto :dword
 	
STD_OUTPUT_HANDLE equ -11
 	
.data
 	
 	sum_string db "Test Console output",0
 	outputHandle DWORD ?
 	buffer db 64 dup(?)
 	bytes_written dd ?
 	
.code
main proc
 	invoke GetStdHandle, STD_OUTPUT_HANDLE
 	mov outputHandle, eax

 	invoke WriteConsoleA, outputHandle, addr sum_string, eax, addr bytes_written, 0

	mov eax,0
	mov eax,bytes_written
 	   
 	invoke ExitProcess, 0
main endp
 	
end main