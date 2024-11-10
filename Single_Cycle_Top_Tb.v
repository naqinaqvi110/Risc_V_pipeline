`timescale 1ns/100ps

module Single_Cycle_Top_Tb();
      
      wire [11:0] out;
	   wire [4:0] out2,out3;
		wire [2:0] out4;
		wire  [6:0] out5;		
 		reg clk = 1'b1, rst;
       
		 
		 


 single_cycle_top  TOP(.out(out),
		                .out2(out2),
							 .out3(out3),
							 .out4(out4),
                      .out5(out5),		                
							 .clk(clk),
							 .rst(rst)
							 );
     
	   initial begin
         $dumpfile("single.vcd");
         $dumpvars(0);

    end

 always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
        $finish;
    end

endmodule

			
		
