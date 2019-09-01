module mux32 (input logic [31:0] d, input logic [4:0] s, output logic y);

logic [7:0] yp;
logic [1:0] yp_2;
genvar i,j;

generate
for (i = 0; i < 8; i++) begin: m4_1
mux4 m4_1(d[4*i],d[4*i+1],d[4*i+2],d[4*i+3],s[0],s[1], yp[i]);
end
endgenerate

generate
for (j = 0; j < 2 ; j++) begin: m4_2
mux4 m4_2(yp[4*j],yp[4*j+1],yp[4*j+2],yp[4*j+3],s[2],s[3], yp_2[j]);
end
endgenerate

mux mux2(yp_2[0],yp_2[1],s[4],y);

endmodule
