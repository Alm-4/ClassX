# print out alphabet to serial port 2

.global main
.text 

main: 
    # initializing counter and output for loop1
    addi $1, $0, 26     # $1 = loop counter
    addi $2, $0, 97     # $2 = output
    j loop1

loop1:
    # uppercase letters. ASCII 65-90
    jal check          
    sw $2, 0x71000($0)  
    addi $2, $2, 1      
    subi $1, $1, 1     
    bnez $1, loop1      
    # initializing counter and output for loop2
    addi $1, $0, 26    
    addi $2, $0, 65     
    j loop2

loop2:
    # lowercase letters. ASCII 97-122 
    jal check
    sw $2, 0x71000($0)  
    addi $2, $2, 1      
    subi $1, $1, 1     
    bnez $1, loop2    
    syscall # end program 

check:
    # checking if data can be transmitted
    lw $13, 0x71003($0) 
    andi $13, $13, 0x2  
    beqz $13, check
    jr $ra              # jumping if tds bit is 1 (ready to transmit)