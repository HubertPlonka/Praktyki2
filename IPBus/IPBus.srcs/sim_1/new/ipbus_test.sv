`timescale 1ns / 1ps

//'include "ipbus_ram.sv"

module ipbus_test(


logic ipb_clk;
always begin: clock
    clk <= !clk #10;
end clock

logic ipb_write
always begin: write
    ipb_write = !ipb_write #20;
end write

initial begin


#10 ipb_write 1;
#10 ipb_write 32'h00000000;
#10 ipb_read;

    );
endmodule
