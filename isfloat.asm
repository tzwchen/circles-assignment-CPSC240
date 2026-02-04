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