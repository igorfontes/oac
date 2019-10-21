#Q1

# a em $s0, b em $s1, m em $s2 

addi $s0, $zero, 2 #armazena 2 em $s0
addi $s1, $zero, 1 #armazena 1 em $s0
addi $s2, $zero, 0 #armazena 0 em $s0
addi $s2, $s0, 0 # m = a
slt $t0, $s1, $s2 # $t0 = 1 se b < m
bne $t0, $zero, if_1 # executa as instruções da label if_1 caso b < m
addi $s2, $zero, 0 # m = 0
j Exit
if_1 : addi $s2, $s1, 0 # m = b
Exit: 


