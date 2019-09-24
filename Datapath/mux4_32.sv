module mux4_32(input logic [31:0] d0, d1, d2, d3, input logic s0, s1, output tri [31:0] y);

logic [31:0] y0, y1;

mux2_32 m0(d0, d1, s0, y0);
mux2_32 m1(d2, d3, s0, y1);
mux2_32 m2(y0, y1, s1, y);

endmodule