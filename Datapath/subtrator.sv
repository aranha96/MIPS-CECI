module subtrator(input logic a, b, bin, output logic s,bout);

logic p, g;
not inv1(na,a);
not inv2(np,p);

assign p = a ^ b;
assign g = na & b;

assign s = p ^ bin;
assign bout = g | (np & bin);

endmodule