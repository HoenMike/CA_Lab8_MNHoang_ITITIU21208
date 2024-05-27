.text
.globl main

main:
    # Prompt user for color value
    li $v0, 4
    la $a0, prompt
    syscall

    # Read color value from user
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 holds the 32-bit color value

    # Extract red component
    srl $t1, $t0, 16    # Shift right 16 bits to get red in lowest 8 bits
    andi $t1, $t1, 0xFF # Mask off low 8 bits
    mtc1 $t1, $f2       # Move red value to $f2
    cvt.s.w $f2, $f2    # Convert to single-precision float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print red
    li $v0, 4
    la $a0, red_msg
    syscall
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Extract green component
    srl $t1, $t0, 8     # Shift right 8 bits to get green in lowest 8 bits
    andi $t1, $t1, 0xFF # Mask off low 8 bits
    mtc1 $t1, $f2       # Move green value to $f2
    cvt.s.w $f2, $f2    # Convert to single-precision float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print green
    li $v0, 4
    la $a0, green_msg
    syscall
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Extract blue component
    andi $t1, $t0, 0xFF # Mask off high 24 bits to get blue in lowest 8 bits
    mtc1 $t1, $f2       # Move blue value to $f2
    cvt.s.w $f2, $f2    # Convert to single-precision float
    li.s $f4, 255.0     # Load 255.0 into $f4
    div.s $f2, $f2, $f4 # Divide by 255.0 to get fraction

    # Print blue
    li $v0, 4
    la $a0, blue_msg
    syscall
    li $v0, 2
    mov.s $f12, $f2
    syscall

    # Exit
    li $v0, 10
    syscall

.data
prompt: .asciiz "Enter a 32-bit color value in hexadecimal (e.g. 0x7F7F7F): "
red_msg: .asciiz "Red: "
green_msg: .asciiz "Green: "
blue_msg: .asciiz "Blue: "