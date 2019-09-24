module tristate5(input logic [4:0] a, input logic en, output tri [4:0] y);

assign y = en ? a : 5'bz;
endmodule	