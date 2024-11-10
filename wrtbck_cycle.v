
module wrtbck_cycle
(

output [31:0] ResultW,
input  [1:0]  ResultSrcW,
input  [31:0] ALUResultW,ReadDataW,PcPlus4W
);


read_mux rdmux(

.Result(ResultW),
.ResultSrc(ResultSrcW),
.ALU_Result(ALUResultW),
.READ_DATA(ReadDataW),
.PcPlus4(PcPlus4W)
);

endmodule