module nor32(output logic [31:0] s, input logic [31:0] a,b);

genvar i;
generate
for (i=0;i<32;i++) begin: nor_
nor nor_(s[i],a[i],b[i]); //011
end
endgenerate

endmodule
