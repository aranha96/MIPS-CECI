module flopenr(input logic d, en, ck, rt, output logic q);

always_ff @(posedge ck, posedge rt)
	if (rt) q <= 0;
	else if (en) q <= d;
endmodule