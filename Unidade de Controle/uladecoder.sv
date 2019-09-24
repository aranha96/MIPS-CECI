module uladecoder(input logic [5:0] funct, input logic [2:0] ALUop, output logic [2:0] ALUcontrole);

always_comb begin
case(ALUop)
3'b000: ALUcontrole = 3'b010;
3'b001: ALUcontrole = 3'b110;
3'b010: begin
case(funct)
6'b100000: ALUcontrole = 3'b010;
6'b100010: ALUcontrole = 3'b110;
6'b100100: ALUcontrole = 3'b000;
6'b100101: ALUcontrole = 3'b001;
6'b101010: ALUcontrole = 3'b111;
6'b100110: ALUcontrole = 3'b011;
6'b100111: ALUcontrole = 3'b100;
default:   ALUcontrole = 3'b000;
endcase
end
3'b011: ALUcontrole = 3'b111;
3'b100: ALUcontrole = 3'b110;
3'b110: ALUcontrole = 3'b001;
3'b111: ALUcontrole = 3'b011;
default:ALUcontrole = 3'b000;
endcase
end

endmodule