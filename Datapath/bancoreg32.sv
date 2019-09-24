module bancoreg32(input logic [4:0] a1,a2,a3, input logic ck,reset,we, input logic [31:0] data, output logic [31:0] reg1, reg2);

genvar i;

generate
for (i = 0; i < 32; i++) begin: rf_
bancoreg rf_(a1,a2,a3,ck,reset,we,data[i],reg1[i],reg2[i]);
end
endgenerate

endmodule