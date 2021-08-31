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

	inputHandle DWORD ?
	outputHandle DWORD ?
	prompt_conversion db "Please enter C to convert from Fahrenheit to Centigrade or F for the reverse:",0
	prompt_invalid db "That is not a valid option.",0
	prompt_temperature db "Please enter the temperature:",0
	bytes_written dd ?
	bytes_read dd ?
	ascii_scale db 1 dup(?)
	ascii_temp db 8 dup(?)

.code

main proc

	invoke GetStdHandle, STD_INPUT_HANDLE
	mov inputHandle, eax
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov outputHandle, eax
	invoke WriteConsoleA, outputHandle, addr prompt_conversion, LENGTHOF prompt_conversion, addr bytes_written, 0
	invoke ReadConsoleA, inputHandle, addr ascii_scale, 2, addr bytes_read,0
	invoke WriteConsoleA, outputHandle, addr prompt_temperature, LENGTHOF prompt_temperature, addr bytes_written, 0
	invoke ReadConsoleA, inputHandle, addr ascii_temp, 8, addr bytes_read,0
	lea eax,prompt_temperature
	mov eax,0
	mov al,ascii_scale

	sub al,66H
	jz cent_to_fahr
	add al,3H
	jz fahr_to_cent
	jmp invalid_char

cent_to_fahr:
	mov eax,1H

fahr_to_cent:
	mov eax,2H

invalid_char:
	invoke WriteConsoleA, outputHandle, addr prompt_invalid, LENGTHOF prompt_invalid, addr bytes_written, 0

main endp
invoke ExitProcess,0
end	main