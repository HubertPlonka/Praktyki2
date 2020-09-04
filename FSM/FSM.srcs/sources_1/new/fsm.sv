`timescale 1ns / 1ps

module fsm(
    input clk,
    input rst,
    input x,
    input en,
    output reg par
    );
reg stan, naststan;
parameter S0=0, S1=1;

always @(posedge clk or posedge rst)
if (rst)
    stan <= S0;
else 
    stan <= naststan;
    
always @(stan) begin
    case (stan)
        S0: par = 0;
        S1: par = 1;
    endcase
end
always @(stan or x)
if (en) begin
begin
    naststan = S0;
    case(stan)
        S0: if (x)
            naststan = S1;
        S1: if (x)
            naststan = S0;
    endcase
end
end
endmodule