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
    
     task read_file();
    
    int fd; 
    int read_write;
    int addr;
    int value;
    
    fd = $fopen ("C:\Users\hubel\Desktop\Praktyk\plik.txt", "r");

        while (!$feof(fd)) begin 
            $fscanf(fd, "%d %d %d ", read_write, addr, value); 
            if(read_write == 1) begin
            $display ("Zapisanie w adresie %08d wartosci %0d ", addr, value);
                 
            
            intf.ipbus.data = value;
                 
            end
        end

    $fclose(fd);
 
    endtask: read_file
    
    
    
    task write_file();
    
    int fd; 
    int register_addr;
    int value;
    
    
    fd = $fopen ("C:\Users\hubel\Desktop\Praktyk\plik.txt", "w");
        $fdisplay (fd, "TEST");
        for (int i = 0; i < 10; i++) begin
           $display ("IPbus data: %d", intf.ipb_in.ipb_rdata);
           
        end
    $fclose(fd);
 
    endtask: write_file
    
    
    endclass: IPbus_test