.data
N:
.word 3 #5
M:
.word 4 #4
matrix:
#.word 1, 1, 1
.word 3, 3, 3
.word 2, 2, 2
#.word 3, 3, 3
.word 1, 1, 1
.word 4, 4, 4

#.word 9, 8, 7, 8, 7
#.word 6, 5, 4, 6, 5
#.word 3, 4, 5, 5, 4
#.word 6, 3, 1, 3, 0
result:
.word 0
#.word 0
#.word 0
#.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
#la a2, M
#la a3, result
call print
call exit

print:
#lw t1, 0(a2)

#lw a1, 0(sp) # load minimal value from stack
lw a1, 0(sp) # load minimal value from stack
addi sp, sp, 4 # restore  stack pointer


#addi t2, x0, 0
#print_cycle:
#addi a0, x0, 1 # print_int ecall
#lw a1, 0(a3)
#ecall

#addi a0, x0, 11 # print_char ecall
#addi a1, x0, 32
#ecall

#addi t2, t2, 1
#addi a3, a3, 4
#blt t2, t1, print_cycle
ret

exit:
#addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer

lw t6, 0(a4) # load the first value from array
add t5, x0, t6 # assume that the first value is the minimal

init:
#addi t5, x0, 0 # result to save
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer

ble t6, t5, countmin
j next#jump to 81 !!!!!!!!!!!!
countmin:
add t5, x0, t6

next:### jump here!!!!!!!!!
addi t3, t3, 1
blt t3, t1, cycle
#sw t5, 0(a5) # save result to resulting array
addi a5, a5, 4
addi t4, t4, 1
blt t4, t2, init
addi sp, sp, -4
sw t5, 0(sp) # save minimal value to stack
ret
