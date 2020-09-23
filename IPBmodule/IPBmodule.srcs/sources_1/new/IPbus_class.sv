`timescale 1ns / 1ps


interface IPbus_intf(
    input ipb_in,
    output ipb_out
    );
    
    initial
    begin
    
    ipb_in.ipb_addr = 32'b0;        
    ipb_in.ipb_rdata = 32'b0;    
    ipb_in.ipb_ack = 1'b0;
    ipb_in.ipb_err = 1'b0;
 
    
    ipb_out.ipb_wdata = 32'b0;  
    ipb_out.ipb_addr = 32'b0;   
    ipb_out.ipb_write = 1'b0;
    ipb_out.ipb_strobe = 1'b0;
    end  
endinterface: IPbus_intf;

class IPbus_test;


    
    local virtual IPb_intf intf;


    local int x;
 
    
    task set(int i);
        x = i;
    endtask
 
    
    function int get();
        return x;
    endfunction
    
     