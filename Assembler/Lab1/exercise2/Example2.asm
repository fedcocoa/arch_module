.586p
.model flat,stdcall
.data
.stack
.code
main proc
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
	mov al,4
	dec al
	dec al
	dec al
	dec al
	dec al
	mov bl,0feh
	inc bl
	inc bl
main endp
end main