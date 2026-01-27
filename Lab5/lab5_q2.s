.global main
.text 

main: 
    lw $12, 0x70003($0)
    andi $12, $12, 0x1  
    beqz $12, main      # looping until ready to recieve a character
    
    lw $1, 0x70001($0)  # value from serial port 1
    add $2, $0, $0
    add $3, $0, $0
    add $4, $0, $0
    slei $2, $1, 122    
    sgei $3, $1, 97      
    and $4, $3, $2      
    beqz $4, character  # jumping if $1 is not within [97, 122] (lowercase letters. ASCII 97-122)   
    
    j transmit 

character:
    addi $1, $0, 42     # '*' = ASCII 42
    j transmit

transmit:
    lw $13, 0x70003($0) 
    andi $13, $13, 0x2  
    beqz $13, transmit  # looping until ready to transmit

    sw $1, 0x70000($0)  # transmitting
    j main 