
module decode_cycle(RegWriteE,ALUSrcE,MemWriteE,ResultSrcE,ALUControlE,branchE,JumpE,
RD1E,RD2E,PCE,RdE,ImmEXTE,PCPlus4E,
Rs1E,Rs2E,
InstrD,PCD,PCPlus4D,RegWriteW,RDW,ResultW,clk,rst);

output RegWriteE,ALUSrcE,MemWriteE,branchE,JumpE;
output[1:0] ResultSrcE;
output [2:0] ALUControlE;
output [4:0] RdE,Rs1E,Rs2E;
output [31:0] RD1E,RD2E,PCE,ImmEXTE,PCPlus4E;
input RegWriteW,clk,rst;
input [4:0] RDW ;
input [31:0] ResultW;
input [31:0] InstrD,PCD,PCPlus4D;


wire RegWriteD,MemWriteD,JumpD,BranchD,ALUScrD;	
wire [1:0]  ResultSrcD,ImmSrcD;
wire [2:0]  ALUControlD;
wire [31:0] RD1D,RD2D,ImmEXTD;

//Creating reg that store temp values
reg RegWriteD_reg,MemWriteD_reg,JumpD_reg,BranchD_reg,ALUScrD_reg;
reg [1:0]  ResultSrcD_reg;
reg [2:0]  ALUControlD_reg;
reg [4:0]  RdD_reg,Rs1D , Rs2D;
reg [31:0] RD1D_reg,RD2D_reg,ImmEXTD_reg;
reg [31:0] PCD_reg,PCPlus4D_reg;

Control_Unit_Top  control_unit
(
.Op(InstrD[6:0]),
.funct7({1'b0,InstrD[30],{5{1'b0}}}),
.funct3(InstrD[14:12]),
.RegWrite(RegWriteD),
.ALUSrc(ALUScrD),
.MemWrite(MemWriteD),
.ResultSrc(ResultSrcD),
.ImmSrc(ImmSrcD),
.ALUControl(ALUControlD),
.branch(BranchD),
.Jump(JumpD)
);


register_files reg_files
(
.A1(InstrD[19:15]),
.A2(InstrD[24:20]),
.A3(RDW),
.WD3(ResultW),
.WE3(RegWriteW),
.rst(rst),
.clk(clk),
.RD1(RD1D),
.RD2(RD2D)
);


sign_extend sgn_extend
(
.In(InstrD),
.Imm_Ext(ImmEXTD),
.ImmSrc(ImmSrcD)
);



always @(posedge clk)
begin
if(rst)
begin
RegWriteD_reg   <= RegWriteD;
MemWriteD_reg   <= MemWriteD;
JumpD_reg       <= JumpD;
BranchD_reg     <= BranchD;
ALUScrD_reg     <= ALUScrD;
ResultSrcD_reg  <= ResultSrcD;
ALUControlD_reg <= ALUControlD;
RD1D_reg        <= RD1D;
RD2D_reg        <= RD2D;
ImmEXTD_reg     <= ImmEXTD;
Rs1D            <= InstrD[19:15];
Rs2D            <= InstrD[24:20];
RdD_reg         <= InstrD[11:7];
PCD_reg         <= PCD;

PCPlus4D_reg    <= PCPlus4D;
end
else
begin
RegWriteD_reg   <= 1'b0;
MemWriteD_reg   <= 1'b0;
JumpD_reg       <= 1'b0;
BranchD_reg     <= 1'b0;
ALUScrD_reg     <= 1'b0;
ResultSrcD_reg  <= 2'b00;
ALUControlD_reg <= 3'b000;
RD1D_reg        <= {32{1'b0}};
RD2D_reg        <= {32{1'b0}};
ImmEXTD_reg     <= {32{1'b0}};
Rs1D            <= {4{1'b0}};
Rs2D            <= {4{1'b0}};
RdD_reg         <= {4{1'b0}};
PCD_reg         <= {32{1'b0}};

PCPlus4D_reg    <= {32{1'b0}};
end
end

assign RegWriteE   =  (rst) ? RegWriteD_reg   : 1'b0;
assign ALUSrcE     =  (rst) ? ALUScrD_reg     : 1'b0;
assign MemWriteE   =  (rst) ? MemWriteD_reg   : 1'b0;
assign branchE     =  (rst) ? BranchD_reg     : 1'b0;
assign JumpE       =  (rst) ? JumpD_reg       : 1'b0;
assign ResultSrcE  =  (rst) ? ResultSrcD_reg  : 2'b00;
assign ALUControlE =  (rst) ? ALUControlD_reg : 3'b000;
assign RD1E        =  (rst) ? RD1D_reg        : {32{1'b0}};
assign RD2E        =  (rst) ? RD2D_reg        : {32{1'b0}};
assign PCE         =  (rst) ? PCD_reg         : {32{1'b0}};
assign RdE         =  (rst) ? RdD_reg         : {4{1'b0}};
assign Rs1E         =  (rst) ? Rs1D           : {4{1'b0}};
assign Rs2E         =  (rst) ? Rs2D           : {4{1'b0}};
assign ImmEXTE     =  (rst) ? ImmEXTD_reg     : {32{1'b0}};
assign PCPlus4E    =  (rst) ? PCPlus4D_reg    : {32{1'b0}};

endmodule