module muxAlu1B#(parameter M) (input logic [M-1:0] d0, d1, input logic selector, input logic [3:0] opCode, output logic [M-1:0] q);
	logic [M-1:0] qWire;
	
	assign qWire = selector ? d1 : d0;	
	assign q = (opCode==4'b0111) ? d0 : qWire; 
	
endmodule 