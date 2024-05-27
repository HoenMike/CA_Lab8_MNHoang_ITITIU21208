# Mai Nguyen Hoang - ITITIU21208
.text
.globl main

main:
    # Print prompt for x
    li $v0, 4
    la $a0, prompt
    syscall

    # Read x from user
    li $v0, 6
    syscall
    mov.s $f2, $f0

    # Load n into $t0
    lw $t0, n

    # Load address of a into $t2
    la $t2, a

    # Initialize sum to zero
    li.s $f4, 0.0

    # Loop n times
    li $t1, 0           # Initialize loop counter j to 0
loop:
    beq $t1, $t0, done   # Exit loop if j equals n

    # Load a[j] into $f6
    l.s $f6, 0($t2)

    # Multiply sum by x
    mul.s $f4, $f4, $f2

    # Add a[j] to sum
    add.s $f4, $f4, $f6

    # Move to next element in array
    addi $t2, $t2, 4

    # Increment loop counter
    addi $t1, $t1, 1

    j loop              # Repeat loop

done:
    # Print result
    li $v0, 4
    la $a0, result_msg
    syscall
    li $v0, 2
    mov.s $f12, $f4
    syscall

    # Exit
    li $v0, 10
    syscall

.data
prompt: .asciiz "Enter the value of x: "
result_msg: .asciiz "The value of the polynomial is: "
n: .word 5
a: .float 4.3, -12.4, 6.8, -0.45, 3.6