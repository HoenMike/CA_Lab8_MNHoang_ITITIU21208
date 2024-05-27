# Mai Nguyen Hoang - ITITIU21208
.text
.globl main

main:
    # Load color value
    lw $t0, color

    # Print "R: "
    la $a0, red_label
    li $v0, 4
    syscall

    # Extract red component
    srl $t1, $t0, 16    # Shift right 16 bits to get red in lowest 8 bits
    andi $t1, $t1, 0xFF # Mask off low 8 bits
    mtc1 $t1, $f2       # Move red value to $f2
    cvt.s.w $f2, $f2    # Convert to float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print red
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Print "G: "
    la $a0, green_label
    li $v0, 4
    syscall

    # Extract green component
    srl $t1, $t0, 8     # Shift right 8 bits to get green in lowest 8 bits
    andi $t1, $t1, 0xFF # Mask off low 8 bits
    mtc1 $t1, $f2       # Move green value to $f2
    cvt.s.w $f2, $f2    # Convert to float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print green
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Print "B: "
    la $a0, blue_label
    li $v0, 4
    syscall

    # Extract blue component
    andi $t1, $t0, 0xFF # Mask off high 24 bits to get blue in lowest 8 bits
    mtc1 $t1, $f2       # Move blue value to $f2
    cvt.s.w $f2, $f2    # Convert to float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print blue
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Exit
    li $v0, 10
    syscall

.data
color: .word 0x0070A0F0 # blue
red_label: .asciiz "R: "
green_label: .asciiz "\nG: "
blue_label: .asciiz "\nB: "