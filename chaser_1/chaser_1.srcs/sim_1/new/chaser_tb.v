`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 10:49:20
// Design Name: 
// Module Name: chaser_tb
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


module chaser_tb();
    reg clk;
    reg [15:0] sw;
    reg btnL;
    reg btnR;
    wire [15:0] led;
    
    initial begin
        clk = 0;
        sw = 16'b0000000000000000;
        btnL = 0;
        btnR = 0;
        #200;
    end
    
    chaser chaser_instance(clk, sw, btnL, btnR, led);
    
    always #5 clk = ~clk;
    
endmodule
