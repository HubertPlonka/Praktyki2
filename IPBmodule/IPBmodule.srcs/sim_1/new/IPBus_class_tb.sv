`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.09.2020 17:26:00
// Design Name: 
// Module Name: IPbus_class_tb
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


module IPbus_class_tb(
    input ipb_in,
    output ipb_out
    );
endmodule

module tb;
  reg clk;

  always #10 clk = ~clk;
  reg_if _if (clk);

  reg_ctrl u0 ( .clk (clk),
            	.ipb_in (_if.ipb_in),
               	.ipb_out(_if.ipb_out));

  initial begin
    new_test t0;

    clk <= 0;


    t0 = new;
    t0.write();
    t0.read();

  
    #200 $finish;
  end

endmodule
