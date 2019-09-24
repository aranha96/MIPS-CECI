module mux8(input logic [31:0] d0,d1,d2,d3,d4,d5,d6,d7, input logic [2:0] s, output tri [31:0] y);

logic [31:0] y0,y1;

mux4_32 m0(d0,d1,d2,d3,s[0],s[1],y0);
mux4_32 m1(d4,d5,d6,d7,s[0],s[1],y1);
mux2_32 m2(y0,y1,s[2],y);

endmodule
