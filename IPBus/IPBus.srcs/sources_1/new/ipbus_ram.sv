`timescale 1ns / 1ps



module ipbus_ram
(
  input [31:0] ipb_wdata,
  input [31:0] ipb_addr,
  input ipb_write, ipb_strobe, ipb_clk,
  output ipb_ack, ipb_err,
  output reg [31:0] ipb_rdata
);

  // RAM variable
  reg [31:0] ram[(2**32)-1:0];

  always @ (posedge ipb_clk)
  begin
  // Strobe
    if (ipb_strobe)
    // Write
      if (ipb_write)
        ram[ipb_addr] <= ipb_wdata;
    // Read
      else
        ipb_rdata <= ram[ipb_addr];
      end

  // Random functions for ACK and ERR
  assign ipb_ack = |ipb_addr;
  assign ipb_err = ^ipb_wdata;
  
  
  
  assign ipb_strobe = ipb_clk;
  
 

endmodule


module ipb_intf(
  
  virtual IPb_intf intf_in_module; 
  virtual IPb_intf intf_out_module;
  
endmodule


 task ipb_writing();    
     
            $display("%0d", ipb_addr );
            
            intf.intf_out_module.ipb_wdata = ipb_addr;
            
    endtask: ipb_writing
    
///////////////////////////////////////    
    
    task ipb_read();
              
            $display ("%0d ", ipb_rdata); 
            
            intf.intf_in_module.ipb_rdata = ipb_addr;            
 
    endtask: ipb_read
    
///////////////////////////////////////
