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

format_string db "%f", 0 ; format string for scanf
pi dq 3.14159 ; constant value of pi

radius dq 0.0 ; variable to hold radius input
area dq 0.0 ; variable to hold area result


segment .text ;code segment

circle:  ;the entry point for the function

    ;stack frame
    push rbp
    mov rbp, rsp
    sub rsp, 16 ;allocate space on stack if needed

    ;prompt user for radius
    call isfloat ; call isfloat 

    ;read radius input
    lea rax, [radius] ; loads the address of radius into rax
    push rax ; push rax onto the stack
    push format_string ;push format string onto the stack
    call scanf 
    add rsp, 16 ;clears stack, 16 bytes 8 (radius) + 8 (format string)

    ;calculate the area of the circle, area = pi * r^2, sd = scalar double
    movsd xmm0, [radius] ; load radius into xmm0 
    movsd xmm1, xmm0  ; copy radius
    mulsd xmm0, xmm1 ; squares radius
    movsd xmm1, [pi] ; load pi into xmm1
    mulsd xmm0, xmm1 
    movsd [area], xmm0 ; moves value of xmm0 (area) back to memory onto variabe area
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

    leave 
    ret 
;end of function
