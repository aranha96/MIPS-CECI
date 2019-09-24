module tristate32(input logic [31:0] a, input logic en, output tri [31:0] y);

assign y = en ? a : 32'bz;
endmodule	