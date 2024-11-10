module pctarget(Imm_Ext,pc,PCTraget);


      output [31:0] PCTraget;

      input [31:0] Imm_Ext,pc;

      assign PCTraget = Imm_Ext + pc;

endmodule