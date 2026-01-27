.global main
.text

main: 
    subi $sp, $sp, 1
    sw $ra, 0($sp)

    jal readswitches    
    
    lw $ra, 0($sp)
    addi $sp, $sp, 1
    
    # Dealing with registers
    subi $sp, $sp, 2
    sw $2, 0($sp)
    sw $3, 1($sp) 

    andi $2, $1, 0xFF   # rightmost 8 bits - start
    srli $1, $1, 8    
    andi $3, $1, 0xFF   # leftmost 8 bits - end 

    subi $sp, $sp, 3    
    sw $2, 0($sp)       # 1st param - start
    sw $3, 1($sp)       # 2nd param - end
    sw $ra, 2($sp)

    jal count

    lw $ra, 2($sp)
    addi $sp, $sp, 3   

    # Dealing with registers
    lw $2, 0($sp)
    lw $3, 1($sp)
    addi $sp, $sp, 2

    jr $ra 