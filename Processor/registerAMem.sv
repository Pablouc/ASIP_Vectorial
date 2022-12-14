module registerAMem(input logic [47:0] RD, ALUOutM, input logic [3:0] WA3M, input logic clk,rst, 
	input logic PCSrcM, regWriteM,memToRegM,
	output logic [47:0] ReadData, AluOutW, output logic [3:0] WA3W, 
	output logic PCSrcW, regWriteW,memToRegW );
	
	always_ff @(posedge clk, posedge rst) 
	   if (rst) PCSrcW<=0;
		else begin
       ReadData <= RD;
		 AluOutW <= ALUOutM;
		 WA3W <= WA3M;
		 PCSrcW <= PCSrcM;
		 regWriteW <= regWriteM;
		 memToRegW <= memToRegM;
		 //assign MemWrite = MemW & zeroFlag; any flag
	end
endmodule 