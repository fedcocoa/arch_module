.586
.model flat, stdcall
option casemap :none
.stack 4096

ExitProcess proto,dwExitCode:dword
GetStdHandle proto :dword
ReadConsoleA  proto :dword, :dword, :dword, :dword, :dword
WriteConsoleA proto :dword, :dword, :dword, :dword, :dword
STD_INPUT_HANDLE equ -10
STD_OUTPUT_HANDLE equ -11

.data
	
	bufSize = 80
 	inputHandle DWORD ?
 	buffer db bufSize dup(?)
 	bytes_read  DWORD  ?
	sum_string db "The number was ",0
 	outputHandle DWORD ?
	bytes_written dd ?
	actualNumber dw 0
	asciiBuf db 4 dup (0)

.code
main proc
	call readString
	call readString
	call writeString
main endp

readString proc
 	invoke GetStdHandle, STD_INPUT_HANDLE
 	mov inputHandle, eax
 	invoke ReadConsoleA, inputHandle, addr buffer, bufSize, addr bytes_read,0
	sub bytes_read, 2	; -2 to remove cr,lf
 	mov ebx,0
	mov al, byte ptr buffer+[ebx] 
	sub al,30h
	add	[actualNumber],ax
getNext:
	inc	bx
	cmp ebx,bytes_read
	jz cont
	mov	ax,10
	mul	[actualNumber]
	mov actualNumber,ax
	mov al, byte ptr buffer+[ebx] 
	sub	al,30h
	add actualNumber,ax
		
	jmp getNext
cont:
	nop
readString endp

writeString proc
	invoke GetStdHandle, STD_OUTPUT_HANDLE
 	mov outputHandle, eax
	mov	eax,LENGTHOF sum_string	;length of sum_string
	invoke WriteConsoleA, outputHandle, addr sum_string, eax, addr bytes_written, 0
	mov ax,[actualNumber]
	mov cl,10
	mov	bl,3
nextNum:
	div	cl
	add	ah,30h
	mov byte ptr asciiBuf+[ebx],ah
	dec	ebx
	mov	ah,0
	cmp al,0
	ja nextNum
		
	mov	eax,4

 	invoke WriteConsoleA, outputHandle, addr asciiBuf, eax, addr bytes_written, 0

	mov eax,0
	mov eax,bytes_written
writeString endp
invoke ExitProcess,0
end	main