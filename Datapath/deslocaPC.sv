module deslocaPC(input logic [3:0] PC, input logic [25:0] a, output logic [31:0] s);

assign s = {PC,a,2'b00};

endmodule