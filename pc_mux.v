module pc_mux(PCNext,PCSrc,PCTarget,PCPlus4);

output [31:0] PCNext;
input [31:0] PCTarget,PCPlus4;
input PCSrc;

assign PCNext = (PCSrc) ? PCTarget : PCPlus4;

endmodule