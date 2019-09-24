module controle(input logic clk,rst, input logic [5:0] OPcode,funct, output logic MemtoReg,RegDst,IorD,ALUSrcA,IRWrite,MemWrite,PCWrite,Branch,RegWrite,output logic [1:0] ALUSrcB,PCSrc, 
output logic [2:0] ALUcontrole, output logic estado);

logic [2:0] ALUop;

unidadecontrole uc(clk,rst,OPcode,MemtoReg,RegDst,IorD,ALUSrcA,IRWrite,MemWrite,PCWrite,Branch,RegWrite,ALUSrcB,PCSrc,ALUop,estado);
uladecoder ula(funct,ALUop,ALUcontrole);

endmodule