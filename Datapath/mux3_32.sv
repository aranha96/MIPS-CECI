module mux3_32(input logic [31:0] d0, d1, d2, input logic s0, s1, output tri [31:0] y);

logic [31:0] y_temp;

mux2_32 m0(d0, d1, s0, y_temp);
mux2_32 m1(y_temp, d2, s1, y);

endmodule