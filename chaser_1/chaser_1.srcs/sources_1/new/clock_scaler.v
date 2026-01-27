`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 16:03:26
// Design Name: 
// Module Name: clock_scaler
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


module clock_scaler(
    input clk,
    input [63:0] factor,
    output reg out
    );
    
    reg [63:0] current;
    
    initial begin
        current <= 1;
        out <= 0; 
    end 
    
    always @(posedge clk) begin
        if (current == 0) begin 
            current <= (factor >> 1) - 1; // half of factor. - 1 for the extra cycle
            out <= ~out;
        end 
        else begin
            current <= current - 1; // decrement
        end 
    end
    
endmodule
