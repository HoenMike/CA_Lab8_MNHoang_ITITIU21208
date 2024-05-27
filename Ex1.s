# Mai Nguyen Hoang - ITITIU21208
.text
.globl main

main:
    # Ask user for x
    li $v0, 4
    la $a0, x_prompt
    syscall
    
    li $v0, 6       # Read float for x
    syscall
    mov.s $f2, $f0  # $f2 = x
    
    # Ask user for y
    li $v0, 4
    la $a0, y_prompt
    syscall
    
    li $v0, 6       # Read float for y
    syscall
    mov.s $f4, $f0  # $f4 = y
    
    # Compute 5.4xy
    mul.s $f6, $f2, $f4  # $f6 = x * y
    li.s $f8, 5.4
    mul.s $f6, $f6, $f8  # $f6 = 5.4xy
    
    # Compute -12.3y
    li.s $f8, -12.3
    mul.s $f8, $f8, $f4  # $f8 = -12.3y
    
    # Compute 18.23x
    li.s $f10, 18.23
    mul.s $f10, $f10, $f2  # $f10 = 18.23x
    
    # Compute final result
    add.s $f12, $f6, $f8   # $f12 = 5.4xy - 12.3y
    add.s $f12, $f12, $f10 # $f12 = 5.4xy - 12.3y + 18.23x
    li.s $f14, -8.23
    add.s $f12, $f12, $f14 # $f12 = 5.4xy - 12.3y + 18.23x - 8.23
    
    # Print result
    li $v0, 2
    syscall
    
    # Exit
    li $v0, 10
    syscall

.data
x_prompt: .asciiz "Enter x: "
y_prompt: .asciiz "Enter y: "