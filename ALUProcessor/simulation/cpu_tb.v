`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 11:29:57
// Design Name: 
// Module Name: cpu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu_tb();
    
    reg clk = 0;
    reg [7:0] instruction = 0;
    
    cpu uut (
        clk,
        instruction
    );
    
    parameter OP_ADD  = 2'b00;
    parameter OP_SUB  = 2'b01;
    parameter OP_MULT = 2'b10;
    
    parameter REG_A = 2'b00;
    parameter REG_B = 2'b01;
    parameter REG_C = 2'b10;
    parameter REG_D = 2'b11;
    
    initial begin
        // Want: (A-B) * (C+D)
        #5;
        instruction = {OP_SUB, REG_B, REG_A, REG_B}; // A-B stored in B instruction = 8'b01010001; 
        #20;
        instruction = {OP_ADD, REG_C, REG_C, REG_D}; // C+D stored in C instruction = 8'b00101011;
        #20;
        instruction = {OP_MULT, REG_A, REG_B, REG_C}; // results in B*C  stored in A instruction = 8'b10000110;
        #20;
        $finish;
    end
    
    always #10 clk = ~clk;
    
endmodule
