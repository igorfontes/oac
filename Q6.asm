#Q6

# parametro em $a0, resultado em $v0

fib:    
addi $sp,$sp,-12        # ajusta pilha para 3 itens
sw $a0, 0($sp)          # salva parametro
sw $s0, 4($sp)          # salva $s0
sw $ra, 8($sp)          # salva endereço de retorno
bgt $a0,1, fib_recurse  # se n > 1, executa as instruções da label fib_recurse
move $v0,$a0            # resultado recebe a se n=0 ou n=1
j retorno               # vai para label retorno que retorna registradores

fib_recurse:    
addi $a0,$a0,-1         # parametro = n-1
jal fib                 
move $s0,$v0            # $s0 recebe fib(n-1)
addi $a0,$a0,-1         # parametro = n-1
jal fib                 # chamada recursiva
add $v0, $v0, $s0       # $v0 = fib(n-2)+fib(n-1)
retorno:   
lw  $a0, 0($sp)         # recupera registradores na pilha
lw  $s0, 4($sp)         
lw  $ra, 8($sp)         
addi $sp, $sp, 12       # pop de 3 itens na pilha
jr $ra