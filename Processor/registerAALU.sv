module registerAALU(input logic [47:0] aluResult, writeData, input logic [3:0] WA3E, input logic clk, rst,
	input logic PCSrcE2, regWriteE2, memWriteE2,memToRegE, 
   output logic [47:0] A,WD, output logic [3:0] WA3M, 
	output logic PCSrcM, regWriteM, memWriteM,memToRegM  );
	always_ff @(posedge clk, posedge rst) 
	   if (rst) PCSrcM<=0;
		else begin        
       A <= aluResult;
		 WD <= writeData;
		 WA3M <= WA3E;
		 PCSrcM <= PCSrcE2;
		 regWriteM <= regWriteE2;
		 memWriteM <= memWriteE2;
		 memToRegM <= memToRegE;
		 //assign MemWrite = MemW & zeroFlag; any flag
	end
endmodule 