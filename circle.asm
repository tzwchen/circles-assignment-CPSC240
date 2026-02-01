;Begin code

extern printf ;c++ function to write to standard output
extern scanf ; reads from standard input

global circle ;exported function

;declarations
segment .data 

askradius db "Please enter a float number and press <enter>:" 10, 0

thanksmsg db "thank you for your input", 10, 0

area_msg db "The area of the circle with radius %f is %f", 10, 0

sent_msg db "The area will be sent to the main function", 10, 0

format_string db "%f", 0 ; format string for scanf
pi dq 3.14159 ; constant value of pi

;uninitialized data declarations
section .bss

radius resq 1 ; reserve space for radius (8 bytes)
area resq 1   ; reserve space for area (8 bytes)


segment .text ;code segment

circle:  ;the entry point for the function

    ;prompt user for radius
    push askradius 
    call printf
    add rsp, 4

    ;read radius input
    lea rax, [radius] ; loads the address of radius into rax
    push rax ; push rax onto the stack
    push format_string ;push format string onto the stack
    call scanf 
    add rsp, 16 ;clears stack, 16 bytes 8 (radius) + 8 (format string)

    ;calculate the area of the circle, area = pi * r^2, sd = scalar double
    mov sd xmm0, [radius] ; load radius into xmm0 
    push xmm0 ; push radius onto the stack
    mov sd xmm1, xmm0  ; copy radius
    mul sd xmm0, xmm1 ; squares radius
    mov sd xmm1, [pi] ; load pi into xmm1
    mul sd xmm0, xmm1 
    mov sd [area], xmm0l ; moves value of xmm01 (area) back to memory onto variabe area

    ;thanks message
    push thanksmsg
    call printf
    add rsp, 8

    ;print area message
    push qword [area] ; push area value onto stack
    push qword [radius] ; push radius value onto stack
    push area_msg ; push format string onto stack
    call printf
    add rsp, 24; clean stack 8 (area) + 8 (radius) + 8 (format string)

    ;sent message
    push sent_msg
    call printf
    add rsp, 8

    ret 
;end of function
