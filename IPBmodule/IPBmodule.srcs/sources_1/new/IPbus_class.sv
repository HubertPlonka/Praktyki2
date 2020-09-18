`timescale 1ns / 1ps


interface IPbus_intf(
    input ipb_in,
    output ipb_out
    );
endinterface: IPbus_intf;

class IPbus_test;


    
    local virtual IPb_intf intf;
 
    
    task assign_interface( virtual IPb_intf intf);
        this.intf = intf;       
    endtask: assign_interface

    local int x;
 
    
    task setter(int i);
        x = i;
    endtask
 
    
    function int getter();
        return x;
    endfunction