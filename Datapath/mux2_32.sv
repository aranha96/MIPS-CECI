module mux2_32(input logic [31:0] d0, d1, input logic s, output tri [31:0] y);

not inversor(ns, s);

tristate32 t0(d0, ns, y);
tristate32 t1(d1, s, y);
endmodule
