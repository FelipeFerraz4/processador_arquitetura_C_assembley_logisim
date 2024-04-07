
.data

.globl main

 main:
 	addi $sp, $sp, -64 #reservando espaço da primeira matriz
    add $s0, $sp, $zero
 	
 	addi $sp, $sp, -64 #reservando espaço da segunda matriz
    add $s1, $sp, $zero
 	
 	addi $sp, $sp, -64 #reservando espaço da matriz resultado
    add $s2, $sp, $zero
 	
 	li $t2, 0	# count
 	li $t3, 0	# aux
 	
 	li $t0, 0	# i
 	li $t5, 4	# condicao for e tamanho da matriz
 	
 	InicioForI:
 		bge $t0, $t5, FinalForI
 		li $t1, 0	# j
        InicioForJ:
            bge $t1, $t5, FinalForJ
            li $t4, 0	# K
            InicioFork:
                bge $t4, $t5, FinalForK
                
                mul $t6, $t0, $t5   # t9 = i * 4
                add $t6, $t6, $t4   # t9 = (i * 4) + k
                mul $t6, $t6, $t5   # t9 = ((i * 4) + k) * 4
                add $s3, $t6, $s0   # s3 = (((i * 4) + k) * 4) + matriz
                #m1

                lw $s3, 0($s3)

                mul $t6, $t4, $t5   # t6 = k * 4
                add $t6, $t6, $t1   # t9 = (k * 4) + j
                mul $t6, $t6, $t5   # t9 = ((k * 4) + j) * 4
                add $s4, $t6, $s1   # s4 = (((k * 4) + j) * 4) + matriz
                #m2

                lw $s4, 0($s4)

                mul $t6, $s3, $s4   # t6 = (m1 * m2)
                add $t3, $t3, $t6   # aux = aux + (m1 * m2)

                addi $t4, $t4, 1
                j InicioFork 
            FinalForK:

            mul $t6, $t0, $t5   # t6 = i * 4

            add $t6, $t6, $t1   # t9 = (i * 4) + j
            mul $t6, $t6, $t5   # t9 = ((i * 4) + j) * 4
            add $s5, $t6, $s2   # s5 = (((i * 4) + j) * 4) + matriz
            #mResultante

            sw $t3, 0($s5)

            li $t3, 0
            addi $t1, $t1, 1
            j InicioForJ
        FinalForJ:
 		addi $t0, $t0, 1
 		j InicioForI
 	FinalForI

li $v0, 10
syscall
