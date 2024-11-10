

module fetch_cycle(instrD,pcplus4D,pcD,clk,rst,pctargetE,pcsrcE);
output  [31:0] instrD,pcplus4D, pcD;
input clk,rst, pcsrcE;
input [31:0] pctargetE;   

wire [31:0] instrD_temp,pcD_temp,pcplus4F,pcf_1,pcf_2;
reg [31:0] instrD_reg,pcplus4D_reg,pcD_reg;
pc_mux pc_mux(
.PCNext(pcf_1),
.PCSrc(pcsrcE),
.PCTarget(pctargetE),
.PCPlus4(pcplus4F)
);

program_counter program_counter(
.rst(rst),
.clk(clk),
.PC_NEXT(pcf_1),
.PC(pcf_2)
);

PC_ADDER pc_adder(
.a(pcf_2),
.b(32'h00000004),
.c(pcplus4F));

instruction_memory inst_mem(
.RD(instrD_temp),
.A(pcf_2),
.rst(rst)
);

always @(posedge clk )
begin
if(rst)
begin
instrD_reg   <= instrD_temp;
pcD_reg      <= pcf_2;
pcplus4D_reg <= pcplus4F;
end
else
begin
instrD_reg   <= {32{1'b0}};
pcD_reg      <= {32{1'b0}};
pcplus4D_reg <= {32{1'b0}};
end
end

assign instrD = (rst) ? instrD_reg : 32'h00000000;
assign pcD	 = (rst) ? pcD_reg : 32'h00000000;
assign pcplus4D = (rst) ? pcplus4D_reg : 32'h00000000;


endmodule