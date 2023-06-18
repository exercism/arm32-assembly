.global hello
.type hello,%function

.data
msg: .asciz "Hello, World!"

.text
hello:
    ldr r0, =msg
    bx lr
