module AEmux(SrcA,RD1E,ALuResultM,ResultW,ForwardAE);

output [31:0] SrcA;
input  [31:0] RD1E,ALuResultM,ResultW;
input  [1:0]  ForwardAE;

assign SrcA = (ForwardAE==2'b01) ? ResultW:
              (ForwardAE==2'b10) ? ALuResultM: RD1E;

endmodule