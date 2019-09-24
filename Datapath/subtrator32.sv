module subtrator32(input logic [31:0] a, b, input logic bin, output logic [31:0] d, output logic bout);

logic [30:0] bout_temp;
genvar i;

subtrator sub_0(a[0],b[0],bin,d[0],bout_temp[0]);

generate
for (i=1;i<31;i++) begin: sub_
subtrator sub_(a[i],b[i],bout_temp[i-1],d[i],bout_temp[i]);
end
endgenerate

subtrator sub_31(a[31],b[31],bout_temp[30],d[31],bout);

endmodule