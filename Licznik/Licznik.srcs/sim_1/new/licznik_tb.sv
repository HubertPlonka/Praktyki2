`timescale 1ns / 1ps

module licznik_tb;
    reg CLOCK;
    reg START;
    reg RESET;
    reg UP;
    reg LOAD;
    reg [2:0] loading;
    wire [2:0] outputs;
    
    
    licznik  l0 ( .CLOCK (CLOCK),
                 .START (START),
                 .RESET (RESET),
                 .UP (UP),
                 .LOAD (LOAD),
                 .loading (load),
                 .outputs (outputs));
                 
    always #5 CLOCK = ~CLOCK;
    
    initial begin
    // 1. Initialize testbench variables to 0 at start of simulation
    // 2. Drive rest of the stimulus, reset is asserted in between
    #20   START <= 1;
    #15   RESET <= 1;
    #10   RESET <= 0;
    #30   START <= 0;
    #20   LOAD <= 1;
    #10   LOAD <= 0;
    #25   UP <= 1;
    #50   UP <= 0;
    #10   LOAD <= 1;
    #10   LOAD <= 0;
    

    // 3. Finish the stimulus after 200ns
    #200 $finish;
  end
  
endmodule