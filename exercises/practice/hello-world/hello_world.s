.global hello
.type hello,%function

.data
msg: .asciz "Goodbye, Mars!"

.text
hello:
    ldr r0, =msg
    bx lr
