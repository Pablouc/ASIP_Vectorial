module mux3a1#(parameter M) (input logic [M-1:0] d0, d1, input logic selector1, selector2, output logic [M-1:0] q);
	logic [M-1:0] intermediateRes;
	assign intermediateRes = selector1 ? d1 : d0;
	assign q = selector2 ? 8'b0 : intermediateRes;
	
endmodule 