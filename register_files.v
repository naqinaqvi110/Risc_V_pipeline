module register_files(A1,A2,A3,WD3,WE3,rst,clk,RD1,RD2);
        
        
        //decalring o/ps
        output [31:0] RD1,RD2;

        //decalring input 
        input clk,rst,WE3;
        input [4:0] A1,A2,A3;
        input [31:0] WD3 ;
        
        // creating mem
        reg [31:0] Register [31:0];
		  

        //read functionality

        assign RD1 = (~rst) ? 32'h0000000 : Register[A1];

        assign RD2 = (~rst) ? 32'h0000000 : Register[A2];
         
        
       always @(posedge clk) 
       begin
         if (WE3) 
          
            Register[A3] <= WD3;
            
         end
       
        initial begin
          
         // Register[9] = 32'h0000020;
          //Register[28] = 32'h00000040;

          // Register[4] = 32'h0000000E;
           //Register[12] = 32'h00000030;
           Register[18] = 32'h00000001;
           Register[19] = 32'h00000001;
           Register[2]  = 32'h00000002;
        end



endmodule