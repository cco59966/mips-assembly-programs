.data
# This is thee nnumber of  the elements within  the arrays
N:       .word 3

# Array A:  This is the thee first input array
A:       .float 5.0, 10.0, 15.0

# Array B:  Thiss is the second input array
B:       .float 1.0, 2.0, 3.0

# Array C: this here will store the result A[i] - B[i]
C:       .space 12      # 3 floats × 4 bytes = 12 bytes

# the newline string is implemeented to print after each number
newline: .asciiz "\n"

.text
.globl main
main:

    # Will load the number of elements  into  the register $t1
    la   $t0, N          # Here will oads the address of N into $t0
    lw   $t1, 0($t0)     # here will  also loads  thee value of N into $t1

    # Will also load the  base addresses of arrays A, B and C
    la   $t2, A          # $t2  now points to start of array A
    la   $t3, B          # $t3 now  points to start of array B
    la   $t4, C          # $t4  now will point to start of array C

    # implementwd to set the  loop counter to 0
    li   $t5, 0          # $t5 will be used as the index i

loop:
    # Will checks if i == N; and  if so,  it will exit the loop
    beq  $t5, $t1, end_loop

    # Calculate offset = i * 4 (each float is 4 bytes)
    mul  $t6, $t5, 4     # $t6 = offset

    # Loads  A[i] into floating-point register $f0
    add  $t7, $t2, $t6   # Address of A[i]
    lwc1 $f0, 0($t7)     # Load A[i] into $f0

    # Will  load the B[i] into floating point register $f1
    add  $t7, $t3, $t6   # This is the Address of B[i]
    lwc1 $f1, 0($t7)     # Here will load the  B[i] into $f1

    # Heree it is subtractingg the   A[i] - B[i],  and then store result in $f2
    sub.s $f2, $f0, $f1

    # Here are storing the result within C[i]
    add  $t7, $t4, $t6   # This is the Address of C[i]
    swc1 $f2, 0($t7)     # Stores the  $f2 into C[i]

    # This willl prints the  the result C[i]
    li   $v0, 2          # This is the syscall code forr printing float
    mov.s $f12, $f2      # Here will move  the results to the  argument register
    syscall

    # this will alsoo print a newline
    li   $v0, 4
    la   $a0, newline
    syscall

    # Incrementation of the  i wich is the loop counter
    addi $t5, $t5, 1
    j loop               # implmeneted to go back to  the start of  the loop

end_loop:
    # Now it will  exit the program
    li $v0, 10
    syscall
