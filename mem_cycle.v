module mem_cycle(
output        RegWriteW,
output [1:0]  ResultSrcW,
output [4:0]  RdW,
output [31:0] ALUResultW,ReadDataW,PcPlus4W,
input         RegWriteM,MemWriteM,
input  [1:0]  ResultSrcM,
input  [4:0]  RdM,
input  [31:0] ALUResultM,WriteDataM,PcPlus4M,
input         rst,clk
);

wire [31:0] ReadData_temp;
reg         reg_RegWriteW;
reg  [1:0]  reg_ResultSrcW;
reg  [4:0]  reg_RdW;
reg  [31:0] reg_ALUResultW,reg_ReadDataW,reg_PcPlus4W; 


 data_memory data_mem
 (
 .clk(clk),
 .rst(rst),
 .A(ALUResultM),
 .WD(WriteDataM),
 .RD(ReadData_temp),
 .WE(MemWriteM)
 );
 
 always @(posedge clk)
 begin
 if(rst)
 begin
 reg_RegWriteW  <= RegWriteM;
 reg_ResultSrcW <= ResultSrcM;
 reg_RdW        <= RdM;
 reg_ALUResultW <= ALUResultM;
 reg_ReadDataW  <= ReadData_temp;
 reg_PcPlus4W   <= PcPlus4M;
 end
 else
 begin
 reg_RegWriteW  <= 1'b0;
 reg_ResultSrcW <= 2'b00;
 reg_RdW        <= 4'b0000;
 reg_ALUResultW <= {32{1'b0}};
 reg_ReadDataW  <= {32{1'b0}};
 reg_PcPlus4W   <= {32{1'b0}};
 end
 end
 
 assign RegWriteW  = (rst) ? reg_RegWriteW  :1'b0;
 assign ResultSrcW = (rst) ? reg_ResultSrcW :2'b00;
 assign RdW        = (rst) ? reg_RdW        :4'b0000;
 assign ALUResultW = (rst) ? reg_ALUResultW :{32{1'b0}};
 assign ReadDataW  = (rst) ? reg_ReadDataW  :{32{1'b0}};
 assign PcPlus4W   = (rst) ? reg_PcPlus4W   :{32{1'b0}};
 
endmodule