module bancoreg(input logic [4:0] sa,sb,key, input logic ck,reset,wd,we, output logic reg1, reg2);

logic [31:0] out_dec, out_and, out_flopenr;

mux32 mux_a(out_flopenr,sa,reg1);
mux32 mux_b(out_flopenr,sb,reg2);
decoder dec(key,out_dec);

genvar i;

generate
for(i = 0;i < 32; i++) begin: registrador
and a(out_and[i],we,out_dec[i]);
flopenr registrador(wd,out_and[i],ck,reset,out_flopenr[i]);
end
endgenerate

endmodule
