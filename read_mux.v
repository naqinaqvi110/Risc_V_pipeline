module read_mux(Result,ResultSrc,ALU_Result,READ_DATA,PcPlus4);

      output [31:0] Result;
      input [31:0]  ALU_Result,READ_DATA,PcPlus4;
      input [1:0]   ResultSrc;

      assign Result = (ResultSrc==2'b01) ? READ_DATA : 
                      (ResultSrc==2'b00) ? ALU_Result:
				          (ResultSrc==2'b10) ? PcPlus4   : {32{1'bx}};


endmodule