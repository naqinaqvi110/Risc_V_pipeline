module BEmux(SrcB,RD2E,ALuResultM,ResultW,ForwardBE);

output [31:0] SrcB;
input  [31:0] RD2E,ALuResultM,ResultW;
input  [1:0]  ForwardBE;

assign SrcB = (ForwardBE==2'b01) ? ResultW:
              (ForwardBE==2'b10) ? ALuResultM: RD2E;

endmodule