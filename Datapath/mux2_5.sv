module mux2_5(input logic [4:0] d0, d1, input logic s, output tri [4:0] y);

not inversor(ns, s);

tristate5 t0(d0, ns, y);
tristate5 t1(d1, s, y);
endmodule
