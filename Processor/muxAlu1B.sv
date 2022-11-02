module muxAlu1B#(parameter M) (input logic [M-1:0] d0, d1,d3, input logic selector, input logic [3:0] opCode, output logic [M-1:0] q);
	logic [M-1:0] qWire1;
	
	assign qWire1 = selector ? d1 : d0;	

	
	always @(*)begin
	case(opCode)
	4'b0111: q=d0;
	4'b0011: q=d3;
	4'b0010: q=d3;
	
	
	default:begin 
	  q= qWire1;	
	  

		  end


	endcase

	end	
	
endmodule 