module tristate(input logic a, en, output tri y);

assign y = en ? a : 1'bz;
endmodule	