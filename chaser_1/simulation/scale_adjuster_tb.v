`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 10:34:45
// Design Name: 
// Module Name: scale_adjuster_tb
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


module scale_adjuster_tb();
    reg clk;
    reg btnL;
    reg btnR;
    wire [63:0] out;
    
    initial begin
        btnL = 0;
        btnR = 0;
        clk = 0;
                
        // Test button presses
        #100;
        btnL = 1;  // Press left button
        #20;
        btnL = 0;
        
        #100;
        btnR = 1;  // Press right button
        #20;
        btnR = 0;
        
        #200;
    end
    
    scale_adjuster scale_adjuster_bro(
    .clk(clk), .btnL(btnL), .btnR(btnR), .out(out)
    );
    
    always #5 clk = ~clk;
    
endmodule
