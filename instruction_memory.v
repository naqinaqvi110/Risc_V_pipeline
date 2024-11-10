module instruction_memory(RD,A,rst);
       // decalring o/ps
       output [31:0] RD;

       //decalring i/ps
       input [31:0] A;
       input rst;

       
       //creating memoring
       reg [31:0] Mem [31:0] ;
		 

       assign RD = (~rst) ? 32'h00000000: Mem[A[31:2]] ;  

      // initial begin
    //    $readmemh("memfile.hex",mem);
     // end
      
      
      
      initial begin
         //  Mem[0] = 32'hFFC4A303;
        // Mem[1] = 32'h0062E233;
       //Mem[2] = 32'h0064A423;
      //Mem[0] = 32'hFE420AE3;
         
      Mem[0] = 32'h013904B3;
      Mem[1] = 32'h41348A33;
     // Mem[3] = 32'h0124EAB3;
     // Mem[4] = 32'h0134FB33;
		 
         



      end



endmodule