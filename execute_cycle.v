
module execute_cycle(
output        PCSrcE, RegWriteM,MemWriteM,
output [1:0]  ResultSrcM,
output [4:0]  RdM,
output [31:0] ALUResultM,WriteDataM,PcPlus4M,PcTargetE,
input         clk,rst,RegWriteE,MemWriteE,ALUSrcE,branchE,JumpE,
input  [1:0]  ResultSrcE,
input  [2:0]  ALUControlE,
input  [4:0]  RdE,
input  [31:0] RD1E,RD2E,PCE,ImmEXTE,PCPlus4E                   
 );
 
wire        ZeroE; 
wire [31:0] SrcBE,ALUResultE;

reg         reg_RegWriteM,reg_MemWriteM; 
reg  [1:0]  reg_ResultSrcM;
reg  [4:0]  reg_RdM;
reg  [31:0] reg_ALUResultE,reg_WriteDataM,reg_PcPlus4M;
 
 
 alu_mux alu_mux
 (
 .SrcB(SrcBE),
 .ALUSrc(ALUSrcE),
 .RD2(RD2E),
 .Imm_Ext(ImmEXTE)
 );
 
 alu alu
 (
 .a(RD1E),
 .b(SrcBE),
 .ALUControl(ALUControlE),
 .result(ALUResultE),
 .z(ZeroE),
 .n(),
 .v(),
 .c()
 );
 
 pctarget adder
 (
 .Imm_Ext(ImmEXTE),
 .pc(PCE),
 .PCTraget(PcTargetE)
 );
 
 
 always @(posedge clk)
 begin
 if(rst)
 begin
 reg_RegWriteM  <= RegWriteE;
 reg_MemWriteM  <= MemWriteE; 
 reg_ResultSrcM <= ResultSrcE;
 reg_RdM        <= RdE;
 reg_ALUResultE <= ALUResultE;
 reg_WriteDataM <= RD2E;
 reg_PcPlus4M   <= PCPlus4E;
 end
 else
 begin
 reg_RegWriteM  <= 1'b0;
 reg_MemWriteM  <= 1'b0; 
 reg_ResultSrcM <= 2'b00;
 reg_RdM        <= 4'b0000;
 reg_ALUResultE <= {32{1'b0}};
 reg_WriteDataM <= {32{1'b0}};
 reg_PcPlus4M   <= {32{1'b0}};
 end
 end
 
assign  PCSrcE    = JumpE|(branchE &ZeroE); 
assign RegWriteM  = (rst) ? reg_RegWriteM  :1'b0;
assign MemWriteM  = (rst) ? reg_MemWriteM  :1'b0;
assign ResultSrcM = (rst) ? reg_ResultSrcM :2'b00;
assign RdM        = (rst) ? reg_RdM        :4'b0000;
assign ALUResultM = (rst) ? reg_ALUResultE :{32{1'b0}};
assign WriteDataM = (rst) ? reg_WriteDataM :{32{1'b0}};
assign PcPlus4M   = (rst) ? reg_PcPlus4M   :{32{1'b0}};

endmodule