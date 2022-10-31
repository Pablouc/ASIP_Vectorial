module muxAluParams#(parameter M) (input logic [M-1:0] d0, d1, input logic [3:0] selector, output logic [M-1:0] q0, q1);
	
	assign q0 = (selector==4'b0111) ? d1 : d0;	
	assign q1 = (selector==4'b0111) ? d0 : d1;	
	
endmodule 