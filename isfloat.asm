;Begin code

extern printf 
extern scanf 

global isfloat


;declarations

segment .data
format_string db "%f", 0 ; format string for scanf
askfloat db "Please enter a float number and press <enter>:", 10, 0
validmsg db "This is a valid input, thank you.", 10, 0
invalidmsg db "Invalid input, please try again: ", 10, 0

;code segment
segment .text

isfloat:

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
       jmp .isfloat_loop ;loop again
    

    .isfloat_valid:
        mov rdi, validmsg
        call printf ;print valid message

        ret ;return 