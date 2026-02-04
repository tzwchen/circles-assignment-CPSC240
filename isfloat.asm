/****************************************************************************************************************************
//Program name: "Circles". The purpose of this program is to calculate the area of a circle based on user input radius.
//Copyright (C) 2026 Tristan chen *
// *
//This file is part of the software program "Circles". *
//"Circles" is free software: you can redistribute it and/or modify it under the terms of the GNU General
Public *
//License version 3 as published by the Free Software Foundation. *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
implied *
//warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
for more details. *
//A copy of the GNU General Public License v3 has been distributed with this software. If not found it is available here: *
//<https://www.gnu.org/licenses/>. The copyright holder may be contacted here: tchen2006@csu.fullerton.edu *
//****************************************************************************************************************************/

;Purpose of this file, isfloat.asm is to get a valid float number from user input. The function isfloat will
;prompt the user to enter a float number, then it will read the input using scanf and validate it. If the input is valid, it will return the float 
;number in xmm0 register.



;Begin code

extern printf 
extern scanf 
extern getchar

global isfloat


;declarations

segment .data
format_string db "%lf", 0 ; format string for scanf
askfloat db "Please enter a float number and press <enter>:", 10, 0
validmsg db "This is a valid input, thank you.", 10, 0
invalidmsg db "Invalid input, please try again: ", 10, 0

;code segment
segment .text

isfloat:
    ;set up stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16 ;alloc space for local var

    ;prompt user for float input
    mov rdi, askfloat
    call printf

    ;read and validate float input, the loop will break when a valid float is given
    .isfloat_loop:
       mov rdi, format_string
       lea rsi, [rbp-8] ;gives scanf address of local var to store input
       xor eax, eax ;clear rax 
       call scanf

     ;if eax == 1, input is a valid float 
       cmp eax, 1 
       je .isfloat_valid 
     ;else, input is invalid
       mov rdi, invalidmsg
       call printf ;print invalid message
       .clear_input: ; will clear the invalid input to avoid infinte loops
            call getchar ;clears first char 
            cmp rax, 10 ; checks for newline character, if there is...
            je .isfloat_loop ; if it wsa just one char loop again
            jne .clear_input ;loops again if there are multiple chars in the invalid
       jmp .isfloat_loop ;loop again
      
    .isfloat_valid:
        mov rdi, validmsg
        call printf ;print valid message
        call getchar  ; clears newline character

        ;move valid float from local var to xmm0
        movsd xmm0, qword [rbp-8]

        leave ;restores the stack frame
        ret ;return 