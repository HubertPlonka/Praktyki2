typedef struct packed{
        logic [31:0] ipb_addr;
        logic [31:0] ipb_wdata;
        logic ipb_strobe;
        logic ipb_write;
}ipb_wbus;


typedef struct packed{
        logic [31:0] ipb_rdata;
        logic ipb_ack;
        logic ipb_err;
}ipb_rbus;

// Interface declaration
interface IPb_intf( input ipb_rbus ipb_in,
                    output ipb_wbus ipb_out,
					logic ipb_clk
					);                           
    initial
    begin
    ipb_in.ipb_rdata = 32'hffffffff;   
    ipb_in.ipb_ack = 1'b1;
    ipb_in.ipb_err = 1'b1; 
    
    ipb_out.ipb_wdata = 32'hffffffff;  
    ipb_out.ipb_addr = 32'hffffffff;   
    ipb_out.ipb_write = 1'b0;
    ipb_out.ipb_strobe = 1'b1;
    end     
                         
endinterface: IPb_intf


class IPbusTestClass;
	
	virtual IPb_intf intf;
 
    function assign_interface( virtual IPb_intf intf);
        this.intf = intf;       
    endfunction
 	
	task write_to_file(string filepath); 
		
		int fileDescriptor;
		
		intf.ipb_out.ipb_addr = 0;
		
		fileDescriptor = $fopen(filepath, "w");
		if (fileDescriptor)  $display("File was opened successfully : %0d", fileDescriptor);
		else     $display("File was NOT opened successfully : %0d", fileDescriptor);
		
		while ( intf.ipb_out.ipb_addr < 0 )begin
		@(negedge intf.ipb_clk);
		  
		  intf.ipb_out.ipb_write = 0;
          intf.ipb_out.ipb_strobe = 1;

		  $fdisplay (fileDescriptor,"%h, %h", intf.ipb_out.ipb_addr, intf.ipb_in.ipb_rdata);
		  intf.ipb_out.ipb_addr = intf.ipb_out.ipb_addr+1;
            
		end

		intf.ipb_out.ipb_addr = 0;

		$fclose(fileDescriptor);
		
	endtask
	
	task read_from_file(string filepath);
		
		int fileDescriptor;
		int addr;
		int value;
		string line, text;
		
		fileDescriptor = $fopen(filepath, "r");
		if (fileDescriptor)  $display("File was opened successfully : %0d", fileDescriptor);
		else     $display("File was NOT opened successfully : %0d", fileDescriptor);
		
		while (!$feof(fileDescriptor)) begin
		@(negedge intf.ipb_clk);
            
            $fscanf(fileDescriptor,"%h, %h", addr, value);
            
            this.write(value, addr);
            
		end
		
		$fclose(fileDescriptor);
			
	endtask

    function logic[31:0] read(input [31:0] addres);
        
        logic[31:0] word;
          
        intf.ipb_out.ipb_write = 0;
        intf.ipb_out.ipb_strobe = 1;
        
        intf.ipb_out.ipb_addr = addres;
        
        word = intf.ipb_in.ipb_rdata;
        
        return word;
 
            
    endfunction

    function void write(input [31:0] word, input [31:0] addres); 
            
        intf.ipb_out.ipb_write = 1;
        intf.ipb_out.ipb_strobe = 1;
        
        intf.ipb_out.ipb_addr = addres;
        intf.ipb_out.ipb_wdata = addres;
                               
    endfunction
  
endclass: IPbusTestClass

