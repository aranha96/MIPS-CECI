module nand32(output logic [31:0] s, input logic [31:0] a,b);

genvar i;
generate
for (i=0;i<32;i++) begin: nand_
nand nand_(s[i],a[i],b[i]); //101
end
endgenerate

endmodule
