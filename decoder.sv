module decoder(input logic [4:0] key, output logic [31:0] out);

logic [31:0] temp = 1;
assign out = temp << key;

endmodule  
