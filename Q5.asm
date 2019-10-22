#Q5

# a em $s0, b em $s1, resultado em $s2

slti $t0, $s0, 0 # $t0 recebe 1 se a < 0
slti $t1, $s1, 0 # $t1 recebe 1 se b < 0
bne $t0, $zero, mod_0 # se a < 0, execute as instruções de mod_0
j ver_0
mod_0 : sub $s0, $zero, $s0 # $s0 recebe o módulo de a
ver_0 : bne $t1, $zero, mod_1 # se b < 0, execute as instruções de mod_0
j multiplica
mod_1 : sub $s1, $zero, $s1 # $s1 recebe o módulo de b
beq $s0, $zero, resp_0 # se a==0, execute as instruções de resp_0
beq $s1, $zero, resp_0 # se b==0, execute as instruções de resp_0
multiplica : add $s2, $s2, $s1 # soma b ao resultado
addi $s0, $s0, -1 # decrementa 1 de a
beq $s0, $zero, Exit # se a == 0, a multiplicação  feita por meio de somas sucessivas chegou ao fim
j multiplica
resp_0 : addi $s2, $zero, 0 # resultado 
Exit :
