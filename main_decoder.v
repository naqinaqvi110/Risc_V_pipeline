module main_decoder(Op,ResultSrc,MemWrite,ALUSrc,ImmSrc,RegWrite,ALUOp,branch,Jump);
 
     // declaring o/ps
     output [1:0] ImmSrc, ResultSrc, ALUOp;
     output      Jump, ALUSrc , MemWrite , RegWrite,branch;

     // delaring i/ps
     input [6:0] Op;
     
     
     
  

     assign RegWrite = ((Op == 7'b0000011)  |(Op == 7'b0110011)) |((Op == 7'b0010011)) | ((Op == 7'b1101111)) ? 1'b1: 1'b0;
     
     assign ALUSrc =  ((Op == 7'b0000011)|(Op == 0100011) | (Op == 0010011)) ? 1'b1: 1'b0;
     
     assign MemWrite = ((Op == 7'b0100011)) ? 1'b1: 1'b0;
     
     assign ResultSrc = ((Op == 7'b0000011)) ? 2'b01: 
                        ((Op == 7'b1101111)) ? 2'b10 : 2'b00;
     
     assign branch = ((Op == 7'b1100011)) ? 1'b1: 1'b0;
     
     assign ImmSrc = ((Op == 7'b0100011)) ? 2'b01: 
                     ((Op == 7'b1100011)) ? 2'b10: 
                     ((Op == 7'b1101111)) ? 2'b11: 2'b00;
     
     assign ALUOp = ((Op == 7'b0110011) | (Op == 0010011)) ? 2'b10: 
                    ((Op == 7'b1100011)) ? 2'b01: 2'b00;

     
       
     assign Jump = (Op == 7'b1101111) ? 1'b1: 1'b0;
    

    

                   

                                 



endmodule