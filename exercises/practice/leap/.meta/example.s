.global leap_year
.type leap_year,%function

.text
leap_year:
    push {r4, lr}      /* safe values of r4 and lr before this function call on the stack */
    mov r4, r0         /* safe the value of r0 (year) in r4 */
    mov r1, #4         /* set the divisor for the modulo operation to 4 */
    bl __umodsi3       /* call the modulo operation */
    tst r0, r0         /* Check if the year is divisible by 4 */
    bne return_false  /* if not divisible by 4 return */

    mov r0, r4         /* restore the year in r0 because it got overwritten by the modulo operation */
    mov r1, #100       /* set the divisor for the modulo operation to 100 */
    bl __umodsi3       /* call the modulo operation */
    tst r0, r0         /* Check if the year is divisible by 100 */
    bne return_true   /* if not divisible by 100 return true */

    mov r0, r4         /* restore the year in r0 because it got overwritten by the modulo operation */
    mov r1, #400       /* set the divisor for the modulo operation to 400 */
    bl __umodsi3       /* call the modulo operation */
    tst r0, r0         /* Check if the year is divisible by 400 */
    beq return_true   /* if it is divisible by 400 return true else it will return false */

return_false:
    eor r0, r0         /* set r0 to 0 */
    b fin              /* call fin */

return_true:
    mov r0, #1         /* set r0 to 1 */
    b fin              /* call fin */

fin:
    pop {r4, lr}       /* restore the values that were in r4 and lr before this function call */
    bx lr              /* return to the calling program/function */
