module or32(output logic [31:0] s, input logic [31:0] a,b);

genvar i;
generate
for (i=0;i<32;i++) begin: or_
or or_(s[i],a[i],b[i]); //001
end
endgenerate

endmodule
