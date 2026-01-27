.global main
.text 

main: 
    jal readswitches  # loads into $1
    andi $1, $1, 0xFF
    addi $4, $0, 8    # loop counter
    add $2, $0, $0    # reset $2

    loop:
        subi $4, $4, 1   # decrement
        andi $3, $1, 0x1 # $3 has the lsb of $1
        add $2, $2, $3
        beqz $4, endloop 
        srli $1, $1, 1   # shift to the right
        j loop 

    endloop:  
        jal writessd # uses $2
        j main 