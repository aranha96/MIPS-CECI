module sinalex(input logic [15:0] a, output logic [31:0] s);

assign s = {{16{a[15]}},a};

endmodule