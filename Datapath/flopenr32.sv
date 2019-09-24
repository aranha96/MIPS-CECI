module flopenr32(input logic [31:0] d, input logic en, ck, rt, output logic [31:0] q);

always_ff @(posedge ck, posedge rt)
	if (rt) q <= 32'b0;
	else if (en) q <= d;
endmodule