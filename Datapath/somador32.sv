module somador32(input logic [31:0] a, b, input logic cin, output logic [31:0] s, output logic cout);

logic [30:0] cout_temp;
genvar i;

somador sum_0(a[0],b[0],cin,s[0],cout_temp[0]);

generate
for (i=1;i<31;i++) begin: sum_
somador sum_(a[i],b[i],cout_temp[i-1],s[i],cout_temp[i]);
end
endgenerate

somador sum_31(a[31],b[31],cout_temp[30],s[31],cout);

endmodule