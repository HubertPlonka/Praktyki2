`timescale 1ns / 1ps

module licznik(
    input CLOCK,
    input START,
    input RESET,
    input UP,
    input LOAD,
    input [2:0] load,
    output reg [2:0] outputs
    );

    
always @(posedge CLOCK)
begin
   if (START) begin
   if (RESET)
      outputs <= 3'b0;
   else if (UP) begin
          outputs++;
       end else if (outputs==3'b110) begin
          outputs <= 3'b0;
       end else begin
          outputs--;
       end if (outputs==3'b0) begin
          outputs <= 3'b101;
       end else if (LOAD) begin
          outputs <= load;
       end
     end  
   end
   
endmodule
