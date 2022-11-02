module regFile(input logic clk,input logic [15:0] pc, input logic we3, input logic [3:0] ra1, ra2, ra3,
				input logic [47:0] wd3, output logic [47:0] rd1, rd2);
	
//input logic [23:0] wd3, r11----> Hay que agregarlos
	
	
 logic [47:0] rf[13:0];	
	
	always_ff @(posedge clk) begin
		
		if(pc==16'b0) 
		rf<= '{48'h000000, 48'h000000, 48'h000000, 48'h000000, 48'h000000, 48'h000000, 48'h000000,
				48'h000000, 48'h000000, 48'h000000,48'h000000, 48'h000000, 48'h000000, 48'h000000}; 
				
		if(pc==16'b1)begin
			rf[4] <= 48'd69540876599103;
			rf[6] <= 48'd1103823438081;
			rf[10] <= 48'd25;
			rf[11] <= 48'd100;
			rf[12] <= 48'd4;
			rf[13] <= 48'd3;
		end
		
		if (we3) rf[ra3] <= wd3;
		
	end
	
	assign rd1=rf[ra1];
	assign rd2=rf[ra2];
		
	
endmodule 