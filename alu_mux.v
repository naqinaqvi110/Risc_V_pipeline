module alu_mux(SrcB,ALUSrc,RD2,Imm_Ext);
       output [31:0] SrcB;
       input ALUSrc;
       input [31:0] RD2 ,Imm_Ext;


       assign SrcB = (ALUSrc) ? Imm_Ext: RD2; 


endmodule