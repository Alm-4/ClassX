`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2025 09:56:36
// Design Name: 
// Module Name: alu
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


    module alu(
        input [31:0] A,
        input [31:0] B,
        input [1:0] S,
        output reg [3:0] result
        );
        
        always @(*) begin
            case (S)
                0: result = A + B; //Addition
                1: result = A - B; //Subtraction
                2: result = A * B; //Shift left  
                3: result = A / B; //Shift right
                default: result = 0;
            endcase
        end
         
    endmodule



