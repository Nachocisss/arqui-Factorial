.data 
texto: .asciiz "\n resultado: "
pedir: .asciiz "\n ingrese numero que quiera conocer el factorial: "

.text

main: 
	li $t1, 1 # compara
	li $t2, 1 #resultado

	la $a0, pedir #texto que pide ingresar numero
	li $v0 , 4
	syscall
	li $v0, 5  # guarda el numero pedido en v0
	syscall

	move $t0, $v0 #movemos a t0, el input
	beq $t0, $zero, end

fact: 
	beq $t0, $t1, end #itera hasta llegar a 1
	mul $t2, $t2, $t0 #genera el nuevo valor
	addi $t0, $t0,-1 #reduce el numero en 1
	j fact

end:
	la $a0, texto # texto de resultado
	li $v0 , 4
	syscall
	move $a0, $t2
	li $v0, 1   # imprime el resultado
	syscall 
	li $v0, 10
	syscall
	