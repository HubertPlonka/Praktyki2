`timescale 1ns / 1ps

module fsm_tb(
    reg clk,
    reg rst,
    reg x,
    reg en,
    wire par
    );
    
licznik  ( .clk (clk),
                 .rst (rst),
                 .x (x),
                 .en (en),
                 .par (par));
                 
always #5 clk = ~clk;
always #10 x = ~x;
   
initial begin
#150   en <= 1;
#10   en <= 0;
#40   en <= 1;
#120   rst <= 0;
#20   rst <= 1;
#60   rst <= 0;
endmodule
