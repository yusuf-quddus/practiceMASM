
comment !

	5/7/20

	Program:
	Display the value of expression input values for num1 ,num2, and num3 and display the
	value of the expression ( (num1 ^ 3) * num2 + 5 * ( num2 ^ 2) ) / num3.
!

include Irvine32.inc

.data
num1 dword ?
num2 dword ?
num3 dword ?
result dword ?
remainder dword ?
instruction byte "You will be entering 3 numbers to do operation on in this program", 0
request byte "Enter a number: ", 0
solutionString byte "The Solution is: ", 0
letter byte " remainder ", 0
equationStr byte "( (num1 ^ 3) * num2 + 5 * ( num2 ^ 2) ) / num3", 0


.code
main PROC

mov edx, offset instruction		; Inform user of direction
call writeString
call crlf
call crlf

; request 3 decimal numbers from users


mov edx, offset request		
call writeString
call readDec
mov num1, eax


call writeString
call readDec
mov num2, eax

	
call writeString
call readDec
mov num3, eax


; calculation begins


sub eax, eax					; empty eax

mov eax, num1
mov ebx, num1
mul ebx							; num1 * num1
mul ebx							; num1^2 * num1

mul num2						; num1^3 * num2
mov ebx, eax					; saves result to ebx

sub eax, eax					; empty eax

mov eax, num2
mul eax							; num2 * num2
mov ecx, 5
mul ecx							; num2^2 * 5

add eax, ebx					; solves (num1 ^ 3) * num2 + 5 * ( num2 ^ 2)
								; solution now in eax

mov edx, 0						; empty edx

div num3						; divide current result by num3

mov ecx, edx


; outputting results


call crlf

mov edx, offset equationStr
call writeString				; output equation for user

call crlf
call crlf

mov edx, offset solutionString			
call writeString				; output solution message

call writedec					; writes result from eax


mov edx, offset letter
call writeString				; output letter for remainder

mov eax, ecx
call writedec					; writes remainder

call crlf
call crlf


exit
main ENDP
END main



comment !
This is what the program looks like when run: 

You will be entering 3 numbers to do operation on in this program

Enter a number: 1
Enter a number: 2
Enter a number: 3

( (num1 ^ 3) * num2 + 5 * ( num2 ^ 2) ) / num3

The Solution is: 7 remainder 1

Press any key to continue . . .

!