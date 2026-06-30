`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2025 10:40:44
// Design Name: 
// Module Name: chaser
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


module chaser(
    input clk,
    input [15:0] sw,
    input btnL,
    input btnR,
    output [15:0] led
    );
    
    reg [3:0] position;
    reg direction; 
    wire [63:0] clk_factor;
    wire clk_scaled;
    
    initial begin 
        position <= 7;
        direction <= 1;
    end
    
    clock_scaler clock_scaler_bruv(
        .clk(clk), .factor(clk_factor), .out(clk_scaled)
    );
    
    scale_adjuster scale_adjuster_bro(
        .clk(clk), .btnL(btnL), .btnR(btnR), .out(clk_factor)
    );
    
    always @(posedge clk_scaled) begin
        if (direction) begin
            position <= position + 1;
        end 
        else position <= position - 1;
        
        if ((position == 1 && direction == 0) ||   // when going down only + 1 cycle ahead
            (position == 14 && direction == 1) ||  // when going up only + 1 cycle ahead
            (sw & (led << 1)) && direction == 1 || // when going up only + 1 cycle ahead
            (sw & (led >> 1)) && direction == 0)   // when going down only + 1 cycle ahead
        begin
            direction <= ~direction;
        end
    end 
        
    assign led = (1 << position);
    
endmodule


