`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 11:21:32
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input [7:0] instruction
    );
    
    reg [3:0] registers [3:0];
    wire [1:0] S, dest, regA, regB;
    wire [31:0] A, B, result;
    
    initial begin
        registers[0] = 3; // Changed these around
        registers[1] = 1;
        registers[2] = 3;
        registers[3] = 0;
    end
    
    assign S = instruction[7:6];
    assign dest = instruction[5:4];
    assign regA = instruction[3:2];
    assign regB = instruction[1:0];
    
    assign A = registers[regA];
    assign B = registers[regB];
    
    alu unit(A,B,S, result);
    
    always @(posedge clk) begin
        registers[dest] <= result;
    end
    
endmodule
