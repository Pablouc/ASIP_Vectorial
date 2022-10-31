module flopenr #(parameter M = 8)(input logic clk, reset, en,negative, input logic [M-1:0] d, output logic [M-1:0] q, negativeFlag);
												  
	always_ff @(negedge clk, posedge reset)
		if (reset) q <= 0;
		else if (en) begin
			q <= d;
			negativeFlag <= negative;
			end
		
endmodule 