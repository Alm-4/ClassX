.global main
.text 

main: 
    # Read the first 8 switch bits and prepare to count the number of 1s
    jal readswitches 
    andi $1, $1, 0xFF # masking to get only the first 8 bits
    addi $4, $0, 8    # looping 8 times
    add $2, $0, $0 

    # looping to count the number of 1s in $1
    loop:
        subi $4, $4, 1   
        andi $3, $1, 0x1 # masking to get the last bit
        add $2, $2, $3
        beqz $4, endloop # branching when done
        srli $1, $1, 1   
        j loop 

    # displaying the encrypted value in the 7-seg display
    endloop:  
        lw $2, encryption($2) # using the number of 1's as an offset
        jal writessd          # writing to the 7-seg display
        j main 

.data 
encryption:
    .word 0xA3 # 0
    .word 0x70 # 1
    .word 0x6B # 2
    .word 0x0D # 3
    .word 0x49 # 4
    .word 0x42 # 5
    .word 0x7F # 6
    .word 0xB8 # 7
    .word 0x51 # 8
    