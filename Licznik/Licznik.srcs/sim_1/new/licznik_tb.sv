`timescale 1ns / 1ps

module licznik_tb;
    reg CLOCK;
    reg START;
    reg RESET;
    reg UP;
    reg LOAD;
    reg [2:0] load;
    wire [2:0] outputs;
    
    
    licznik  l0 ( .CLOCK (CLOCK),
                 .START (START),
                 .RESET (RESET),
                 .UP (UP),
                 .LOAD (LOAD),
                 .load (load),
                 .outputs (outputs));
                 
    always #5 CLOCK = ~CLOCK;
    
    initial begin
    // 1. Initialize testbench variables to 0 at start of simulation
    // 2. Drive rest of the stimulus, reset is asserted in between
    #20   START <= 1;
    #30   START <= 0;
    #100   START <= 1;
    #30   START <= 0;
    #20   START <= 1;
    #30   RESET <= 0;
    #20   RESET <= 1;
    #150   RESET <= 0;
    #100   UP <= 1;
    #100   UP <= 0;
    #120   LOAD <= 0;
    #10   LOAD <= 1;
    #70   LOAD <= 0;
    #200   load <= 3'b010;

    // 3. Finish the stimulus after 200ns
    #200 $finish;
  end
  
endmodule