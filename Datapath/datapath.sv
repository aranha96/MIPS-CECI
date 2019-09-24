module datapath(input logic IorD,IRWrite,RegDst,MemtoReg,ALUSrcA,RegWrite,PCWrite,Branch,ck,rt, input logic [1:0] ALUSrcB,PCSrc, input logic [31:0] Memory,
input logic [2:0] ALUcontrole, output logic out_muxPC, output logic [5:0] opcode, funct);

logic [31:0] outSinalEx,outDesloca2,out_muxALU,data,instr,out_muxInstr,ALUout,data_a,data_b,RD1,RD2,srcA,srcB,ALUresult,out_muxWrite,PC,out_Jump;
logic PCEn,cout,zero,saidaAND,saidaOR;


flopenr32 reg_instr(Memory,IRWrite,ck,rt,instr);
flopenr32 reg_write(Memory,1,ck,rt,data);
flopenr32 reg_A(RD1,1,ck,rt,data_a);
flopenr32 reg_B(RD2,1,ck,rt,data_b);
flopenr32 reg_ALU(ALUresult,1,ck,rt,ALUout);
flopenr32 reg_PC(out_muxALU,PCEn,ck,rt,PC);


mux2_5 mux_instr(instr[20:16],instr[15:11],RegDst,out_muxInstr);
mux2_32 mux_write(ALUout,data,MemtoReg,out_muxWrite);
mux2_32 mux_PC(PC,ALUout,IorD,out_muxPC);
mux2_32 mux_reg(PC,data_a,ALUSrcA,srcA);
mux4_32 mux4_reg(data_b,4,outSinalEx,outDesloca2,ALUSrcB[0],ALUSrcB[1],srcB);
mux3_32 mux3_jump(ALUresult,ALUout,out_Jump,PCSrc[0],PCSrc[1],out_muxALU);

bancoreg32 reg_file(instr[25:21],instr[20:16],out_muxInstr,ck,rt,RegWrite,out_muxWrite,RD1,RD2);

ula32 ULA(srcA,srcB,0,ALUcontrole,ALUresult,cout,zero);

sinalex sign_extend(Memory[15:0],outSinalEx);
desloca2 shift_2(outSinalEx,outDesloca2);
deslocaPC shift_PC(PC[31:28],instr[25:0],out_Jump);

and and_PC(saidaAND,zero,Branch);
or or_PC(saidaOR,PCWrite,saidaAND);

assign opcode = instr[31:26];
assign funct = instr[5:0];

endmodule