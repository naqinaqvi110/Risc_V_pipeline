`include "alu_decoder.v"
`include "main_decoder.v"
module Control_Unit_Top(Op,funct7,funct3,RegWrite,ALUSrc,MemWrite,ResultSrc,ImmSrc,ALUControl,branch,Jump);

    input [6:0]Op,funct7;
    input [2:0]funct3;
    output  Jump;
    output ALUSrc,MemWrite,RegWrite,branch;
    output [1:0]ImmSrc,  ResultSrc;
    output [2:0]ALUControl;

    wire [1:0]ALUOp;

    main_decoder main_decoder(
                .Op(Op),
                .RegWrite(RegWrite),
                .ImmSrc(ImmSrc),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .ALUSrc(ALUSrc),
                .ALUOp(ALUOp),
                .branch(branch),
                .Jump(Jump)
    );

    alu_decoder alu_decoder(
                            .ALUOp(ALUOp),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(Op),
                            .ALUControl(ALUControl)
    );


endmodule