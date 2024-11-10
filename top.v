`include "fetch_cycle.v"
`include "decode_cycle.v"
`include "execute_cycle.v"
`include "mem_cycle.v"
`include "wrtbck_cycle.v"
`include "hazard_unit.v"
`include "AEmux.v"
`include "BEmux.v"
`include "Control_Unit_Top.v"
`include "register_files.v"
`include "sign_extend.v"
`include "read_mux.v"
`include "alu_mux.v"
`include "alu.v"
`include "pctarget.v"
`include "pc_mux.v"
`include "program_counter.v"
`include "PC_ADDER.v"
`include "instruction_memory.v"
`include "data_memory.v"
module top(
input clk,rst
);

wire pcsrce,regwritee,regwritem,regwritew,aluscr,memwritee,memwritem,branche,jumpe;
wire [1:0]  resultsrce,resultsrcm,resultsrcw,forwardae,forwardbe;
wire [2:0]  alucontrole;
wire [4:0]  rdd,rdm,rdw,rs1e,rs2e;
wire [31:0] rd1e,rd2e,instrd,pcplus4d,pcd,pctargete,pce,immexte,pcplus4e,resultw,aluresultm,writedatam,pcplus4m,aluresultw,readdataw,pcplus4W,srca,srcb;

fetch_cycle fetch
(
.instrD(instrd),
.pcplus4D(pcplus4d),
.pcD(pcd),
.clk(clk),
.rst(rst),
.pctargetE(pctargete),
.pcsrcE(pcsrce)
);



decode_cycle decode
(
.RegWriteE(regwritee),
.ALUSrcE(aluscr),
.MemWriteE(memwritee),
.ResultSrcE(resultsrce),
.ALUControlE(alucontrole),
.branchE(branche),
.JumpE(jumpe),
.RD1E(rd1e),
.RD2E(rd2e),
.PCE(pce),
.RdE(rdd),
.Rs1E(rs1e),
.Rs2E(rs2e),
.ImmEXTE(immexte),
.PCPlus4E(pcplus4e),
.InstrD(instrd),
.PCD(pcd),
.PCPlus4D(pcplus4d),
.RegWriteW(regwritew),
.RDW(rdw),
.ResultW(resultw),
.clk(clk),
.rst(rst));

execute_cycle execute
(
.PCSrcE(pcsrce), 
.RegWriteM(regwritem),
.MemWriteM(memwritem),
.ResultSrcM(resultsrcm),
.RdM(rdm),
.ALUResultM(aluresultm),
.WriteDataM(writedatam),
.PcPlus4M(pcplus4m),
.PcTargetE(pctargete),
.clk(clk),
.rst(rst),
.RegWriteE(regwritee),
.MemWriteE(memwritee),
.ALUSrcE(aluscr),
.branchE(branche),
.JumpE(jumpe),
.ResultSrcE(resultsrce),
.ALUControlE(alucontrole),
.RdE(rdd),
.RD1E(srca),
.RD2E(srcb),
.PCE(pce),
.ImmEXTE(immexte),
.PCPlus4E(pcplus4e)                   
 );
 
mem_cycle memory
(
.RegWriteW(regwritew),
.ResultSrcW(resultsrcw),
.RdW(rdw),
.ALUResultW(aluresultw),
.ReadDataW(readdataw),
.PcPlus4W(pcplus4W),
.RegWriteM(regwritem),
.MemWriteM(memwritem),
.ResultSrcM(resultsrcm),
.RdM(rdm),
.ALUResultM(aluresultm),
.WriteDataM(writedatam),
.PcPlus4M(pcplus4m),
.rst(rst),
.clk(clk)
); 
 
wrtbck_cycle writeback
(
.ResultW(resultw),
.ResultSrcW(resultsrcw),
.ALUResultW(aluresultw),
.ReadDataW(readdataw),
.PcPlus4W(pcplus4W)
);

hazard_unit hazard(
.ForwardAE(forwardae),
.ForwardBE(forwardbe),
.Rs1E(rs1e),
.Rs2E(rs2e),
.RdM(rdm),
.RdW(rdw),
.RegWriteM(regwritem),
.RegWriteW(regwritew)
);

AEmux AEmux
(
.SrcA(srca),
.RD1E(rd1e),
.ALuResultM(aluresultm),
.ResultW(resultw),
.ForwardAE(forwardae));

BEmux BEmux
(
.SrcB(srcb),
.RD2E(rd2e),
.ALuResultM(aluresultm),
.ResultW(resultw),
.ForwardBE(forwardbe)
);



endmodule