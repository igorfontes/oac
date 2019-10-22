#Q4

# a em $a0, b em $a1, resultado em $v1

slt $t1, $a1, $a0 # $t1 recebe 1 se a > b
beq $t1, $zero, inicia # se a <= b, vá para a label inicia
addi $v1, $zero, 1 # se a > b, 1 é armazenado em v1
j Exit
inicia : jal soma
j Exit
soma:
addi $sp, $sp, -8 		# ajustando pilha p/ 2 itens
sw $ra, 4($sp) 			# salva endereço de retorno
sw $a1, 0($sp) 			# salva argumento
slt $t0, $a1, $a0 		# testa se b < a
beq $t0, $zero, L1
addi $v1, $zero, 0 	    # se sim, resultado é 0 para início da soma
addi $sp, $sp, 8 		# pop 2 itens da pilha
jr $ra 					# e retorna
L1: addi $a1, $a1, -1 		# senão decrementa b em 1
jal soma 				# chamada recursiva
lw $a1, 0($sp) 			# restaura b original
lw $ra, 4($sp) 			# e endereço de retorno
addi $sp, $sp, 8 		# pop 2 itens da pilha
add $v1, $a1, $v1 		# soma p/ obter resultado
jr $ra 					# e retorna
Exit :