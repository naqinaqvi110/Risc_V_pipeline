module hazard_unit(
output [1:0] ForwardAE,ForwardBE,
input  [4:0] Rs1E,Rs2E,RdM,RdW,
input        RegWriteM,RegWriteW
);



assign ForwardAE = ((RegWriteM)&(RdM != 0)&(RdM==Rs1E)) ? 2'b10:
                   ((RegWriteW)&(RdW != 0)&(RdW==Rs1E)) ? 2'b01: 2'b00;

assign ForwardBE = ((RegWriteM)&(RdM != 0)&(RdM==Rs2E)) ? 2'b10:
                   ((RegWriteW)&(RdW != 0)&(RdW==Rs2E)) ? 2'b01: 2'b00;						 
endmodule