`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 16:22:56
// Design Name: 
// Module Name: clock_scaler_tb
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


module clock_scaler_tb();
    reg clk;
    reg [63:0] factor;
    wire out;
    
    initial begin
        clk = 0;
        factor = 10;
        #200;
    end
      
    clock_scaler clock_scaler_bro(.clk(clk), .factor(factor), .out(out));
    
    always #5 clk = ~clk;
    
endmodule
