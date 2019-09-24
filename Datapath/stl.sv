module stl(input logic [31:0] a,b, output logic [31:0] less);

logic [31:0] d;
logic bout;

subtrator32 sub(a,b,0,d,bout);


assign less[31:1] = 0;
assign less[0] = bout;

endmodule