module unidadecontrole(input logic clk,rst, input logic [5:0] OPcode, output logic MemtoReg,RegDst,IorD,ALUSrcA,IRWrite,MemWrite,PCWrite,Branch,RegWrite, 
output logic [1:0] ALUSrcB,PCSrc, output logic [2:0] ALUOp, output logic [3:0] estado);

typedef enum logic [3:0]{s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,
s10,s11,s12,s13,s14} State;
	
State Atual;
State Prox;

assign estado = Atual;

always_ff@(posedge clk, posedge rst)begin		
if(rst) Atual = s0;
else Atual = Prox;
end	
always_comb begin
case(Atual)

s0: begin 			
IorD = 1'b0;
ALUSrcA = 1'b0;
ALUSrcB = 2'b01;
ALUOp = 3'b000;
PCSrc = 2'b00;
IRWrite = 1'b1;
PCWrite = 1'b1;
MemWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
Branch 	= 1'b0;				
Prox = s1;
end			

s1: begin			
ALUSrcA = 1'b0;
ALUSrcB = 2'b11;
ALUOp = 3'b000;			
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
Branch 	= 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;
	
case(OPcode)
6'b101011: Prox = s2;	 						
6'b100011: Prox = s2;							
6'b000000: Prox = s6;				
6'b000100: Prox = s8;							
6'b001000: Prox = s9;							
6'b000010: Prox = s11;										
6'b001101: Prox = s12;				
6'b001110: Prox = s13;							
6'b001010: Prox = s14;									
default: Prox = s0;
endcase
end			

s2: begin			
ALUSrcA = 1'b1;
ALUSrcB = 2'b10;
ALUOp = 3'b000;		
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;

case(OPcode)
6'b100011: Prox = s3;							
6'b101011: Prox = s5;								
default: Prox = s0;
endcase
end

s3: begin			

IorD = 1'b1;				
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s4;				
end

s4: begin			
RegDst = 1'b0;
MemtoReg = 1'b1;
RegWrite = 1'b1;			
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s0;			
end
	
s5: begin			
IorD = 1'b1;
MemWrite = 1'b1;				
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s0;			
end

s6: begin			
ALUSrcA = 1'b1;
ALUSrcB = 2'b00;
ALUOp = 3'b100;		
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s7;
end			

s7: begin			
RegDst = 1'b1;
MemtoReg = 1'b0;
RegWrite = 1'b1;				
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s0;
end			

s8: begin			
ALUSrcA = 1'b1;
ALUSrcB = 2'b00;
ALUOp = 3'b001;
PCSrc = 2'b01;
Branch = 1'b1;	
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
PCWrite = 1'b0;				
Prox = s0;
end
	
s9: begin			
ALUSrcA = 1'b1;
ALUSrcB = 2'b10;
ALUOp = 3'b000;					
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s10;
end
					
s10: begin			
RegDst = 1'b0;
MemtoReg = 1'b0;
RegWrite = 1'b1;						
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s0;
end			
		
s11: begin			
PCWrite = 1'b1;
PCSrc = 2'b10;				
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;				
Prox = s0;
end			
			
s12: begin 			
ALUSrcA = 1'b1;
ALUSrcB	= 2'b10;
ALUOp = 3'b110;				
Branch = 1'b0;
PCSrc = 2'bxx;
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
PCWrite = 1'b0;
Prox = s10;
end
		
s13: begin			
ALUSrcA = 1'b1;
ALUSrcB = 2'b10;
ALUOp = 2'b011;		
Branch = 1'b0;
PCSrc = 2'bxx;
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
PCWrite = 1'b0;				
Prox = s10;
end
			
s14: begin			
RegWrite = 1'b1;
RegDst = 1'b0;
ALUSrcA = 1'b1;
ALUOp = 3'b111; 
Branch = 1'b0;
MemWrite = 1'b0;
MemtoReg = 1'b0;				
ALUSrcB = 2'bxx;
PCSrc = 2'bxx;
IorD = 1'bx;
IRWrite = 1'b0;
PCWrite = 1'b0;
Prox = s0;
end
			
default: begin
IorD = 1'bx;
MemWrite = 1'b0;
IRWrite = 1'b0;
RegDst = 1'bx;
MemtoReg = 1'bx;
RegWrite = 1'b0;
ALUSrcA = 1'bx;
ALUSrcB = 2'bxx;
ALUOp = 3'b000;
Branch = 1'b0;
PCWrite = 1'b0;
PCSrc = 2'bxx;				
Prox = s0;
end			
endcase
end
endmodule