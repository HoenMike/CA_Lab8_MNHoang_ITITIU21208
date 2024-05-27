# Mai Nguyen Hoang - ITITIU21208
.text
.globl main

main:
  # Prompt user for number of terms
  li $v0, 4
  la $a0, prompt
  syscall

  # Read integer n
  li $v0, 5
  syscall
  move $t0, $v0  # $t0 = n

  li.s $f2, 0.0  # Initialize sum to 0.0

loop:
  beq $t0, $zero, done  # If n == 0, exit loop

  li.s $f4, 1.0        # Load 1.0 into $f4
  mtc1 $t0, $f6        # Move the value in $t0 to $f6
  cvt.s.w $f6, $f6     # Convert n to float in $f6
  div.s $f4, $f4, $f6  # $f4 = 1.0 / n

  add.s $f2, $f2, $f4  # Add term to sum

  addi $t0, $t0, -1    # Decrement n
  j loop

done:
  # Print sum
  li $v0, 2
  mov.s $f12, $f2
  syscall

  # Exit
  li $v0, 10
  syscall

.data
prompt: .asciiz "Enter the number of terms: "