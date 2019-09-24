module mux(input logic d0, d1, s, output tri y);

not inversor(ns, s);

tristate t0(d0, ns, y);
tristate t1(d1, s, y);
endmodule
