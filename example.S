.data
N:
.word 5
M:
.word 4
matrix:
.word 9, 8, 7, 8, 7
.word 6, 5, 4, 6, 5
.word 3, 4, 5, 5, 4
.word 6, 3, 1, 3, 0
result:
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
call print
call exit

print:
lw a1, 0(sp) # load minimal value from stack
addi a0, x0, 1 #print_int ecall
addi sp, sp, 4 # restore stack pointer
ecall
ret

exit:
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer

lw t6, 0(a4) # load the first value from array
add t5, x0, t6 # assume that the first value is the minimal

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer

ble t6, t5, countmin
j next#jump to 56 !!!!!!!!!!!!
countmin:
add t5, x0, t6

next:### jump here!!!!!!!!!
addi t3, t3, 1
blt t3, t1, cycle
addi a5, a5, 4
addi t4, t4, 1
blt t4, t2, init
addi sp, sp, -4
sw t5, 0(sp) # save minimal value to stack
ret
