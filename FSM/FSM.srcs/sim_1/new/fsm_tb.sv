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
always #30 rst = ~rst;
always #40 en = ~en;
   
initial begin
#300 $finish;
end
endmodule


endmodule
