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
