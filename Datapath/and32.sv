module and32(output logic [31:0] s, input logic [31:0] a,b);

genvar i;
generate
for (i=0;i<32;i++) begin: and_
and and_(s[i],a[i],b[i]); //000
end
endgenerate

endmodule
