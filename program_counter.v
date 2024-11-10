module program_counter(rst,clk,PC_NEXT,PC);
              
              
      input rst,clk;
      //declaring o/ps
       output reg [31:0] PC;
  
       //declarring i/psc
       input [31:0]  PC_NEXT;

       always @ ( posedge clk) 
        begin

         if(~rst)
           begin
            PC <= 32'h00000000;  
           end
         else
           begin
            PC <= PC_NEXT;
           end
        
        end


              








endmodule