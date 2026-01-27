`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2025 10:29:22
// Design Name: 
// Module Name: scale_adjuster
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


module scale_adjuster(
    input clk,
    input btnL,
    input btnR,
    output reg [63:0] out
    );
    
    reg oldL;
    reg oldR;
    
    initial begin 
        oldL <= btnL;
        oldR <= btnR;
        out <= 100000000; // too large for simulation to show
    end 
    
    always @(posedge clk) begin
        casez({oldL, btnL, oldR, btnR})
            4'b01??: begin
                out <= out >> 1;
            end
            4'b??01: begin
                out <= out << 1;
            end
        endcase
        oldL <= btnL;
        oldR <= btnR;
    end
            
endmodule
