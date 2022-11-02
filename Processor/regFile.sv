module regFile(input logic clk,input logic [15:0] pc, input logic we3, input logic [3:0] ra1, ra2, ra3,
				input logic [47:0] wd3,input logic [7:0] color, output logic [47:0] rd1, rd2);
	
//input logic [23:0] wd3, r11----> Hay que agregarlos
	
	
 logic [47:0] rf[13:0];	
	logic [47:0] alpha;logic [7:0] r,g,b;
 
 
always @(*)begin
case(color[1:0])



2'b00: begin
	alpha = 48'd0;

	end

2'b01: begin
	alpha = 48'd25;

	end
	

2'b10: begin
	alpha = 48'd50;

	end

2'b11:begin
	
	alpha = 48'd75;

	end
	

default:begin 
	alpha = 48'd0;

	end

endcase
end

always @(*)begin
case(color[3:2])



2'b00: begin
	r = 8'd0;

	end

2'b01: begin
	r = 8'd63;

	end
	

2'b10: begin
	r = 8'd191;

	end

2'b11:begin
	
	r = 8'd255;

	end
	

default:begin 
	r = 8'd0;

	end

endcase
end

always @(*)begin
case(color[5:4])



2'b00: begin
	g = 8'd0;

	end

2'b01: begin
	g = 8'd63;

	end
	

2'b10: begin
	g = 8'd191;

	end

2'b11:begin
	
	g = 8'd255;

	end
	

default:begin 
	g = 8'd0;

	end

endcase
end

always @(*)begin
case(color[7:6])



2'b00: begin
	b = 8'd0;

	end

2'b01: begin
	b = 8'd63;

	end
	

2'b10: begin
	b = 8'd191;

	end

2'b11:begin
	
	b = 8'd255;

	end
	

default:begin 
	b = 8'd0;

	end

endcase
end
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
		rf[4]<= {r,g,b,r,g,b};
		rf[3]<= alpha;
		
		if (we3) rf[ra3] <= wd3;
		
	end
	
	assign rd1=rf[ra1];
	assign rd2=rf[ra2];
		
	
endmodule 