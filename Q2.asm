#Q2 

# x em $s0, a em $s1, b em $s2

addi $s0, $zero, 0 # x = 0
slti $t0, $s1, 0 # $t0 recebe 1 se a < 0
slt $t1, $s1, $s2 # $t1 recebe 1 se a < b
beq $t0, $zero, if_1 # se a >= 0, execute as instruções de if_1
and $t2, $s1, $s2 # $t2 recebe 1 se a == b
xor $t3, $t1, $t2 # $t3 recebe 1 a==b ou a < b
beq $t3, $zero, if_2 # se $t3 for 0, execute as instruções de if_2
addi $s0, $zero, 3 # x = 3 apenas se nenhuma das condições ( a >= 0 && a < b ), ( a < 0 && a > b ) forem satisfeitas
j Exit
if_1 : bne $t1, $zero, set_x_to_1 # se a < b, execute as instruções de set_x_to_1
set_x_to_1 : addi $s0, $zero, 1 # x = 1
j Exit
if_2 : addi $s0, $zero, 2 # x = 2
j Exit
Exit: 
