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
    
    
    task write();
    
    int fd; 
    int value;
    
    fd = $fopen ("C:\Users\hubel\Desktop\Praktyk\plik.txt", "w");
    
    while (!$feof(ipb_out.ipb_wdata)) begin
            $display("Zapisane wartosci: %0d", ipb_out.ipb_wdata );
    end
    $fclose(fd);
    endtask: write
    
    
    task read();
    
    int fd; 
    int value;
    
    fd = $fopen ("C:\Users\hubel\Desktop\Praktyk\plik.txt", "r");

        while (!$feof(fd)) begin 
            $fgets(value, fd);
            $display ("Odczytano wartosc %0d ", value);
                 
                 
            end
    $fclose(fd);
 
    endtask: read

    
    endclass: IPbus_test   
	
	
	
	
	module IPbus_test_module;

	virtual IPb_intf intf_in_module; 


  initial begin
  
   
    IPbus_test xyz = new(intf_in_module); 
    
    xyz.set(8);
    xyz.write();
	xyz.read();
    
  end
  
endmodule: IPbus_testing_module
