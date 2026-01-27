`timescale 1ns / 1ps
module tb();

reg clk = 0;
wire [2:0] floor;
reg rst = 0;
reg [2:0] button_value = 0;
reg button_pressed = 0;

reg error  = 0;

initial begin   
    
    rst<=1;
    @(posedge clk);
    rst<=0;
    @(posedge clk);
    
    if (floor!=0) begin error <= 1; $display("01: Expected Floor 0!"); end 
    button_pressed <= 1;
    button_value   <= 7;
    @(posedge clk);

    if (floor!=0) begin error <= 1; $display("02: Expected Floor 0!"); end 
    button_pressed <= 0;
    @(posedge clk);

    if (floor!=0) begin error <= 1; $display("03: Expected Floor 0!"); end 
    button_pressed <= 0;
    @(posedge clk);

    if (floor!=1) begin error <= 1; $display("04: Expected Floor 1!"); end 
    button_pressed <= 0;
    @(posedge clk);

    if (floor!=2) begin error <= 1; $display("05: Expected Floor 2!"); end 
    button_pressed <= 1;
    button_value   <= 2; 
    @(posedge clk);

    if (floor!=3) begin error <= 1; $display("06: Expected Floor 3!"); end 
    button_pressed <= 0;
    @(posedge clk);

    if (floor!=4) begin error <= 1; $display("07: Expected Floor 4!"); end 
    button_pressed <= 1;
    button_value   <= 4; 
    @(posedge clk);

    if (floor!=5) begin error <= 1; $display("08: Expected Floor 5!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=6) begin error <= 1; $display("09: Expected Floor 6!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=7) begin error <= 1; $display("10: Expected Floor 7!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=6) begin error <= 1; $display("11: Expected Floor 6!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=5) begin error <= 1; $display("12: Expected Floor 5!"); end 
    button_pressed <= 1;
    button_value   <= 5; 

    @(posedge clk);
    if (floor!=4) begin error <= 1; $display("13: Expected Floor 4!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=3) begin error <= 1; $display("14: Expected Floor 3!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=2) begin error <= 1; $display("15: Expected Floor 2!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=3) begin error <= 1; $display("16: Expected Floor 3!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=4) begin error <= 1; $display("17: Expected Floor 4!"); end 
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=5) begin error <= 1; $display("18: Expected Floor 5!"); end 

    @(posedge clk);
    if (floor!=5) begin error <= 1; $display("19: Expected Floor 5!"); end 
    button_pressed <= 1;
    button_value   <= 0; 

    @(posedge clk);   
    if (floor!=5) begin error <= 1; $display("20: Expected Floor 5!"); end 
    button_pressed <= 0;

    @(posedge clk);
    if (floor!=5) begin error <= 1; $display("21: Expected Floor 5!"); end 
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=4) begin error <= 1; $display("22: Expected Floor 4!"); end 
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=3) begin error <= 1; $display("23: Expected Floor 3!"); end 
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=2) begin error <= 1; $display("24: Expected Floor 2!"); end 
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=1) begin error <= 1; $display("25: Expected Floor 1!"); end
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=0) begin error <= 1; $display("26: Expected Floor 0!"); end
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=0) begin error <= 1; $display("27: Expected Floor 0!"); end
    button_pressed <= 0;

    @(posedge clk);   
    if (floor!=0) begin error <= 1; $display("28: Expected Floor 0!"); end 
    button_pressed <= 0;
    
    if (error==1) $display ("Your elevator FAILED the test!");
    else          $display ("Your elevator PASSED the test!");

    $finish;    
end    

elevator dut (
    .i_clk(clk),
    .i_rst(rst),
    .i_button_pressed(button_pressed),
    .i_button_value(button_value),
    .o_floor(floor)  
);

always #10 clk = ~clk;

endmodule
