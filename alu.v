module alu(a,b,ALUControl,result,z,n,v,c);

       //declaring o/ps
        output [31:0] result ;
	    output z,n,v,c;

       //declaring i/ps
         input [31:0] a,b;
		 input [2:0]   ALUControl;
		 
		 //declaring wires
		 
		 wire [31:0] b_not;
		 wire [31:0] mux_1;
		 wire [31:0] sum;
		 wire [31:0] mux_2;
		 wire cout;
		 wire [31:0] slt;
		 
		 
		
		 
		 //ternary operater 
		 assign mux_1 = (ALUControl[0]) ? ~b : b;
		 
		 // Addition / subtraction and cout (overflow will be saved) 
		 assign {cout,sum} = mux_1 + a + ALUControl[0];
		 
		  //zero extention
		  assign slt = {31'b0000000000000000000000000000000,sum[31]};
		 // 4 by 2 mux
		 assign mux_2 = (ALUControl[2:0] === 3'b000) ? sum : 
		                (ALUControl[2:0] === 3'b001) ? sum :
		                (ALUControl[2:0] === 3'b010) ? a & b :
						(ALUControl[2:0] === 3'b011) ? a | b:
						(ALUControl[2:0] === 3'b101) ? slt : 32'h00000000;  
							 
		 assign result = mux_2;
       

       // zero flag
         assign z = &(~result);
		 
      
       // negative flag
	     assign n = result[31];
		 
		 //carry flag
		 assign c = cout & (~ALUControl[1]);
		 
		 
		 //overflow flag
		 assign v = (~ALUControl[1]) & (a[31]^sum[31]) & (~(a[31]^b[31]^ALUControl[0]));
		 
		 
		 
		 
		 
		 
endmodule