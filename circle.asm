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

;Purpose of this file, circle.asm is to calculate the area of a circle based on user input. The function circle will
;call the isfloat function (implemented in isfloat.asm) to get a valid float radius from the user, then it will 
;calculate the area of the circle using the formula area = pi * r^2. 

;Begin code

extern printf ;c++ function to write to standard output
extern scanf ; reads from standard input
extern isfloat ; isfloat is an external function

global circle ;exported function


;declarations
segment .data 

thanksmsg db "thank you for your input", 10, 0

area_msg db "The area of the circle with radius %f is %f", 10, 0

sent_msg db "The area will be sent to the main function", 10, 0

format_string db "%lf", 0 ; format string for scanf
pi dq 3.14159 ; constant value of pi

;uninitialized variables
segment .bss

radius resq 1
area resq 1 

segment .text ;code segment

circle:  ;the entry point for the function

    ;stack frame
    push rbp
    mov rbp, rsp

    ;prompt user for radius
    call isfloat ; call isfloat 
    movsd [radius], xmm0 ; store the float in radius


    ;calculate the area of the circle, area = pi * r^2, sd = scalar double
    movsd xmm0, [radius] ; load radius into xmm0 
    movsd xmm1, xmm0  ; copy radius
    mulsd xmm0, xmm1 ; squares radius
    movsd xmm1, [pi] ; load pi into xmm1
    mulsd xmm0, xmm1 
    movsd [area], xmm0 ; moves value of xmm0 (area) back to memory onto variabe area

    ;thanks message
    mov rdi, thanksmsg 
    xor eax, eax
    call printf

    ;print area message
    mov rdi, area_msg
    movsd xmm0, [radius] ; load radius into xmm0 for printf
    movsd xmm1, [area] ; load area into xmm1 for printf
    mov eax, 2 ;passing 2 floats (using xmm0 and xmm1)
    call printf

    ;sent message
    mov rdi, sent_msg
    xor eax, eax
    call printf
 

    leave 
    ret 
;end of function
